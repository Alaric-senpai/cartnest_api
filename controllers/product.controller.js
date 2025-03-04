const productModel = require('../models/product.model')

exports.addProduct = async(req, res)=>{
    const { name, price, category, brand, description, instock, tags, other_images, main_image, } = req.body

// console.log(req.body)
    const shop = req.shop

    try {
        
        const product = await productModel.createProduct(name, description, shop.shopid, price, category, instock, brand, main_image, other_images, tags)

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

exports.productsList = async(req, res) =>{
    try {
        
        const products = await productModel.listProducts();

        if(!products.success){
            return res.status(400).json(
                {
                    message: products.message,
                    success:products.success
                }
            )
        }

        res.status(200).json(
            {
                message: products.message,
                products:products.products,
                success:products.success
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

exports.getProductbyId = async(req, res)=>{
    try {
        
        const product_id = req.query.product_id;

        const product = await productModel.getproductById(product_id);

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
                product: product.product,
                data: product.data,
                success:product.success
            }
        )

    } catch (error) {
        return res.status(500).json(
            {
                message: error.message,
                error: error.error
            }
        )
    }
}

exports.getProductsbyCategory = async (req, res)=>{
    try {
        
        const params = req.query

        const category = params.category_id;


        const products = await productModel.getproductsBycategory(category);

        if(!products.success){
            return res.status(400).json(
                {
                    message: products.message,
                    success:products.success
                }
            )
        }

        return res.status(200).json(
            {
                message: products.message,
                products:products.product,
                success:products.success
            }
        )

    } catch (error) {
        return res.status(500).json(
            {
                message: error.message,
                error: error.error
            }
        )
    }
}

exports.getProductsbyBrand = async (req, res)=>{
    try {
        
        const params = req.query


        const brand = params.brand_id;

        const products = await productModel.getproductsByBrand(brand);

        if(!products.success){
            return res.status(400).json(
                {
                    message: products.message,
                    success:products.success
                }
            )
        }

        return res.status(200).json(
            {
                message: products.message,
                products:products.product,
                success:products.success
            }
        )

    } catch (error) {
        return res.status(500).json(
            {
                message: error.message,
                error: error.error
            }
        )
    }
}

exports.getProductsbyVendor = async (req, res)=>{
    try {
        
        const params = req.shop


        const shopid = params.shopid;

        const products = await productModel.getproductsByShop(shopid);

        if(!products.success){
            return res.status(400).json(
                {
                    message: products.message,
                    success:products.success
                }
            )
        }

        return res.status(200).json(
            {
                message: products.message,
                products:products.product,
                success:products.success
            }
        )

    } catch (error) {
        return res.status(500).json(
            {
                message: error.message,
                error: error.error
            }
        )
    }
}
exports.trendingProducts = async(req, res)=>{
    try{
        const products = await productModel.trendingproducts();

        if(!products.success){
            return res.status(400).json(
            {
                message: products.message,
                success: products.success
            })
        }

        return res.status(200).json(
        {
            message:products.message,
            products:products.products,
            success:products.success

        })
    } catch (error){
        return res.status(500).json(
        {
            message: 'Internal server error',
            error:error
        })
    }
}

/**
 * 
 * 
 * @returns the number of the specified products in stock
 */
exports.GetInStock = async(req, res)=>{
    try {
        
        const params = req.query

        // console.log(params)

        const productId = params.product
        console.log(productId)

        const inStock = await productModel.VerifyInStcck(productId)

        if(!inStock.success){
            res.status(404).json(inStock)
        }

        return res.status(201).json(inStock)

    } catch (error) {
        return res.status(500).json(
            {
                message: error.message,
                error: error.error
            }
        )
    }
}

/**
 * update the prduct stuch accordingly
 * 
 *  
 */
exports.UpdateProductReqistry = async(req, res)=>{
    try {
        const {product, quantity} = req.body
        console.log(req.body)
        const update = await productModel.UpdateInstock(product, 'update', quantity)

        if(!update.success){
            res.status(404).json(update)
        }
        res.status(200).json(update)

    } catch (error) {
        return res.status(500).json(
            {
                message: error.message,
                error: error.error
            }
        )
    }
}