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

        if(!user){
            res.status(404).json({error: 'User not found'});
        }
        const passowrdvalid = await bcrypt.compare(password, user.password);

        if(!passowrdvalid){
            return res.status(401).json({error: 'Invalid password'});
        }

        
        if(user.role == 'vendor'){
            const shop = await shopModel.getMyshops(user.id);
                const token = jwt.sign(
                    {
                        userid: user.id,
                        userrole:user.role,
                    },
                    process.env.JWT_SECRET,
                    {
                        expiresIn: '3h'
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
                            expiresIn: '3h'
                        }
                    )
    
                return res.status(201).json({ token:token, shoptoken:shoptoken})

                }else{
                    return res.status(201).json({ token:token})
                }



        }else{
            const token = jwt.sign(
                {
                    userid: user.id,
                    userrole:user.role
                },
                process.env.JWT_SECRET,
                {
                    expiresIn: '3h'
                }
            );

            return res.status(201).json({ token:token})
        }


        
    } catch (error) {
         return res.status(500).json({error: error.message})
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