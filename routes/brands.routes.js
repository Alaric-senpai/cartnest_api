const express = require('express');

const router = express.Router();

const brandController  = require('../controllers/brands.controller')

router.post('/new', brandController.newBrand);
router.get('/list', brandController.brandsList)
router.get('/brand', brandController.getBrandById)

module.exports = router