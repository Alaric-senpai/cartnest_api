const shopModel = require('../models/shop.model');

exports.createShop = async (req, res) => {
    const { 
        shop_name,
        location,
        shop_email,
        hours,
        shop_type,
        description,
        regno,
        years
    } = req.body;

    const user = req.user; // User should be attached from middleware

    console.log(user);
    

    // Check if the user role is valid for shop creation
    if (user.userrole !== 'vendor') {
        return res.status(403).json({ message: 'Access denied. Only vendors can create shops.', success: false });
    }

    try {

    

        const shop = await shopModel.newShop(shop_email, shop_name, user.userid, location, regno, shop_type, description, hours, years);

        if (!shop.success) {
            return res.status(400).json({ message: shop.message, success: shop.success });
        }

        return res.status(201).json({ message: shop.message, success: shop.success });

    } catch (error) {
        return res.status(500).json({
            message: 'Internal server error',
            error: error.message,
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