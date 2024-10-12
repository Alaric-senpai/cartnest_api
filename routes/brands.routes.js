const express = require('express');

const router = express.Router();

const brandController  = require('../controllers/brands.controller')

router.post('/newbrand', brandController.newBrand);
router.get('/brandsList', brandController.brandsList)
router.post('/brand', brandController.getBrandById)

module.exports = router