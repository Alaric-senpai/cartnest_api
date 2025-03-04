const pool = require('../config/db.config')


// show all tables 
exports.tables = async () =>{
    try {
        const conn = await pool.getConnection();
        const result = await conn.query(
            "show tables"
        )

        conn.release();
        return result;
    } catch (error) {
        throw error
    }
}

exports.admins = async () =>{
    try{
        const conn = await pool.getConnection();

        const result = await conn.query(
            "select * from admins"
        )

        conn.release();

        return result


    }catch(err){
        throw err
    }
}

exports.users = async () =>{
    try{
        const conn = await pool.getConnection();

        const result = await conn.query(
            "select id, email, role, created_at, updated_at from users"
        )

        conn.release();

        return result


    }catch(err){
        throw err
    }
}

exports.shops = async () => {
    try {
        const conn = await pool.getConnection();
        
        const result = await conn.query(
            "SELECT * FROM shops "
        );

        conn.release();

        // Check if the result is empty
        if (result.length === 0) {
            return { message: 'No shops listed currently', success: true, shops: [] };
        }

        return { message: 'Shops fetched successfully', success: true, shops: result };

    } catch (error) {
        return { message: 'Error fetching shops', success: false, error: error.message };
    }
}



exports.vendors = async () =>{
    try{
        const conn = await pool.getConnection();

        const result = await conn.query(
            "select * from shop_owners"
        )

        conn.release();

        return result


    }catch(err){
        throw err
    }
}

exports.customers = async () =>{
    try{
        const conn = await pool.getConnection();

        const result = await conn.query(
            "select * from customers"
        )

        conn.release();

        return result


    }catch(err){
        throw err
    }
}