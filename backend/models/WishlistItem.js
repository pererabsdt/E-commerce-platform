const db = require('../config/database');

class WishlistItem {
  static async addItem(customerId, productId) {
    try {
      const [result] = await db.query(
        `CALL AddWishlistItem(?, ?, @insertId)`,
        [customerId, productId]
      );
      return result.insertId;
    } catch (error) {
      if (error.code === 'ER_DUP_ENTRY') {
        throw new Error('Item already exists in wishlist');
      }
      throw error;
    }
  }

  static async removeItem(customerId, productId) {
    const [result] = await db.query(
      `CALL RemoveWishlistItem(?, ?, @affectedRows)`,
      [customerId, productId]
    );
    return result.affectedRows;
  }

  static async getWishlist(customerId) {
    console.log(`getWishlist: Fetching wishlist for customer ID ${customerId}.`);

    const query = `CALL GetWishlistByCustomerId(?)`;
    const params = [customerId];

    try {
      const [results] = await db.query(query, params);
      // Stored procedures return results in a nested array
      const wishlist = results[0];
      console.log(`getWishlist: Retrieved ${wishlist.length} items from wishlist.`);
      return wishlist;
    } catch (error) {
      console.error(`getWishlist: Error fetching wishlist for customer ID ${customerId}:`, error);
      throw error;
    }
  }

  static async isItemInWishlist(customerId, productId) {
    const [rows] = await db.query(
      `CALL IsItemInWishlist(?, ?, @exists)`,
      [customerId, productId]
    );
    return rows.length > 0;
  }
}

module.exports = WishlistItem;

