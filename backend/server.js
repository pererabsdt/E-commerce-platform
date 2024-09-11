const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');
const productRoutes = require('./routes/productRoutes');
const dotenv = require('dotenv');

const app = express();
app.use(cors());
app.use(express.json());
dotenv.config();


app.use('/api/products', productRoutes);
// Product routes
app.get('/api/products', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM products');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.get('/api/products/:id', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM products WHERE id = ?', [req.params.id]);
    if (rows.length === 0) {
      res.status(404).json({ error: 'Product not found' });
    } else {
      res.json(rows[0]);
    }
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Order creation route
app.post('/api/orders', async (req, res) => {
  const { userId, items, totalAmount, deliveryMethod, paymentMethod } = req.body;

  const connection = await pool.getConnection();
  try {
    await connection.beginTransaction();

    // Create order
    const [orderResult] = await connection.query(
      'INSERT INTO orders (user_id, total_amount, status, delivery_method, payment_method) VALUES (?, ?, ?, ?, ?)',
      [userId, totalAmount, 'pending', deliveryMethod, paymentMethod]
    );

    const orderId = orderResult.insertId;

    // Insert order items and update inventory
    for (const item of items) {
      await connection.query(
        'INSERT INTO order_items (order_id, variant_id, quantity, price) VALUES (?, ?, ?, ?)',
        [orderId, item.variantId, item.quantity, item.price]
      );

      await connection.query(
        'UPDATE inventory SET quantity = quantity - ? WHERE variant_id = ?',
        [item.quantity, item.variantId]
      );
    }

    await connection.commit();
    res.status(201).json({ orderId });
  } catch (error) {
    await connection.rollback();
    res.status(500).json({ error: 'Internal server error' });
  } finally {
    connection.release();
  }
});

app.get('/test-db', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT 1');
    res.json({ message: 'Database connected successfully', data: rows });
  } catch (error) {
    console.error('Database connection error:', error);
    res.status(500).json({ message: 'Database connection error', error: error.message });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

const db = require('./config/database');