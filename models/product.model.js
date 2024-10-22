const pool = require('../config/db.config')


// add a new product 
exports.createProduct = async(name, description, shop_id, price, category_id, instock, brand_id, main_image, other_images, tags) =>{
    try {        

        const product = await addProduct(name, brand_id, shop_id, category_id, description, price, instock, main_image)

        if(!product.success){
            return {
                message: product.message,
                success:product.success
            }
        }

        const insertId = product.id;

        const info = await productDetails(insertId, tags, other_images)

        if(!info.success){
            return {
                message: info.message,
                success: info.success
            }
        }


        return {
            message: info.message,
            success: info.success
        }



    } catch (error) {
        throw error;
    }
}


async function addProduct(name, brand, vendor, category, description, price , instock, main_image){

    try {
        
        const conn = await pool.getConnection();

        await conn.query(
            "set foreign_key_checks = 0"
        )

        const add = await conn.query(
            "insert into products(category, brand, vendor, name, description, price, instock, main_image) values(?,?,?,?,?,?,?,?)",
            [category, brand, vendor, name,description, price, instock, main_image]
        )


        await conn.query(
            "set foreign_key_checks = 1"
        )

        conn.release()
        if(!add){
            return { message: 'Insert sql failed', success:false }
        }

        return { message: 'Product added', id:add.insertId, success:true}


    } catch (error) {
        throw error;
    }
}


async function productDetails(product_id, tags, other_images){

    try {
        
        const conn = await pool.getConnection()

        const info = await conn.query(
            "insert into products_info(product_id, tags, other_images) values(?,?,?)",
            [product_id, {tags}, {other_images}]
        )

        conn.release()

        if(!info){
            return {
                message: 'Addition of product info failed',
                success: false
            }
        }

        return {
            message: 'Product added successfully',
            success:true
        }

    } catch (error) {
        throw error
    }
}


// list all products 
exports.listProducts= async () => {
     try {
        
        const conn = await pool.getConnection();

        const result = await conn.query(
            "select * from products"
        )

        conn.release();

        if(!result){
            return{ message: 'Products not loaded', success:false }
        }

        return { message: 'Products fetched successfully', products:result, success:true }

     } catch (error) {
        throw error;
     }
}


// get specific product 
exports.getproductById = async (product_id)=>{
    try {
        
        const conn = await pool.getConnection();

        const product = await conn.query(
            "select * from products where id=?",
            [product_id]
        )

        const data = await conn.query(
            "select * from products_info where product_id = ?",
            [product_id]
            )

        conn.release()

        if(!product){
            return { message: 'Product fetch failed', success:false }
        }

        return { message: "product found", product:product[0], data:data[0], success:true }

    } catch (error) {
        throw error
    }
}

// get products by category 
exports.getproductsBycategory = async (category_id)=>{
    try {
        
        const conn = await pool.getConnection();

        const product = await conn.query(
            "select * from products where category=?",
            [category_id]
        )

        conn.release()

        if(!product){
            return { message: 'Product fetch failed', success:false }
        }

        return { message: "product found", product:product, success:true }

    } catch (error) {
        throw error
    }
}

// get products by brand 
exports.getproductsByBrand = async (brand_id)=>{
    try {
        
        const conn = await pool.getConnection();

        const product = await conn.query(
            "select * from products where brand=?",
            [brand_id]
        )

        conn.release()

        if(!product){
            return { message: 'Product fetch failed', success:false }
        }

        return { message: "product found", product:product, success:true }

    } catch (error) {
        throw error
    }
}

// get products by vendor 

exports.getproductsByShop = async (shop_id)=>{
    try {
        
        const conn = await pool.getConnection();

        const product = await conn.query(
            "select * from products where vendor=?",
            [shop_id]
        )

        conn.release()

        if(!product){
            return { message: 'Product fetch failed', success:false }
        }

        return { message: "product found", product:product, success:true }

    } catch (error) {
        throw error
    }
}

// trending products

exports.trendingproducts = async ()=>{
    try{
        const conn = await pool.getConnection();

        const products = await conn.query(
            "select * from products where trending='yes'"
        );

        conn.release()
        if(!products){
            return { message: 'Products sql failed', success:false}
        }

        return{ message: 'Products found', products:products, success:true }

    } catch (error){
        throw error;
    }
}

// delete product

exports.deleteProduct = async (product_id)=>{
    try {
        
        const conn = await pool.getConnection();

        const product = await conn.query(
            "delete  from products where id=?",
            [product_id]
        )

        conn.release()

        if(!product){
            return { message: 'Product delte failed', success:false }
        }

        return { message: "product delete was sucessfull", success:true }

    } catch (error) {
        throw error
    }
}

