const express = require('express');

const router = express.Router();

const categoryController = require('../controllers/category.controller')

router.post('/new' , categoryController.newCategory)
router.get('/all', categoryController.categorylist)
router.post('/category', categoryController.categoryById)
router.delete('/delete', categoryController.deleteCategory)

module.exports = router
