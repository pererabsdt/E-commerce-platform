const db = require("../config/database");

class CustomerAddress {
  static async createCustomerAddress(customerId, addressId) {
    await db.query(
      "CALL CreateCustomerAddress(?, ?)",
      [customerId, addressId]
    );
  }
}

module.exports = CustomerAddress;
