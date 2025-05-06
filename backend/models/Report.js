const db = require('../config/database');

class Report {
  static async getQuarterlySales(year) {
    const [rows] = await db.query(
      `SELECT QUARTER(order_date) AS quarter, COUNT(order_id) AS total_orders, SUM(total_order_price) AS total_sales
       FROM shop_order
       WHERE YEAR(order_date) = ?
       GROUP BY QUARTER(order_date)`,
      [year]
    );
    return rows;
  }

  static async getTopProducts(startDate, endDate) {
    const [rows] = await db.query(
      `SELECT p.product_name, SUM(oi.quantity) AS total_quantity
       FROM order_item oi
       JOIN product p ON oi.variant_id = p.product_id
       JOIN shop_order o ON oi.order_id = o.order_id
       WHERE o.order_date BETWEEN ? AND ?
       GROUP BY p.product_name
       ORDER BY total_quantity DESC
       LIMIT 10`,
      [startDate, endDate]
    );
    return rows;
  }

  static async getTopCategories(startDate, endDate) {
    const [rows] = await db.query(
      `SELECT c.category_name, COUNT(o.order_id) AS total_orders
       FROM shop_order o
       JOIN order_item oi ON o.order_id = oi.order_id
       JOIN variant v ON oi.variant_id = v.variant_id
       JOIN product p ON v.product_id = p.product_id
       JOIN category c ON p.category_id = c.category_id
       WHERE o.order_date BETWEEN ? AND ?
       GROUP BY c.category_name
       ORDER BY total_orders DESC
       LIMIT 10`,
      [startDate, endDate]
    );
    return rows;
  }

  static async getProductInterest(productId, startDate, endDate) {
    const [rows] = await db.query(
      `SELECT DATE(order_date) AS date, COUNT(o.order_id) AS interest_count
       FROM shop_order o
       JOIN order_item oi ON o.order_id = oi.order_id
       WHERE oi.variant_id = ? AND o.order_date BETWEEN ? AND ?
       GROUP BY DATE(order_date)
       ORDER BY interest_count DESC
       LIMIT 1`,
      [productId, startDate, endDate]
    );
    return rows[0];
  }

  static async getCustomerOrders(customerId) {
    const [rows] = await db.query(
      `SELECT o.order_id, o.order_date, o.total_order_price, o.order_status
       FROM shop_order o
       JOIN user u ON o.user_id = u.user_id
       WHERE u.customer_id = ?`,
      [customerId]
    );
    return rows;
  }

  // Add more report methods as needed
}

module.exports = Report;