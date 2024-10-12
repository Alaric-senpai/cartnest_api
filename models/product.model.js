const pool = require('../config/db.config')


// add a new product 
exports.createProduct = async(name, description, shop_id, price, category_id, instock, brand_id, main_image, other_images, tags) =>{

    

    try {
        
        const conn = await pool.getConnection();

        // insert into table 

        const result = await conn.query(
            "insert into products ( name, category, brand, vendor, description, price, instock, tags, main_image, other_images ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            [name, category_id,brand_id,shop_id, description, price, instock, tags, main_image, other_images]
        )

        console.log(result)

        conn.release()
        if(!result){
            return { message: 'Product registration failed', success:false }
        }

        return { message: 'Product added successfuly', success:true }

    } catch (error) {
        throw error;
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

        conn.release()

        if(!product){
            return { message: 'Product fetch failed', success:false }
        }

        return { message: "product found", product:product[0], success:true }

    } catch (error) {
        throw error
    }
}

// get products by category 
exports.getproductsBycategory = async (category_id)=>{
    try {
        
        const conn = await pool.getConnection();

        const product = await conn.query(
            "select * from products where category_id=?",
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
            "select * from products where brand_id=?",
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
            "select * from products where shop_id=?",
            [shop_id]
        )

        conn.release()

        if(!product){
            return { message: 'Product fetch failed', success:false }
        }

        return { message: "product found", product:product[0], success:true }

    } catch (error) {
        throw error
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

