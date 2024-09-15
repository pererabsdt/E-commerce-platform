-- 1. Create category table (self-referencing)
CREATE TABLE `category` (
  `category_id` INT AUTO_INCREMENT,
  `category_name` VARCHAR(100) NOT NULL,
  `parent_category_id` INT DEFAULT NULL,
  `category_image` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  FOREIGN KEY (`parent_category_id`) REFERENCES `category`(`category_id`)
) ENGINE=InnoDB;

-- 2. Create customer table
CREATE TABLE `customer` (
  `customer_id` INT AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `email_address` VARCHAR(255) UNIQUE NOT NULL,
  `username` VARCHAR(50) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login` TIMESTAMP NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB;

-- 3. Create payment_method table
CREATE TABLE `payment_method` (
  `payment_method_id` INT AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB;

-- 4. Create variation table
CREATE TABLE `variation` (
  `variation_id` INT AUTO_INCREMENT,
  `category_id` INT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`variation_id`),
  FOREIGN KEY (`category_id`) REFERENCES `category`(`category_id`)
) ENGINE=InnoDB;

-- 5. Create variation_option table
CREATE TABLE `variation_option` (
  `variation_option_id` INT AUTO_INCREMENT,
  `variation_id` INT,
  `value` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`variation_option_id`),
  FOREIGN KEY (`variation_id`) REFERENCES `variation`(`variation_id`)
) ENGINE=InnoDB;

-- 6. Create address table
CREATE TABLE `address` (
  `address_id` INT AUTO_INCREMENT,
  `address_line1` VARCHAR(255) NOT NULL,
  `address_line2` VARCHAR(255) DEFAULT NULL,
  `address_line3` VARCHAR(255) DEFAULT NULL,
  `city` VARCHAR(100) NOT NULL,
  `region` VARCHAR(100) DEFAULT NULL,
  `postal_code` VARCHAR(20) DEFAULT NULL,
  `is_main_city` TINYINT(1) DEFAULT 0,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB;

-- 7. Create user table
CREATE TABLE `user` (
  `user_id` INT AUTO_INCREMENT,
  `customer_id` INT,
  `login_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`)
) ENGINE=InnoDB;

-- 8. Create delivery_module table
CREATE TABLE `delivery_module` (
  `delivery_module_id` INT AUTO_INCREMENT,
  `estimated_arrival_date` DATE,
  PRIMARY KEY (`delivery_module_id`)
) ENGINE=InnoDB;

-- 9. Create product table
CREATE TABLE `product` (
  `product_id` INT AUTO_INCREMENT,
  `category_id` INT,
  `product_name` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `product_image` VARCHAR(255) DEFAULT NULL,
  `weight` DECIMAL(10,2),
  PRIMARY KEY (`product_id`),
  FOREIGN KEY (`category_id`) REFERENCES `category`(`category_id`)
) ENGINE=InnoDB;

-- 10. Create variant table
CREATE TABLE `variant` (
  `variant_id` INT AUTO_INCREMENT,
  `product_id` INT,
  `inventory_stock` INT DEFAULT 0,
  `total_price` DECIMAL(10,2) NOT NULL,
  `variant_image` VARCHAR(255) DEFAULT NULL,
  `SKU` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`variant_id`),
  FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`)
) ENGINE=InnoDB;

-- 11. Create shop_order table
CREATE TABLE `shop_order` (
  `order_id` INT AUTO_INCREMENT,
  `user_id` INT,
  `delivery_module_id` INT,
  `order_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `payment_method_id` INT,
  `delivery_method` ENUM('store pickup', 'delivery') NOT NULL,
  `delivery_address_id` INT,
  `total_order_price` DECIMAL(10,2) NOT NULL,
  `order_status` ENUM('pending', 'shipped', 'delivered', 'cancelled') DEFAULT 'pending',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`),
  FOREIGN KEY (`delivery_module_id`) REFERENCES `delivery_module`(`delivery_module_id`),
  FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method`(`payment_method_id`),
  FOREIGN KEY (`delivery_address_id`) REFERENCES `address`(`address_id`)
) ENGINE=InnoDB;

-- 12. Create shopping_cart table
CREATE TABLE `shopping_cart` (
  `shopping_cart_id` INT AUTO_INCREMENT,
  `customer_id` INT,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shopping_cart_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`)
) ENGINE=InnoDB;

