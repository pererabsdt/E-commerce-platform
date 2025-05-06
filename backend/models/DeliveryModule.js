const db = require('../config/database');

class DeliveryModule {
  static async createDeliveryModule(estimated_arrival_date) {
    const [result] = await db.query(
      'INSERT INTO delivery_module (estimated_arrival_date) VALUES (?)',
      [estimated_arrival_date]
    );
    return result.insertId;
  }

  static async getDeliveryModuleById(id) {
    const [rows] = await db.query('SELECT * FROM delivery_module WHERE delivery_module_id = ?', [id]);
    return rows[0];
  }

  // Add more methods as needed
}

module.exports = DeliveryModule;