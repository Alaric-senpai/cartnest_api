const express = require('express');

const router = express.Router();

const authController = require('../controllers/auth.controller')
const mailerController = require('../controllers/mailer.controller')

router.post('/register', authController.register)
router.post('/login', authController.login);
router.delete('/delete', authController.deleteUser)
router.post('/user/token/confirm', authController.confirm)
router.post('/user/reset', authController.reset)
router.post('/user/token/send', mailerController.resetPassword)
module.exports = router