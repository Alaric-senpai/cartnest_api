const pool  = require('../config/db.config')

exports.newcart = async(name, userid, image)=>{

    try {
        
        const conn = await pool.getConnection();

        const cart = await conn.query(
            "insert into carts(user_id, name, image) values(?,?,?)",
            [userid, name, image]
        )

        conn.release()
        if(!cart){
            return{
                message: 'Querty failed',
                success:false
            }
        }

        return {
            message: 'Cart added successfully',
            success:true
        }

    } catch (error) {
        console.log(error)
        throw error
    }

}

exports.myCarts = async(userid)=>{
    try {
        
    const conn = await pool.getConnection();

    const carts = await conn.query(
        "select * from carts where user_id=?",
        [userid]
    )

    conn.release()

    if(!carts){
        return{
            message: 'Query failed',
            success:false
        }
    }

    return {
        message: 'Carts found',
        carts: carts,
        success: true
    }

    } catch (error) {
        throw error
    }
}

exports.addTocart = async(user_id, cartid, productid, vendor, quantity) =>{
    try {
        

        // const conn = await pool.getConnection();

        const carts = await this.myCarts(user_id)

        if(!carts.success){
            return {
                message: carts.message,
                success: carts.message
            }
        }

        const carts_no = carts.carts

        if(carts_no.length < 1){
            return {
                message: 'No cart to add product to',
                success: false
            }
        }

        const good = await addGoods(user_id, vendor, productid, quantity,cartid)

        if(!good.success){
            return {
                message: good.message,
                success:good.success
            }
        }

        return {
            message: good.message,
            success:good.success
        }


    } catch (error) {
        throw error
    }
}

async function addGoods(userid, vendor, product, quantity, cart){
    try {
        
        const conn = await pool.getConnection();

        const good = await conn.query(
            "insert into carted_goods(user_id, product_id, vendor, cart_id, quantity) values(?,?,?,?,?)"
            [userid,product,vendor, cart, quantity]

        )

        conn.release()

        if(!good){
            return {
                message: 'Query failed',
                success: false
            }
        }

        return {
            message: 'Product added to cart',
            success:true
        }

    } catch (error) {
        throw error
    }
}

exports.cartGoods = async(userid, cartid) =>{
    try {
        
        const conn = await pool.getConnection();

        const goods = await conn.query(
            "select * from carted_goods where user_id=? and cart_id=?",
            [userid, cartid]
        )

        conn.release()

        if(!goods){
            return {
                message: 'Query failed',
                success:false
            }
        }

        return {
            message: 'Goods found',
            products:goods,
            success:true
        }

    } catch (error) {
        throw error
    }
}
exports.deletecart = async(userid, cartid) =>{
    try {
        
        const conn = await pool.getConnection();

        const goods = await conn.query(
            "delete from carts where user_id=? and id=?",
            [userid, cartid]
        )

        conn.release()

        if(!goods){
            return {
                message: 'Query failed',
                success:false
            }
        }

        return {
            message: 'Cart deleted',
            success:true
        }

    } catch (error) {
        throw error
    }
}