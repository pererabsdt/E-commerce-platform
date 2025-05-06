const db = require('../config/database');

class PhoneNumber {
  static async save(number, id) {
    console.log('Saving phone number:', number, '  ', id);
    try {
      console.log('Saving phone number:', number, '  ', id);
      if (!number || !id) {
        throw new Error('Phone number and customer ID are required');
      }
      id = parseInt(id);
      const query = 'CALL insert_phone_number (?, ?)';
      const [result] = await db.execute(query, [ id,number]);
      console.log('Phone number saved successfully:', result);
      return result.insertId;
    } catch (error) {
      console.error('Error saving phone number:', error);
      throw error;
    }
  }

  static async getPhoneNumbers() {
    try {
      const [rows] = await db.query('CALL GetPhoneNumbers()');
      return rows[0]; // Stored procedure results are in an array of arrays, so take the first set
    } catch (error) {
      console.error('Error retrieving phone numbers:', error);
      throw error;
    }
  }
}

module.exports = PhoneNumber;