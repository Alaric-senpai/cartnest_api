const pool = require('../config/db.config');

exports.newcart = async (name, userid, image) => {
    try {
        const conn = await pool.getConnection();

        const cart = await conn.query(
            "insert into carts(user_id, name, image) values(?,?,?)",
            [userid, name, image]
        );

        conn.release();
        if (!cart) {
            return {
                message: 'Query failed',
                success: false
            };
        }

        return {
            message: 'Cart added successfully',
            success: true
        };

    } catch (error) {
        console.log(error);
        throw error;
    }
};

exports.myCarts = async (userid) => {
    try {
        const conn = await pool.getConnection();

        const carts = await conn.query(
            "select * from carts where user_id=?",
            [userid]
        );

        conn.release();

        if (!carts) {
            return {
                message: 'Query failed',
                success: false
            };
        }

        return {
            message: 'Carts found',
            carts: carts,
            success: true
        };

    } catch (error) {
        throw error;
    }
};

// Move incart function above exports.addTocart
async function incart(cartid, product, user) {
    try {
        const conn = await pool.getConnection();

        const available = await conn.query(
            "select * from carted_goods where user_id=? and product_id=? and cart_id=?",
            [user, product, cartid]
        );

        await conn.release();

        if (!available) {
            return {
                message: 'Query failed',
                success: false,
                failed: true
            };
        }

        const length = available.length;

        return {
            message: 'Product already in this cart',
            success: true,
            length: length,
            failed: false
        };
    } catch (error) {
        console.log(error);
        throw error;
    }
}

exports.addTocart = async (user_id, cartid, productid, vendor, quantity) => {
    try {
        const carts = await this.myCarts(user_id);

        if (!carts.success) {
            return {
                message: carts.message,
                success: carts.message
            };
        }

        const carts_no = carts.carts;

        if (carts_no.length < 1) {
            return {
                message: 'No cart to add product to',
                success: false
            };
        }

        const incartResult = await incart(cartid, productid, user_id);

        if (incartResult.failed) {
            return {
                message: incartResult.message,
                success: incartResult.success
            };
        }

        if (incartResult.length > 0) {
            return {
                message: incartResult.message,
                success: incartResult.success
            };
        }

        const editable = await isEditable(cartid);

        if(!editable.editable){
            return {
                message: editable.message,
                success: false
            }
        }

        const good = await addGoods(user_id, vendor, productid, quantity, cartid);

        if (!good.success) {
            return {
                message: good.message,
                success: good.success
            };
        }

        return {
            message: good.message,
            success: good.success
        };

    } catch (error) {
        throw error;
    }
};


async function isEditable(cartid) {
    // body...

    try{
        const conn = await pool.getConnection()

        const query = await conn.query("select * from carts where id=?", [cartid])

        const cart = query[0]

        await conn.release()

        if(cart.is_editable == 1){
            return {
                message: "Cart is editable",
                editable:true
            }
        }

        return {
            message: "cart is not editable",
            editable: false
        }

    }catch(error){
        throw error
    }
}



async function addGoods(userid, vendor, product, quantity, cart) {
    try {
        const conn = await pool.getConnection();

        const good = await conn.query(
            "insert into carted_goods(user_id, product_id, vendor, cart_id, quantity) values(?,?,?,?,?)",
            [userid, product, vendor, cart, quantity]
        );
        await conn.release();

        if (!good) {
            return {
                message: 'Query failed',
                success: false
            };
        }

        return {
            message: 'Product added to cart',
            success: true
        };

    } catch (error) {
        throw error;
    }
}

exports.cartInfo = async(cartid)=>{
    try {
        
        const conn = await pool.getConnection()

        const query  = await conn.query(
            "select * from carts where id=?",
            [cartid]
        )

        await conn.release()

        if(query){
            return {
                message: 'Cart Found',
                cart:query[0],
                success: true
            }
        }
        return {
            message: 'Cart not found',
            success: false
        }

    } catch (error) {
        throw error
    }
}


exports.cartGoods = async (userid, cartid) => {
    try {
        const conn = await pool.getConnection();

        const goods = await conn.query(
            "select * from carted_goods where user_id=? and cart_id=?",
            [userid, cartid]
        );

        conn.release();

        if (!goods) {
            return {
                message: 'Query failed',
                success: false
            };
        }

        return {
            message: 'Goods found',
            products: goods,
            success: true
        };

    } catch (error) {
        throw error;
    }
};

exports.deletecart = async (userid, cartid) => {
    try {
        const conn = await pool.getConnection();

        const goods = await conn.query(
            "delete from carts where user_id=? and id=?",
            [userid, cartid]
        );

        conn.release();

        if (!goods) {
            return {
                message: 'Query failed',
                success: false
            };
        }

        return {
            message: 'Cart deleted',
            success: true
        };

    } catch (error) {
        throw error;
    }
};

exports.ModifyGood = async (cart, quantity, userid, product) => {
    const conn = await pool.getConnection();

    try {
        const query = await conn.query(
            "UPDATE carted_goods SET quantity = ?, updated_at = ? WHERE user_id = ? AND cart_id = ? and product_id=?",
            [quantity, new Date(), userid, cart, product]
        );

        if (query.affectedRows > 0) {
            return {
                message: 'Quantity updated successfully',
                success: true
            };
        }

        return {
            message: 'Quantity update failed',
            success: false
        };

    } catch (error) {
        throw error;
    } finally {
        conn.release(); // Ensure the connection is released after use
    }
};

exports.RemoveProduct = async (cart_id, productid)=>{
    try{
        const conn = await pool.getConnection()

        const query  = await conn.query( 
        "delete from carted_goods where cart_id=? and product_id=?", [cart_id, productid] );


        conn.release()
        if(query){
            return {
                message: 'Product removed from cart ',
                success: true
            }
        }

        return {
            message: 'query failed',
            success: false
        }
    } catch (error){
        throw error
    }
}


// exports.cart = async(id)=>{
//     try{
//         const conn = await pool.getConnection()

//         const query = await conn.query("select * from carts where id=?", [id])
//         console.log(query)
//     }catch(error){
//         throw error
//     }
// }