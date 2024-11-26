const jwt  = require('jsonwebtoken');
const userModel =  require('../models/user.model')
const bcrypt = require('bcryptjs')
const shopModel = require('../models/shop.model')
const mail = require('../mailer/send.email')

// register logic 
exports.register = async (req, res) =>{
    const { username, email, role, password, firstname, lastname} = req.body;
    try {
        const user = await userModel.createUser(username,email,role, password, firstname, lastname);
        if(!user.success){
            return res.status(401).json({message: user.message, success:user.success })
        }
        // let fullname = firstname + " " + lastname;
        
        
        // const welcome = await mailer.WelcomeMail(email, fullname, 'Welcome to cartnest', 'welcom to the service' )
        // console.log(welcome)
        // if (!welcome.success) {
            return res.status(401).json({message: welcome.message, success:welcome.success })
            
        // }
        // else {
            return res.status(201).json({message: user.message, success:user.success })
        // }

    } catch (error) {

        return res.status(500).json({error: 'Internal server error', details: error.message});
    }
}


// login logic 
exports.login = async(req, res) =>{
    const {email, password} = req.body;

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



        }else{
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

exports.reset = async (req, res) => {
    console.log("Reset Password Endpoint Hit");

    const { email, password } = req.body;

    // Log request body for debugging
    console.log("Request Body:", req.body);

    if (!email || !password) {
        return res.status(400).json({
            message: "Email and password are required",
            success: false,
        });
    }

    try {
        const reset = await userModel.newPass(email, password);

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
        console.error("Error in Reset Password:", error);

        return res.status(500).json({
            message: "Internal server error",
            success: false,
            error: error.message || error,
        });
    }
};

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