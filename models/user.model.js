const pool = require('../config/db.config')

const bcrypt = require('bcryptjs');


// register method 
exports.createUser = async(username, email, role, password, firstname, lastname) =>{

    try {


        const userRegisered = await this.findUserByEmail(email);

        if(userRegisered.success){
            return { message: 'User is Already registered try to login', success:true }
        }
        const hashed = await bcrypt.hash(password, 10);
        const conn = await pool.getConnection();
        const result = await conn.query(
            "insert into users(username, email, role, password) values(?,?,?,?)",
            [username, email, role, hashed]
        );

        if(!result){
            return { message: 'User not created', success:false }
        }

        let respectiveinsert;

        if(role == "customer"){
             respectiveinsert = await conn.query(
                "insert into customers (user_id, first_name, last_name) values(?,?,?)",
                [result.insertId, firstname, lastname]
            );
        }else if(role == "vendor"){
             respectiveinsert  = await conn.query(
                "insert into shop_owners (user_id, firstname, lasttname) values(?,?,?)",
                [result.insertId, firstname, lastname]
            );
        }else if(role == "admin"){
             respectiveinsert  = await conn.query(
                "insert into admins (user_id, firstname, lastname) values(?,?,?)",
                [result.insertId, firstname, lastname]
            );
        }

        conn.release();
        if(!respectiveinsert){
            return { message:`insert not registered correctly`, success:false }
        }else{
            return { message: 'User registered successully', success:true };

        }


    } catch (error) {
        console.log(error)
        throw error;
    }
}


// login method is ok
exports.findUserByEmail = async(email) =>{
    try {
        const conn = await pool.getConnection();

        const result = await conn.query(
            "select * from users where email=?",
            [email]
        );
        conn.release();
        if(result.length == 0){
            return { message: 'User not found', success:false }
        }
        return { message: 'User found', user:result[0], success:true };
    } catch (error) {
        throw error
    }
}



// delete user from respective ussertype table 

async  function deleteUserFromTypetable(userid, usertype){
    try{
        const conn = await pool.getConnection();

        let result;

        if(usertype === 'admin'){
            result = await conn.query(
                "delete from admins where user_id=?", [userid]
            )

        }else if(usertype === "customer"){
            result = await conn.query(
                "delete from customers where user_id=?", [userid]
            )
        }else if(usertype === "vendor"){
            result = await conn.query(
                "delete from shop_owners where user_id =?", [userid]
            )
        }

        conn.release();

        return result.affectedRows;

    }catch(error){
        throw error;
    }
}



exports.deleteUserByEmail = async(email) =>{
    try {
        
        const user = await this.findUserByEmail(email);
        
        if(!user){
            return{ message: 'User not found', success:false }
        }


        const deleteType = await deleteUserFromTypetable(user.id, user.role);

        if(!deleteType){
            return { message: `No user found in the ${user.role}'s tables`, success:false }
        }
        const conn = await pool.getConnection();

        const delResult = await conn.query(
            "delete from users where email=?",[email]
        );
        conn.release()
        if(!delResult){
            return { message: 'User not found in main table', success:false };
        }

        return { message: 'User deleted successfully', success:true}
        



    } catch (error) {
        throw error
    }
}

exports.storeToken = async (email, code) => {
    try {
        const conn = await pool.getConnection();

        // Run the update query to store the reset token
        const query = await conn.query(
            "UPDATE users SET resetToken = ?, updated_at = ? WHERE email = ?",
            [code, new Date(), email]
        );

        conn.release();

        console.log(query)

        // Check if the query affected any rows
        if (query.affectedRows > 0) {
            return {
                message: 'Reset token set successfully',
                success: true,
            };
        }

        return {
            message: 'Reset token not set. Email might not exist.',
            success: false,
        };
    } catch (error) {
        console.error("Error in storeToken:", error);
        throw error;
    }
};


exports.newPass = async(email, password) =>{
    try {
        
        const conn = await pool.getConnection()

        const hashedPass = await bcrypt.hash(password, 10)

        const query = await conn.query(
            "update users set password=?, resetToken=? where email=? ",
            [hashedPass, null, email]
        )

        if(query.affectedRows > 0){
            return {
                message: 'Password updated successfully',
                success: true
            }
        }

        return {
            message: 'Password update failed',
            success: false
        }

    } catch (error) {
        throw error
    }
}

exports.confirmToken = async (email, token) => {
    try {
        const conn = await pool.getConnection();

        // Fetch the user by email
        const query = await conn.query(
            "SELECT resetToken FROM users WHERE email = ? LIMIT 1",
            [email]
        );

        conn.release();

        console.log(query)
        // Check if user exists and token matches
        if (query.length === 0) {
            return {
                message: 'User not found',
                success: false,
            };
        }

        const storedToken = query[0].resetToken;
        if (storedToken === token) {
            return {
                message: 'Token matched successfully',
                success: true,
            };
        }

        return {
            message: 'Token does not match',
            success: false,
        };
    } catch (error) {
        console.error("Error in confirmToken:", error);
        throw error;
    }
};

exports.CustomerInfo  = async(userid)=>{
    try {
        
        const conn = await pool.getConnection()

        const query = await conn.query(
            "select * from customers where user_id=? limit 1",
            [userid]
        )

        conn.release()

        if(query){
            return {
                 message: 'Customer info found',
                 customer: query[0],
                 success: true

            }
        }    
        return {
            message: 'Query error',
            success: false
        }    

    } catch (error) {
        throw error
    }
}