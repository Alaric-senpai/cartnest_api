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
            "select * from products where instock>0"
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

exports.VerifyInStcck = async(product)=>{
    try {
        console.log('from stock verification')
        console.log(product)
        const conn = await pool.getConnection()

        const query = await conn.query("select instock from products where id=?",[product]);

        console.log(query)

         conn.release()

        if(!query){
            return {
                success: false,
                message: 'Query failed',
                status:501
            }
        }

        return {
            success: true,
            instock:query[0].instock,
            message:'Instock data found'
        }

    } catch (error) {
        throw error
    }
}
/**
 * 
 * @param {number} product The product number
 * @param {string} actions The actions to do 
 * @param {number} user = optinal user variabe 
 * @example "purchase" = when purchasing a product,
 * @example "update" = when the vendor is adding the product sin stock
 * @param {number} number cthe number to add or subtract from stock
 * @returns 
 */
exports.UpdateInstock = async(product, actions, number, user=1)=>{
    try {
        
        console.log(product)

        const conn = await pool.getConnection()

        // if(actions === 'purchase')

        let query;
        let totalProcutsRemaining
        const instock = await this.VerifyInStcck(product)
        if(!instock.success){
            return instock
        }
        console.log(instock)
        switch (actions) {
            case 'purchase':
                // /distribute cash to vendors 




                if(parseInt(instock.instock) < 0){
                    return {
                        success:false,
                        message: 'The product you are attempting to purchase is currently out of stock',
                        status: 402
                    }
                }
                if(parseInt(instock.instock) < parseInt(number)){
                    return {
                        success: false,
                        Message: 'The number of products you are attempting to purchase exceed the current products stock qunatity',
                        status: 402
                    }
                }


                    // distibution code 


                        /**
                         * get product details
                         */

                    const productinfo = await this.getproductById(product)

                    if(!productinfo.success){
                        return productinfo
                    }

                    let productData  = productinfo.product
                    /**
                     * register product sale
                     */

                    const registerSales = await registerProductSales( product ,productData.vendor,number, user)


                    if(!registerSales.success){
                        return registerSales
                    }


                 totalProcutsRemaining = parseInt(instock.instock) - number
                
                break;
            case 'update':
                 totalProcutsRemaining = parseInt(instock.instock) + number

                    break
            default:
                return {
                        success:false,
                        message: 'Invalid Product action',
                        status: 402
                    }
                }
                console.log(totalProcutsRemaining)
                query = await conn.query("update products set instock=? where id=?", [totalProcutsRemaining, product])

                console.log(query)

                conn.release()

                if(!query){
                    return {
                        success: false,
                        message: 'Product action failed',
                        status:402
                    }
                }
                return {
                    success: true,
                    message: 'Products instock updated successfully',
                    status: 200
                }
    } catch (error) {
        throw error
    }
}


/**
 * register a sale in the salse table
 * @param {number} vendor -> the vendor buying the product from
 * @param {number} count -> number of products bought
 * @param {number} user -> the user who bought the product
 * @param {number} product 
 */

async function registerProductSales( product, vendor, count, user){
    try{
        const conn = await pool.getConnection()

        const query = await conn.query("insert into sales(product_id, vendor_id, quantity, userid) values(?,?,?)",[product, vendor, count, user])

        await conn.release()

        if(!query){
            return {
                message: 'sale Registration failure',
                success:false
            }
        }

        return {
            message: 'Sale registered successfully',
            success:true
        }

    }catch(error){
        throw error
    }
}