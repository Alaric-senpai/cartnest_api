const express = require('express')

const orderController = require('../controllers/orders.controller')

const authMiddleware = require('../middlewares/auth.middleware')

const vendorMiddleware = require('../middlewares/vendor.middleware')

const router = express.Router()

router.post('/new/single', authMiddleware.verify, orderController.placeSingleOrder)
router.post('/new/cart', authMiddleware.verify, orderController.PlaceCartOrder)
router.post('/order/complete', authMiddleware.verify, orderController.CheckOutOrder)
router.get('/cancel', authMiddleware.verify, orderController.cancelOrder)
router.get('/user/all', authMiddleware.verify,orderController.myorders)
router.get('/order/data', authMiddleware.verify, orderController.orderData)
router.get('/vendor', orderController.shopOrders)
router.get('/vendorext', orderController.shopOrdersExtview)
module.exports = router
