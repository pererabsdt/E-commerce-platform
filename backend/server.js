const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');

const productRoutes = require('./routes/productRoutes');
const orderRoutes = require('./routes/orderRoutes');
const testRoutes = require('./routes/testRoutes');

const app = express();
app.use(cors());
app.use(express.json());
dotenv.config();

app.use('/api/products', productRoutes);
app.use('/api/orders', orderRoutes);
app.use('/test', testRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});