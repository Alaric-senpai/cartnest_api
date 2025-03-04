const express = require('express');
const productController = require('../controllers/product.controller');

// Middlwares 
const authMiddleware = require('../middlewares/auth.middleware')
const vendorMiddleware = require('../middlewares/vendor.middleware');

const router = express.Router()

router.post('/add', authMiddleware.verify, vendorMiddleware.VerifyVendor, productController.addProduct)
router.get('/list', productController.productsList)
router.get('/product', productController.getProductbyId),
router.get('/category', productController.getProductsbyCategory),
router.get('/brand', productController.getProductsbyBrand)
router.get('/trending', productController.trendingProducts)
router.get('/instock', productController.GetInStock)
router.patch('/instock',productController.UpdateProductReqistry)
router.get('/vendor', vendorMiddleware.VerifyVendor, productController.getProductsbyVendor)
module.exports = router