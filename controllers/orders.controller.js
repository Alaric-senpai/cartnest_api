const ordersModel = require('../models/orders.model')
const userModel = require('../models/user.model')
const cartsModel = require('../models/carts.model')


exports.placeSingleOrder = async(req, res) =>{
    const { product, vendor, quantity, price } = req.body
    console.log(req.body)
    const user = req.user

    const userid = user.userid

    if(user.userrole !== 'customer'){
        return res.status(401).json(
            {
                message: 'Only customers can place orders',
                success: false
            }
        )
    }

    try {
        
        const order = await ordersModel.singleOrder(userid, product, vendor, quantity, price)

        console.log(order)

        if(!order.success){
            return res.status(400).json(
                {
                    message: order.message,
                    success: order.success
                }
            )
        }

        return res.status(200).json(
            {
                message: order.message,
                orderid:parseInt(order.orderId),
                success:order.success
            }
        )

    } catch (error) {
        console.log(error)
        return res.status(500).json(
            {
                message: 'Internal server error',
                name: error.name,
                error:error.message,
                success:false
            }
        )

    }

}

exports.confirmSingleOrder = async(req, res)=>{
    const { order_id } = req.body 

    const user = req.user

    const userid= user.userid
    try {
        
        const complete = await ordersModel.completeSingleorder(order_id, userid)

        if(!complete.success){
            return res.status(400).json(
                {
                    message: complete.message,
                    success:complete.success
                }
            )
        }

        return res.status(200).json(
            {
                message: complete.message,
                success: complete.success
            }
        )


    } catch (error) {
        
        return res.status(500).json(
            {
                message: 'Internal server error',
                name: error.name,
                error:error.message,
                success:false
            }
        )
    }
}


exports.cancelOrder = async(req, res)=>{
  try{
      const user = req.user
      const params = req.query 
      const order_id = params.order
  

        const userid= user.userid
    
        
        const complete = await ordersModel.cancelSingleOrder(order_id, userid)

        if(!complete.success){
            return res.status(400).json(
                {
                    message: complete.message,
                    success:complete.success
                }
            )
        }

        return res.status(200).json(
            {
                message: complete.message,
                success: complete.success
            }
        )


    } catch (error) {

    console.log(error)
        
        return res.status(500).json(
            {
                message: 'Internal server error',
                name: error.name,
                error:error.message,
                success:false
            }
        )
    }
}

exports.myorders =  async(req, res) =>{
    try {

        const user = req.user

        // console.log(req)
        const userid =user.userid


        
        const records = await ordersModel.myOrders(userid)


        if(!records.success){
            return res.status(401).json(
                records
            )
        }

        return res.status(200).json(
            {
                message: records.message,
                records:records.records,
                success: records.success
            }
        )

    } catch (error) {

        return res.status(500).json(
            {
                message: 'Internal server error',
                name: error.name,
                error:error.message,
                success:false
            }
        )
    }
}
exports.shopOrders =  async(req, res) =>{
    const shop = req.shop

    const shopid =shop.userid

    try {
        
        const records = await ordersModel.shoporders(shopid)

        if(!records.success){
            return res.status(401).json(
                {
                    message: records.message,
                    success: records.success
                }
            )
        }

        return res.status(200).json(
            {
                message: records.message,
                records:records.records,
                success: records.success
            }
        )

    } catch (error) {
        
        return res.status(500).json(
            {
                message: 'Internal server error',
                name: error.name,
                error:error.message,
                success:false
            }
        )
    }
}

exports.shopOrdersExtview =  async(req, res) =>{
    const params = req.query

    const shopid =params.vendor

    try {
        
        const records = await ordersModel.shoporders(shopid)

        if(!records.success){
            return res.status(401).json(
                {
                    message: records.message,
                    success: records.success
                }
            )
        }

        return res.status(200).json(
            {
                message: records.message,
                records:records.records,
                success: records.success
            }
        )

    } catch (error) {
        
        return res.status(500).json(
            {
                message: 'Internal server error',
                name: error.name,
                error:error.message,
                success:false
            }
        )
    }
}

exports.PlaceCartOrder = async(req, res)=>{
    try {
        console.log("cart Order Processing starts Here")
        const { cart, price } = req.body
        console.log(req.body)
        // console.log(req)
        const user = req.user
        const userid = user.userid

        const placeOrder = await  ordersModel.newcartOrder(userid, cart, price)

        if(placeOrder.success){
            return res.status(200).json(
                {
                    message: placeOrder.message,
                    orderid: parseInt(placeOrder.orderId),
                    success: placeOrder.success
                }
            )
        }
        return res.status(400).json(
            {
                message:placeOrder.message,
                success:placeOrder.success
            }
        )


    } catch (error) {
        console.log(error)
        return res.status(500).json(
            {
                message: 'Internal server error',
                error: error,
                success:false
            }
        )
    }
}

exports.ConfirmCartOrder = async(req, res)=>{
    try {

        const { order } = req.body

        const userid = req.user.userid;

        const complete = await ordersModel.CompleteCartOrder(order, userid)

        if(complete.success){
            return res.status(200).json(
                {
                    message: complete.message,
                    success: complete.success
                }
            )
        }
        return req.status(400).json(
            {
                message: complete.message,
                success:complete.success
            }
        )

        
    } catch (error) {
        return res.status(500).json(
            {
                message: 'Internal server error',
                name: error.name,
                error:error.message,
                success:false
            }
        )
    }
}

exports.CheckOutOrder = async (req, res) => {
    try {
        const { orderid, payment_method, code, amount, shipping, type } = req.body;

        const user = req.user;
        const userid = user.userid;

        console.log(req.body)

        let confirmationResult;

        // Process order confirmation based on type
        if (type === "single") {
            // Call ConfirmSingleOrder
            confirmationResult = await ordersModel.completeOrder(orderid, userid);
        } else if (type === "cart") {
            // Call ConfirmCartOrder
            confirmationResult = await ordersModel.completeOrder(orderid, userid);

        } else {
            return res.status(400).json({
                message: 'Invalid order type. Must be "single" or "cart".',
                success: false,
            });
        }

        // Handle confirmation result
        if (!confirmationResult.success) {
            return res.status(400).json({
                message: confirmationResult.message,
                success: confirmationResult.success,
            });
        }

        // Fetch customer information
        const customer = await userModel.CustomerInfo(userid);
        if (customer.success) {
            const customerData = customer.customer;

            // Proceed with checkout
            const checkoutOrder = await ordersModel.checkoutOrder(
                orderid,
                userid,
                payment_method,
                code,
                amount,
                shipping,
                customerData.id
            );

            if (checkoutOrder.success) {
                return res.status(200).json({
                    message: checkoutOrder.message,
                    success: checkoutOrder.success,
                });
            }

            return res.status(400).json({
                message: checkoutOrder.message,
                success: checkoutOrder.success,
            });
        }

        return res.status(400).json({
            message: 'Error fetching your info',
            success: false,
        });

    } catch (error) {
        return res.status(500).json({
            message: 'Internal server error',
            name: error.name,
            error: error.message,
            success: false,
        });
    }
};

exports.orderData = async(req, res)=>{
    try{

        const params = req.query

        const orderid = params.order
        const order = await ordersModel.GetorderDetails(orderid)

        if(order.success){
            return res.status(200).json(
            {
                message: order.message,
                order:order.order,
                success:order.success
            })
        }
        return res.status(400).json(
            {
                message: order.message,
                order:order.order,
                success:order.success
            })


    }catch(error){
        return res.status(500).json(
            {
                message: 'Internal server error',
                name: error.name,
                error:error.message,
                success:false
            }
        )
    }
}

