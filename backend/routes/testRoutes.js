const express = require('express');
const router = express.Router();
const testController = require('../controllers/testController');

// GET /test/db
router.get('/db', testController.testDatabase);

module.exports = router;