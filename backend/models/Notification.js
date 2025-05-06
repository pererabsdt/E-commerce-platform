const db = require('../config/database');

class Notification {
  static async getNotificationsByUserId(customerId) {

    const query = `CALL GetNotificationsByUserId(?)`;

    try {
      const [rows] = await db.query(query, [customerId]);
      // Stored procedures return results in a nested array
      const notifications = rows[0];
      return notifications;
    } catch (error) {
      throw error;
    }
  }

  static async markAsRead(notificationId) {

    const query = `CALL MarkNotificationAsRead(?)`;

    try {
      const [result] = await db.query(query, [notificationId]);
    } catch (error) {
      throw error;
    }
  }


  static async createNotification(userId, orderId, message) {

    const query = `CALL CreateNotification(?, ?, ?)`;

    try {
      const [result] = await db.query(query, [userId, orderId, message]);
      // The stored procedure returns the insertId in the first row of the first result set
      const insertId = result[0][0].insertId;

      return insertId;
    } catch (error) {
      throw error;
    }
  }

  // Add more methods as needed with similar logging and stored procedure calls
}

module.exports = Notification;