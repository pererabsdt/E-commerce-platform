const express = require('express');
const router = express.Router();
const customerController = require('../controllers/customerController');

// POST /api/customers/register
router.post('/register', customerController.registerCustomer);

// GET /api/customers/:id
router.get('/:id', customerController.getCustomerById);

// Add more routes as needed (update, delete, etc.)

module.exports = router;