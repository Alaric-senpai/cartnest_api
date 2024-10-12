const express = require('express');

const router = express.Router();

const general = require('../controllers/general.controller')

router.get('/tables', general.listTables);
router.get('/server', general.server)
router.get('/users', general.users);
router.get('/admins', general.admins),
router.get('/vendors', general.vendors);
router.get('/customers', general.customers)
router.get('/shops', general.listShops)
module.exports = router