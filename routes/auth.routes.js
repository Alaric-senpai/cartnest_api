const express = require('express');

/**
 * @exports /register path
 */
const router = express.Router();
const authController = require('../controllers/auth.controller')
const mailerController = require('../controllers/mailer.controller')
const authMiddleware = require('../middlewares/auth.middleware')
router.post('/register', authController.register)
router.post('/login', authController.login);
router.delete('/delete', authController.deleteUser)
router.post('/user/token/confirm', authController.confirm)
router.post('/user/reset', authController.reset)
router.get('/user/info',authMiddleware.verify, authController.user )
router.get('/user/me', authMiddleware.verify, authController.me)
router.post('/user/token/send', mailerController.resetPassword)
router.get('/me', authMiddleware.verify, authController.me)
module.exports = router