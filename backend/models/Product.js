const db = require('../config/database');

class Product {
  static async getAllProducts() {
    const [rows] = await db.query('SELECT * FROM products');
    return rows;
  }

  static async getProductById(id) {
    const [rows] = await db.query('SELECT * FROM products WHERE id = ?', [id]);
    return rows[0];
  }
}

module.exports = Product;