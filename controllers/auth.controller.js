const jwt  = require('jsonwebtoken');
const userModel =  require('../models/user.model')
const bcrypt = require('bcryptjs')
const shopModel = require('../models/shop.model')
// const mail = require('../mailer/send.email')
// const mailer = require('../mailer/send.email')
const envConfig = require('../env.config');
const { sendWelcomeEmail, sendLoginAlert, sendPasswordResetSuccess } = require('../mailer/resend/resend.mailer');
const UAParser = require('ua-parser-js');
const { emit } = require('nodemon');
// register logic 
exports.register = async (req, res) =>{
    const { username, email, role, password, firstname, lastname} = req.body;
    try {
        const user = await userModel.createUser(username,email,role, password, firstname, lastname);
        if(!user.success){
            return res.status(401).json({message: user.message, success:user.success })
        }
        let fullname = firstname + " " + lastname;
        
        
        const welcome =  await sendWelcomeEmail(email, fullname )
        // console.log(welcome)
        if (!welcome.success) {
            return res.status(401).json({message: welcome.message, success:welcome.success })
            
        }
        else {
            return res.status(201).json({message: user.message, success:user.success })
        }

    } catch (error) {

        return res.status(500).json({message: 'Internal server error', details: error.message, });
    }
}


// login logic 

/**
 * method to allow log in
 * 
 */

exports.login = async(req, res) =>{
    // console.log(req.body)
    const {email, password} = req.body;

    const getIpAddress = (req) => {
        return req.headers['x-forwarded-for']?.split(',')[0] || req.connection.remoteAddress;
    };
    

    const getDeviceInfo = (req) => {
    const parser = new UAParser();
    parser.setUA(req.headers['user-agent']);
    const result = parser.getResult();

    return `Browser: ${result.browser.name || 'Unknown Browser'}, OS: ${result.os.name || 'Unknown OS'}, Device: ${result.device.model || 'Unknown Device'}`;
};

    

    // console.log(req.body);
    try {
        const user = await userModel.findUserByEmail(email);

        // console.log(user)

        if(!user.success){
            return res.status(400).json(
                {
                    message: user.message,
                    success:user.success
                }
            )
        }

        const userdetails = user.user
        const passowrdvalid = await bcrypt.compare(password, userdetails.password);

        if(!passowrdvalid){
            return res.status(401).json(
                {
                    message: 'Invalid password',
                    success:false
                }
            );
        }

        const ipAddress = getIpAddress(req);
        const deviceInfo = getDeviceInfo(req);
        await sendLoginAlert(email, email, ipAddress, deviceInfo);


        
        if(userdetails.role == 'vendor'){
            const shop = await shopModel.getMyshops(userdetails.id);
                const token = jwt.sign(
                    {
                        userid: userdetails.id,
                        userrole:userdetails.role,
                        useremail:userdetails.email
                        
                    },
                    process.env.JWT_SECRET,
                    {
                        expiresIn: '6h'
                    }

                )

                if(shop.length > 0){
                    const data = shop.shop
                    const shoptoken = jwt.sign(
                        {
                            shopid:data.shop_id,
                            status:data.status
                        },
                        process.env.JWT_SECRET,
                        {
                            expiresIn: '6h'
                        }
                    )

                    return res.status(200).json(
                        {
                            message: 'vendor Login successfull',
                            token: token,
                            shoptoken:shoptoken,
                            userrole:userdetails.role,
                            shopstatus: data.status,
                            success:true
                        }
                    )
    

                }else{
                    return res.status(200).json(
                        {
                            message: 'Login successfull',
                             token:token,
                            userrole:userdetails.role,
                             success:true
                        }
                    )
                }



        }else if(userdetails.role == 'admin'){
            

            const token = await jwt.sign({
                userid: userdetails.id,
                userrole:userdetails.role,
                useremail:userdetails.email
            },
            envConfig.JWT_SECRET,
            {
                expiresIn: '6h'
            }
        )

        const admintoken = await jwt.sign({
            message: 'Encoded only in admin user',
            role: userdetails.role
        },
        envConfig.ADMIN_HASH_KEY,
        {
            expiresIn: '6h'
        }
    )

        return res.status(200).json(
            {
                message: 'Login successfull',
                 token:token,
                 admintoken,
                 userrole:userdetails.role,
                 success:true
            }
        )

        }
        else{
            const token = jwt.sign(
                {
                    userid: userdetails.id,
                    userrole:userdetails.role,
                    useremail:userdetails.email
                },
                envConfig.JWT_SECRET,
                {
                    expiresIn: '6h'
                }

            )

            return res.status(200).json(
                {
                    message: 'Login successfull',
                     token:token,
                     userrole:userdetails.role,
                     success:true
                }
            )
        }


        
    } catch (error) {
         return res.status(500).json({
            message:error.message,
            errordetails: error
        })
    }
}



// delete user logic
exports.deleteUser = async(req, res) =>{
    const {email} = req.body;
    try {
        const success = (await userModel.deleteUserByEmail(email));

        if(!success.success){
            return res.status(404).json({message: success.message})
        }
        return res.status(201).json( { message:success.message })

    } catch (error) {
        return res.status(500).json({message: 'user not deleted', error:error.message})
    }
}


// password reser logic 
exports.reset = async (req, res) => {

    const { email, password } = req.body;

    // Log request body for debugging

    if (!email || !password) {
        return res.status(400).json({
            message: "Email and password are required",
            success: false,
        });
    }

    try {
        const reset = await userModel.newPass(email, password);
        await sendPasswordResetSuccess(email, email)
        if (reset.success) {
            return res.status(200).json({
                message: reset.message,
                success: reset.success,
            });
        }

        return res.status(400).json({
            message: reset.message,
            success: reset.success,
        });
    } catch (error) {

        return res.status(500).json({
            message: "Internal server error",
            success: false,
            error: error.message || error,
        });
    }
};

// confirm password reset token 
exports.confirm = async (req, res) => {
    const { email, code }= req.body

    console.log(req.body)

    try {
        
        const confirm = await userModel.confirmToken(email, code)
        console.log('confirm', confirm)

        if(confirm.success){
            return res.status(200).json(
                {
                    message: confirm.message,
                    success: confirm.success
                }
            )
        }

        return res.status(400).json(
            {
                message: confirm.message,
                success: confirm.success
            }
        )


    } catch (error) {
        return res.status(500).json(
            {
                message: 'Internal server error',
                success: false,
                error:error
            }
        )
    }
}


// get user details by email address 
exports.user = async(req, res)=>{
    try {

        const user = req.user.useremail 

        const data = await userModel.findUserByEmail(user)

        if(data.success){
            return res.status(200).json(data)
        }
        return res.status(400).json(data)
        
    } catch (error) {
        return res.status(500).json({
            success: false,
            message:error.message,
            errordetails: error
        })
    }
}


/**
 * 
 * @param {*} req 
 * @param {*} res 
 * @returns current user inforrmation
 */
exports.me = async(req, res)=>{

    console.log('i was invoked')

    try {
        const user = req?.user

        if(!user){
            return res.status(400).json({
                message: 'User credentials not found',
                success:false
            })
        }

        return res.status(200).json({
            message: 'User credentials fetched',
            ...user,
            success: true
        })

    } catch (error) {
        console.log('error', error)
        return res.status(500).json({
            success: false,
            message:error.message,
            errordetails: error
        })
    }
}

