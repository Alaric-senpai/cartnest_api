const express = require('express')
const cartsController = require('../controllers/carts.controller')
const authMiddleware = require('../middlewares/auth.middleware')
const router = express.Router()

router.post('/new', authMiddleware.verify, cartsController.newCart)
router.post('/addProduct', authMiddleware.verify, cartsController.addtocart)
router.get('/mycarts', authMiddleware.verify, cartsController.myCarts)
router.get('/cartGoods', authMiddleware.verify, cartsController.cartGoods)
router.delete('/delete', authMiddleware.verify, cartsController.deletecart)


module.exports = router


