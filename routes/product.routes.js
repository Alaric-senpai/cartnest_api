const express = require('express');
const productController = require('../controllers/product.controller');

// Middlwares 
const authMiddleware = require('../middlewares/auth.middleware')
const vendorMiddleware = require('../middlewares/vendor.middleware');

const router = express.Router()

router.post('/add', authMiddleware.verify, vendorMiddleware.VerifyVendor, productController.addProduct)

module.exports = router