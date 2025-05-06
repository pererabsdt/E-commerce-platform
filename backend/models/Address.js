const db = require('../config/database');

class Address {
  static async getAddressesByCustomerId(customerId) {
    try {
      const [rows] = await db.query('CALL GetAddressesByCustomerId(?)', [customerId]);
      // The result of a CALL is typically an array with one element per result set
      // Adjust based on your DB driver; often the first element contains the rows
      return rows[0];
    } catch (error) {
      console.error("Error in getAddressesByCustomerId:", error);
      throw error;
    }
  }

  static async createAddress(formData) {
    // console.log("formData");
    // console.log(formData);
    const { address_line1, address_line2, city, postal_code, is_main_city } = formData;
    try {
      // Prepare the CALL statement with an OUT parameter
      const insertIdQuery = 'CALL CreateAddress(?, ?, ?, ?, ?, @insertId)';
      await db.query(insertIdQuery, [
        address_line1,
        address_line2,
        city,
        postal_code,
        is_main_city
      ]);

      // Retrieve the value of the OUT parameter
      const [result] = await db.query('SELECT @insertId as insertId');
      return result[0].insertId;
    } catch (error) {
      console.error("Error in createAddress:", error);
      throw error;
    }
  }

}

module.exports = Address;