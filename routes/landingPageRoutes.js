const express = require('express');
const router = express.Router();
const landingPageController = require('../controllers/landingPageController');

router.get('/', landingPageController.getAll);
router.post('/', landingPageController.create);

module.exports = router;
