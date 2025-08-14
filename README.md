# 🛒 E-Commerce Platform

A comprehensive full-stack e-commerce solution built with modern web technologies, featuring a customer frontend, admin dashboard, and robust backend API.

![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)
![Node.js](https://img.shields.io/badge/Node.js-18+-green.svg)
![React](https://img.shields.io/badge/React-18.3.1-blue.svg)
![MySQL](https://img.shields.io/badge/MySQL-8.0+-orange.svg)

## 🌟 Features

### 🛍️ Customer Frontend
- **Product Catalog**: Browse products with advanced filtering and search
- **Shopping Cart**: Add/remove items with real-time updates
- **Wishlist**: Save favorite products for later
- **User Authentication**: Secure registration, login, and profile management
- **Checkout Process**: Multi-step checkout with address and payment options
- **Order Management**: Track orders and view order history
- **Real-time Notifications**: Get updates on order status changes
- **Responsive Design**: Optimized for desktop and mobile devices

### 👨‍💼 Admin Dashboard
- **Product Management**: Add, edit, and manage product inventory
- **Category Management**: Organize products into categories
- **Sales Reports**: Analytics and reporting dashboard
- **Order Management**: Process and track customer orders
- **User Management**: Manage customer accounts and access

### 🔧 Backend API
- **RESTful API**: Comprehensive API endpoints for all operations
- **Authentication**: JWT-based secure authentication system
- **Database Integration**: MySQL database with optimized queries
- **File Upload**: Support for product images and documents
- **Real-time Features**: WebSocket integration for live updates
- **Security**: Helmet.js, CORS, and input validation

## 🏗️ Architecture

```
E-commerce-platform/
├── Frontend/          # Customer-facing React application
├── admin/            # Admin dashboard React application
├── backend/          # Node.js/Express.js API server
└── src/              # Shared components
```

## 🛠️ Technology Stack

### Frontend & Admin
- **React 18.3.1** - Modern UI library
- **Material-UI (MUI)** - Component library for consistent design
- **React Router** - Client-side routing
- **Axios** - HTTP client for API calls
- **Framer Motion** - Smooth animations
- **React Bootstrap** - Additional UI components

### Backend
- **Node.js** - JavaScript runtime
- **Express.js** - Web framework
- **MySQL** - Relational database
- **JWT** - Authentication tokens
- **bcrypt** - Password hashing
- **Socket.io** - Real-time communication
- **Multer** - File upload handling
- **Helmet.js** - Security middleware

### Development Tools
- **Nodemon** - Development server auto-restart
- **dotenv** - Environment variable management
- **CORS** - Cross-origin resource sharing
- **Morgan** - HTTP request logger

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ 
- MySQL 8.0+
- npm or yarn

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/group-32-databse-project/E-commerce-platform.git
   cd E-commerce-platform
   ```

2. **Install root dependencies**
   ```bash
   npm install
   ```

3. **Setup Backend**
   ```bash
   cd backend
   npm install
   
   # Create .env file and configure database
   cp .env.example .env
   # Edit .env with your database credentials
   
   # Setup database
   mysql -u root -p < database.sql
   mysql -u root -p < procedures.sql
   ```

4. **Setup Frontend**
   ```bash
   cd ../Frontend
   npm install
   ```

5. **Setup Admin Dashboard**
   ```bash
   cd ../admin
   npm install
   ```

### Running the Application

1. **Start the Backend Server**
   ```bash
   cd backend
   npm start
   # Server runs on http://localhost:5001
   ```

2. **Start the Frontend** (in a new terminal)
   ```bash
   cd Frontend
   npm start
   # Frontend runs on http://localhost:3000
   ```

3. **Start the Admin Dashboard** (in a new terminal)
   ```bash
   cd admin
   npm start
   # Admin runs on http://localhost:3001
   ```

## 📁 Project Structure

### Backend Structure
```
backend/
├── config/           # Database configuration
├── controllers/      # Request handlers
├── middlewares/      # Authentication & validation
├── models/          # Database models
├── routes/          # API route definitions
├── utils/           # Helper utilities
├── database.sql     # Database schema
├── procedures.sql   # Stored procedures
└── server.js        # Entry point
```

### Frontend Structure
```
Frontend/src/
├── api/             # API service functions
├── assets/          # Images, styles, icons
├── components/      # Reusable UI components
├── context/         # React context providers
├── pages/           # Page components
├── services/        # Business logic services
└── theme/           # Material-UI theme customization
```

### Admin Structure
```
admin/src/
├── components/      # Admin UI components
├── context/         # Authentication context
├── pages/           # Admin pages
└── theme/           # Admin theme configuration
```

## 🔐 Environment Variables

Create a `.env` file in the backend directory:

```env
# Database Configuration
DB_HOST=localhost
DB_PORT=3306
DB_USER=your_username
DB_PASSWORD=your_password
DB_NAME=ecommerce

# JWT Configuration
JWT_SECRET=your_jwt_secret_key
JWT_EXPIRES_IN=24h

# Server Configuration
PORT=5001
NODE_ENV=development

# File Upload
UPLOAD_PATH=./uploads
MAX_FILE_SIZE=5242880
```

## 📊 Database Schema

The application uses MySQL with the following main entities:
- **Customers** - User accounts and profiles
- **Products** - Product catalog with variants
- **Categories** - Product categorization
- **Orders** - Customer orders and order items
- **Shopping Cart** - User shopping carts
- **Wishlist** - User favorite products
- **Addresses** - Customer shipping addresses
- **Payments** - Payment methods and transactions

## 🔄 Order Flow

### Temporary Cart System
- **Guest Users**: Items stored locally until checkout
- **Registered Users**: Items synced between local and database storage
- **Checkout**: Temporary cart items transferred to order tables

### Delivery Estimates
- **In stock + Main city**: 5 days
- **In stock + Other cities**: 7 days  
- **Out of stock + Main city**: 8 days
- **Out of stock + Other cities**: 10 days

## 🧪 Testing

```bash
# Backend tests
cd backend
npm test

# Frontend tests
cd Frontend
npm test

# Admin tests
cd admin
npm test
```


## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## 👥 Team

- **Database Project Group 32**
- **Repository**: [E-commerce-platform](https://github.com/group-32-databse-project/E-commerce-platform)

## 📞 Support

For support and questions:
- Create an issue in the repository
- Contact the development team



---

**Built with ❤️ by Database Project Group 32**
