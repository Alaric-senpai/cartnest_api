const express = require('express');

const router = express.Router();

const mailerController = require('../controllers/mailer.controller')

router.post('/reset', mailerController.resetPassword)