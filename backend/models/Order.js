const db = require('../config/database');

class Order {
  static async createOrder(userId, items, totalAmount, deliveryMethod, paymentMethod) {
    const connection = await db.getConnection();
    try {
      await connection.beginTransaction();

      const [orderResult] = await connection.query(
        'INSERT INTO orders (user_id, total_amount, status, delivery_method, payment_method) VALUES (?, ?, ?, ?, ?)',
        [userId, totalAmount, 'pending', deliveryMethod, paymentMethod]
      );

      const orderId = orderResult.insertId;

      for (const item of items) {
        await connection.query(
          'INSERT INTO order_items (order_id, variant_id, quantity, price) VALUES (?, ?, ?, ?)',
          [orderId, item.variantId, item.quantity, item.price]
        );

        await connection.query(
          'UPDATE inventory SET quantity = quantity - ? WHERE variant_id = ?',
          [item.quantity, item.variantId]
        );
      }

      await connection.commit();
      return orderId;
    } catch (error) {
      await connection.rollback();
      throw error;
    } finally {
      connection.release();
    }
  }
}

module.exports = Order;