const db = require('../config/database');

class Variant {
  static async getVariantsByProductId(productId) {
    const [rows] = await db.query(
      "SELECT * FROM variant WHERE product_id = ?",
      [productId]
    );
    return rows;
  }

  static async createVariant(variantData) {
    const { product_id, inventory_stock, total_price, variant_image, SKU } =
      variantData;
    const [result] = await db.query(
      "INSERT INTO variant (product_id, inventory_stock, total_price, variant_image, SKU) VALUES (?, ?, ?, ?, ?)",
      [product_id, inventory_stock, total_price, variant_image, SKU]
    );
    return result.insertId;
  }

  static async updateInventory(variantId, quantityChange) {
    const [result] = await db.query(
      "UPDATE variant SET inventory_stock = inventory_stock + ? WHERE variant_id = ?",
      [quantityChange, variantId]
    );
    return result.affectedRows;
  }

  static async getRecentVariants(limit = 3) {
    console.log(`getRecentVariants: Fetching the latest ${limit} variants.`);

    const query = `CALL GetRecentVariants(?)`;

    try {
      const [results] = await db.query(query, [limit]);
      // Stored procedures return results in a nested array
      const recentVariants = results[0];
      console.log(`getRecentVariants: Retrieved ${recentVariants.length} variants.`);
      return recentVariants;
    } catch (error) {
      console.error(`getRecentVariants: Error fetching recent variants:`, error);
      throw error;
    }
  }

}

module.exports = Variant;