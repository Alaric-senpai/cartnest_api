const express = require('express')
const cartsController = require('../controllers/carts.controller')
const authMiddleware = require('../middlewares/auth.middleware')
const router = express.Router()

router.post('/new', authMiddleware.verify, cartsController.newCart)
router.post('/addProduct', authMiddleware.verify, cartsController.addtocart)
router.get('/mycarts', authMiddleware.verify, cartsController.myCarts)
router.get('/cartGoods', authMiddleware.verify, cartsController.cartGoods)
router.delete('/delete', authMiddleware.verify, cartsController.deletecart)
router.get("/cart", authMiddleware.verify, cartsController.cartdata)
router.delete('/product/remove', authMiddleware.verify, cartsController.Removeproduct)
router.post('/product/edit', authMiddleware.verify, cartsController.ProductQuantity)
module.exports = router


