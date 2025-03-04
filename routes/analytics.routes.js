const express = require('express')
const AnalyticsController = require('../modules/Analytics/analytics.controller')

const AuthMiddleware = require('../middlewares/auth.middleware')
const AdminMiddleware = require('../middlewares/admin.middleware')
const AnalyticsRouter = express.Router()

AnalyticsRouter.get('/general' , AuthMiddleware.verify, AnalyticsController)


module.exports = AnalyticsRouter