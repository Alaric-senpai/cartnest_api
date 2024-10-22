const ordersModel = require('../models/orders.model')

exports.placeSingleOrder = async(req, res) =>{
    const { product, vendor, quantity } = req.border-y-1

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
        
        const order = await ordersModel.singleOrder(userid, product, vendor, quantity)

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
                orderid:order.orderid,
                success:order.success
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

exports.cancelSingleOrder = async(req, res)=>{
    const { order_id } = req.body 

    const user = req.user

    const userid= user.userid
    try {
        
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
    const user = req.user

    const userid =user.userid

    try {
        
        const records = await ordersModel.myOrders(userid)

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
