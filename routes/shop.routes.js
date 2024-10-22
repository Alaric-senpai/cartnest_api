const express = require('express');
const router = express.Router();
const shopController = require('../controllers/shop.controller');
const authMiddleware = require('../middlewares/auth.middleware');

router.post('/new', authMiddleware.verify, shopController.createShop);
router.get('/shop', shopController.getShopById)
router.post('/shopData', authMiddleware.verify, shopController.myShop)
router.get('/unverified', shopController.unverifiedShops)
router.patch('/update', authMiddleware.verify, shopController.updateShop)
module.exports = router;