-- 13. Create shopping_cart_item table
CREATE TABLE `shopping_cart_item` (
  `shopping_cart_item_id` INT AUTO_INCREMENT,
  `shopping_cart_id` INT,
  `variant_id` INT,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`shopping_cart_item_id`),
  FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_cart`(`shopping_cart_id`),
  FOREIGN KEY (`variant_id`) REFERENCES `variant`(`variant_id`)
) ENGINE=InnoDB;

-- 14. Create order_item table
CREATE TABLE `order_item` (
  `order_item_id` INT AUTO_INCREMENT,
  `order_id` INT,
  `variant_id` INT,
  `quantity` INT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  FOREIGN KEY (`order_id`) REFERENCES `shop_order`(`order_id`),
  FOREIGN KEY (`variant_id`) REFERENCES `variant`(`variant_id`)
) ENGINE=InnoDB;

-- 15. Create customer_payment_method table
CREATE TABLE `customer_payment_method` (
  `cpm_id` INT AUTO_INCREMENT,
  `customer_id` INT,
  `card_number` VARCHAR(20) NOT NULL,
  `expire_date` DATE NOT NULL,
  PRIMARY KEY (`cpm_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`)
) ENGINE=InnoDB;

-- 16. Create product_specification table
CREATE TABLE `product_specification` (
  `product_specification_id` INT AUTO_INCREMENT,
  `variant_id` INT,
  `variation_option_id` INT,
  PRIMARY KEY (`product_specification_id`),
  FOREIGN KEY (`variant_id`) REFERENCES `variant`(`variant_id`),
  FOREIGN KEY (`variation_option_id`) REFERENCES `variation_option`(`variation_option_id`)
) ENGINE=InnoDB;

-- 17. Create customer_address table
CREATE TABLE `customer_address` (
  `customer_id` INT,
  `address_id` INT,
  `is_default` TINYINT(1) DEFAULT 0,
  PRIMARY KEY (`customer_id`, `address_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`),
  FOREIGN KEY (`address_id`) REFERENCES `address`(`address_id`)
) ENGINE=InnoDB;




-- Insert categories
INSERT INTO `category` (`category_name`, `parent_category_id`, `category_image`) VALUES
('Electronics', NULL, 'electronics.jpg'),
('Toys', NULL, 'toys.jpg'),
('Mobile', 1, 'mobile.jpg'),
('Speakers', 1, 'speakers.jpg'),
('Action Figures', 2, 'action_figures.jpg'),
('Board Games', 2, 'board_games.jpg'),
('Laptops', 1, 'laptops.jpg'),
('Drones', 1, 'drones.jpg'),
('Stuffed Toys', 2, 'stuffed_toys.jpg'),
('RC Cars', 2, 'rc_cars.jpg');

-- Insert payment methods
INSERT INTO `payment_method` (`name`) VALUES
('Cash on Delivery'),
('Credit Card'),
('Debit Card'),
('PayPal');

-- Insert products
INSERT INTO `product` (`category_id`, `product_name`, `description`, `product_image`, `weight`) VALUES
(3, 'iPhone X', 'Latest Apple smartphone', 'iphone_x.jpg', 0.5),
(3, 'Samsung Galaxy S21', 'Latest Samsung smartphone', 'galaxy_s21.jpg', 0.45),
(7, 'MacBook Pro', 'Apple laptop', 'macbook_pro.jpg', 1.4),
(7, 'Dell XPS 13', 'Dell laptop', 'dell_xps_13.jpg', 1.2),
(4, 'Bose Speaker', 'High-quality speaker', 'bose_speaker.jpg', 2.0),
(4, 'JBL Speaker', 'Portable speaker', 'jbl_speaker.jpg', 1.5),
(8, 'DJI Drone', 'Camera drone', 'dji_drone.jpg', 1.8),
(8, 'Parrot Drone', 'Mini drone', 'parrot_drone.jpg', 0.6),
(5, 'Superman Action Figure', 'Detailed action figure', 'superman_figure.jpg', 0.3),
(5, 'Batman Action Figure', 'Detailed action figure', 'batman_figure.jpg', 0.35),
-- Add more products up to 40
;

-- Insert variants for products (example for iPhone X)
INSERT INTO `variant` (`product_id`, `inventory_stock`, `total_price`, `variant_image`, `SKU`) VALUES
(1, 50, 999.99, 'iphone_x_16gb.jpg', 'IPX-16-BLK'),
(1, 30, 1099.99, 'iphone_x_32gb.jpg', 'IPX-32-BLK'),
(1, 20, 999.99, 'iphone_x_16gb_red.jpg', 'IPX-16-RD'),
(1, 10, 1099.99, 'iphone_x_32gb_red.jpg', 'IPX-32-RD'),
-- Add variants for other products
;