const db = require('../config/database');

class Search {
  static async getSearchResults(searchTerm) {
    console.log(searchTerm);
    const [rows] = await db.query('CALL GetSearchResults(?)', [searchTerm]);
    return rows[0]; // Stored procedures return results in an array, so we access the first element
  }
}

module.exports = Search;