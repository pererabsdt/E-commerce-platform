const Report = require('../models/Report');

exports.getQuarterlySales = async (req, res) => {
  const { year } = req.query;
  try {
    const report = await Report.getQuarterlySales(year);
    res.json(report);
  } catch (error) {
    console.error('Error in getQuarterlySales:', error);
    res.status(500).json({ message: 'Error generating report', error: error.toString() });
  }
};

exports.getTopProducts = async (req, res) => {
  const { startDate, endDate } = req.query;
  try {
    const report = await Report.getTopProducts(startDate, endDate);
    res.json(report);
  } catch (error) {
    console.error('Error in getTopProducts:', error);
    res.status(500).json({ message: 'Error generating report', error: error.toString() });
  }
};

exports.getTopCategories = async (req, res) => {
  const { startDate, endDate } = req.query;
  try {
    const report = await Report.getTopCategories(startDate, endDate);
    res.json(report);
  } catch (error) {
    console.error('Error in getTopCategories:', error);
    res.status(500).json({ message: 'Error generating report', error: error.toString() });
  }
};

exports.getProductInterest = async (req, res) => {
  const { productId, startDate, endDate } = req.query;
  try {
    const report = await Report.getProductInterest(productId, startDate, endDate);
    res.json(report);
  } catch (error) {
    console.error('Error in getProductInterest:', error);
    res.status(500).json({ message: 'Error generating report', error: error.toString() });
  }
};

exports.getCustomerOrders = async (req, res) => {
  const { customerId } = req.params;
  try {
    const report = await Report.getCustomerOrders(customerId);
    res.json(report);
  } catch (error) {
    console.error('Error in getCustomerOrders:', error);
    res.status(500).json({ message: 'Error generating report', error: error.toString() });
  }
};