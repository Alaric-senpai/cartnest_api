const express = require('express');
const router = express.Router();
const systemAnalyticsVendorsController = require('../controllers/systemAnalyticsVendorsController');

router.get('/', systemAnalyticsVendorsController.getAll);
router.post('/', systemAnalyticsVendorsController.create);

module.exports = router;
