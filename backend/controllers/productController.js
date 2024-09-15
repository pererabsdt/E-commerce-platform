const Product = require('../models/Product');
const Variant = require('../models/Variant');

exports.getAllProducts = async (req, res) => {
  try {
    const products = await Product.getAllProducts();
    for (const product of products) {
      product.variants = await Variant.getVariantsByProductId(product.product_id);
    }
    res.json(products);
  } catch (error) {
    console.error('Error in getAllProducts:', error);
    res.status(500).json({ message: 'Error fetching products', error: error.toString() });
  }
};

exports.getProductById = async (req, res) => {
  try {
    const product = await Product.getProductById(req.params.id);
    if (product) {
      product.variants = await Variant.getVariantsByProductId(product.product_id);
      res.json(product);
    } else {
      res.status(404).json({ message: 'Product not found' });
    }
  } catch (error) {
    console.error('Error in getProductById:', error);
    res.status(500).json({ message: 'Error fetching product' });
  }
};

exports.createProduct = async (req, res) => {
  try {
    const productId = await Product.createProduct(req.body);
    res.status(201).json({ productId });
  } catch (error) {
    console.error('Error in createProduct:', error);
    res.status(500).json({ message: 'Error creating product', error: error.toString() });
  }
};

// Add more controller methods as needed (update, delete, etc.)