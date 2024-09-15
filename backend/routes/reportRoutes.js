const express = require('express');
const router = express.Router();
const reportController = require('../controllers/reportController');

// GET /api/reports/quarterly-sales?year=2023
router.get('/quarterly-sales', reportController.getQuarterlySales);

// GET /api/reports/top-products?startDate=2023-01-01&endDate=2023-03-31
router.get('/top-products', reportController.getTopProducts);

// GET /api/reports/top-categories?startDate=2023-01-01&endDate=2023-03-31
router.get('/top-categories', reportController.getTopCategories);

// GET /api/reports/product-interest?productId=1&startDate=2023-01-01&endDate=2023-03-31
router.get('/product-interest', reportController.getProductInterest);

// GET /api/reports/customer-orders/:customerId
router.get('/customer-orders/:customerId', reportController.getCustomerOrders);

module.exports = router;