const express = require('express');
const router = express.Router();
const systemAnalyticsSalesController = require('../controllers/systemAnalyticsSalesController');

router.get('/', systemAnalyticsSalesController.getAll);
router.post('/', systemAnalyticsSalesController.create);

module.exports = router;
