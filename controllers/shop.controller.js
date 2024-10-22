const shopModel = require('../models/shop.model');
const jwt = require('jsonwebtoken')
exports.createShop = async (req, res) => {
    const { 
        name,
        location,
        email,
        hours,
        type,
        description,
        regno,
        years
    } = req.body;

    const user = req.user; // User should be attached from middleware
    if (user.userrole !== 'vendor') {
        return res.status(403).json({ message: 'Access denied. Only vendors can create shops.', success: false });
    }
    // console.log(user)

    try {

        const shop = await shopModel.newShop(email, name, user.userid, location, regno, type, description, hours, years);
        // console.log(shop)
        if (!shop.success) {
            return res.status(400).json({ message: shop.message, success: shop.success });
        }

        const data = (await shopModel.myShop(user.userid)).shop
        // console.log(data)

        const shoptoken = jwt.sign(
            {
                shopid:data.shop_id
            },
            process.env.JWT_SECRET,
            {
                expiresIn: '6h'
            }
        )
        


        return res.status(201).json({ message: shop.message, shoptoken:shoptoken , success: shop.success });

    } catch (error) {
        return res.status(500).json({
            message: 'Internal server error',
            error: error
        });
    }
};

exports.getShopById = async (req, res) =>{
    const  shop_id  = req.query.shop_id

    try {
        
        const shop = await shopModel.getdetails(shop_id)

        if(!shop.success){
            return res.status(404).json(
                {
                    message: shop.message,
                    success:shop.success
                 }
            )
        }

        return res.status(200).json(
            {
                message: shop.message,
                shop:shop.shop[0],
                shop_details: shop.shopdata,
                success:shop.success

            }
        )


    } catch (error) {
        return res.status(500).json(
            {
                message: "Internal server error",
                error: error.message
            }
        )
    }
}

exports.myShop = async (req, res) =>{


    try {
        const user = req.user;
    
        const userid = user.userid
    
        const shop = await shopModel.myShop(userid)
    
        if(!shop.success){
            return res.status(401).json(
                {
                    message: shop.message,
                    success:shop.success
                }
            )
        }
        
        return res.status(200).json(
            {
                message:shop.message,
                shop:shop.shop[0],
                shop_details:shop.shopdetails,
                success:shop.success
            }
        )

    } catch (error) {
        return res.status(500).json(
            {
                message: 'Internal server error',
                error:error.message
            }
        )
    }

}

exports.unverifiedShops  = async(req, res)=>{
    try{
        const shops = await shopModel.unverifiedShops();

        if(!shops.success){
            return res.status(400).json(
            {
                message: shops.message,
                success: shops.success
            })
        }

        return res.status(200).json(
        {
            message: shops.message,
            shops:shops.shops,
            success:shops.success
        })

    }catch (error){
        return res.status(500).json(
            {
                message: 'Internal server error',
                error:error.message
            }
        )
    }        
    }


exports.updateShop = async(req, res)=>{

    const { status, vendor } = req.body

    // const params = req.body

    // console.log(req.body)

    // const status_text = params.status

    // const shop_id = params.vendor
    try {


        const update = await shopModel.updateShop(status, vendor)

        if(!update.success){
            return res.status(400).json(
                {
                    message: update.message,
                    success:update.success
                }
            )
        }
        return res.status(200).json(
            {
                message: update.message,
                success:update.success
            }
        )
        
    } catch (error) {
        return res.status(500).json(
            {
                message: 'Internal server error',
                error:error.message
            }
        )        
    }
}