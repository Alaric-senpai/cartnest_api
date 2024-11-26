const pool = require('../config/db.config');
const cartModel = require('./carts.model');
const globalFns = require('../global/global.class');

exports.exists = async (user_id, product_id) => {
    try {
        const conn = await pool.getConnection();
        const [result] = await conn.query(
            "SELECT * FROM carted_goods WHERE user_id = ? AND product_id = ?",
            [user_id, product_id]
        );
        conn.release();

        if (!result.length) {
            return { message: 'No records found', success: false };
        }
        return { message: 'Records found', records: result, success: true };
    } catch (error) {
        throw error;
    }
};

exports.singleOrder = async (user, product, vendor, quantity, price) => {
    try {
        const conn = await pool.getConnection();
        const order = await conn.query(
            "INSERT INTO orders (user_id, product_id, vendor, totalprice, quantity, type) VALUES (?, ?, ?, ?, ?,?)",
            [user, product, vendor, price, quantity, "single"]
        );
        conn.release();

        // console.log(order)

        if (order.affectedRows < 1) {
            return { message: 'Query failed', success: false };
        }
        return { message: 'Order registered', orderId: order.insertId, success: true };
    } catch (error) {
        throw error;
    }
};

exports.newcartOrder = async (user, cart, price) => {
    try {
        const conn = await pool.getConnection();
        const query = await conn.query(
            "INSERT INTO orders (user_id, status, totalprice, cartid, type) VALUES (?, 'draft', ?, ?,?)",
            [user, price, cart, "cart"]
        );
        conn.release();

        if (query.affectedRows > 0) {
            return { message: 'Order created successfully', orderId:query.insertId, success: true };
        }
        return { message: 'Query failed', success: false };
    } catch (error) {
        throw error;
    }
};

exports.completeOrder = async (orderId, userId) => {
    try {
        const conn = await pool.getConnection();
        const query = await conn.query(
            "UPDATE orders SET status = 'completed', updated_at = ? WHERE id = ? AND user_id = ?",
            [new Date(), orderId, userId]
        );
        conn.release();

        console.log(query)
        if (query.affectedRows > 0) {
            return { message: 'Order completed', success: true };
        }
        return { message: 'Query failed', success: false };
    } catch (error) {
        throw error;
    }
};

exports.cancelSingleOrder = async (orderId, userId) => {
    try {
        const conn = await pool.getConnection();
        const query = await conn.query(
            "UPDATE orders SET status = 'cancelled' WHERE id = ? AND user_id = ?",
            [orderId, userId]
        );
        conn.release();

        if (query.affectedRows > 0) {
            return { message: 'Order cancelled', success: true };
        }
        return { message: 'Query failed', success: false };
    } catch (error) {
        throw error;
    }
};

exports.myOrders = async (userId) => {
    try {
        const conn = await pool.getConnection();
        const orders = await conn.query(
            "SELECT * FROM orders WHERE user_id = ? ORDER BY status ASC",
            [userId]
        );
        conn.release();

        if (orders.length < 1) {
            return { message: 'No orders found', success: false };
        }
        return { message: 'Orders retrieved', records: orders, success: true };
    } catch (error) {
        throw error;
    }
};

exports.shopOrders = async (vendor) => {
    try {
        const conn = await pool.getConnection();
        const [orders] = await conn.query(
            "SELECT * FROM orders WHERE vendor = ? ORDER BY status ASC",
            [vendor]
        );
        conn.release();

        if (!orders.length) {
            return { message: 'No orders found', success: false };
        }
        return { message: 'Orders retrieved', records: orders, success: true };
    } catch (error) {
        throw error;
    }
};

async function updateRecords(action, productId, quantity) {
    try {
        const conn = await pool.getConnection();

        console.log("product")
        console.log("Action", action)
        console.log("Product", productId)
        console.log("Qunatity" , quantity)

        console.log("update records")

        const product = await conn.query(
            "SELECT * FROM products WHERE id = ? LIMIT 1",
            [productId]
        );
        console.log(product)
        if (product.length < 1) {
            conn.release();
            return { message: 'Product not found', success: false };
        }

        let instock = product[0].instock;
        instock += action === 'shop' ? -quantity : quantity;

        const update = await conn.query(
            "UPDATE products SET instock = ? WHERE id = ?",
            [instock, productId]
        );
        conn.release();

        console.log(update)

        if (update.affectedRows > 0) {
            return { message: 'Stock updated', success: true };
        }
        return { message: 'Stock update failed', success: false };
    } catch (error) {
        throw error;
    }
}

