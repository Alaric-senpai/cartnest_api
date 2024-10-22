const pool = require('../config/db.config')

async function exists(user_id, product_id){

    try {
        
        const conn = await pool.getConnection();

        const result = await conn.query(
            "select * from carted_goods where user_id=? and product_id=?",
            [user_id, product_id]
        )

        conn.release()
        if(!result){
            return {
                message: 'Query failed',
                success:false
            }
        }
        return {
            message: 'Records found',
            records:result,
            success:true
        }
    } catch (error) {
        throw error        
    }
}

exports.singleOrder = async(user, product, vendor, quantity) =>{
    try {
        const conn = await pool.getConnection()

        const order = await conn.query(
            "insert into orders (user_id, product_id, vendor, quantity) values(?,?,?,?)",
            [user, product, vendor, quantity]
        )

        conn.release()

        if(!order){
            return {
                message: 'query failed',
                success:false
            }
        }

        return {
            message: 'Order registered',
            orderid: order.insertId,
            success:true
        }

    } catch (error) {
        throw error
    }
}

exports.completeSingleorder = async(order_id, userid) =>{

    try {
        
        const conn =  await pool.getConnection()

        const complete = await conn.query(
            "update orders set status=completed  where id=? and user_id=?",
            [order_id, userid]
        )

        conn.release()
        if(!complete){
            return {
                message: 'Query failed',
                success: false
            }
        }

        return {
            message: 'order completed',
            success:true
        }

    } catch (error) {
        throw error
    }
}

exports.cancelSingleOrder = async(order_id, userid) =>{

    try {
        
        const conn =  await pool.getConnection()

        const cancel = await conn.query(
            "update orders set status=cancelled  where id=? and user_id = ? ",
            [order_id, userid]
        )

        conn.release()
        if(!cancel){
            return {
                message: 'Query failed',
                success: false
            }
        }

        return {
            message: 'order completed',
            success:true
        }

    } catch (error) {
        throw error
    }
}

exports.myOrders = async(user_id) =>{
    try {
        
        const conn =  await pool.getConnection();

        const orders = await conn.query(
            "select * from orders where user_id=? group by status asc",
            [user_id]
        )

        if(!orders){
            return {
                message: 'Query failed',
                success: false
            }
        }

        return {
            message: 'Records found',
            records: orders,
            success:true
        }

    } catch (error) {
        throw error
    }
}

exports.shoporders = async(vendor) =>{
    try {
        
        const conn =  await pool.getConnection();

        const orders = await conn.query(
            "select * from orders where vendor=? group by status asc",
            [vendor]
        )

        if(!orders){
            return {
                message: 'Query failed',
                success: false
            }
        }

        return {
            message: 'Records found',
            records: orders,
            success:true
        }

    } catch (error) {
        throw error
    }
}

