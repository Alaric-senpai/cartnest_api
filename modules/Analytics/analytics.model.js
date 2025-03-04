
const general = require('../../models/general.model')
const ordersModel = require('../../models/orders.model')
exports.Analytics = async ()=>{
    try {
        
        const admins = await general.admins()
        const vendors = await general.vendors()
        const users = await general.users()
        const shops = await general.shops()
        const customers = await general.customers()
        const totalOrders = await ordersModel.GetAllOrders()
        const completedOrders = await ordersModel.GetOrdersByStatus('completed')
        const cancelledOrders = await ordersModel.GetOrdersByStatus('status')
        const pendingOrders = await ordersModel.GetOrdersByStatus('pending')


        return {
            message: 'Analytics data fetched',
            success:true,
            vendors: vendors.length,
            admins:admins.length,
            users: users.length,
            shops: shops.length,
            customers: customers.length,
            orders:{
                totalOrders:totalOrders.length,
                completedOrders:completedOrders.length,
                cancelledOrders: cancelledOrders.length,
                pendingOrders: pendingOrders.length
            },
            
            additional: {
                admins,
                vendors,
                users,
                shops,
                customers,
                // orders:{
                //     totalOrders,
                //     cancelledOrders,
                //     completedOrders,
                //     pendingOrders
                // }
            }
        }


    } catch (error) {
        throw error
    }
}