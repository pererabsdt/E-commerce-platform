const db = require('../config/database');

exports.testDatabase = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT 1');
    res.json({ message: 'Database connected successfully', data: rows });
  } catch (error) {
    console.error('Database connection error:', error);
    res.status(500).json({ message: 'Database connection error', error: error.message });
  }
};