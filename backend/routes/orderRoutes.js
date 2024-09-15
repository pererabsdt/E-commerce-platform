const express = require('express');
const router = express.Router();
const orderController = require('../controllers/orderController');

// POST /api/orders
router.post('/', orderController.createOrder);

// GET /api/orders/:id
router.get('/:id', orderController.getOrderById);

// Add more routes as needed

module.exports = router;