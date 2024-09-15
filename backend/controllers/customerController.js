const Customer = require('../models/Customer');
const Address = require('../models/Address');
const ShoppingCart = require('../models/ShoppingCart');

exports.registerCustomer = async (req, res) => {
  try {
    const customerId = await Customer.createCustomer(req.body);
    // Create a shopping cart for the new customer
    const cartId = await ShoppingCart.createCart(customerId);
    res.status(201).json({ customerId, cartId });
  } catch (error) {
    console.error('Error in registerCustomer:', error);
    res.status(500).json({ message: 'Error registering customer', error: error.toString() });
  }
};

exports.getCustomerById = async (req, res) => {
  try {
    const customer = await Customer.getCustomerById(req.params.id);
    if (customer) {
      // Fetch addresses
      customer.addresses = await Address.getAddressesByCustomerId(customer.customer_id);
      res.json(customer);
    } else {
      res.status(404).json({ message: 'Customer not found' });
    }
  } catch (error) {
    console.error('Error in getCustomerById:', error);
    res.status(500).json({ message: 'Error fetching customer', error: error.toString() });
  }
};

// Add more controller methods as needed (update, delete, etc.)