const db = require("../config/database");

class Cart {
  static async getCartIdByCustomerId(customer_id) {
    const [rows] = await db.query(
      "SELECT * FROM shopping_cart WHERE customer_id = ?",
      [customer_id]
    );
    return rows[0];
  }
  static async updateShippingDate(orderId) {
    const [rows] = await db.query(
      "call update_shipping_date_if_out_of_stock(?)",
      [orderId]
    );
    return rows;
  }
}
module.exports = Cart;
