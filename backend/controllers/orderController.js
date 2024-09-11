const Order = require('../models/Order');

exports.createOrder = async (req, res) => {
  const { userId, items, totalAmount, deliveryMethod, paymentMethod } = req.body;

  try {
    const orderId = await Order.createOrder(userId, items, totalAmount, deliveryMethod, paymentMethod);
    res.status(201).json({ orderId });
  } catch (error) {
    console.error('Error in createOrder:', error);
    res.status(500).json({ message: 'Error creating order', error: error.toString() });
  }
};