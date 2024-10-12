const productModel = require('../models/product.model')

exports.addProduct = async(req, res)=>{
    const { product_name, price, category, brand, description, instock, tags, other_images, main_image, } = req.body


    const shop = req.shop

    try {
        
        const product = await productModel.createProduct(product_name, description, shop.shopid, price, category, instock, brand, main_image, other_images, tags)

        if(!product.success){
            return res.status(400).json(
                {
                    message: product.message,
                    success:product.success
                }
            )
        }

        return res.status(200).json(
            {
                message: product.message,
                success:product.success
            }
        )

    } catch (error) {
        return res.status(500).json(
            {
                message: 'Internal server error',
                error: error.message
            }
        )
    }
}