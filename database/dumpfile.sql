CREATE DATABASE  IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce`;
-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	9.0.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `is_main_city` tinyint DEFAULT '0',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'1600 Pennsylvania Ave NW',NULL,'Washington','20500',1),(2,'221B Baker St',NULL,'London','NW1 6XE',1),(3,'350 Fifth Avenue','Suite 5100','New York','10118',1),(4,'1 Infinite Loop',NULL,'Cupertino','95014',0),(5,'1 Queen Street','Level 2','Auckland','1010',1),(6,'100 Queen St W','3rd Floor','Toronto','M5H 2N2',1),(7,'742 Evergreen Terrace',NULL,'Springfield','62704',0),(8,'55 Rue du Faubourg Saint-Antoine',NULL,'Paris','75012',1),(9,'Friedrichstraße 43-45',NULL,'Berlin','10117',1),(10,'10 Downing St',NULL,'London','SW1A 2AA',1),(11,'no 51/18 , 1st lane , Pahala Gettuwana , Kurunegala','Pahala gattuwana','Kurunegala','60000',1),(12,'no 51/18 , 1st lane , Pahala Gettuwana , Kurunegala','Pahala gattuwana','Kurunegala','60000',1),(13,'no 51/18 , 1st lane , Pahala Gettuwana , Kurunegala','Pahala gattuwana','Kurunegala','60000',1),(14,'no 51/18 , 1st lane , Pahala Gettuwana , Kurunegala','Pahala gattuwana','Kurunegala','60000',1),(15,'no 51/18 , 1st lane , Pahala Gettuwana , Kurunegala','Pahala gattuwana','Kurunegala','60000',1),(16,'no 51/18 , 1st lane , Pahala Gettuwana , Kurunegala','Pahala gattuwana','Kurunegala','60000',1),(17,'no 51/18 , 1st lane , Pahala Gettuwana , Kurunegala','Pahala gattuwana','Kurunegala','60000',1),(18,'Ist Lane','Pahala gattuwana','Kurunegala','60000',1),(19,'dfdf','dfd','fd','4353',1),(20,'fdsfd','dfdsa','Kurunegala','55',1),(21,'jd','fda','efda','60000',0),(22,'rr','rr','rr','rr',1),(23,'no 51/18 , 1st lane , Pahala Gettuwana , Kurunegala','e','e','e',1),(24,'no 51/18 , 1st lane , Pahala Gettuwana , Kurunegala','Pahala gattuwana','d','d',1),(25,'d','d','d','d',1);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Parakrama','$2b$10$a6ntbj1KRN6D.F4FDGSaWuCSdiO0s2gr0InEaSSa3LmfPGPWjqlpy','Parakramawork@gmail.com','2024-10-30 10:48:33'),(11,'abc','$2b$10$mCPDXNp/zloZnzAHCkzJNOSJOWrOLjI411kweQJ/yyJt9hT9LQgYG','abc@gmail.com','2024-10-30 17:39:26'),(12,'bashitha','$2b$10$RqXapWL8RK5ma/Pz1iI.h.LKfZr56kma43T0hg3NANeNmlN4jKOLa','rireyod251@aqqor.com','2024-11-01 04:05:05');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `card_owner` varchar(50) DEFAULT NULL,
  `card_number` char(16) DEFAULT NULL,
  `card_type` varchar(20) DEFAULT 'Visa',
  `last_four_digits` char(4) DEFAULT NULL,
  `expiration_date` varchar(5) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (1,1,'Alice Johnson','1234567812345678','Visa','5678','06/25','tok_visa_1234abcd'),(2,2,'Bob Smith','9876543212345678','Visa','5678','11/24','tok_visa_5678efgh'),(3,3,'Charlie Brown','1234567890123456','MasterCard','3456','03/26','tok_master_9012ijkl'),(4,4,'Diana Prince','5678123456781234','Amex','1234','09/25','tok_amex_3456mnop'),(5,5,'Edward Stone','3456789012345678','Visa','5678','12/24','tok_visa_7890qrst'),(6,6,'Fiona Gray','9012345678123456','MasterCard','3456','01/27','tok_master_4321uvwx'),(7,7,'George Wilson','1234567890123456','Visa','5678','08/23','tok_visa_8765yzab'),(8,8,'Hannah Lee','5678123456781234','Discover','1234','05/28','tok_discover_2345cdef'),(9,9,'Ivan Rogers','3456789012345678','Visa','5678','10/26','tok_visa_6789ghij'),(10,10,'Julia Chen','9012345678123456','MasterCard','3456','02/25','tok_master_1111klmn'),(11,1,'Alice Johnson','1234567812345678','Visa','5678','06/25','tok_visa_1234abcd'),(12,2,'Bob Smith','9876543212345678','Visa','5678','11/24','tok_visa_5678efgh'),(13,3,'Charlie Brown','1234567890123456','MasterCard','3456','03/26','tok_master_9012ijkl'),(14,4,'Diana Prince','5678123456781234','Amex','1234','09/25','tok_amex_3456mnop'),(15,5,'Edward Stone','3456789012345678','Visa','5678','12/24','tok_visa_7890qrst'),(16,6,'Fiona Gray','9012345678123456','MasterCard','3456','01/27','tok_master_4321uvwx'),(17,7,'George Wilson','1234567890123456','Visa','5678','08/23','tok_visa_8765yzab'),(18,8,'Hannah Lee','5678123456781234','Discover','1234','05/28','tok_discover_2345cdef'),(19,9,'Ivan Rogers','3456789012345678','Visa','5678','10/26','tok_visa_6789ghij'),(20,10,'Julia Chen','9012345678123456','MasterCard','3456','02/25','tok_master_1111klmn'),(26,11,'acdkzcncdsk','3333333333333333','VISA','3333','44/44',NULL),(27,11,'9999','9999999999999999','VISA','9999','99/99',NULL),(28,17,'khhjh','0000000000000000','VISA','0000','00/00',NULL);
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT NULL,
  `parent_category_id` int DEFAULT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_category_id` (`parent_category_id`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`parent_category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Toys',NULL,'toys.jpg'),(2,'Electronics',NULL,'electronics.jpg'),(3,'Action Figures',1,'action_figures.jpg'),(4,'Board Games',1,'board_games.jpg'),(5,'Smartphones',2,'smartphones.jpg'),(6,'Laptops',2,'laptops.jpg'),(7,'Educational Toys',1,'educational_toys.jpg'),(8,'Outdoor Toys',1,'outdoor_toys.jpg'),(9,'Gaming Consoles',2,'gaming_consoles.jpg'),(10,'Smart Home Devices',2,'smart_home.jpg'),(11,'Smart Watches',2,'smart_watch.jpg'),(12,'Plush Doll',1,NULL),(13,'Jigsaw Puzzle',1,NULL),(14,'Bluetooth Speaker',2,NULL),(15,'Tablets',2,'ear_buds.jpg'),(16,'Wireless Earbuds',2,NULL),(17,'Wireless Headphones',2,'headphones.jpg'),(18,'qidhdd',2,'.jpg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `username` (`username`),
  KEY `idx_email` (`email_address`),
  KEY `idx_username` (`username`),
  KEY `idx_last_login` (`last_login`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Doe','john.doe@email.com','johnd','password123','2024-10-29 15:23:45','2024-10-29 15:23:45','2024-10-29 15:23:45'),(2,'Jane','Smith','jane.smith@email.com','janes','securepass','2024-10-29 15:23:45','2024-10-29 15:23:45','2024-10-29 15:23:45'),(3,'Robert','Johnson','robert.j@email.com','robertj','texasbest','2024-10-29 15:23:45','2024-10-29 15:23:45','2024-10-29 15:23:45'),(4,'Emily','Brown','emily.b@email.com','emilyb','toysrus','2024-10-29 15:23:45','2024-10-29 15:23:45','2024-10-29 15:23:45'),(5,'Michael','Davis','michael.d@email.com','michaeld','electronics101','2024-10-29 15:23:45','2024-10-29 15:23:45','2024-10-29 15:23:45'),(6,'Sarah','Wilson','sarah.w@email.com','sarahw','shopaholic','2024-10-29 15:23:45','2024-10-29 15:23:45','2024-10-29 15:23:45'),(7,'David','Martinez','david.m@email.com','davidm','password321','2024-10-29 15:23:45','2024-10-29 15:23:45','2024-10-29 15:23:45'),(8,'Jennifer','Anderson','jennifer.a@email.com','jennifera','texasshopper','2024-10-29 15:23:45','2024-10-29 15:23:45','2024-10-29 15:23:45'),(9,'William','Taylor','william.t@email.com','williamt','toyslover','2024-10-29 15:23:45','2024-10-29 15:23:45','2024-10-29 15:23:45'),(10,'Elizabeth','Thomas','elizabeth.t@email.com','elizabetht','gadgetfan','2024-10-29 15:23:45','2024-10-29 15:23:45','2024-10-29 15:23:45'),(11,'Parakrama','Rathnayaka','Parakramawork@gmail.com','Parakramawork@gmail.com','$2b$10$QAJHxIzaZ0NrfsUHmrnWuO7xUfwhdP4lm.MsVRgtxt1LfodmkeiiW','2024-10-30 13:56:38','2024-10-30 13:56:38','2024-10-30 13:56:38'),(16,'Parakrama','Rathnayaka','Parakramawork@gmail.com','dfsajd','$2b$10$Gy2IlCE6jrSaluajn3k8vOp1uSK2NqfLB3dinziVPSO9v6SR.fwPi','2024-11-01 03:41:08','2024-11-01 03:41:08','2024-11-01 03:41:08'),(17,'Dulitha','Perera','rireyod251@aqqor.com','dulitha','$2b$10$v98FEY5pGUdDrGOIpKMa9ehifH8kBlFcuP7ITdbDsaXkUo09Ki1sC','2024-11-01 03:57:56','2024-11-01 03:57:56','2024-11-01 03:57:56'),(19,'Parakrama','Rathnayaka','Parakramawork@gmail.com','Para@gmail.com','$2b$10$LODTBqrLZNYYjrxijrl7fexSeGlSxsqk.7HmON1h4FDL7FnO0.2Gm','2025-03-18 11:32:35','2025-03-18 11:32:35','2025-03-18 11:32:35'),(20,'jh','ff','teridox883@barodis.com','aaaaaa','$2b$10$hhIHwQloLPdjzCZl1suQpuTLsRzaQrKCz/E8lG8YVu8OhxGrQkxk.','2025-03-18 11:33:12','2025-03-18 11:33:12','2025-03-18 11:33:12'),(21,'Parakra','r','P@gmail.com','a','11111111','2025-05-06 21:11:22','2025-05-06 21:11:22','2025-05-06 21:11:22'),(22,'Parakrama','Rathnayaka','Para@gmail.com','P@gmail.com','11111111','2025-05-06 21:12:39','2025-05-06 21:12:39','2025-05-06 21:12:39'),(24,'P','a','yesamed957@bocapies.com','aaaa','$2b$10$PVSYUDwVWY.c6.ct.jN0oOLCNojw0cayiUJNRBd5ZZAM1hebXShyK','2025-05-06 21:34:24','2025-05-06 21:34:24','2025-05-06 21:34:24');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `create_shopping_cart` AFTER INSERT ON `customer` FOR EACH ROW BEGIN
  INSERT INTO shopping_cart (customer_id, created_at, updated_at)
  VALUES (NEW.customer_id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address` (
  `customer_id` int NOT NULL,
  `address_id` int NOT NULL,
  `is_default` tinyint DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`address_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `customer_address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `customer_address_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
INSERT INTO `customer_address` VALUES (1,1,1),(2,1,0),(3,3,1),(4,2,1),(5,5,0),(6,5,1),(7,7,1),(8,8,0),(9,8,1),(10,10,1),(11,11,NULL),(11,12,NULL),(11,13,NULL),(11,14,NULL),(11,15,NULL),(11,16,NULL),(11,17,NULL),(11,18,NULL),(11,19,NULL),(16,20,NULL),(17,21,NULL),(20,22,NULL),(24,23,NULL),(24,24,NULL),(24,25,NULL);
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_order_report`
--

DROP TABLE IF EXISTS `customer_order_report`;
/*!50001 DROP VIEW IF EXISTS `customer_order_report`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_order_report` AS SELECT 
 1 AS `customer_id`,
 1 AS `customer_name`,
 1 AS `total_orders`,
 1 AS `total_spent`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer_payment_method`
--

DROP TABLE IF EXISTS `customer_payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_payment_method` (
  `cpm_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`cpm_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_payment_method_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_payment_method`
--

LOCK TABLES `customer_payment_method` WRITE;
/*!40000 ALTER TABLE `customer_payment_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_phone_number`
--

DROP TABLE IF EXISTS `customer_phone_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_phone_number` (
  `phone_number` varchar(20) NOT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`phone_number`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_phone_number_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_phone_number`
--

LOCK TABLES `customer_phone_number` WRITE;
/*!40000 ALTER TABLE `customer_phone_number` DISABLE KEYS */;
INSERT INTO `customer_phone_number` VALUES ('0704064244',11);
/*!40000 ALTER TABLE `customer_phone_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_module`
--

DROP TABLE IF EXISTS `delivery_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_module` (
  `delivery_module_id` int NOT NULL,
  `estimated_arrival_date` date DEFAULT NULL,
  PRIMARY KEY (`delivery_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_module`
--

LOCK TABLES `delivery_module` WRITE;
/*!40000 ALTER TABLE `delivery_module` DISABLE KEYS */;
INSERT INTO `delivery_module` VALUES (1,'2024-10-15'),(2,'2024-10-16'),(3,'2024-10-17'),(4,'2024-10-18'),(5,'2024-10-19'),(6,'2024-10-20'),(7,'2024-10-21'),(8,'2024-10-22'),(9,'2024-10-23'),(10,'2024-10-24');
/*!40000 ALTER TABLE `delivery_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `is_read` tinyint DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `shop_order` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,121,'Your order #121 has been placed successfully.',0,'2024-10-30 13:31:50'),(2,122,'Your order #122 has been placed successfully.',0,'2024-10-30 13:43:56'),(3,123,'Your order #123 has been placed successfully.',0,'2024-10-30 13:58:15'),(4,124,'Your order #124 has been placed successfully.',0,'2024-10-30 13:59:14'),(5,125,'Your order #125 has been placed successfully.',0,'2024-10-30 13:59:41'),(6,126,'Your order #126 has been placed successfully.',0,'2024-10-30 14:33:18'),(7,127,'Your order #127 has been placed successfully.',0,'2024-10-30 16:07:32'),(8,128,'Your order #128 has been placed successfully.',0,'2024-10-31 09:35:22'),(9,129,'Your order #129 has been placed successfully.',0,'2024-10-31 09:54:38'),(10,130,'Your order #130 has been placed successfully.',0,'2024-10-31 10:02:04'),(11,131,'Your order #131 has been placed successfully.',0,'2024-10-31 10:50:32'),(12,132,'Your order #132 has been placed successfully.',0,'2024-10-31 11:26:27'),(13,133,'Your order #133 has been placed successfully.',0,'2024-10-31 11:29:47'),(14,134,'Your order #134 has been placed successfully.',0,'2024-10-31 11:30:00'),(15,135,'Your order #135 has been placed successfully.',0,'2024-10-31 11:30:25'),(16,136,'Your order #136 has been placed successfully.',0,'2024-10-31 11:30:55'),(17,137,'Your order #137 has been placed successfully.',0,'2024-10-31 11:31:44'),(18,138,'Your order #138 has been placed successfully.',0,'2024-10-31 14:45:57'),(19,140,'Your order #140 has been placed successfully.',0,'2024-10-31 15:17:40'),(20,141,'Your order #141 has been placed successfully.',0,'2024-10-31 15:44:33'),(23,144,'Your order #144 has been placed successfully.',0,'2024-10-31 15:56:38'),(24,145,'Your order #145 has been placed successfully.',0,'2024-10-31 15:56:52'),(25,146,'Your order #146 has been placed successfully.',0,'2024-10-31 15:57:25'),(26,147,'Your order #147 has been placed successfully.',0,'2024-10-31 15:57:35'),(28,149,'Your order #149 has been placed successfully.',0,'2024-10-31 16:07:10'),(31,152,'Your order #152 has been placed successfully.',0,'2024-10-31 16:09:00'),(32,153,'Your order #153 has been placed successfully.',0,'2024-10-31 16:24:11'),(33,154,'Your order #154 has been placed successfully.',0,'2024-10-31 16:25:04'),(34,155,'Your order #155 has been placed successfully.',0,'2024-10-31 16:25:14'),(35,156,'Your order #156 has been placed successfully.',0,'2024-10-31 16:27:21'),(36,157,'Your order #157 has been placed successfully.',0,'2024-10-31 16:28:00'),(37,158,'Your order #158 has been placed successfully.',0,'2024-10-31 16:44:13'),(38,159,'Your order #159 has been placed successfully.',0,'2024-11-01 01:53:14'),(39,160,'Your order #160 has been placed successfully.',0,'2024-11-01 01:54:40'),(40,161,'Your order #161 has been placed successfully.',0,'2024-11-01 02:19:56'),(41,162,'Your order #162 has been placed successfully.',0,'2024-11-01 02:23:20'),(42,163,'Your order #163 has been placed successfully.',0,'2024-11-01 02:24:35'),(43,164,'Your order #164 has been placed successfully.',0,'2024-11-01 02:26:59'),(44,165,'Your order #165 has been placed successfully.',0,'2024-11-01 02:27:22'),(45,166,'Your order #166 has been placed successfully.',0,'2024-11-01 02:27:45'),(46,1,'Your order #1 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(47,3,'Your order #3 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(48,6,'Your order #6 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(49,8,'Your order #8 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(50,11,'Your order #11 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(51,12,'Your order #12 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(52,13,'Your order #13 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(53,14,'Your order #14 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(54,15,'Your order #15 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(55,17,'Your order #17 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(56,18,'Your order #18 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(57,19,'Your order #19 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(58,20,'Your order #20 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(59,24,'Your order #24 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(60,25,'Your order #25 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(61,26,'Your order #26 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(62,27,'Your order #27 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(63,28,'Your order #28 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(64,29,'Your order #29 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(65,30,'Your order #30 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(66,31,'Your order #31 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(67,32,'Your order #32 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(68,33,'Your order #33 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(69,34,'Your order #34 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(70,35,'Your order #35 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(71,36,'Your order #36 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(72,37,'Your order #37 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(73,38,'Your order #38 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(74,39,'Your order #39 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(75,40,'Your order #40 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(76,41,'Your order #41 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(77,42,'Your order #42 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(78,43,'Your order #43 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(79,44,'Your order #44 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(80,45,'Your order #45 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(81,46,'Your order #46 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(82,47,'Your order #47 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(83,48,'Your order #48 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(84,49,'Your order #49 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(85,50,'Your order #50 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(86,51,'Your order #51 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(87,52,'Your order #52 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(88,53,'Your order #53 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(89,54,'Your order #54 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(90,55,'Your order #55 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(91,56,'Your order #56 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(92,57,'Your order #57 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(93,58,'Your order #58 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(94,59,'Your order #59 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(95,60,'Your order #60 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(96,61,'Your order #61 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(97,62,'Your order #62 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(98,63,'Your order #63 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(99,64,'Your order #64 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(100,65,'Your order #65 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(101,66,'Your order #66 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(102,67,'Your order #67 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(103,68,'Your order #68 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(104,69,'Your order #69 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(105,70,'Your order #70 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(106,71,'Your order #71 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(107,72,'Your order #72 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(108,73,'Your order #73 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(109,74,'Your order #74 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(110,75,'Your order #75 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(111,76,'Your order #76 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(112,77,'Your order #77 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(113,78,'Your order #78 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(114,79,'Your order #79 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(115,80,'Your order #80 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(116,81,'Your order #81 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(117,82,'Your order #82 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(118,83,'Your order #83 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(119,84,'Your order #84 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(120,85,'Your order #85 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(121,86,'Your order #86 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(122,87,'Your order #87 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(123,88,'Your order #88 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(124,89,'Your order #89 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(125,90,'Your order #90 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(126,91,'Your order #91 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(127,92,'Your order #92 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(128,93,'Your order #93 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(129,94,'Your order #94 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(130,95,'Your order #95 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(131,96,'Your order #96 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(132,97,'Your order #97 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(133,98,'Your order #98 status has been updated to shipped.',0,'2024-11-01 02:29:21'),(134,167,'Your order #167 has been placed successfully.',0,'2024-11-01 02:43:40'),(135,168,'Your order #168 has been placed successfully.',0,'2024-11-01 02:48:22'),(136,169,'Your order #169 has been placed successfully.',0,'2024-11-01 02:51:16'),(137,170,'Your order #170 has been placed successfully.',0,'2024-11-01 02:52:22'),(138,171,'Your order #171 has been placed successfully.',0,'2024-11-01 04:01:46'),(139,172,'Your order #172 has been placed successfully.',0,'2025-03-18 11:35:37'),(140,173,'Your order #173 has been placed successfully.',0,'2025-05-06 21:35:34'),(141,174,'Your order #174 has been placed successfully.',0,'2025-05-06 21:37:48'),(142,175,'Your order #175 has been placed successfully.',0,'2025-05-06 21:40:37');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `shop_order` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,3,59.97),(2,2,4,1,699.99),(3,3,3,1,49.99),(4,4,6,1,999.99),(5,5,7,1,29.99),(6,6,8,1,24.99),(7,6,1,2,39.99),(8,7,10,1,149.99),(9,8,4,2,1399.98),(10,9,1,3,59.97),(11,24,2,1,19.99),(12,52,4,1,699.99),(13,52,1,1,19.99),(15,19,4,1,699.99),(16,19,5,1,699.99),(17,19,3,2,49.99),(18,19,7,1,29.99),(19,19,9,1,499.99),(20,19,1,3,19.99),(21,19,6,1,999.99),(22,19,8,2,24.99),(23,19,10,1,149.99),(30,19,4,1,699.99),(31,19,5,1,699.99),(32,19,3,2,49.99),(33,19,7,1,29.99),(34,19,9,1,499.99),(35,19,1,3,19.99),(36,19,6,1,999.99),(37,19,8,2,24.99),(38,19,10,1,149.99),(45,20,4,1,699.99),(46,20,5,1,699.99),(47,20,3,2,49.99),(48,20,7,1,29.99),(49,20,9,1,499.99),(50,20,1,3,19.99),(51,20,6,1,999.99),(52,20,8,2,24.99),(53,20,10,1,149.99),(60,55,1,1,19.99),(61,57,1,1,19.99),(62,58,6,1,999.99),(63,58,1,1,19.99),(65,59,4,1,699.99),(66,63,3,1,49.99),(67,65,3,1,49.99),(68,66,1,1,19.99),(69,67,1,1,19.99),(70,69,4,1,699.99),(71,70,1,1,19.99),(72,71,6,1,999.99),(73,72,7,1,29.99),(74,73,3,1,49.99),(75,76,6,1,999.99),(76,77,1,1,19.99),(77,79,3,1,49.99),(78,84,7,1,29.99),(79,88,7,1,29.99),(80,88,3,1,49.99),(82,89,3,1,49.99),(83,91,1,1,19.99),(84,92,7,1,29.99),(85,94,3,1,49.99),(86,95,3,1,49.99),(87,96,6,5,999.99),(88,97,3,1,49.99),(89,98,3,1,49.99),(90,102,7,4,29.99),(91,102,6,1,999.99),(93,103,3,1,49.99),(94,105,7,1,29.99),(95,105,8,1,24.99),(97,106,3,4,49.99),(98,106,7,1,29.99),(100,107,7,4,29.99),(101,108,1,1,19.99),(102,109,1,1,19.99),(103,109,3,1,49.99),(105,110,1,5,19.99),(106,111,1,1,19.99),(107,112,6,1,999.99),(108,113,7,2,29.99),(109,114,1,1,19.99),(110,114,4,1,699.99),(112,115,1,1,19.99),(113,115,3,4,49.99),(115,116,4,1,699.99),(116,117,1,1,19.99),(117,119,9,1,499.99),(118,120,9,1,499.99),(119,122,1,4,19.99),(120,123,9,1,499.99),(121,126,3,2,49.99),(122,126,7,1,29.99),(124,127,9,1,499.99),(125,127,4,1,699.99),(127,128,3,1,49.99),(128,128,1,8,19.99),(130,129,8,4,24.99),(131,130,9,1,499.99),(132,130,1,2,19.99),(134,131,1,1,19.99),(135,132,7,1,29.99),(136,132,1,1,19.99),(138,138,1,10,19.99),(140,140,1,6,19.99),(141,141,3,6,49.99),(145,149,1,100,19.99),(148,152,1,7,19.99),(149,153,1,6,19.99),(150,157,1,14,19.99),(151,158,1,10,19.99),(152,159,1,1,19.99),(153,161,6,1,999.99),(154,161,1,1,19.99),(155,161,4,1,699.99),(156,162,1,1,19.99),(157,166,1,9,19.99),(158,167,6,17,999.99),(159,167,1,4,19.99),(161,168,10,10,149.99),(162,169,1,11,19.99),(163,170,1,1,19.99),(164,171,1,3,19.99),(165,172,1,1,19.99),(166,173,3,1,49.99),(167,174,16,4,10.00),(168,175,1,1,19.99);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `payment_method_id` int NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,'Credit Card'),(2,'Debit Card'),(3,'PayPal'),(4,'Apple Pay'),(5,'Google Pay'),(6,'Bank Transfer'),(7,'Cash on Delivery'),(8,'Gift Card'),(9,'Cryptocurrency'),(10,'Afterpay');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `product_image` varchar(255) DEFAULT NULL,
  `weight` decimal(5,1) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT '0.0',
  PRIMARY KEY (`product_id`),
  KEY `idx_category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,3,'Superhero Action Figure','Poseable superhero figure','https://media.istockphoto.com/id/458945985/photo/partners-against-crime.jpg?s=612x612&w=0&k=20&c=r6A4YzG_TAyGF2jGoJSwY6PizSqC9BcIi_PSQBfq5CA=',0.3,4.0),(2,4,'Strategy Board Game','Complex strategy game for adults','https://www.shutterstock.com/image-vector/isometric-board-games-various-boardgames-600nw-2322698469.jpg',1.2,4.5),(3,5,'TexasPhone X','Latest smartphone with advanced features','https://www.shutterstock.com/image-illustration/3d-mobile-phone-sim-card-260nw-1880249659.jpg',0.2,5.0),(4,6,'LoneStar Laptop','Powerful laptop for work and play','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnPNXzj26cZtZ9BKHW4iVNKWHXB5KPVXvq9gG-lTizp_CS6lh6H6Tp1ZRT4kD_8NcNi64&usqp=CAU',2.5,4.5),(5,7,'Math Learning Set','Educational toy for learning mathematics','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_ZGnIHzfGtbhV7riebZLNxB7uMYAQ-thWzA&s',0.5,5.0),(6,8,'Texas-sized Frisbee','Large frisbee for outdoor fun','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXyMJGPztBOH4gx_xV5g7C16CXk3HFzjcykw&s',0.2,5.0),(7,9,'TexasStation 5','Next-gen gaming console','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwBPKyUVshSg5B_w0SxRgl-Pex4S0VSAD_Ew&s',3.9,5.0),(8,10,'Smart Thermostat','Energy-saving smart home device','https://www.bobvila.com/wp-content/uploads/2019/02/Smart_Thermostat.jpg',0.3,4.5),(9,3,'Cowboy Action Figure','Detailed cowboy figure with accessories','https://thumbs.dreamstime.com/b/cowboy-toy-figure-15370167.jpg',0.3,5.0),(10,12,'POP MART LABUBU','The Monsters Etciting Macaron Plush Dolls Figures Toys Blind Box','https://i.ebayimg.com/images/g/IBoAAOSw6~9nDVIu/s-l1600.webp',0.8,5.0),(11,13,'HOYE CRAFT','Hot Selling DIY Handmade House 3D Puzzle Game Shop Jigsaw Puzzle For Kids Gifts','https://s.alicdn.com/@sc04/kf/H460ac4b4df6044abaae46d55f86b8b04m.jpg_720x720q50.jpg',0.9,4.5),(12,14,' Wireless Bluetooth Speaker','JBL GO3 Portable Waterproof Wireless Bluetooth Speaker, Waterproof and Dustproof','https://i.ebayimg.com/images/g/90EAAOSw-S1m7pIG/s-l1600.webp',2.0,5.0),(13,14,'Bluetooth Speaker','Universal Wireless Portable Bluetooth Speaker JBL Flip 6 Waterproof Multicolor','https://i.ebayimg.com/images/g/rLEAAOSw8VtnB4nW/s-l1600.webp',2.0,4.5),(14,11,'Samsung Galaxy Watch','Samsung Galaxy Watch 7 44mm SM-L310 Bluetooth AI Smartwatch - Excellent','https://i.ebayimg.com/images/g/vkQAAOSwfrpnCVtE/s-l1600.webp',1.5,5.0),(15,11,'Apple Watch','Apple Watch Series 7 45mm (GPS + Cellular) Aluminum Case - Excellent','https://i.ebayimg.com/images/g/cuEAAOSwxQJnG8Y2/s-l1600.webp',0.1,5.0),(17,11,'Google Pixel Watch','The Google Pixel Watch combines sleek design with health and fitness tracking, powered by Wear OS for seamless integration with Google services.','https://i.ebayimg.com/images/g/R-sAAOSwF0Fllwaj/s-l1600.webp',1.0,2.5),(18,11,'Apple Watch Series ','The Apple Watch Series offers advanced health tracking, fitness features, and seamless connectivity, designed to keep you connected and active throughout the day.','https://i.ebayimg.com/images/g/1bgAAOSwgN9kUuU9/s-l1600.webp',2.0,4.0),(19,11,'Apple Watch Series 3 38mm 42mm GPS+ WIFI + LTE UNLOCKED Gold Gray Silver - Good','The Apple Watch Series 3 (38mm & 42mm, GPS + WiFi + LTE) in Gold, Gray, and Silver offers cellular connectivity, fitness tracking, and essential health features, ideal for staying connected on the go.\n\n\n\n\n\n\n','https://i.ebayimg.com/images/g/VyUAAOSwvvdiPLuq/s-l1600.webp',2.0,1.5),(20,15,'Apple - iPad mini (6th Generation)','The Apple iPad mini (6th Generation) features an 8.3-inch Liquid Retina display, A15 Bionic chip, and Apple Pencil support, offering powerful performance in a compact design.','https://i.ebayimg.com/images/g/RiQAAOSwiFJjyCGG/s-l1600.webp',0.7,4.5),(21,15,'Apple - iPad 9 ','The Apple iPad 9th Generation features a 10.2-inch Retina display, A13 Bionic chip, and support for the Apple Pencil and Smart Keyboard, providing great versatility for work, learning, and entertainment.','https://i.ebayimg.com/thumbs/images/g/Zd0AAOSwMEBhWzuG/s-l500.jpg',0.7,3.0),(22,16,'Soundcore P30i Noise Cancelling Wireless Earbuds','The Soundcore P30i Noise Cancelling Wireless Earbuds deliver immersive sound with active noise cancellation, long battery life, and a comfortable fit for all-day listening.','https://i.ebayimg.com/images/g/K0cAAOSwPHJmaq7D/s-l1600.webp',0.5,4.5),(23,16,'Soundcore P30i Noise Cancelling Wireless Earbuds ','Experience immersive sound with the Soundcore P30i Noise Cancelling Wireless Earbuds, featuring advanced noise cancellation and a comfortable fit for all-day listening.','https://i.ebayimg.com/images/g/K0cAAOSwPHJmaq7D/s-l1600.webp',0.8,3.0),(24,16,'Galaxy Buds FE ','Discover exceptional sound quality and a comfortable fit with the Galaxy Buds FE, designed for seamless listening and immersive experiences wherever you go.','https://i.ebayimg.com/images/g/9RQAAOSwoxdm871X/s-l960.webp',0.2,3.0),(25,16,'Soundcore P30i Noise Cancelling Wireless Earbuds 2in1 Phone Stand Case 45H Play','Enjoy 45 hours of playtime and effortless convenience with the Soundcore P30i Noise Cancelling Wireless Earbuds, featuring a 2-in-1 phone stand case for easy charging and hands-free viewing.','https://i.ebayimg.com/thumbs/images/g/K0cAAOSwPHJmaq7D/s-l300.webp',1.0,5.0),(26,17,'JBL Tune 770NC Bluetooth Adaptive Noise Cancelling Wireless over-Ear Headphones','Experience premium audio with the JBL Tune 770NC Bluetooth Adaptive Noise Cancelling Wireless Over-Ear Headphones, designed for superior comfort and immersive sound in any environment.','https://i.ebayimg.com/images/g/HzMAAOSwLtFmX3D3/s-l1600.webp',0.5,4.0),(27,17,'Beats Studio Pro Bluetooth Wireless Headphones','Immerse yourself in rich sound and unrivaled comfort with the Beats Studio Pro Bluetooth Wireless Headphones, featuring advanced noise cancellation and an iconic design for all-day listening.\n\n\n\n\n\n\n','https://i.ebayimg.com/images/g/mS8AAOSwghRk0SOL/s-l500.webp',0.7,2.9),(28,17,'Bose QuietComfort 45 Bluetooth Wireless Noise Cancelling Headphones From Japan','Experience unparalleled comfort and superior sound quality with the Bose QuietComfort 45 Bluetooth Wireless Noise Cancelling Headphones from Japan, designed to deliver a serene listening experience in any environment.','https://i.ebayimg.com/thumbs/images/g/~C4AAOSwohZmC7kR/s-l300.webp',0.5,3.0),(29,17,'Sony WH1000XM4 Wireless Noise-Cancelling Over-the-Ear Headphones,Brand New','Enjoy premium sound and industry-leading noise cancellation with the brand new Sony WH-1000XM4 Wireless Over-the-Ear Headphones, perfect for an immersive listening experience wherever you go.','https://i.ebayimg.com/images/g/3CsAAOSwrJZm~vjh/s-l1600.webp',0.6,4.0),(30,11,'Apple Watch Series 8 45mm GPS + WiFi + Cellular Unlocked Aluminum Case - Good','Stay connected and track your fitness goals with the Apple Watch Series 8 45mm GPS + WiFi + Cellular, featuring an unlocked aluminum case for a stylish and versatile wear experience.','https://i.ebayimg.com/images/g/1bgAAOSwgN9kUuU9/s-l1600.webp',1.8,5.0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `report`
--

DROP TABLE IF EXISTS `report`;
/*!50001 DROP VIEW IF EXISTS `report`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `report` AS SELECT 
 1 AS `order_date`,
 1 AS `payment_method_name`,
 1 AS `delivery_method`,
 1 AS `total_order_price`,
 1 AS `subtotal`,
 1 AS `shipping`,
 1 AS `tax`,
 1 AS `shipping_date`,
 1 AS `order_status`,
 1 AS `quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `shop_order`
--

DROP TABLE IF EXISTS `shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `delivery_module_id` int DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `payment_method_id` int DEFAULT NULL,
  `delivery_method` enum('standard','express','overnight') DEFAULT NULL,
  `delivery_address_id` int DEFAULT NULL,
  `total_order_price` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_date` datetime DEFAULT NULL,
  `order_status` enum('pending','shipped','delivered','canceled') DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `discount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `delivery_module_id` (`delivery_module_id`),
  KEY `delivery_address_id` (`delivery_address_id`),
  KEY `payment_method_id` (`payment_method_id`),
  CONSTRAINT `shop_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `shop_order_ibfk_2` FOREIGN KEY (`delivery_module_id`) REFERENCES `delivery_module` (`delivery_module_id`),
  CONSTRAINT `shop_order_ibfk_3` FOREIGN KEY (`delivery_address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `shop_order_ibfk_4` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order`
--

LOCK TABLES `shop_order` WRITE;
/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
INSERT INTO `shop_order` VALUES (1,1,1,'2024-10-08 10:00:00',1,'standard',1,179.91,49.99,9.99,2.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(2,2,2,'2024-10-08 11:30:00',2,'express',2,699.99,600.00,25.00,60.00,'2024-10-09 11:30:00','shipped','2024-10-29 15:23:45',0.00),(3,3,3,'2024-10-08 12:45:00',3,'standard',3,49.99,40.00,5.00,4.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(4,4,4,'2024-10-08 14:15:00',1,'overnight',4,999.99,800.00,30.00,80.00,'2024-10-08 14:15:00','shipped','2024-10-29 15:23:45',0.00),(5,5,5,'2024-10-08 15:30:00',4,'standard',5,29.99,20.00,3.00,2.00,'2024-10-08 15:30:00','delivered','2024-10-29 15:23:45',0.00),(6,6,6,'2024-10-08 16:45:00',2,'express',6,104.97,500.00,15.00,40.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(7,7,7,'2024-10-08 17:00:00',5,'standard',7,149.99,120.00,7.00,10.00,'2024-10-08 17:00:00','shipped','2024-10-29 15:23:45',0.00),(8,8,8,'2024-10-08 18:30:00',3,'overnight',8,2799.96,1300.00,50.00,90.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(9,9,9,'2024-10-08 19:45:00',1,'standard',9,179.91,60.00,5.00,5.00,'2024-10-08 19:45:00','delivered','2024-10-29 15:23:45',0.00),(10,10,10,'2024-10-08 21:00:00',4,'express',10,499.99,450.00,20.00,30.00,'2024-10-09 21:00:00','shipped','2024-10-29 15:23:45',0.00),(11,11,1,'2024-10-29 20:55:05',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(12,11,1,'2024-10-29 21:01:09',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(13,11,1,'2024-10-29 21:04:54',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(14,11,1,'2024-10-29 21:05:23',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(15,11,1,'2024-10-29 21:07:19',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(17,11,1,'2024-10-29 21:13:02',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(18,11,1,'2024-10-29 21:17:19',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(19,11,1,'2024-10-29 21:18:26',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(20,11,1,'2024-10-29 21:20:03',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(24,1,1,'2024-10-10 10:00:00',1,'standard',1,59.97,49.99,9.99,2.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(25,11,1,'2024-10-29 21:33:11',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(26,11,1,'2024-10-29 21:33:27',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(27,1,1,'2024-10-10 10:00:00',1,'standard',1,59.97,49.99,9.99,2.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(28,1,1,'2024-10-10 10:00:00',1,'standard',1,59.97,49.99,9.99,2.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(29,1,1,'2024-10-10 10:00:00',1,'standard',1,59.97,49.99,9.99,2.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(30,11,1,'2024-10-29 21:34:42',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(31,1,1,'2024-10-10 10:00:00',1,'standard',1,59.97,49.99,9.99,2.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(32,1,1,'2024-10-10 10:00:00',1,'standard',1,59.97,49.99,9.99,2.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(33,1,1,'2024-10-10 10:00:00',1,'standard',1,59.97,49.99,9.99,2.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(34,1,1,'2024-10-10 10:00:00',1,'standard',1,59.97,49.99,9.99,2.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(35,1,1,'2024-10-10 10:00:00',1,'standard',1,59.97,49.99,9.99,2.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(36,11,1,'2024-10-29 22:03:17',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(37,11,1,'2024-10-29 22:04:05',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(38,1,1,'2024-10-10 10:00:00',1,'standard',1,59.97,49.99,9.99,2.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(39,11,1,'2024-10-29 22:04:46',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(40,11,1,'2024-10-29 22:04:47',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(41,1,1,'2024-10-10 10:00:00',1,'standard',1,59.97,49.99,9.99,2.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(42,1,1,'2024-10-10 10:00:00',1,'standard',1,59.97,49.99,9.99,2.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(43,11,1,'2024-10-29 22:10:29',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(44,11,1,'2024-10-29 22:10:30',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(45,11,1,'2024-10-29 22:14:35',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(46,1,1,'2024-10-10 10:00:00',1,'standard',1,59.97,49.99,9.99,2.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(47,11,1,'2024-10-29 22:15:49',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(48,11,1,'2024-10-29 22:25:12',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(49,11,1,'2024-10-29 22:26:14',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(50,11,1,'2024-10-29 22:27:15',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(51,11,1,'2024-10-29 22:34:34',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(52,11,1,'2024-10-29 22:36:51',1,'standard',11,734.98,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(53,11,1,'2024-10-29 22:37:55',1,'standard',11,734.98,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(54,11,1,'2024-10-29 22:49:19',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(55,11,1,'2024-10-29 22:49:38',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(56,11,1,'2024-10-29 22:50:11',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(57,11,1,'2024-10-29 22:51:35',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(58,11,1,'2024-10-29 23:03:58',1,'standard',11,1034.98,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(59,11,1,'2024-10-29 23:11:42',1,'standard',11,714.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(60,11,1,'2024-10-29 23:12:01',1,'standard',11,714.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(61,11,1,'2024-10-29 23:14:26',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(62,11,1,'2024-10-29 23:20:09',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(63,11,1,'2024-10-29 23:32:02',1,'standard',11,64.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(64,11,1,'2024-10-29 23:32:16',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(65,11,1,'2024-10-29 23:32:37',1,'standard',11,64.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(66,11,1,'2024-10-29 23:33:20',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(67,11,1,'2024-10-29 23:33:58',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(68,11,1,'2024-10-29 23:34:48',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(69,11,1,'2024-10-29 23:35:29',1,'standard',11,714.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(70,11,1,'2024-10-29 23:42:47',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(71,11,1,'2024-10-29 23:44:09',1,'standard',11,1014.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(72,11,1,'2024-10-29 23:44:49',1,'standard',11,44.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(73,11,1,'2024-10-29 23:46:07',1,'standard',11,64.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(74,11,1,'2024-10-29 23:50:03',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(75,11,1,'2024-10-30 00:17:59',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(76,11,1,'2024-10-30 00:18:49',1,'standard',11,1014.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(77,11,1,'2024-10-30 00:23:36',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(78,11,1,'2024-10-30 00:41:03',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(79,11,1,'2024-10-30 02:31:52',1,'standard',11,64.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(80,11,1,'2024-10-30 02:32:00',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(81,11,1,'2024-10-30 02:34:08',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(82,11,1,'2024-10-30 02:35:10',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(83,11,1,'2024-10-30 02:44:01',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(84,11,1,'2024-10-30 02:44:46',1,'standard',11,44.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(85,11,1,'2024-10-30 02:58:31',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(86,11,1,'2024-10-30 03:14:53',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(87,11,1,'2024-10-30 03:14:53',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(88,11,1,'2024-10-30 03:22:21',1,'standard',11,94.98,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(89,11,1,'2024-10-30 03:27:25',1,'standard',11,64.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(90,11,1,'2024-10-30 03:37:33',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(91,11,1,'2024-10-30 04:10:04',1,'standard',11,34.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(92,11,1,'2024-10-30 04:15:37',1,'standard',11,44.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(93,11,1,'2024-10-30 04:20:48',1,'standard',11,15.00,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(94,11,1,'2024-10-30 04:22:46',1,'standard',11,64.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(95,11,1,'2024-10-30 05:09:06',1,'standard',11,68.99,0.00,0.00,0.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(96,11,1,'2024-10-30 05:37:13',1,'standard',11,5399.95,4999.95,0.00,400.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(97,11,1,'2024-10-30 05:37:42',1,'standard',11,68.99,49.99,15.00,4.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(98,11,1,'2024-10-30 05:38:12',1,'standard',11,68.99,49.99,15.00,4.00,'2024-11-01 07:59:21','shipped','2024-11-01 02:29:21',0.00),(99,11,1,'2024-10-30 11:37:05',1,'standard',11,15.00,0.00,15.00,0.00,NULL,'pending','2024-10-30 06:07:05',0.00),(100,11,1,'2024-10-30 11:37:19',1,'standard',11,15.00,0.00,15.00,0.00,NULL,'pending','2024-10-30 06:07:19',0.00),(101,11,1,'2024-10-30 11:37:45',1,'standard',11,15.00,0.00,15.00,0.00,NULL,'pending','2024-10-30 06:07:45',0.00),(102,11,1,'2024-10-30 11:38:52',1,'standard',11,1209.55,1119.95,0.00,89.60,NULL,'pending','2024-10-30 06:08:52',0.00),(103,11,1,'2024-10-30 11:42:46',1,'standard',11,68.99,49.99,15.00,4.00,'2024-10-30 11:42:46','pending','2024-10-30 06:12:46',0.00),(104,11,1,'2024-10-30 11:51:29',1,'standard',11,15.00,0.00,15.00,0.00,'2024-10-30 11:51:29','pending','2024-10-30 06:21:29',0.00),(105,11,1,'2024-10-30 12:02:32',1,'standard',11,59.38,54.98,0.00,4.40,'2024-11-04 00:00:00',NULL,'2024-10-30 06:32:32',0.00),(106,11,1,'2024-10-30 12:09:14',1,'standard',11,248.35,229.95,0.00,18.40,'2024-11-04 00:00:00',NULL,'2024-10-30 06:39:14',0.00),(107,11,1,'2024-10-30 12:32:06',1,'standard',11,129.56,119.96,0.00,9.60,'2024-11-04 00:00:00',NULL,'2024-10-30 07:02:06',0.00),(108,11,1,'2024-10-30 12:38:53',1,'standard',11,36.59,19.99,15.00,1.60,'2024-11-04 00:00:00','pending','2024-10-30 07:08:53',0.00),(109,11,1,'2024-10-30 12:41:30',1,'standard',11,75.58,69.98,0.00,5.60,'2024-11-04 00:00:00','pending','2024-10-30 07:11:30',0.00),(110,11,1,'2024-10-30 13:39:38',1,'standard',11,107.95,99.95,0.00,8.00,'2024-11-04 00:00:00','pending','2024-10-30 08:09:38',0.00),(111,11,1,'2024-10-30 15:16:26',1,'standard',11,36.59,19.99,15.00,1.60,'2024-11-04 00:00:00','pending','2024-10-30 09:46:26',0.00),(112,11,1,'2024-10-30 15:48:36',1,'standard',11,1079.99,999.99,0.00,80.00,'2024-11-04 00:00:00','pending','2024-10-30 10:18:36',0.00),(113,11,1,'2024-10-30 17:22:34',1,'standard',11,64.78,59.98,0.00,4.80,'2024-11-04 00:00:00','pending','2024-10-30 11:52:34',0.00),(114,11,1,'2024-10-30 17:32:08',1,'standard',11,777.58,719.98,0.00,57.60,'2024-11-04 00:00:00','pending','2024-10-30 12:02:08',0.00),(115,11,1,'2024-10-30 17:32:08',1,'standard',11,444.00,44.00,0.00,45.54,'2024-11-04 00:00:00','pending','2024-10-30 12:02:08',0.00),(116,11,1,'2024-10-30 18:02:41',1,'standard',11,755.99,699.99,0.00,56.00,'2024-11-04 00:00:00','pending','2024-10-30 12:32:41',0.00),(117,11,1,'2024-10-30 18:39:06',1,'standard',11,36.59,19.99,15.00,1.60,'2024-11-04 00:00:00','pending','2024-10-30 13:09:06',0.00),(118,11,1,'2024-10-30 18:39:22',1,'standard',11,15.00,0.00,15.00,0.00,'2024-11-04 00:00:00','pending','2024-10-30 13:09:22',0.00),(119,11,1,'2024-10-30 18:57:12',1,'standard',11,539.99,499.99,0.00,40.00,'2024-11-04 00:00:00','pending','2024-10-30 13:27:12',0.00),(120,11,1,'2024-10-30 18:57:43',1,'standard',11,539.99,499.99,0.00,40.00,'2024-11-04 00:00:00','pending','2024-10-30 13:27:43',0.00),(121,11,1,'2024-10-30 19:01:50',1,'standard',11,15.00,0.00,15.00,0.00,'2024-11-04 00:00:00','pending','2024-10-30 13:31:50',0.00),(122,11,1,'2024-10-30 19:13:56',1,'standard',11,86.36,79.96,0.00,6.40,'2024-11-04 00:00:00','pending','2024-10-30 13:43:56',0.00),(123,11,1,'2024-10-30 19:28:15',1,'standard',11,539.99,499.99,0.00,40.00,'2024-11-04 00:00:00','pending','2024-10-30 13:58:15',0.00),(124,11,1,'2024-10-30 19:29:14',1,'standard',11,15.00,0.00,15.00,0.00,'2024-11-04 00:00:00','pending','2024-10-30 13:59:14',0.00),(125,11,1,'2024-10-30 19:29:41',1,'standard',11,15.00,0.00,15.00,0.00,'2024-11-04 00:00:00','pending','2024-10-30 13:59:41',0.00),(126,11,1,'2024-10-30 20:03:18',1,'standard',11,140.37,129.97,0.00,10.40,'2024-11-04 00:00:00','pending','2024-10-30 14:33:18',0.00),(127,11,1,'2024-10-30 21:37:32',1,'standard',11,1295.98,1199.98,0.00,96.00,'2024-11-04 00:00:00','pending','2024-10-30 16:07:32',0.00),(128,11,1,'2024-10-31 15:05:22',1,'standard',11,226.70,209.91,0.00,16.79,'2024-11-05 00:00:00','pending','2024-10-31 09:35:22',0.00),(129,11,1,'2024-10-31 15:24:38',1,'standard',11,107.96,99.96,0.00,8.00,'2024-11-05 00:00:00','pending','2024-10-31 09:54:38',0.00),(130,11,1,'2024-10-31 15:32:04',1,'standard',11,583.17,539.97,0.00,43.20,'2024-11-05 00:00:00','pending','2024-10-31 10:02:04',0.00),(131,11,1,'2024-10-31 16:20:32',1,'standard',11,36.59,19.99,15.00,1.60,'2024-11-05 00:00:00','pending','2024-10-31 10:50:32',0.00),(132,11,1,'2024-10-31 16:56:27',1,'standard',11,68.98,49.98,15.00,4.00,'2024-11-05 00:00:00','pending','2024-10-31 11:26:27',0.00),(133,11,1,'2024-10-31 16:59:47',1,'standard',11,15.00,0.00,15.00,0.00,'2024-11-05 00:00:00','pending','2024-10-31 11:29:47',0.00),(134,11,1,'2024-10-31 17:00:00',1,'standard',11,15.00,0.00,15.00,0.00,'2024-11-05 00:00:00','pending','2024-10-31 11:30:00',0.00),(135,11,1,'2024-10-31 17:00:25',1,'standard',11,15.00,0.00,15.00,0.00,'2024-11-05 00:00:00','pending','2024-10-31 11:30:25',0.00),(136,11,1,'2024-10-31 17:00:55',1,'standard',11,15.00,0.00,15.00,0.00,'2024-11-05 00:00:00','pending','2024-10-31 11:30:55',0.00),(137,11,1,'2024-10-31 17:01:44',1,'standard',11,15.00,0.00,15.00,0.00,'2024-11-08 00:00:00','pending','2024-10-31 11:31:44',0.00),(138,11,1,'2024-10-31 20:15:57',1,'standard',11,215.89,199.90,0.00,15.99,'2024-11-08 00:00:00','pending','2024-10-31 14:45:57',0.00),(140,11,1,'2024-10-31 20:47:40',1,'standard',11,129.54,119.94,0.00,9.60,'2024-11-08 00:00:00','pending','2024-10-31 15:17:40',0.00),(141,11,1,'2024-10-31 21:14:33',1,'standard',11,323.94,299.94,0.00,24.00,'2024-11-05 00:00:00','pending','2024-10-31 15:44:33',0.00),(144,11,1,'2024-10-31 21:26:38',1,'standard',11,2158.92,1999.00,0.00,159.92,'2024-11-08 00:00:00','pending','2024-10-31 15:56:38',0.00),(145,11,1,'2024-10-31 21:26:52',1,'standard',11,2158.92,1999.00,0.00,159.92,'2024-11-08 00:00:00','pending','2024-10-31 15:56:52',0.00),(146,11,1,'2024-10-31 21:27:25',1,'standard',11,2158.92,1999.00,0.00,159.92,'2024-11-05 00:00:00','pending','2024-10-31 15:57:25',0.00),(147,11,1,'2024-10-31 21:27:35',1,'standard',11,2158.92,1999.00,0.00,159.92,'2024-11-05 00:00:00','pending','2024-10-31 15:57:35',0.00),(149,11,1,'2024-10-31 21:37:10',1,'standard',11,2158.92,1999.00,0.00,159.92,'2024-11-05 00:00:00','pending','2024-10-31 16:07:10',0.00),(152,11,1,'2024-10-31 21:39:00',1,'standard',11,151.12,139.93,0.00,11.19,'2024-11-05 00:00:00','pending','2024-10-31 16:09:00',0.00),(153,11,1,'2024-10-31 21:54:11',1,'standard',11,129.54,119.94,0.00,9.60,'2024-11-05 00:00:00','pending','2024-10-31 16:24:11',0.00),(154,11,1,'2024-10-31 21:55:04',1,'standard',11,129.54,119.94,0.00,9.60,'2024-11-05 00:00:00','pending','2024-10-31 16:25:04',0.00),(155,11,1,'2024-10-31 21:55:14',1,'standard',11,129.54,119.94,0.00,9.60,'2024-11-05 00:00:00','pending','2024-10-31 16:25:14',0.00),(156,11,1,'2024-10-31 21:57:21',1,'standard',11,129.54,119.94,0.00,9.60,'2024-11-05 00:00:00','pending','2024-10-31 16:27:21',0.00),(157,11,1,'2024-10-31 21:58:00',1,'standard',11,302.25,279.86,0.00,22.39,'2024-11-08 00:00:00','pending','2024-10-31 16:28:00',0.00),(158,11,1,'2024-10-31 22:14:13',1,'standard',11,215.89,199.90,0.00,15.99,'2024-11-08 00:00:00','pending','2024-10-31 16:44:13',0.00),(159,11,1,'2024-11-01 07:23:14',1,'standard',11,36.59,19.99,15.00,1.60,'2024-11-09 00:00:00','pending','2024-11-01 01:53:14',0.00),(160,11,1,'2024-11-01 07:24:40',1,'standard',11,15.00,0.00,15.00,0.00,'2024-11-06 00:00:00','pending','2024-11-01 01:54:40',0.00),(161,11,1,'2024-11-01 07:49:56',1,'standard',11,1857.57,1719.97,0.00,137.60,'2024-11-06 00:00:00','pending','2024-11-01 02:19:56',0.00),(162,11,1,'2024-11-01 07:53:20',1,'standard',11,36.59,19.99,15.00,1.60,'2024-11-06 00:00:00','pending','2024-11-01 02:23:20',0.00),(163,11,1,'2024-11-01 07:54:35',1,'standard',11,36.59,19.99,15.00,1.60,'2024-11-06 00:00:00','pending','2024-11-01 02:24:35',0.00),(164,11,1,'2024-11-01 07:56:59',1,'standard',11,36.59,19.99,15.00,1.60,'2024-11-06 00:00:00','pending','2024-11-01 02:26:59',0.00),(165,11,1,'2024-11-01 07:57:22',1,'standard',11,36.59,19.99,15.00,1.60,'2024-11-06 00:00:00','pending','2024-11-01 02:27:22',0.00),(166,11,1,'2024-11-01 07:57:45',1,'standard',11,194.30,179.91,0.00,14.39,'2024-11-09 00:00:00','pending','2024-11-01 02:27:45',0.00),(167,11,1,'2024-11-01 08:13:40',1,'standard',11,18446.17,17079.79,0.00,1366.38,'2024-11-06 00:00:00','pending','2024-11-01 02:43:40',0.00),(168,16,1,'2024-11-01 08:18:22',1,'standard',20,1619.89,1499.90,0.00,119.99,'2024-11-06 00:00:00','pending','2024-11-01 02:48:22',0.00),(169,16,1,'2024-11-01 08:21:16',1,'standard',20,237.48,219.89,0.00,17.59,'2024-11-06 00:00:00','pending','2024-11-01 02:51:16',0.00),(170,16,1,'2024-11-01 08:22:22',1,'standard',20,36.59,19.99,15.00,1.60,'2024-11-09 00:00:00','pending','2024-11-01 02:52:22',0.00),(171,17,1,'2024-11-01 09:31:46',1,'standard',21,91.76,84.96,0.00,6.80,'2024-11-11 00:00:00','pending','2024-11-01 04:01:46',0.00),(172,20,1,'2025-03-18 17:05:37',1,'standard',22,36.59,19.99,15.00,1.60,'2025-03-26 00:00:00','pending','2025-03-18 11:35:37',0.00),(173,24,1,'2025-05-07 03:05:34',1,'standard',23,68.99,49.99,15.00,4.00,'2025-05-11 00:00:00','pending','2025-05-06 21:35:34',0.00),(174,24,1,'2025-05-07 03:07:48',1,'standard',23,58.20,40.00,15.00,3.20,'2025-05-11 00:00:00','pending','2025-05-06 21:37:48',0.00),(175,24,1,'2025-05-07 03:10:37',1,'standard',23,36.59,19.99,15.00,1.60,'2025-05-14 00:00:00','pending','2025-05-06 21:40:37',0.00);
/*!40000 ALTER TABLE `shop_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `notify_order_created` AFTER INSERT ON `shop_order` FOR EACH ROW BEGIN
  INSERT INTO notifications (order_id, message)
  VALUES (NEW.order_id, CONCAT('Your order #', NEW.order_id, ' has been placed successfully.'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `handle_order_creation` AFTER INSERT ON `shop_order` FOR EACH ROW BEGIN
    DECLARE cart_id INT;

    -- Get the most recent cart for the customer
    SELECT shopping_cart_id INTO cart_id
    FROM shopping_cart
    WHERE customer_id = NEW.customer_id
    ORDER BY shopping_cart_id DESC  -- assuming higher IDs are more recent
    LIMIT 1;

    -- Only proceed if we found a cart
    IF cart_id IS NOT NULL THEN
        -- Insert order items from the shopping cart
        INSERT INTO order_item (order_id, variant_id, quantity, price)
        SELECT NEW.order_id, sci.variant_id, sci.quantity, v.total_price
        FROM shopping_cart_item sci
        JOIN variant v ON sci.variant_id = v.variant_id
        WHERE sci.shopping_cart_id = cart_id
        AND sci.saved_for_later = 0;

        -- Reduce inventory stock for each item added to the order
        UPDATE variant v
        JOIN shopping_cart_item sci ON v.variant_id = sci.variant_id
        SET v.inventory_stock = v.inventory_stock - sci.quantity
        WHERE sci.shopping_cart_id = cart_id
        AND sci.saved_for_later = 0;

        -- Delete the shopping cart items
        DELETE FROM shopping_cart_item
        WHERE shopping_cart_id = cart_id
        AND saved_for_later = 0;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No shopping cart found for this customer';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_order_timestamp` BEFORE UPDATE ON `shop_order` FOR EACH ROW BEGIN
  SET NEW.updated_at = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `notify_order_status_updated` AFTER UPDATE ON `shop_order` FOR EACH ROW BEGIN
  IF OLD.order_status <> NEW.order_status THEN
    INSERT INTO notifications (order_id, message)
    VALUES (NEW.order_id, CONCAT('Your order #', NEW.order_id, ' status has been updated to ', NEW.order_status, '.'));
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `shopping_cart_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subtotal` decimal(10,2) DEFAULT '0.00',
  `shipping` decimal(10,2) DEFAULT '0.00',
  `tax` decimal(10,2) DEFAULT '0.00',
  `discount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`shopping_cart_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (1,1,0.00,'2024-10-29 15:23:45','2024-10-29 15:23:45',0.00,0.00,0.00,0.00),(2,2,0.00,'2024-10-29 15:23:45','2024-10-29 15:23:45',0.00,0.00,0.00,0.00),(3,3,0.00,'2024-10-29 15:23:45','2024-10-29 15:23:45',0.00,0.00,0.00,0.00),(4,4,0.00,'2024-10-29 15:23:45','2024-10-29 15:23:45',0.00,0.00,0.00,0.00),(5,5,0.00,'2024-10-29 15:23:45','2024-10-29 15:23:45',0.00,0.00,0.00,0.00),(6,6,0.00,'2024-10-29 15:23:45','2024-10-29 15:23:45',0.00,0.00,0.00,0.00),(7,7,0.00,'2024-10-29 15:23:45','2024-10-29 15:23:45',0.00,0.00,0.00,0.00),(8,8,0.00,'2024-10-29 15:23:45','2024-10-29 15:23:45',0.00,0.00,0.00,0.00),(9,9,0.00,'2024-10-29 15:23:45','2024-10-29 15:23:45',0.00,0.00,0.00,0.00),(10,10,0.00,'2024-10-29 15:23:45','2024-10-29 15:23:45',0.00,0.00,0.00,0.00),(11,11,18446.17,'2024-11-01 02:42:48','2024-11-01 02:42:48',17079.79,0.00,1366.38,0.00),(13,16,36.59,'2024-11-01 02:52:15','2024-11-01 02:52:15',19.99,15.00,1.60,0.00),(14,NULL,0.00,'2024-11-01 02:45:46','2024-11-01 02:45:46',0.00,0.00,0.00,0.00),(15,17,41.99,'2024-11-01 04:03:28','2024-11-01 04:03:28',24.99,15.00,2.00,0.00),(16,NULL,0.00,'2024-11-01 03:57:56','2024-11-01 03:57:56',0.00,0.00,0.00,0.00),(17,19,0.00,'2025-03-18 11:32:35','2025-03-18 11:32:35',0.00,0.00,0.00,0.00),(18,NULL,0.00,'2025-03-18 11:32:35','2025-03-18 11:32:35',0.00,0.00,0.00,0.00),(19,20,36.59,'2025-03-18 11:34:12','2025-03-18 11:34:12',19.99,15.00,1.60,0.00),(20,NULL,0.00,'2025-03-18 11:33:12','2025-03-18 11:33:12',0.00,0.00,0.00,0.00),(21,21,0.00,'2025-05-06 21:11:22','2025-05-06 21:11:22',0.00,0.00,0.00,0.00),(22,21,0.00,'2025-05-06 21:11:22','2025-05-06 21:11:22',0.00,0.00,0.00,0.00),(23,22,0.00,'2025-05-06 21:12:39','2025-05-06 21:12:39',0.00,0.00,0.00,0.00),(24,22,0.00,'2025-05-06 21:12:39','2025-05-06 21:12:39',0.00,0.00,0.00,0.00),(25,24,36.59,'2025-05-06 21:40:18','2025-05-06 21:40:18',19.99,15.00,1.60,0.00),(26,NULL,0.00,'2025-05-06 21:34:24','2025-05-06 21:34:24',0.00,0.00,0.00,0.00);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart_item`
--

DROP TABLE IF EXISTS `shopping_cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart_item` (
  `shopping_cart_item_id` char(36) NOT NULL DEFAULT (uuid()),
  `shopping_cart_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `saved_for_later` tinyint(1) NOT NULL DEFAULT '0',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shopping_cart_item_id`),
  KEY `shopping_cart_id` (`shopping_cart_id`),
  KEY `variant_id` (`variant_id`),
  CONSTRAINT `shopping_cart_item_ibfk_1` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_cart` (`shopping_cart_id`),
  CONSTRAINT `shopping_cart_item_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart_item`
--

LOCK TABLES `shopping_cart_item` WRITE;
/*!40000 ALTER TABLE `shopping_cart_item` DISABLE KEYS */;
INSERT INTO `shopping_cart_item` VALUES ('10',10,4,1,0,'2024-10-29 15:23:45'),('2',2,5,1,0,'2024-10-29 15:23:45'),('3',3,3,2,0,'2024-10-29 15:23:45'),('4',4,7,1,0,'2024-10-29 15:23:45'),('5',5,9,1,0,'2024-10-29 15:23:45'),('6',6,1,3,0,'2024-10-29 15:23:45'),('7',7,6,1,0,'2024-10-29 15:23:45'),('8',8,8,2,0,'2024-10-29 15:23:45'),('9',9,10,1,0,'2024-10-29 15:23:45'),('acdb5e9e-9805-11ef-9d67-e74abac7b536',15,8,1,1,'2024-11-01 03:59:57');
/*!40000 ALTER TABLE `shopping_cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_debug`
--

DROP TABLE IF EXISTS `trigger_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trigger_debug` (
  `debug_id` int NOT NULL AUTO_INCREMENT,
  `trigger_name` varchar(100) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `message` text,
  `debug_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`debug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_debug`
--

LOCK TABLES `trigger_debug` WRITE;
/*!40000 ALTER TABLE `trigger_debug` DISABLE KEYS */;
INSERT INTO `trigger_debug` VALUES (3,'handle_order_creation',24,1,'Trigger started','2024-10-29 16:02:26'),(4,'handle_order_creation',24,1,'Items inserted into order_item','2024-10-29 16:02:26'),(5,'handle_order_creation',25,12,'Trigger started','2024-10-29 16:03:11'),(6,'handle_order_creation',25,12,'Items inserted into order_item','2024-10-29 16:03:11'),(7,'handle_order_creation',26,12,'Trigger started','2024-10-29 16:03:27'),(8,'handle_order_creation',26,12,'Items inserted into order_item','2024-10-29 16:03:27'),(9,'handle_order_creation',27,1,'Trigger started','2024-10-29 16:03:40'),(10,'handle_order_creation',27,1,'Items inserted into order_item','2024-10-29 16:03:40'),(11,'handle_order_creation',28,1,'Trigger started','2024-10-29 16:04:09'),(12,'handle_order_creation',28,1,'Items inserted into order_item','2024-10-29 16:04:09'),(13,'handle_order_creation',29,1,'Trigger started','2024-10-29 16:04:17'),(14,'handle_order_creation',29,1,'Items inserted into order_item','2024-10-29 16:04:17'),(15,'handle_order_creation',30,12,'Trigger started','2024-10-29 16:04:42'),(16,'handle_order_creation',30,12,'Items inserted into order_item','2024-10-29 16:04:42'),(17,'handle_order_creation',31,1,'Trigger started','2024-10-29 16:05:14'),(18,'handle_order_creation',31,1,'Items inserted into order_item','2024-10-29 16:05:14'),(19,'handle_order_creation',32,1,'Trigger started','2024-10-29 16:05:17'),(20,'handle_order_creation',32,1,'Items inserted into order_item','2024-10-29 16:05:17'),(21,'handle_order_creation',33,1,'Trigger started','2024-10-29 16:05:18'),(22,'handle_order_creation',33,1,'Items inserted into order_item','2024-10-29 16:05:18'),(23,'handle_order_creation',34,1,'Trigger started','2024-10-29 16:30:36'),(24,'handle_order_creation',34,1,'Items inserted into order_item','2024-10-29 16:30:36'),(25,'handle_order_creation',35,1,'Trigger started','2024-10-29 16:30:42'),(26,'handle_order_creation',35,1,'Items inserted into order_item','2024-10-29 16:30:42'),(27,'handle_order_creation',36,12,'Trigger started','2024-10-29 16:33:17'),(28,'handle_order_creation',36,12,'Items inserted into order_item','2024-10-29 16:33:17'),(29,'handle_order_creation',37,12,'Trigger started','2024-10-29 16:34:05'),(30,'handle_order_creation',37,12,'Items inserted into order_item','2024-10-29 16:34:05'),(31,'handle_order_creation',38,1,'Trigger started','2024-10-29 16:34:12'),(32,'handle_order_creation',38,1,'Items inserted into order_item','2024-10-29 16:34:12'),(33,'handle_order_creation',39,12,'Trigger started','2024-10-29 16:34:46'),(34,'handle_order_creation',39,12,'Items inserted into order_item','2024-10-29 16:34:46'),(35,'handle_order_creation',40,12,'Trigger started','2024-10-29 16:34:47'),(36,'handle_order_creation',40,12,'Items inserted into order_item','2024-10-29 16:34:47'),(37,'handle_order_creation',41,1,'Trigger started','2024-10-29 16:39:38'),(38,'handle_order_creation',41,1,'Items inserted into order_item','2024-10-29 16:39:38'),(39,'handle_order_creation',42,1,'Trigger started','2024-10-29 16:39:49'),(40,'handle_order_creation',42,1,'Items inserted into order_item','2024-10-29 16:39:49'),(41,'handle_order_creation',43,12,'Trigger started','2024-10-29 16:40:29'),(42,'handle_order_creation',43,12,'Items inserted into order_item','2024-10-29 16:40:29'),(43,'handle_order_creation',44,12,'Trigger started','2024-10-29 16:40:30'),(44,'handle_order_creation',44,12,'Items inserted into order_item','2024-10-29 16:40:30'),(45,'handle_order_creation',45,12,'Trigger started','2024-10-29 16:44:35'),(46,'handle_order_creation',45,12,'Items inserted into order_item','2024-10-29 16:44:35'),(47,'handle_order_creation',46,1,'Trigger started','2024-10-29 16:44:46'),(48,'handle_order_creation',46,1,'Items inserted into order_item','2024-10-29 16:44:46'),(49,'handle_order_creation',47,12,'Trigger started','2024-10-29 16:45:49'),(50,'handle_order_creation',47,12,'Items inserted into order_item','2024-10-29 16:45:49'),(51,'handle_order_creation',48,12,'Trigger started','2024-10-29 16:55:12'),(52,'handle_order_creation',48,12,'Items inserted into order_item','2024-10-29 16:55:12'),(53,'handle_order_creation',49,12,'Trigger started','2024-10-29 16:56:14'),(54,'handle_order_creation',49,12,'Items inserted into order_item','2024-10-29 16:56:14'),(55,'handle_order_creation',50,12,'Trigger started','2024-10-29 16:57:15'),(56,'handle_order_creation',50,12,'Items inserted into order_item','2024-10-29 16:57:15'),(57,'handle_order_creation',51,12,'Trigger started','2024-10-29 17:04:34'),(58,'handle_order_creation',51,12,'Items inserted into order_item','2024-10-29 17:04:34'),(59,'handle_order_creation',51,12,'Items deleted from shopping_cart_item','2024-10-29 17:04:34'),(60,'handle_order_creation',52,11,'Trigger started','2024-10-29 17:06:51'),(61,'handle_order_creation',52,11,'Items inserted into order_item','2024-10-29 17:06:51'),(62,'handle_order_creation',52,11,'Items deleted from shopping_cart_item','2024-10-29 17:06:51'),(63,'handle_order_creation',53,11,'Trigger started','2024-10-29 17:07:55'),(64,'handle_order_creation',53,11,'Items inserted into order_item','2024-10-29 17:07:55'),(65,'handle_order_creation',53,11,'Items deleted from shopping_cart_item','2024-10-29 17:07:55'),(66,'handle_order_creation',54,11,'Trigger started','2024-10-29 17:19:19'),(67,'handle_order_creation',54,11,'Items inserted into order_item','2024-10-29 17:19:19'),(68,'handle_order_creation',54,11,'Items deleted from shopping_cart_item','2024-10-29 17:19:19'),(69,'handle_order_creation',55,11,'Trigger started','2024-10-29 17:19:38'),(70,'handle_order_creation',55,11,'Items inserted into order_item','2024-10-29 17:19:38'),(71,'handle_order_creation',55,11,'Items deleted from shopping_cart_item','2024-10-29 17:19:38'),(72,'handle_order_creation',56,11,'Trigger started','2024-10-29 17:20:11'),(73,'handle_order_creation',56,11,'Items inserted into order_item','2024-10-29 17:20:11'),(74,'handle_order_creation',56,11,'Items deleted from shopping_cart_item','2024-10-29 17:20:11'),(75,'handle_order_creation',57,11,'Trigger started','2024-10-29 17:21:35'),(76,'handle_order_creation',57,11,'Items inserted into order_item','2024-10-29 17:21:35'),(77,'handle_order_creation',57,11,'Items deleted from shopping_cart_item','2024-10-29 17:21:35'),(78,'handle_order_creation',58,11,'Trigger started','2024-10-29 17:33:58'),(79,'handle_order_creation',58,11,'Items inserted into order_item','2024-10-29 17:33:58'),(80,'handle_order_creation',58,11,'Items deleted from shopping_cart_item','2024-10-29 17:33:58'),(81,'handle_order_creation',59,11,'Trigger started','2024-10-29 17:41:42'),(82,'handle_order_creation',59,11,'Items inserted into order_item','2024-10-29 17:41:42'),(83,'handle_order_creation',59,11,'Items deleted from shopping_cart_item','2024-10-29 17:41:42'),(84,'handle_order_creation',60,11,'Trigger started','2024-10-29 17:42:01'),(85,'handle_order_creation',60,11,'Items inserted into order_item','2024-10-29 17:42:01'),(86,'handle_order_creation',60,11,'Items deleted from shopping_cart_item','2024-10-29 17:42:01'),(87,'handle_order_creation',61,11,'Trigger started','2024-10-29 17:44:26'),(88,'handle_order_creation',61,11,'Items inserted into order_item','2024-10-29 17:44:26'),(89,'handle_order_creation',61,11,'Items deleted from shopping_cart_item','2024-10-29 17:44:26'),(90,'handle_order_creation',62,11,'Trigger started','2024-10-29 17:50:09'),(91,'handle_order_creation',62,11,'Items inserted into order_item','2024-10-29 17:50:09'),(92,'handle_order_creation',62,11,'Items deleted from shopping_cart_item','2024-10-29 17:50:09'),(93,'handle_order_creation',63,11,'Trigger started','2024-10-29 18:02:02'),(94,'handle_order_creation',63,11,'Items inserted into order_item','2024-10-29 18:02:02'),(95,'handle_order_creation',63,11,'Items deleted from shopping_cart_item','2024-10-29 18:02:02'),(96,'handle_order_creation',64,11,'Trigger started','2024-10-29 18:02:16'),(97,'handle_order_creation',64,11,'Items inserted into order_item','2024-10-29 18:02:16'),(98,'handle_order_creation',64,11,'Items deleted from shopping_cart_item','2024-10-29 18:02:16'),(99,'handle_order_creation',65,11,'Trigger started','2024-10-29 18:02:37'),(100,'handle_order_creation',65,11,'Items inserted into order_item','2024-10-29 18:02:37'),(101,'handle_order_creation',65,11,'Items deleted from shopping_cart_item','2024-10-29 18:02:37'),(102,'handle_order_creation',66,11,'Trigger started','2024-10-29 18:03:20'),(103,'handle_order_creation',66,11,'Items inserted into order_item','2024-10-29 18:03:20'),(104,'handle_order_creation',66,11,'Items deleted from shopping_cart_item','2024-10-29 18:03:20'),(105,'handle_order_creation',67,11,'Trigger started','2024-10-29 18:03:58'),(106,'handle_order_creation',67,11,'Items inserted into order_item','2024-10-29 18:03:58'),(107,'handle_order_creation',67,11,'Items deleted from shopping_cart_item','2024-10-29 18:03:58'),(108,'handle_order_creation',68,11,'Trigger started','2024-10-29 18:04:48'),(109,'handle_order_creation',68,11,'Items inserted into order_item','2024-10-29 18:04:48'),(110,'handle_order_creation',68,11,'Items deleted from shopping_cart_item','2024-10-29 18:04:48'),(111,'handle_order_creation',69,11,'Trigger started','2024-10-29 18:05:29'),(112,'handle_order_creation',69,11,'Items inserted into order_item','2024-10-29 18:05:29'),(113,'handle_order_creation',69,11,'Items deleted from shopping_cart_item','2024-10-29 18:05:29'),(114,'handle_order_creation',70,11,'Trigger started','2024-10-29 18:12:47'),(115,'handle_order_creation',70,11,'Items inserted into order_item','2024-10-29 18:12:47'),(116,'handle_order_creation',70,11,'Items deleted from shopping_cart_item','2024-10-29 18:12:47'),(117,'handle_order_creation',71,11,'Trigger started','2024-10-29 18:14:09'),(118,'handle_order_creation',71,11,'Items inserted into order_item','2024-10-29 18:14:09'),(119,'handle_order_creation',71,11,'Items deleted from shopping_cart_item','2024-10-29 18:14:09'),(120,'handle_order_creation',72,11,'Trigger started','2024-10-29 18:14:49'),(121,'handle_order_creation',72,11,'Items inserted into order_item','2024-10-29 18:14:49'),(122,'handle_order_creation',72,11,'Items deleted from shopping_cart_item','2024-10-29 18:14:49'),(123,'handle_order_creation',73,11,'Trigger started','2024-10-29 18:16:07'),(124,'handle_order_creation',73,11,'Items inserted into order_item','2024-10-29 18:16:07'),(125,'handle_order_creation',73,11,'Items deleted from shopping_cart_item','2024-10-29 18:16:07'),(126,'handle_order_creation',74,11,'Trigger started','2024-10-29 18:20:03'),(127,'handle_order_creation',74,11,'Items inserted into order_item','2024-10-29 18:20:03'),(128,'handle_order_creation',74,11,'Items deleted from shopping_cart_item','2024-10-29 18:20:03');
/*!40000 ALTER TABLE `trigger_debug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'2024-10-08 03:30:00'),(2,2,'2024-10-08 05:00:00'),(3,3,'2024-10-08 06:15:00'),(4,4,'2024-10-08 07:45:00'),(5,5,'2024-10-08 09:00:00'),(6,6,'2024-10-08 10:15:00'),(7,7,'2024-10-08 10:30:00'),(8,8,'2024-10-08 12:00:00'),(9,9,'2024-10-08 13:15:00'),(10,10,'2024-10-08 14:30:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant`
--

DROP TABLE IF EXISTS `variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variant` (
  `variant_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `inventory_stock` int DEFAULT NULL,
  `total_price` decimal(7,2) DEFAULT NULL,
  `variant_image` varchar(255) DEFAULT NULL,
  `SKU` varchar(50) DEFAULT NULL,
  `Arrived_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`variant_id`),
  KEY `idx_product_id` (`product_id`),
  CONSTRAINT `variant_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant`
--

LOCK TABLES `variant` WRITE;
/*!40000 ALTER TABLE `variant` DISABLE KEYS */;
INSERT INTO `variant` VALUES (1,1,-6,19.99,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTKHAD5B-RkB0rgeStHdTOF-dF1HCOOYvZQQ&s','SUP-RED-001','2025-05-06 21:40:37'),(2,1,80,19.99,'https://img.freepik.com/premium-photo/cartoon-superman-smiles-as-he-runs-front-red-background_36682-302022.jpg','SUP-BLUE-001','2024-09-15 13:00:00'),(3,2,48,49.99,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIM_emms9I7tfGVfA8DB5maFWffjNPd8iMQQ&s','STRAT-STD-001','2025-05-06 21:35:34'),(4,3,197,699.99,'https://media.istockphoto.com/id/1334658862/photo/receiver-with-spiral-cord-of-vintage-telephone-isolated-on-white.jpg?s=612x612&w=0&k=20&c=07l0RjClgjr9grp5p51ePLZ9n-WGUHy7WR8YVhmoSwM=','TXP-BLACK-001','2024-10-15 18:33:22'),(5,3,150,699.99,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKDPsGSlcxX0LngHHUgNsaR0y009UezEGWeTkbW9WInvhwjkQe5LGYkTNuymWYvRuGbyI&usqp=CAU','TXP-WHITE-001','2024-09-24 13:00:00'),(6,4,57,999.99,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUlhG1SLFZV7QTGajX-6Szrk3b0zJKPs68Sg&s','LSL-SILVER-001','2024-11-01 02:43:40'),(7,5,111,29.99,'https://img.freepik.com/free-vector/set-math-element_1308-25986.jpg','MATH-BASIC-001','2024-10-29 07:36:20'),(8,6,195,24.99,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNtl-RmAPbTuHFNG9EEy7ffwhH0woOT25TcA&s','FRIS-BLUE-001','2024-10-29 07:42:37'),(9,7,50,499.99,'texasstation_black.jpg','TXS-BLACK-001','2024-10-09 13:00:00'),(10,8,89,149.99,'https://img.freepik.com/premium-photo/thermostat-with-white-background_933496-31737.jpg','THERM-WHITE-001','2024-11-01 02:48:22'),(11,10,100,16.90,'https://i.ebayimg.com/images/g/704AAOSw~7pnDVMr/s-l500.webp','DOLL-BROWN-091','2024-10-29 22:11:05'),(12,10,290,17.90,'https://i.ebayimg.com/images/g/-fkAAOSwP-5nDVKC/s-l960.webp','DOLL-PINK-091','2024-10-29 22:11:05'),(13,10,300,18.08,'https://i.ebayimg.com/images/g/L14AAOSwTqVnDVJv/s-l960.webp','DOLL-BLUE-091','2024-10-29 22:11:05'),(14,11,10,10.00,'https://s.alicdn.com/@sc04/kf/Hdc44c787687d42c59a3dc86eb633fa79p.jpg_720x720q50.jpg','CRAFT-bLUE','2024-10-29 23:00:21'),(15,11,200,11.00,'https://s.alicdn.com/@sc04/kf/Hc2fa546aa0f34ef6bbe3944906654ca20.jpg_720x720q50.jpg','CRAFT-PINK','2024-10-29 23:00:07'),(16,12,196,10.00,'https://i.ebayimg.com/images/g/6~EAAOSw1TBm7pIT/s-l960.webp','SPEAKER-RED','2025-05-06 21:37:48'),(17,12,100,11.00,'https://i.ebayimg.com/images/g/AEAAAOSw-Hdm7pIU/s-l960.webp','SPEAKER-BLUE','2024-10-29 23:13:13'),(18,12,50,12.00,'https://i.ebayimg.com/images/g/GGsAAOSwPVdm7pII/s-l960.webp','SPEAKER-BLACK','2024-10-29 23:13:13'),(19,13,20,10.00,'https://i.ebayimg.com/images/g/a3IAAOSwxfpnB4nh/s-l960.webp','SPEAKERB-BLACK','2024-10-29 23:22:45'),(20,13,20,11.00,'https://i.ebayimg.com/images/g/a3IAAOSwxfpnB4nh/s-l960.webp','SPEAKERB-BLUE','2024-10-29 23:22:45'),(21,14,20,9.00,'https://i.ebayimg.com/images/g/3rAAAOSw4IlnCV9p/s-l960.webp','Watch-silver','2024-10-30 05:25:45'),(22,14,20,9.50,'https://i.ebayimg.com/images/g/BrUAAOSw2G9nCVt4/s-l960.webp','Watch-green','2024-10-30 05:25:45'),(23,15,20,15.00,'https://d3d71ba2asa5oz.cloudfront.net/12003181/images/appwatch7%20blue.jpg','AWATCH-BLUE','2024-10-30 05:45:11'),(24,15,20,15.40,'https://d3d71ba2asa5oz.cloudfront.net/12003181/images/apple%20watch%20ser%207%20green.jpg','aWATCH-GREEN','2024-10-30 05:45:11'),(25,17,100,199.99,'https://m.media-amazon.com/images/I/71DfMwITnaL._AC_SX300_SY300_QL70_FMwebp.jpg','SKU1017RED','2024-10-30 08:55:35'),(26,17,90,199.99,'https://shoplineimg.com/594b474cd4e395a054002dd9/62d8d2ee37a9d10032394cf9/800x.webp?source_format=jpg','SKU1017BLUE','2024-10-30 08:55:35'),(27,18,70,299.99,'https://media.istockphoto.com/id/1188703347/photo/apple-watch-series-3-38mm-gold-aluminum-case-with-pink-sand-sport-band-on-a-soft-fluffy-peach.jpg?s=1024x1024&w=is&k=20&c=9K5FKnTDOMuc2tRFKyGtQuOrH0hjwrh_ql2ixtt_LGY=','SKU1018GOLD','2024-10-30 08:55:35'),(28,18,60,299.99,'https://www.techrific.com.au/image/cache/data/AppleWatchSeries338MMBlack-550x400.jpg','SKU1018BLACK','2024-10-30 08:55:35'),(29,19,110,399.99,'https://cdn.alloallo.media/catalog/product/apple/ipad/ipad-mini-6/ipad-mini-6th-generation-space-gray.jpg','SKU1019GRAY','2024-10-30 08:55:35'),(30,19,100,399.99,'https://i0.wp.com/www.tabletblog.de/wp-content/uploads/2022/11/apple-ipad-10-design.jpg?w=1920&ssl=1','SKU1019SILVER','2024-10-30 08:55:35'),(31,20,150,329.99,'https://i0.wp.com/www.tabletblog.de/wp-content/uploads/2022/11/apple-ipad-10-design.jpg?w=1920&ssl=1','SKU1020GOLD','2024-10-30 08:55:35'),(33,21,200,59.99,'https://m.media-amazon.com/images/I/51gRgXnCwZL._AC_SX300_SY300_QL70_FMwebp.jpg','SKU1021BLACK','2024-10-30 09:00:58'),(34,21,180,59.99,'https://m.media-amazon.com/images/I/41bOGfLD-uL._AC_SX300_SY300_QL70_FMwebp.jpg','SKU1021WHITE','2024-10-30 09:00:58'),(35,22,210,79.99,'https://m.media-amazon.com/images/I/51GobyVFywL._AC_SX300_SY300_QL70_FMwebp.jpg','SKU1022GRAY','2024-10-30 09:00:58'),(36,22,190,79.99,'https://m.media-amazon.com/images/I/71Y9pNSo9qL._AC_SX300_SY300_QL70_FMwebp.jpg','SKU1022PINK','2024-10-30 09:00:58'),(37,23,160,89.99,'https://m.media-amazon.com/images/I/61turRGN1cL._AC_SX300_SY300_QL70_FMwebp.jpg','SKU1023BLUE','2024-10-30 09:00:58'),(38,23,150,89.99,'https://m.media-amazon.com/images/I/61WoVRaI84L.AC_SX466.jpg','SKU1023GRAY','2024-10-30 09:00:58'),(39,24,110,129.99,'https://m.media-amazon.com/images/I/61y6Y7SzF0L._AC_SX300_SY300_QL70_FMwebp.jpg','SKU1024WHITE','2024-10-30 09:00:58'),(40,24,100,129.99,'https://m.media-amazon.com/images/I/810kFyC3r3L.AC_SX466.jpg','SKU1024RED','2024-10-30 09:00:58'),(41,25,90,149.99,'https://m.media-amazon.com/images/I/71676b31ieL._AC_SX300_SY300_QL70_FMwebp.jpg','SKU1025BLACK','2024-10-30 09:00:58'),(42,25,80,149.99,'https://m.media-amazon.com/images/I/71+tvxgeilL.AC_SX300_SY300.jpg','SKU1025SILVER','2024-10-30 09:00:58'),(43,26,75,249.99,'https://m.media-amazon.com/images/I/6172ibD41+L.AC_SX466.jpg','SKU1026BLACK','2024-10-30 09:00:58'),(44,26,65,249.99,'https://m.media-amazon.com/images/I/51icNrk5glL._AC_SX300_SY300_QL70_FMwebp.jpg','SKU1026GOLD','2024-10-30 09:00:58'),(45,27,70,399.99,'https://m.media-amazon.com/images/I/71cANOnqpHL._AC_SY445_SX342_QL70_FMwebp.jpg','SKU1027BLUE','2024-11-01 09:00:58'),(46,27,60,399.99,'https://m.media-amazon.com/images/I/71KLmTN3amL._AC_SY445_SX342_QL70_FMwebp.jpg','SKU1027STARLIGHT','2024-11-01 09:00:58'),(47,26,40,79.99,'https://i.ebayimg.com/images/g/JBL-Tune770NC_Var1.jpg','JBL770NC-BLK-01','2024-10-30 12:19:04'),(48,26,20,84.99,'https://i.ebayimg.com/images/g/JBL-Tune770NC_Var2.jpg','JBL770NC-BLU-02','2024-10-30 12:19:04'),(49,27,35,99.99,'https://www.beatsbydre.com/content/dam/beats/web/product/headphones/studiopro-wireless/pdp/product-carousel/black/pc-studiopro-black-thrqtr-right.jpg.small.2x.jpg','BEATS-PRO-WHT-01','2024-11-01 12:19:04'),(50,27,15,109.99,'https://www.beatsbydre.com/content/dam/beats/web/product/headphones/studiopro-wireless/pdp/product-carousel/navy/pc-studiopro-navy-thrqtr-right.jpg.small.2x.jpg','BEATS-PRO-RED-02','2024-10-30 12:19:04'),(51,28,25,299.99,'https://assets.bose.com/content/dam/cloudassets/Bose_DAM/Web/consumer_electronics/global/products/headphones/qc45/product_silo_images/QC45-LE_Left-Angle_1200x1022_Midnight-Blue_RGB.png/jcr:content/renditions/cq5dam.web.600.600.png','BOSE-QC45-BLK-01','2024-10-30 12:19:04'),(52,28,10,319.99,'https://assets.bose.com/content/dam/cloudassets/Bose_DAM/Web/consumer_electronics/global/products/headphones/qc45/product_silo_images/QC45_PDP_Ecom-Gallery-B02.jpg/jcr:content/renditions/cq5dam.web.600.600.jpeg','BOSE-QC45-SLV-02','2024-10-30 12:19:04'),(53,29,50,349.99,'https://i.insider.com/5f36a9e4e89ebf001f044924?width=700&format=jpeg&auto=webp','SONY-1000XM4-BLK-01','2024-10-30 12:19:04'),(54,29,30,359.99,'https://i.ebayimg.com/images/g/Sony-WH1000XM4_Var2.jpg','SONY-1000XM4-BRN-02','2024-10-30 12:19:04'),(55,30,60,399.99,'https://i.ebayimg.com/images/g/Apple-WatchSeries8_Var1.jpg','APPLE-WATCH8-42MM-01','2024-10-30 12:19:04'),(56,30,40,429.99,'https://i.ebayimg.com/images/g/Apple-WatchSeries8_Var2.jpg','APPLE-WATCH8-44MM-02','2024-10-30 12:19:04'),(69,9,20,79.99,'https://thumbs.dreamstime.com/b/cowboy-toy-figure-15370167.jpg','CMGU-23-GHK-01','2024-10-31 10:57:05');
/*!40000 ALTER TABLE `variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant_specification`
--

DROP TABLE IF EXISTS `variant_specification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variant_specification` (
  `variant_id` int NOT NULL,
  `variation_option_id` int NOT NULL,
  PRIMARY KEY (`variant_id`,`variation_option_id`),
  KEY `variation_option_id` (`variation_option_id`),
  CONSTRAINT `variant_specification_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`variant_id`),
  CONSTRAINT `variant_specification_ibfk_2` FOREIGN KEY (`variation_option_id`) REFERENCES `variation_option` (`variation_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant_specification`
--

LOCK TABLES `variant_specification` WRITE;
/*!40000 ALTER TABLE `variant_specification` DISABLE KEYS */;
INSERT INTO `variant_specification` VALUES (1,1),(2,1),(8,2),(1,4),(2,5),(5,5),(3,6),(6,6),(7,7),(4,8),(5,9),(9,9),(4,10),(10,10);
/*!40000 ALTER TABLE `variant_specification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation`
--

DROP TABLE IF EXISTS `variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variation` (
  `variation_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`variation_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `variation_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation`
--

LOCK TABLES `variation` WRITE;
/*!40000 ALTER TABLE `variation` DISABLE KEYS */;
INSERT INTO `variation` VALUES (1,3,'Size'),(2,3,'Color'),(3,4,'Edition'),(4,5,'Storage Capacity'),(5,5,'Color'),(6,6,'Processor'),(7,7,'Age Group'),(8,8,'Size'),(9,9,'Storage Capacity'),(10,10,'Compatibility');
/*!40000 ALTER TABLE `variation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_option`
--

DROP TABLE IF EXISTS `variation_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variation_option` (
  `variation_option_id` int NOT NULL,
  `variation_id` int DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`variation_option_id`),
  KEY `variation_id` (`variation_id`),
  CONSTRAINT `variation_option_ibfk_1` FOREIGN KEY (`variation_id`) REFERENCES `variation` (`variation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_option`
--

LOCK TABLES `variation_option` WRITE;
/*!40000 ALTER TABLE `variation_option` DISABLE KEYS */;
INSERT INTO `variation_option` VALUES (1,1,'Small'),(2,1,'Medium'),(3,1,'Large'),(4,2,'Red'),(5,2,'Blue'),(6,3,'Standard'),(7,3,'Deluxe'),(8,4,'64GB'),(9,4,'128GB'),(10,5,'Black');
/*!40000 ALTER TABLE `variation_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_item`
--

DROP TABLE IF EXISTS `wishlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_item` (
  `wishlist_item_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wishlist_item_id`),
  UNIQUE KEY `unique_customer_product` (`customer_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `wishlist_item_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_item`
--

LOCK TABLES `wishlist_item` WRITE;
/*!40000 ALTER TABLE `wishlist_item` DISABLE KEYS */;
INSERT INTO `wishlist_item` VALUES (15,11,4,'2024-10-31 09:55:21'),(16,11,1,'2024-10-31 09:56:19'),(17,16,13,'2024-11-01 02:46:24'),(18,16,8,'2024-11-01 02:47:03'),(20,17,2,'2024-11-01 03:58:39'),(21,20,25,'2025-03-18 11:34:18'),(22,20,12,'2025-03-18 11:34:23'),(23,24,24,'2025-05-06 21:36:48'),(24,24,28,'2025-05-06 21:36:50'),(25,24,17,'2025-05-06 21:36:52');
/*!40000 ALTER TABLE `wishlist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `set_order_to_shipped` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `set_order_to_shipped` ON SCHEDULE EVERY 1 DAY STARTS '2024-11-01 07:59:21' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE shop_order
    SET order_status = 'shipped', shipping_date = NOW()
    WHERE order_status = 'pending' AND order_date <= NOW() - INTERVAL 2 DAY */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'ecommerce'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddWishlistItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddWishlistItem`(
    IN p_customerId INT,
    IN p_productId INT,
    OUT p_insertId INT
)
BEGIN
    DECLARE EXIT HANDLER FOR 1062 -- Duplicate entry error code
    BEGIN
        -- Signal a duplicate entry error
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Item already exists in wishlist';
    END;

    INSERT INTO wishlist_item (customer_id, product_id) 
    VALUES (p_customerId, p_productId);

    SET p_insertId = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateAddress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateAddress`(
    IN p_address_line1 VARCHAR(255),
    IN p_address_line2 VARCHAR(255),
    IN p_city VARCHAR(100),
    IN p_postal_code VARCHAR(20),
    IN p_is_main_city BOOLEAN,
    OUT p_insertId INT
)
BEGIN
    INSERT INTO address (address_line1, address_line2, city, postal_code, is_main_city) 
    VALUES (p_address_line1, p_address_line2, p_city, p_postal_code, p_is_main_city);
    SET p_insertId = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateAdmin`(
    IN p_username VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_password VARCHAR(255),
    OUT p_insertId INT
)
BEGIN
    INSERT INTO admin_users (username, email, password)
    VALUES (p_username, p_email, p_password);
    
    SET p_insertId = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateCustomerAddress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateCustomerAddress`(IN cust_id INT, IN addr_id INT)
BEGIN
    INSERT INTO customer_address (customer_id, address_id) 
    VALUES (cust_id, addr_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNotification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateNotification`(
    IN p_userId INT, 
    IN p_orderId INT, 
    IN p_message VARCHAR(255)
)
BEGIN
    INSERT INTO 
        notifications (user_id, order_id, message, is_read, created_at)
    VALUES 
        (p_userId, p_orderId, p_message, 0, NOW());
        
    SELECT LAST_INSERT_ID() AS insertId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_customer`(
    IN p_first_name VARCHAR(255),
    IN p_last_name VARCHAR(255),
    IN p_email_address VARCHAR(255),
    IN p_username VARCHAR(255),
    IN p_password VARCHAR(255)
    -- Add other necessary fields if applicable
)
BEGIN
    INSERT INTO customer (
        first_name, 
        last_name, 
        email_address, 
        username, 
        password, 
        created_at, 
        updated_at
    )
    VALUES (
        p_first_name, 
        p_last_name, 
        p_email_address, 
        p_username, 
        p_password, 
        NOW(), 
        NOW()
    );
    
    -- Return the inserted customer's ID
    SELECT LAST_INSERT_ID() AS customer_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAddressesByCustomerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAddressesByCustomerId`(IN customerId INT)
BEGIN
    SELECT a.* 
    FROM address a 
    JOIN customer_address ca ON a.address_id = ca.address_id 
    WHERE ca.customer_id = customerId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAdminById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAdminById`(
    IN p_admin_id INT
)
BEGIN
    SELECT admin_id, username, email, password, created_at, updated_at
    FROM admin_users
    WHERE admin_id = p_admin_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCardByCustomerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCardByCustomerId`(
    IN p_customerId INT
)
BEGIN
    SELECT * FROM cards WHERE customer_id = p_customerId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCustomerByEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCustomerByEmail`(
    IN p_email_address VARCHAR(255)
)
BEGIN
    SELECT * FROM customer WHERE email_address = p_email_address;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetNotificationsByUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNotificationsByUserId`(IN p_customerId INT)
BEGIN
    SELECT 
        n.notification_id, 
        n.order_id, 
        n.message, 
        n.is_read, 
        n.created_at
    FROM 
        notifications n
    JOIN 
        shop_order so ON n.order_id = so.order_id
    WHERE 
        so.customer_id = p_customerId
    ORDER BY 
        n.created_at DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPaymentDetailsByCustomerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPaymentDetailsByCustomerId`(
    IN p_customer_id INT
)
BEGIN
    SELECT 
        CONCAT(c.first_name, " ", c.last_name) AS name,
        cp.*
    FROM 
        customer_payment_method cp
    LEFT OUTER JOIN 
        customer c USING(customer_id)
    WHERE 
        cp.customer_id = p_customer_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPhoneNumbers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPhoneNumbers`()
BEGIN
    SELECT * FROM customer_phone_number;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRandomAvailableProductsByParentCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRandomAvailableProductsByParentCategory`(
    IN p_parentCategoryId INT,
    IN p_limit INT
)
BEGIN
    SELECT DISTINCT 
        p.product_id, 
        p.product_name, 
        p.description, 
        p.product_image, 
        p.weight
    FROM 
        product p
    JOIN 
        variant v ON p.product_id = v.product_id
    JOIN 
        category c ON p.category_id = c.category_id
    WHERE 
        c.parent_category_id = p_parentCategoryId
        AND v.inventory_stock > 0
    ORDER BY 
        RAND()
    LIMIT 
        p_limit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRecentVariants` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRecentVariants`(IN variant_limit INT)
BEGIN
    SELECT v.*, p.product_name 
    FROM variant v 
    JOIN product p ON v.product_id = p.product_id 
    ORDER BY Arrived_date DESC 
    LIMIT variant_limit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getReport`(
    IN order_time_p ENUM("Monthly", "Quartly", "Half Year", "Annual"),
    IN payment_method_p VARCHAR(200),
    IN delivery_method_p ENUM('standard', 'express', 'overnight'),
    IN total_order_price_min_p DECIMAL(10,2),
    IN total_order_price_max_p DECIMAL(10,2),
    IN order_status_p ENUM('pending', 'shipped', 'delivered', 'canceled'),
    IN quantity_p INT
)
BEGIN
    -- Set default values if min/max price is NULL
    IF total_order_price_min_p IS NULL THEN
        SET total_order_price_min_p = 0;
    END IF;
    IF total_order_price_max_p IS NULL THEN
        SET total_order_price_max_p = 99999999.99;
    END IF;

    -- Monthly Report
    IF order_time_p IS NULL OR order_time_p = "Monthly" THEN
        SELECT 
            DATE_FORMAT(order_date, '%Y-%m') AS report_month,
            AVG(total_order_price) AS avg_total_price,
            AVG(subtotal) AS avg_subtotal,
            AVG(shipping) AS avg_shipping,
            AVG(tax) AS avg_tax,
            AVG(quantity) AS avg_quantity
        FROM report
        WHERE 
            (payment_method_p IS NULL OR payment_method_p = report.payment_method_name)
            AND (delivery_method_p IS NULL OR delivery_method_p = report.delivery_method)
            AND (report.total_order_price BETWEEN total_order_price_min_p AND total_order_price_max_p)
            AND (order_status_p IS NULL OR order_status_p = report.order_status)
            AND (quantity_p IS NULL OR quantity_p = report.quantity)
        GROUP BY DATE_FORMAT(order_date, '%Y-%m')
        ORDER BY report_month DESC;

    -- Quarterly Report
    ELSEIF order_time_p = "Quartly" THEN
        SELECT 
            CONCAT(YEAR(order_date), '-Q', QUARTER(order_date)) AS report_quarter,
            AVG(total_order_price) AS avg_total_price,
            AVG(subtotal) AS avg_subtotal,
            AVG(shipping) AS avg_shipping,
            AVG(tax) AS avg_tax,
            AVG(quantity) AS avg_quantity
        FROM report
        WHERE 
            (payment_method_p IS NULL OR payment_method_p = report.payment_method_name)
            AND (delivery_method_p IS NULL OR delivery_method_p = report.delivery_method)
            AND (report.total_order_price BETWEEN total_order_price_min_p AND total_order_price_max_p)
            AND (order_status_p IS NULL OR order_status_p = report.order_status)
            AND (quantity_p IS NULL OR quantity_p = report.quantity)
        GROUP BY CONCAT(YEAR(order_date), '-Q', QUARTER(order_date))
        ORDER BY report_quarter DESC;

    -- Half-Year Report
    ELSEIF order_time_p = "Half Year" THEN
        SELECT 
            CONCAT(YEAR(order_date), '-H', IF(MONTH(order_date) <= 6, 1, 2)) AS report_half_year,
            AVG(total_order_price) AS avg_total_price,
            AVG(subtotal) AS avg_subtotal,
            AVG(shipping) AS avg_shipping,
            AVG(tax) AS avg_tax,
            AVG(quantity) AS avg_quantity
        FROM report
        WHERE 
            (payment_method_p IS NULL OR payment_method_p = report.payment_method_name)
            AND (delivery_method_p IS NULL OR delivery_method_p = report.delivery_method)
            AND (report.total_order_price BETWEEN total_order_price_min_p AND total_order_price_max_p)
            AND (order_status_p IS NULL OR order_status_p = report.order_status)
            AND (quantity_p IS NULL OR quantity_p = report.quantity)
        GROUP BY CONCAT(YEAR(order_date), '-H', IF(MONTH(order_date) <= 6, 1, 2))
        ORDER BY report_half_year DESC;

    -- Annual Report
    ELSEIF order_time_p = "Annual" THEN
        SELECT 
            YEAR(order_date) AS report_year,
            AVG(total_order_price) AS avg_total_price,
            AVG(subtotal) AS avg_subtotal,
            AVG(shipping) AS avg_shipping,
            AVG(tax) AS avg_tax,
            AVG(quantity) AS avg_quantity
        FROM report
        WHERE 
            (payment_method_p IS NULL OR payment_method_p = report.payment_method_name)
            AND (delivery_method_p IS NULL OR delivery_method_p = report.delivery_method)
            AND (report.total_order_price BETWEEN total_order_price_min_p AND total_order_price_max_p)
            AND (order_status_p IS NULL OR order_status_p = report.order_status)
            AND (quantity_p IS NULL OR quantity_p = report.quantity)
        GROUP BY YEAR(order_date)
        ORDER BY report_year DESC;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSearchResults` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSearchResults`(IN searchTerm VARCHAR(255))
BEGIN
    SELECT product_id, product_name 
    FROM product 
    WHERE product_name LIKE CONCAT('%', searchTerm, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetWishlistByCustomerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetWishlistByCustomerId`(
    IN p_customerId INT
)
BEGIN
    SELECT p.*, wi.added_at
    FROM wishlist_item wi
    JOIN product p ON wi.product_id = p.product_id
    WHERE wi.customer_id = p_customerId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_categories_with_subcategories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_categories_with_subcategories`()
BEGIN
    SELECT 
        c1.category_id AS category_id,
        c1.category_name AS category_name,
        c2.category_id AS subcategory_id,
        c2.category_name AS subcategory_name
    FROM 
        category c1
    LEFT JOIN 
        category c2 ON c2.parent_category_id = c1.category_id
    WHERE 
        c1.parent_category_id IS NULL
    ORDER BY 
        c1.category_id, c2.category_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_customer_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_customer_by_id`(
    IN p_customer_id INT
)
BEGIN
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        c.email_address,
        c.username,
        -- Add other customer fields as necessary
        cp.phone_number
    FROM 
        customer c
    LEFT OUTER JOIN 
        customer_phone_number cp 
    ON 
        c.customer_id = cp.customer_id
    WHERE 
        c.customer_id = p_customer_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_filtered_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_filtered_products`(
    IN p_category_ids TEXT,
    IN p_subcategory_ids TEXT,
    IN p_min_price DECIMAL(10,2),
    IN p_max_price DECIMAL(10,2)
)
BEGIN
    SET @category_ids = p_category_ids;
    SET @subcategory_ids = p_subcategory_ids;
    SET @min_price = p_min_price;
    SET @max_price = p_max_price;

    SET @query = CONCAT(
        'SELECT p.product_id, p.product_name, p.description, p.product_image, p.weight, c.category_name, ',
        'v.variant_id, v.total_price ',
        'FROM product p ',
        'JOIN category c ON p.category_id = c.category_id ',
        'JOIN variant v ON p.product_id = v.product_id ',
        'WHERE 1=1 '
    );

    IF @category_ids IS NOT NULL AND @category_ids != '' THEN
        SET @query = CONCAT(@query, ' AND p.category_id IN (', @category_ids, ') ');
    END IF;

    IF @subcategory_ids IS NOT NULL AND @subcategory_ids != '' THEN
        SET @query = CONCAT(@query, ' AND p.category_id IN (', @subcategory_ids, ') ');
    END IF;

    IF @min_price IS NOT NULL THEN
        SET @query = CONCAT(@query, ' AND v.total_price >= ', @min_price, ' ');
    END IF;

    IF @max_price IS NOT NULL THEN
        SET @query = CONCAT(@query, ' AND v.total_price <= ', @max_price, ' ');
    END IF;

    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_payment_details_by_customer_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_payment_details_by_customer_id`(
    IN p_customer_id INT
)
BEGIN
    SELECT 
        CONCAT(c.first_name, ' ', c.last_name) AS name,
        cp.*
    FROM 
        customer_payment_method cp
    LEFT OUTER JOIN 
        customer c 
    ON 
        cp.customer_id = c.customer_id
    WHERE 
        cp.customer_id = p_customer_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_phone_number` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_phone_number`(
    IN cust_id INT,
    IN phone_num VARCHAR(15)
)
BEGIN
    -- Delete all four-digit phone numbers for the given customer
    DELETE FROM customer_phone_number
    WHERE customer_id = cust_id;
    
    -- Insert the new phone number for the customer
    INSERT INTO customer_phone_number (phone_number, customer_id)
    VALUES (phone_num, cust_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IsItemInWishlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IsItemInWishlist`(
    IN p_customerId INT,
    IN p_productId INT,
    OUT p_exists BOOLEAN
)
BEGIN
    DECLARE countItems INT;

    SELECT COUNT(*) INTO countItems
    FROM wishlist_item
    WHERE customer_id = p_customerId AND product_id = p_productId;

    IF countItems > 0 THEN
        SET p_exists = TRUE;
    ELSE
        SET p_exists = FALSE;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MarkNotificationAsRead` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MarkNotificationAsRead`(IN p_notificationId INT)
BEGIN
    UPDATE 
        notifications 
    SET 
        is_read = 1 
    WHERE 
        notification_id = p_notificationId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveWishlistItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveWishlistItem`(
    IN p_customerId INT,
    IN p_productId INT,
    OUT p_affectedRows INT
)
BEGIN
    DELETE FROM wishlist_item 
    WHERE customer_id = p_customerId AND product_id = p_productId;

    SET p_affectedRows = ROW_COUNT();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SaveCard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SaveCard`(
    IN p_customerId INT,
    IN p_lastFourDigits VARCHAR(4),
    IN p_expirationDate DATE,
    IN p_cardOwner VARCHAR(255),
    IN p_cardType VARCHAR(50),
    IN p_cardNumber VARCHAR(20)
)
BEGIN
    INSERT INTO cards (customer_id, last_four_digits, expiration_date, card_owner, card_type, card_number)
    VALUES (p_customerId, p_lastFourDigits, p_expirationDate, p_cardOwner, p_cardType, p_cardNumber);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_customer`(
    IN p_customer_id INT,
    IN p_first_name VARCHAR(255),
    IN p_last_name VARCHAR(255),
    IN p_email_address VARCHAR(255)
    -- Add other fields you wish to update
)
BEGIN
    UPDATE customer 
    SET 
        first_name = p_first_name,
        last_name = p_last_name,
        email_address = p_email_address,
        updated_at = NOW()
    WHERE 
        customer_id = p_customer_id;
        
    -- Optionally, return the number of affected rows
    SELECT ROW_COUNT() AS affected_rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_shipping_date_if_out_of_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_shipping_date_if_out_of_stock`(IN order_id_param INT)
BEGIN
    DECLARE has_out_of_stock BOOLEAN;
    
    -- Check if any variant in the order has insufficient stock
    SELECT EXISTS (
        SELECT 1
        FROM order_item oi
        JOIN variant v ON oi.variant_id = v.variant_id
        WHERE oi.order_id = order_id_param 
        AND v.inventory_stock < oi.quantity
    ) INTO has_out_of_stock;
    
    -- If out of stock items found, update shipping date
    IF has_out_of_stock THEN
        UPDATE shop_order
        SET shipping_date = DATE_ADD(shipping_date, INTERVAL 3 DAY)
        WHERE order_id = order_id_param;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `customer_order_report`
--

/*!50001 DROP VIEW IF EXISTS `customer_order_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_order_report` AS select `c`.`customer_id` AS `customer_id`,concat(`c`.`first_name`,' ',`c`.`last_name`) AS `customer_name`,count(`so`.`order_id`) AS `total_orders`,sum(`so`.`total_order_price`) AS `total_spent` from (`customer` `c` join `shop_order` `so` on((`c`.`customer_id` = `so`.`customer_id`))) group by `c`.`customer_id`,`customer_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `report`
--

/*!50001 DROP VIEW IF EXISTS `report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `report` AS select `shop_order`.`order_date` AS `order_date`,`payment_method`.`name` AS `payment_method_name`,`shop_order`.`delivery_method` AS `delivery_method`,`shop_order`.`total_order_price` AS `total_order_price`,`shop_order`.`subtotal` AS `subtotal`,`shop_order`.`shipping` AS `shipping`,`shop_order`.`tax` AS `tax`,`shop_order`.`shipping_date` AS `shipping_date`,`shop_order`.`order_status` AS `order_status`,`order_item`.`quantity` AS `quantity` from ((`shop_order` join `payment_method` on((`shop_order`.`payment_method_id` = `payment_method`.`payment_method_id`))) join `order_item` on((`shop_order`.`order_id` = `order_item`.`order_item_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-07  3:25:39
