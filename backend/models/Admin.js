// backend/models/Admin.js
const { executeQuery } = require('../utils/db');

const Admin = {
  createAdmin: async (adminData) => {
    const { username, email, password } = adminData;
    const query = 'CALL CreateAdmin(?, ?, ?, @insertId); SELECT @insertId as insertId;';
    const results = await executeQuery(query, [username, email, password]);
    
    const insertId = results[1][0].insertId;
    return insertId;
  },

  getAdminByEmail: async (email) => {
    const query = 'CALL GetAdminByEmail(?);';
    const results = await executeQuery(query, [email]);
    return results[0][0] || null;
  },

  getAdminById: async (id) => {
    const query = 'CALL GetAdminById(?);';
    const results = await executeQuery(query, [id]);
    return results[0][0] || null;
  }
};

module.exports = Admin;