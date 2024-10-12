const pool = require('../config/db.config')


// create a new brand 
exports.createBrand = async(brandname) =>{
    try {
        const conn = await pool.getConnection();
        const result = await conn.query(
            "insert into brands(brand_name) values(?)",
            [brandname]
        );

        conn.release();

        return result.insertId;
    } catch (error) {
        throw error
    }
}

// get a list of all brands 
exports.getBrands = async() =>{
    try {
        const conn = await pool.getConnection();
        const result = await conn.query(
            'select * from brands'
        );
        conn.release()
        return result
    } catch (error) {
        throw error
    }
}


// get specific brand 
exports.getBrandById = async (id) => {
    try {
        // Establish a connection with the database
        const conn = await pool.getConnection();

        // Query the database for the brand with the provided id
        const result = await conn.query(
            "SELECT * FROM brands WHERE id = ?",
            [id]
        );

        // Release the connection
        conn.release();

        // Check if the brand was found
        if (result.length === 0) {
            return { message: 'Brand not found', success: false };
        }

        // Return the found brand
        return { message: 'Brand found', result: result[0], success: true };

    } catch (error) {
        // Throw the error so it can be handled by the controller
        throw error;
    }
};
