const jwt  = require('jsonwebtoken');
const userModel =  require('../models/user.model')
const bcrypt = require('bcryptjs')
const shopModel = require('../models/shop.model')

// register logic 
exports.register = async (req, res) =>{
    const { username, email, role, password, firstname, lastname} = req.body;
    try {
        const user = await userModel.createUser(username,email,role, password, firstname, lastname);
        if(user.success){
            return res.status(201).json({message: user.message, success:user.success })
        }
        return res.status(401).json({message: user.message, success:user.success })

    } catch (error) {
        return res.status(500).json({error: 'Internal server error', details: error.message});
    }
}


// login logic 
exports.login = async(req, res) =>{
    const {email, password} = req.body;

    try {
        const user = await userModel.findUserByEmail(email);

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
                            shopid:data.shop_id
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