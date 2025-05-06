const db = require('../config/database');

class Banner {
  static async getRandomAvailableProductsByParentCategory(parentCategoryId, limit = 3) {
    try {
      const [rows] = await db.query('CALL GetRandomAvailableProductsByParentCategory(?, ?)', [parentCategoryId, limit]);
      // The result of a CALL is typically an array with one element per result set
      // Adjust based on your DB driver; often the first element contains the rows
      return rows[0];
    } catch (error) {
      console.error('Error in Banner.getRandomAvailableProductsByParentCategory:', error);
      throw error;
    }
  }
}

module.exports = Banner;