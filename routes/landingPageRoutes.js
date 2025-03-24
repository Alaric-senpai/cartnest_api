const express = require('express');
const router = express.Router();
const landingPageController = require('../modules/landing/landing.controller');
const authMiddleware =  require('../middlewares/auth.middleware')
const adminMiddleware = require('../middlewares/admin.middleware')
router.get('/', landingPageController.getLanding);
router.post('/', authMiddleware.verify, adminMiddleware.verify ,landingPageController.addLanding);
router.get('/record', landingPageController.getRecordById)
router.post('/record', authMiddleware.verify, adminMiddleware.verify , landingPageController.ModifyLanding)

module.exports = router;
