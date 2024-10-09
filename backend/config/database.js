const mysql = require('mysql2/promise');
const { config } = require('dotenv');

config();

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '2002',
  database: 'ecommerce',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// Async function to test the connection
async function testConnection() {
  try {
    const connection = await pool.getConnection(); // Use await to get the connection
    console.log('Database connected successfully!');
    connection.release(); // Always release the connection back to the pool
  } catch (err) {
    console.error('Error connecting to the database:', err);
  }
}

// Call the function to test the connection
testConnection();

module.exports = pool;