const express = require('express');
const router = express.Router();
const testController = require('../controllers/testController');

router.get('/db', testController.testDatabase);

module.exports = router;