exports.checkoutOrder = async (orderId, user, payMethod, payCode, amount, shippingMethod, customerId) => {
    try {
        const trackingCode = globalFns.createTrackingCode(30);
        const payment = await paymentRecords(user, payMethod, payCode, amount, orderId, trackingCode);
        console.log(payment)
        if (payment.success) {
            const orderProcessing = await OrderProcessing(orderId, user);
            console.log(orderProcessing)
            if (orderProcessing.success) {
                const shipping = await Shipping(orderId, trackingCode, shippingMethod, customerId);
                if (shipping.success) {
                    return { message: 'Order will be shipped soon', success: true };
                }
                return shipping;
            }
            return orderProcessing;
        }
        return payment;
    } catch (error) {
        console.log(error)
        throw error;
    }
};

async function paymentRecords(user, payMethod, payCode, amount, orderId, trackingCode) {
    try {
        const conn = await pool.getConnection();
        const query = await conn.query(
            "INSERT INTO completed_orders (order_id, payment_method, payment_code, payment_amount, user_id, tracking_code) VALUES (?, ?, ?, ?, ?, ?)",
            [orderId, payMethod, payCode, amount, user, trackingCode]
        );
        conn.release();

        console.log(query)

        // if()

        if (query.affectedRows > 0) {
            return { message: 'Payment recorded', success: true };
        }
        return { message: 'Payment record failed', success: false };
    } catch (error) {
        throw error;
    }
}

async function Shipping(orderId, trackingCode, shippingMethod, customerId) {
    try {
        const conn = await pool.getConnection();
        const currentDate = new Date();
        const deliveryDate = new Date();
        deliveryDate.setDate(currentDate.getDate() + 3);

        const query = await conn.query(
            "INSERT INTO order_deliveries (order_id, customer_id, delivery_status, shipping_method, tracking_number, actual_delivery_date, created_at) VALUES (?, ?, 'started', ?, ?, ?, ?)",
            [orderId, customerId, shippingMethod, trackingCode, deliveryDate, currentDate]
        );
        conn.release();
        console.log("shipping")
        console.log(query)
        if (query.affectedRows > 0) {
            return { message: 'Shipping information saved', success: true };
        }
        return { message: 'Shipping information failed', success: false };
    } catch (error) {
        throw error;
    }
}

async function OrderProcessing(orderId, userId) {
    try {
        const orderDetails = await exports.GetorderDetails(orderId);
        console.log("order details")
        console.log(orderDetails)
        if (orderDetails.success) {
            const order = orderDetails.order;
            if (order.cartid !== null) {
                console.log("cart instance")

                console.log("Order details from inside cart ops", order.cartid)

                // console.log(order.id)

                const disable = await disableCart(order.cartid)

                console.log(disable)


                if(!disable.success){
                    return disable
                }

                const cart = await cartModel.cartGoods(userId, order.cartid);
                console.log( "cart Goods", cart)
                if (cart.success) {
                    for (let item =0 ; item < cart.products.length ; item++) {
                        console.log("item", cart.products[item])
                        const update = await updateRecords('shop', cart.products[item].product_id, cart.products[item].quantity);
                        if (!update.success) {
                            return update;
                        }
                    }
                }
            } else {
                console.log("Single prodcut instance")
                const update = await updateRecords('shop', order.product_id, order.quantity);
                console.log(update)
                if (!update.success) {
                    return update;
                }
            }
            return { message: 'Order processed successfully', success: true };
        }
        return { message: 'Order details not found', success: false };
    } catch (error) {
        throw error;
    }
}

exports.GetorderDetails = async (orderId) => {
    try {
        const conn = await pool.getConnection();
        const query = await conn.query("SELECT * FROM orders WHERE id = ?", [orderId]);
        conn.release();


        if (query.length > 0) {
            return { message: 'Order details found', order: query[0], success: true };
        }
        return { message: 'Order not found', success: false };
    } catch (error) {
        throw error;
    }
};
async function disableCart(cartid) {
    try
    {

        console.log("from cart disable fn")
        console.log("cartid", cartid)
        const conn = await pool.getConnection()
        const query = await conn.query("update carts set is_editable=? and checkedout=true and updated_at=? where id=?",[0, new Date(), cartid])

        console.log(query)

        conn.release()

        if(query.affectedRows > 0){
            return{
            message: 'cart disabled successfully',
            success: true  
            }

        }
        return {
            message: 'Query failed',
            success: false
        }
    }
    catch(error)
    {
        throw error
    }
}
