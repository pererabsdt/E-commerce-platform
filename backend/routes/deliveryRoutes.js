const express = require('express');
const router = express.Router();
const deliveryController = require('../controllers/deliveryController');

// POST /api/delivery/estimate
router.post('/estimate', deliveryController.estimateDelivery);

module.exports = router;