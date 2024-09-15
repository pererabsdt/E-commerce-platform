const db = require('../config/database');

class Address {
  static async getAddressesByCustomerId(customerId) {
    const [rows] = await db.query(
      'SELECT a.* FROM address a JOIN customer_address ca ON a.address_id = ca.address_id WHERE ca.customer_id = ?',
      [customerId]
    );
    return rows;
  }

  static async createAddress(addressData) {
    const { address_line1, address_line2, address_line3, city, region, postal_code, is_main_city } = addressData;
    const [result] = await db.query(
      'INSERT INTO address (address_line1, address_line2, address_line3, city, region, postal_code, is_main_city) VALUES (?, ?, ?, ?, ?, ?, ?)',
      [address_line1, address_line2, address_line3, city, region, postal_code, is_main_city]
    );
    return result.insertId;
  }

  // Add more methods as needed
}

module.exports = Address;