const pool = require('../config/db.config');

exports.getMyshops = async (owner_id) => {

    if(owner_id == null ){
        return { message:'Owner id not passed', success:false }
    }

    let conn;
    try {

        // console.log(owner_id)

        conn = await pool.getConnection(); // Await connection properly

        const shop = await conn.query(
            "SELECT * FROM shops WHERE owner_id = ? LIMIT 1",
            [owner_id]
        );
        if (!shop.length) {
            return { message: 'No shops registered', success: false, length: null };
        }

        return { message: 'Shop found', shop:shop[0], length:shop.length, success: true, shopid:shop[0].shop_id };

    } catch (error) {
        throw error;
    } finally {
        if (conn) conn.release(); // Ensure connection is released
    }
};


async function getshopCount(owner_id) {
    try {
        
        const conn = await pool.getConnection();

        const count = await conn.query(
            "select count(shop_id) as count from shops where owner_id=?",
            [owner_id]
        )

         conn.release()

         console.log(count.length)

        if(!count){
            return { message: 'Query failed', success:false}
        }

        return { message: 'Shops count', count: count.count , success:true }

    } catch (error) {
        throw error
    }
}


exports.newShop = async (email, shop_name, owner_id, location, regno, type, description, hours, years) => {

    // console.log("email:" + email)
    // console.log("shop name:" + shop_name)
    // console.log("owner_id:" + owner_id)
    // console.log("location:" + location)
    // console.log("description:" + description)
    // console.log("regno:" + regno)
    // console.log("years:" + years)


    if(owner_id == undefined){
        return { message: 'Owner id not passed', success:false }
    }

    try {
        const shops =await this.getMyshops(owner_id)
        
        if(shops.success){
            return { message: 'You can only register one shop', success:false }
        }
        // console.log(shops)



        const registerShop = await AddShop(shop_name, email, owner_id, regno);
        // console.log(registerShop)
        if (!registerShop.success) {
            return { message: registerShop.message, success: registerShop.success };
        }

        const addDetails = await AddShopDetails(registerShop.insertid, location, type, description, hours, years);

        if (!addDetails.success) {
            return { message: addDetails.message, success: addDetails.success };
        }

        return { message: registerShop.message, success: registerShop.success };

    } catch (error) {
        throw error;
    }
};

async function AddShop(name, email, owner_id, regno) {
    // console.log(name + email + owner_id + regno)
    try {
        
        const conn = await pool.getConnection();


        await conn.query(
            "set foreign_key_checks = 0"
        );

        const result = await conn.query(
            "INSERT INTO shops (owner_id, shop_email, shop_name, business_registration_number) VALUES (?, ?, ?, ?)",
            [owner_id, email, name, regno]
        );

        await conn.query(
            "set foreign_key_checks = 1"
        )

        conn.release();

        if (!result.insertId) {
            return { message: 'Shop creation failed', success: false };
        }

        return { message: 'Shop created successfully', success: true, insertid: result.insertId };

    } catch (error) {
        throw error;
    }
}

async function AddShopDetails(shopid, location, type, description, hours, years) {
    let conn;
    try {
        conn = await pool.getConnection();

        const result = await conn.query(
            "INSERT INTO vendor_details (vendor_id, business_type, business_description, location, operational_hours, years_in_business) VALUES (?, ?, ?, ?, ?,?)",
            [shopid, type, description, location, hours, years]
        );

        if (!result.affectedRows) {
            return { message: 'Shop details not passed', success: false };
        }

        return { message: 'Shop details saved successfully', success: true };

    } catch (error) {
        throw error;
    } finally {
        if (conn) conn.release();
    }
}

exports.getdetails =async(shop_id) =>{
    try {
        const details = await getshop(shop_id)

        if(!details.success){
            return { message:details.message, success:details.success }
        }

        const conn = await pool.getConnection();
        
        const result = await conn.query(
            "select * from vendor_details where vendor_id=?" ,
            [shop_id]
        )
        

        conn.release()

        if(!result){
            return { message: 'Query failed', success:false }
        }

        if(result.length == 0){
            return { message: 'Shop does not exist', success:true }
        }

        return { message: " Shop data  found", shopdata:result[0], success:true, shop:details.shop }




    } catch (error) {
        throw error
    }
}

async function getshop(shop_id) {

    if(shop_id == null || shop_id == undefined){
        return { message:'Shop id not passed', success:false }
        
    }

    try {
        const conn = await pool.getConnection();
        

        const shop = await conn.query(
            "select * from shops where shop_id=?",
            [shop_id]
        )

        conn.release()

        if(!shop){
            return { message: 'query failed', success:false }
        }

        if(shop.length == 0){
            return { message: 'Shop does not exist', success:false }
        }

        return { message: 'Shop found', shop:shop, success:true }

    } catch (error) {
        throw error
    }
}

exports.myShop = async(owner_id) =>{
    try {
        

        const shop = await this.getMyshops(owner_id)


        if(!shop.success){
            return { message: shop.message, success:shop.success}
        }


        const data = await this.getdetails(shop.shopid)

        if(!data.success){
            return  { message: data.message , success:data.success }
        }

        return { message: data.message, shop:data.shop, shopdetails:data.shopdata, success:data.success }


    } catch (error) {
        
        throw error;
        
    }
}

exports.unverifiedShops = async()=>{
    try{
        const conn = await pool.getConnection();

        const shops = await conn.query(
            "select * from shops where status ='pending'"
            );

        conn.release()

        if(!shops){
            return {
                message: 'Query failed',
                success: 'false'
            }

        }

        return {
            message: 'Vendors found',
            shops:shops,
            success:true
        }
    }catch(error){
        throw error;
    }

}

exports.updateShop  = async(status_text, shop_id)=>{
    // console.log(status_text)
    // console.log(shop_id)
    try {
        
        const conn = await pool.getConnection();

        const update = await conn.query(
            "update shops set status=? where shop_id=?",
            [status_text, shop_id]
        )
        conn.release()
        if(conn.affectedRows < 1){
            return {
                message: "shop update failed",
                success: false
            }

        }

        return {
            message: `shop ${status_text}ed successfully`,
            success:true
        }

    } catch (error) {
        throw error;
    }
}