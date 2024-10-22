const express = require('express')

const orderController = require('../controllers/orders.controller')

const authMiddleware = require('../middlewares/auth.middleware')

const vendorMiddleware = require('../middlewares/vendor.middleware')

const router = express.Router()

router.post('/new', authMiddleware.verify, orderController.placeSingleOrder)

router.post('/complete', authMiddleware.verify, orderController.confirmSingleOrder)

router.post('/cancel', authMiddleware.verify, orderController.cancelSingleOrder)

router.get('/all', orderController.myorders)

router.get('/vendor', orderController.shopOrders)

router.get('/vendorext', orderController.shopOrdersExtview)

module.exports = router