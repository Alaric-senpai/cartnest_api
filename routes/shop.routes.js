const express = require('express');
const router = express.Router();
const shopController = require('../controllers/shop.controller');
const authMiddleware = require('../middlewares/auth.middleware');

router.post('/new', authMiddleware.verify, shopController.createShop);
router.post('/shop', shopController.getShopById)
router.post('/shopData', authMiddleware.verify, shopController.myShop)
module.exports = router;
