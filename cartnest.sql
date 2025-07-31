/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.5.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: cartnest
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `admin_bookmarks`
--

DROP TABLE IF EXISTS `admin_bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `boomarked_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_bookmarks`
--

LOCK TABLES `admin_bookmarks` WRITE;
/*!40000 ALTER TABLE `admin_bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_reminders`
--

DROP TABLE IF EXISTS `admin_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `dated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_reminders`
--

LOCK TABLES `admin_reminders` WRITE;
/*!40000 ALTER TABLE `admin_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_reminders` ENABLE KEYS */;
UNLOCK TABLES;

-- --
-- -- Table structure for table `admin_users`
-- --

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `firstname` text DEFAULT NULL,
  `lastname` text DEFAULT NULL,
  `birthdate` int(11) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `profile` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES
(1,16,'kahuho','charles',NULL,NULL,NULL);
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES
(2,35,'some name','some las name','active','2024-10-05 15:19:54',NULL),
(3,42,'Charles','Kahuho','active','2024-10-25 08:56:56',NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `instructions` text DEFAULT NULL,
  `submissions` int(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'open',
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES
(1,'Balenciaga','2024-10-05 08:47:29',NULL),
(2,'sony','2024-10-05 08:48:27',NULL),
(3,'Huawei','2024-10-05 08:48:40',NULL),
(4,'Samsung','2024-10-05 08:48:47',NULL),
(5,'Apple','2024-10-05 08:48:53',NULL),
(6,'Techno','2024-10-05 08:49:00',NULL),
(7,'Infinix','2024-10-05 08:49:17',NULL),
(8,'Infinix','2024-10-05 13:28:36',NULL),
(9,'Infinix','2024-10-05 13:28:55',NULL),
(10,'Infinix','2024-10-05 13:29:02',NULL),
(11,'Infinix','2024-10-05 13:29:03',NULL),
(12,'Infinix','2024-10-05 13:29:04',NULL),
(13,'Infinix','2024-10-05 13:29:05',NULL),
(14,'Infinix','2024-10-05 13:29:05',NULL),
(15,'Mercedes','2024-10-21 09:04:22',NULL),
(16,'Koinor','2024-10-21 09:06:07',NULL),
(17,'Samsung','2024-10-26 13:35:02',NULL),
(18,'versace','2024-11-21 13:47:39',NULL),
(19,'valenciga','2024-11-25 10:42:56',NULL),
(20,'Google Pixel','2024-12-01 17:08:40',NULL);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carted_goods`
--

DROP TABLE IF EXISTS `carted_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carted_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `vendor` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `added_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `vendor` (`vendor`),
  KEY `cart_id` (`cart_id`),
  CONSTRAINT `carted_goods_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `carted_goods_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `carted_goods_ibfk_3` FOREIGN KEY (`vendor`) REFERENCES `shops` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `carted_goods_ibfk_4` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carted_goods`
--

LOCK TABLES `carted_goods` WRITE;
/*!40000 ALTER TABLE `carted_goods` DISABLE KEYS */;
INSERT INTO `carted_goods` VALUES
(1,36,15,18,17,1,'2024-10-26 13:17:46',NULL),
(2,36,15,18,20,1,'2024-10-26 13:19:27',NULL),
(3,36,19,18,17,1,'2024-10-26 13:49:43',NULL),
(6,39,130,23,26,3,'2024-11-19 13:35:16','2024-11-24 17:49:07'),
(11,39,130,23,25,29,'2024-11-19 15:30:11','2024-11-21 12:43:56'),
(12,39,20,18,25,10,'2024-11-19 15:30:27','2024-11-21 12:44:04'),
(13,39,21,NULL,26,1,'2024-11-19 17:00:37','2024-11-21 12:36:48'),
(14,39,20,NULL,26,2,'2024-11-19 17:01:20','2024-11-19 17:01:38'),
(16,39,18,18,26,1,'2024-11-21 12:36:18',NULL),
(17,39,17,18,26,1,'2024-11-24 13:12:25',NULL),
(18,39,19,18,26,1,'2024-11-24 13:12:34',NULL),
(19,39,12,18,26,1,'2024-11-24 13:12:38',NULL),
(20,39,13,18,26,1,'2024-11-24 13:12:43',NULL),
(21,39,15,18,26,1,'2024-11-24 13:12:53',NULL),
(22,39,18,18,29,3,'2024-11-25 10:36:45','2024-11-25 10:36:58'),
(23,39,19,18,29,1,'2024-11-25 10:36:49',NULL),
(24,39,17,18,30,1,'2024-11-26 07:47:09',NULL),
(25,39,18,18,30,1,'2024-11-26 07:47:15',NULL),
(26,39,12,18,30,1,'2024-11-26 07:47:20',NULL),
(27,39,12,18,31,1,'2024-11-26 10:56:45','2024-11-26 10:57:15'),
(28,39,19,18,31,2,'2024-11-26 10:56:51','2024-11-26 10:57:12');
/*!40000 ALTER TABLE `carted_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_editable` int(11) NOT NULL DEFAULT 1,
  `checkedout` varchar(255) DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES
(17,36,'tech collection','images/big4.jpg','active','2024-10-18 12:36:59',NULL,1,'false'),
(20,36,'School collection','images/box3-2.jpg','active','2024-10-18 19:06:23',NULL,1,'false'),
(22,36,'Tv collection','images/image16.png','active','2024-10-18 19:07:51',NULL,1,'false'),
(25,39,'Starter collection','images/big1.jpg','active','2024-10-20 08:52:08',NULL,0,'false'),
(26,39,'gaming collection','https://t3.ftcdn.net/jpg/02/85/90/44/360_F_285904463_52tKiXp592qUhmg24eS3f4k1kGQSji3f.jpg','active','2024-10-22 10:09:31',NULL,0,'false'),
(28,41,'Starter collection','images/big1.jpg','active','2024-10-26 12:37:02',NULL,1,'false'),
(29,39,'open cart','images/big1.jpg','active','2024-11-25 10:36:35',NULL,0,'false'),
(30,39,'new cart','images/big2.jpg','active','2024-11-25 11:18:26',NULL,0,'false'),
(31,39,'Bultutt','images/big1.jpg','active','2024-11-26 10:56:13',NULL,0,'false');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `longname` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT 'https://t3.ftcdn.net/jpg/02/85/90/44/360_F_285904463_52tKiXp592qUhmg24eS3f4k1kGQSji3f.jpg',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(5,'Women','women clothing collection','The best clothes to wear for women 2024 fashionable','images/box2-4.jpg','2024-10-05 13:28:36',NULL),
(12,'Men','Men clothing collection','The best clothes to wear for men 2024 fashionable','images/headphone.png','2024-10-13 11:45:26',NULL),
(13,'Perspiciatis culpa ','Laboris voluptas ill','Nulla Nam quod minim','https://www.lel.com','2024-10-20 11:07:35',NULL),
(14,'Kitchen','Kitchen products good and supplies','Shop everything you need to make your kitchen feely cooky','images/box1-1.jpg','2024-10-20 11:30:21',NULL),
(15,'Phome','Latest phone collection','A collection of recently released phones for everybody','https://plus.unsplash.com/premium_photo-1680985551009-05107cd2752c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHBob25lfGVufDB8fDB8fHww','2024-10-24 10:03:47',NULL),
(16,'Smart Phones','SMART PHONES','Shop the latest smart phones easily affordable and convenient. Keep up with the smarts','data:image/jpeg;base64,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','2024-12-01 16:33:05',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completed_orders`
--

DROP TABLE IF EXISTS `completed_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `completed_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_code` varchar(100) NOT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `payment_date` timestamp NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `tracking_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_code` (`payment_code`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_payment_method` (`payment_method`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `completed_orders_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_orders`
--

LOCK TABLES `completed_orders` WRITE;
/*!40000 ALTER TABLE `completed_orders` DISABLE KEYS */;
INSERT INTO `completed_orders` VALUES
(1,17,'Bank Transfer','OHN66D0GL0K9',417.00,'2024-11-25 07:41:10',39,'1732520470485aUxESASD4OPidzebF1IRupdwOOiIlI'),
(3,17,'Apple Pay','TVHU0G3563MM',417.00,'2024-11-25 07:42:23',39,'17325205431835t0Vcl30fhIp0mIH7Ux4hSZXcRLHRf'),
(4,17,'Bank Transfer','3RGG8B07GQD4',417.00,'2024-11-25 07:43:17',39,'1732520597411xoINcBeRimhEHBdwNVNcUJmKt3Qtbk'),
(5,17,'Apple Pay','J1SSL8NQOFLA',417.00,'2024-11-25 07:43:50',39,'1732520630749dm366RMsn8QlxGHBp3dfnmMKXXFnBu'),
(6,17,'Apple Pay','VKODL5KKDJ1P',417.00,'2024-11-25 07:44:36',39,'1732520676775NGiPx5pQCh4CSgiOfTIyoANrtCknB7'),
(8,17,'Google Pay','IEWL8IJENVW4',417.00,'2024-11-25 07:46:29',39,'1732520789277uNP102HKB9khldxArGLgHYb3qtbw2t'),
(9,17,'Google Pay','789AZLHTJHBC',417.00,'2024-11-25 07:50:02',39,'1732521002357xU9L5qsYt7L44XTKcVyPxr0baUoxoa'),
(10,17,'Google Pay','P6YD782Z671Y',417.00,'2024-11-25 07:52:16',39,'17325211369642Ac0it3RPRnoCOfabzPaKbarHeKOdI'),
(11,17,'Bank Transfer','P0OU4THSUNUO',417.00,'2024-11-25 07:53:42',39,'1732521222694L6ZNG1J0tPU3wuXIMQlDKkE9sLHKXw'),
(12,17,'Apple Pay','EF5K2UQK1XPJ',417.00,'2024-11-25 07:54:00',39,'1732521240683p1lVCQ9ydUkXO4KLeCv0VGiYr9i5yy'),
(13,17,'Google Pay','Q2DSJM6X4QCJ',417.00,'2024-11-25 07:59:26',39,'1732521566818O8dVWsnAYMW2hxvQXa6nYYQmcJmhVN'),
(14,17,'Apple Pay','LNRT9HBHRDY6',417.00,'2024-11-25 07:59:45',39,'1732521585656RLRRyPHrAZkyrNtsSpwoaPDzeOidwT'),
(16,19,'Google Pay','APSY6WEI04FY',5687.00,'2024-11-25 08:17:59',39,'1732522679395ZJt1Ex3CDwfpCOItAAA2qAcguVyJGD'),
(19,19,'Bank Transfer','WDH7CRZD2EV1',5687.00,'2024-11-25 08:21:43',39,'17325229035854zQy27XlcnwpdJSBXoIrGi8clx8HL9'),
(20,19,'Bank Transfer','7TJSFWLHDYW3',5687.00,'2024-11-25 08:22:40',39,'1732522960460FKpkS043Bxim5O1Y51kVxPkdLPX0CZ'),
(21,20,'Apple Pay','7U156IMV042N',5421.00,'2024-11-25 08:26:22',39,'1732523182410DwUMFtok0fWQYcMP2yqehzFuKNoQZ7'),
(22,21,'Apple Pay','8NCIEXRJV6RT',15859.00,'2024-11-25 09:13:24',39,'1732526004027A18SMnzzWu7GkFwuXp9Sdzn8Svz5nA'),
(23,21,'Apple Pay','N672983JPDZZ',15859.00,'2024-11-25 09:17:43',39,'1732526263260XxMujxKSDD22F2GZGhpf6glbEh4UA3'),
(24,21,'Google Pay','M5ERWFAFVRTS',15859.00,'2024-11-25 09:18:25',39,'1732526305584vk9Jd1B7SI0QswK4avSR5PuiZaTl7X'),
(25,21,'Bank Transfer','M0JHLLNLMF6E',15859.00,'2024-11-25 09:20:38',39,'1732526438358JEjhphRqaDaXOZWs0k1GyYePehjdOy'),
(26,21,'Bank Transfer','WAIAUZ186168',15859.00,'2024-11-25 09:21:14',39,'1732526474477WqBqLsNWhUiMvGpBL8YCwCjzDgxrRc'),
(27,22,'Bank Transfer','3S1WROA3PNPR',15859.00,'2024-11-25 09:28:26',39,'1732526906170seCkYudgomulSg8atKA1pPTkt0U5a7'),
(28,22,'Stripe','J1AJJFVNHBG8',15859.00,'2024-11-25 09:30:24',39,'1732527024702iwlFchoIkfjAdjiV1HsnLElLv86Rw9'),
(29,22,'Stripe','J73UR4SGHSKD',15859.00,'2024-11-25 09:31:03',39,'1732527063513k1w8N1OGGfwfzv5yuyHDKHwBOdYKzj'),
(30,22,'Stripe','YOA3S3P993IR',15859.00,'2024-11-25 09:31:33',39,'1732527093978y9uGej8FyeAxftzy4CW4353tRJHh9Y'),
(31,22,'Stripe','IPH7JNARW6G8',15859.00,'2024-11-25 09:32:30',39,'1732527150966BYdxiwCN05TkLiBtIdK7cnmMnVpH6N'),
(32,22,'Stripe','3AF7GP2HNKRK',15859.00,'2024-11-25 09:33:40',39,'1732527220982iT9gi5sENjmKatinjNZqtoZhEM0yAC'),
(33,22,'Stripe','GI2TJ4GYMYT2',15859.00,'2024-11-25 09:34:01',39,'1732527241908FLPcjNo7P0L79J33hzsBsIQR71R8c2'),
(34,22,'Stripe','2J9PS6DEZKDK',15859.00,'2024-11-25 09:34:36',39,'1732527276216fHLHEXOmM7dFas3jKOiVqNc8vBnJze'),
(35,22,'Stripe','0VT8DXZ28J0U',15859.00,'2024-11-25 09:34:53',39,'1732527293976zRdvCoP5wEpjCPNpVZQCayO0HTkhKt'),
(36,23,'Apple Pay','OYDLAT8PBY2J',5687.00,'2024-11-25 09:36:58',39,'1732527418587dyLcJzTtv4v0VJLnZWSp9zhlFmWK67'),
(37,23,'Bank Transfer','103ATHUJHOV6',5687.00,'2024-11-25 09:37:50',39,'1732527470459eQAhiR0kYW3h8AWjxBfQrwkeanRHrg'),
(38,24,'Apple Pay','ZXWEB96IYL7Q',15859.00,'2024-11-25 09:40:44',39,'1732527644224A9wg013s7d150F1xn7mTWMVI1tsJMY'),
(39,25,'Apple Pay','BEY2SIBIRU8G',15859.00,'2024-11-25 09:42:54',39,'1732527774376JGNK9lVPaGSOaCjtriskGHSurjbEF7'),
(40,26,'Google Pay','WZ3WE1K1MGK5',15859.00,'2024-11-25 09:45:30',39,'173252793072082dj2ap4buFZPuNW6ns4WAQw3ggMUJ'),
(41,27,'Stripe','JFOYTJ1FQOOW',1698.00,'2024-11-25 10:37:21',39,'1732531041815T3cGPrWvFa1HGAj5fsf6A2KgmXSDCx'),
(42,30,'Apple Pay','OYANYBAD02PB',1507.00,'2024-11-26 07:49:40',39,'1732607380677hCMVz62hnOTMTaJBmROkbJVHS3OyHU'),
(43,18,'Apple Pay','FNASEK3NH1Y5',5687.00,'2024-11-26 08:07:49',39,'17326084697232CaJRRToGwxt1izvg4uDacn3B3kjqS'),
(45,29,'Apple Pay','K04PKCFLI3G7',5687.00,'2024-11-26 08:08:04',39,'1732608484739FMaCjXZDcpvwk426OFPntW54OaNpPC'),
(46,28,'Apple Pay','EZ0YKT9OLOSX',5687.00,'2024-11-26 08:33:16',39,'1732609996892aYmkgskpdgvOx3RenAtWYzcRZGzxTD'),
(47,31,'Google Pay','1PH10Q96KSMP',2210.00,'2024-11-26 08:37:21',39,'1732610241996vcJs5XRuPVkUq0XcByVX5ZMmcJJ0dh'),
(48,32,'Apple Pay','QFBG25G1XSPD',1677.00,'2024-11-26 10:57:43',39,'17326186633812GnqQuo6yYvck5cWmZTYVXgLbH0xT9'),
(49,33,'Google Pay','G9ZA93O4JNGI',110.00,'2024-12-01 17:17:41',39,'1733073461974H0Do63V62GnVVcZd99O8MhbhebALNH'),
(50,2,'Apple Pay','IB9PHZ09ONYV',417.00,'2024-12-01 17:24:42',39,'1733073882485fBtKgvErNO31RlT73mqBJNcrdQFXbs'),
(51,1,'Bank Transfer','TTO1SZGBLZII',417.00,'2024-12-01 17:24:56',39,'1733073896791w8XmUM5oLnPWTRjCuZv5DkrCMFcrYt'),
(52,3,'Bank Transfer','ENZAZOWBL600',417.00,'2024-12-01 17:25:09',39,'1733073909557TiGvfqLIsPl8s8mromcK1WFwKovuyj'),
(53,4,'Bank Transfer','YZN5O7CFE2TG',417.00,'2024-12-01 17:25:20',39,'1733073920886xHZPgOkHsUqOdjmMFoUEIdkgJO5rZe');
/*!40000 ALTER TABLE `completed_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `first_name` text DEFAULT NULL,
  `last_name` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES
(7,36,'some name','some las name','2024-10-05 15:20:19',NULL),
(9,38,'some name','some las name','2024-10-20 08:36:00',NULL),
(10,39,'Charles','Kahuho','2024-10-20 08:40:22',NULL),
(11,41,'Kitimba','muthuku','2024-10-24 09:56:26',NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `discount_code` text NOT NULL,
  `discount_percentage` decimal(2,2) DEFAULT NULL,
  `valid_from` timestamp NOT NULL,
  `valid_until` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `discount_code` (`discount_code`(32)) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_deliveries`
--

DROP TABLE IF EXISTS `order_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_deliveries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `delivery_status` varchar(50) NOT NULL DEFAULT 'Pending',
  `shipping_method` varchar(50) DEFAULT NULL,
  `tracking_number` varchar(100) NOT NULL,
  `estimated_delivery_date` date DEFAULT NULL,
  `actual_delivery_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `tracking_number` (`tracking_number`),
  KEY `customer_id` (`customer_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_tracking_number` (`tracking_number`),
  CONSTRAINT `order_deliveries_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_deliveries_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_deliveries`
--

LOCK TABLES `order_deliveries` WRITE;
/*!40000 ALTER TABLE `order_deliveries` DISABLE KEYS */;
INSERT INTO `order_deliveries` VALUES
(1,17,10,'started','Personal pickup','17325211369642Ac0it3RPRnoCOfabzPaKbarHeKOdI',NULL,'2024-11-28 07:52:17','2024-11-25 07:52:17','2024-11-25 07:52:17'),
(2,17,10,'started','Personal pickup','1732521222694L6ZNG1J0tPU3wuXIMQlDKkE9sLHKXw',NULL,'2024-11-28 07:53:42','2024-11-25 07:53:42','2024-11-25 07:53:42'),
(3,17,10,'started','Personal pickup','1732521240683p1lVCQ9ydUkXO4KLeCv0VGiYr9i5yy',NULL,'2024-11-28 07:54:01','2024-11-25 07:54:01','2024-11-25 07:54:01'),
(4,17,10,'started','Personal pickup','1732521566818O8dVWsnAYMW2hxvQXa6nYYQmcJmhVN',NULL,'2024-11-28 07:59:26','2024-11-25 07:59:26','2024-11-25 07:59:26'),
(5,17,10,'started','Personal pickup','1732521585656RLRRyPHrAZkyrNtsSpwoaPDzeOidwT',NULL,'2024-11-28 07:59:45','2024-11-25 07:59:45','2024-11-25 07:59:45'),
(6,19,10,'started','Personal pickup','1732522960460FKpkS043Bxim5O1Y51kVxPkdLPX0CZ',NULL,'2024-11-28 08:22:40','2024-11-25 08:22:40','2024-11-25 08:22:40'),
(7,20,10,'started','Personal pickup','1732523182410DwUMFtok0fWQYcMP2yqehzFuKNoQZ7',NULL,'2024-11-28 08:26:22','2024-11-25 08:26:22','2024-11-25 08:26:22'),
(8,21,10,'started','Personal pickup','1732526004027A18SMnzzWu7GkFwuXp9Sdzn8Svz5nA',NULL,'2024-11-28 09:13:25','2024-11-25 09:13:25','2024-11-25 09:13:25'),
(9,22,10,'started','Personal pickup','1732527293976zRdvCoP5wEpjCPNpVZQCayO0HTkhKt',NULL,'2024-11-28 09:34:54','2024-11-25 09:34:54','2024-11-25 09:34:54'),
(10,23,10,'started','Personal pickup','1732527470459eQAhiR0kYW3h8AWjxBfQrwkeanRHrg',NULL,'2024-11-28 09:37:52','2024-11-25 09:37:52','2024-11-25 09:37:52'),
(11,24,10,'started','Personal pickup','1732527644224A9wg013s7d150F1xn7mTWMVI1tsJMY',NULL,'2024-11-28 09:40:44','2024-11-25 09:40:44','2024-11-25 09:40:44'),
(12,25,10,'started','Personal pickup','1732527774376JGNK9lVPaGSOaCjtriskGHSurjbEF7',NULL,'2024-11-28 09:42:54','2024-11-25 09:42:54','2024-11-25 09:42:54'),
(13,26,10,'started','Personal pickup','173252793072082dj2ap4buFZPuNW6ns4WAQw3ggMUJ',NULL,'2024-11-28 09:45:30','2024-11-25 09:45:30','2024-11-25 09:45:30'),
(14,27,10,'started','Personal pickup','1732531041815T3cGPrWvFa1HGAj5fsf6A2KgmXSDCx',NULL,'2024-11-28 10:37:21','2024-11-25 10:37:21','2024-11-25 10:37:21'),
(15,30,10,'started','Boda','1732607380677hCMVz62hnOTMTaJBmROkbJVHS3OyHU',NULL,'2024-11-29 07:49:40','2024-11-26 07:49:40','2024-11-26 07:49:40'),
(16,18,10,'started','Personal pickup','17326084697232CaJRRToGwxt1izvg4uDacn3B3kjqS',NULL,'2024-11-29 08:07:50','2024-11-26 08:07:50','2024-11-26 08:07:50'),
(17,29,10,'started','Boda','1732608484739FMaCjXZDcpvwk426OFPntW54OaNpPC',NULL,'2024-11-29 08:08:06','2024-11-26 08:08:06','2024-11-26 08:08:06'),
(18,28,10,'started','Boda','1732609996892aYmkgskpdgvOx3RenAtWYzcRZGzxTD',NULL,'2024-11-29 08:33:17','2024-11-26 08:33:17','2024-11-26 08:33:17'),
(19,31,10,'started','Personal pickup','1732610241996vcJs5XRuPVkUq0XcByVX5ZMmcJJ0dh',NULL,'2024-11-29 08:37:22','2024-11-26 08:37:22','2024-11-26 08:37:22'),
(20,32,10,'started','Personal pickup','17326186633812GnqQuo6yYvck5cWmZTYVXgLbH0xT9',NULL,'2024-11-29 10:57:43','2024-11-26 10:57:43','2024-11-26 10:57:43'),
(21,33,10,'started','Personal pickup','1733073461974H0Do63V62GnVVcZd99O8MhbhebALNH',NULL,'2024-12-04 17:17:42','2024-12-01 17:17:42','2024-12-01 17:17:42'),
(22,2,10,'started','Personal pickup','1733073882485fBtKgvErNO31RlT73mqBJNcrdQFXbs',NULL,'2024-12-04 17:24:42','2024-12-01 17:24:42','2024-12-01 17:24:42'),
(23,1,10,'started','Personal pickup','1733073896791w8XmUM5oLnPWTRjCuZv5DkrCMFcrYt',NULL,'2024-12-04 17:24:56','2024-12-01 17:24:56','2024-12-01 17:24:56'),
(24,3,10,'started','Personal pickup','1733073909557TiGvfqLIsPl8s8mromcK1WFwKovuyj',NULL,'2024-12-04 17:25:09','2024-12-01 17:25:09','2024-12-01 17:25:09'),
(25,4,10,'started','Personal pickup','1733073920886xHZPgOkHsUqOdjmMFoUEIdkgJO5rZe',NULL,'2024-12-04 17:25:20','2024-12-01 17:25:20','2024-12-01 17:25:20');
/*!40000 ALTER TABLE `order_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `vendor` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` ENUM('draft','completed','cancelled') NOT NULL DEFAULT 'draft',
  `added_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `totalprice` varchar(255) NOT NULL,
  `cartid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `vendor` (`vendor`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`vendor`) REFERENCES `shops` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES
(1,39,18,NULL,1,'completed','2024-11-25 07:00:02','2024-12-01 17:24:56','single','417.00',NULL),
(2,39,18,NULL,1,'completed','2024-11-25 07:01:28','2024-12-01 17:24:42','single','417.00',NULL),
(3,39,18,NULL,1,'completed','2024-11-25 07:02:16','2024-12-01 17:25:09','single','417.00',NULL),
(4,39,18,18,1,'completed','2024-11-25 07:02:41','2024-12-01 17:25:20','single','417.00',NULL),
(5,39,18,18,1,'draft','2024-11-25 07:09:34',NULL,'single','417',NULL),
(6,39,18,18,1,'cancelled','2024-11-25 07:10:38',NULL,'single','417',NULL),
(7,39,18,18,1,'cancelled','2024-11-25 07:10:46',NULL,'single','417',NULL),
(8,39,18,18,1,'cancelled','2024-11-25 07:10:49',NULL,'single','417',NULL),
(9,39,18,18,1,'cancelled','2024-11-25 07:10:54',NULL,'single','417',NULL),
(10,39,18,18,1,'cancelled','2024-11-25 07:11:38',NULL,'single','417',NULL),
(11,39,18,18,1,'cancelled','2024-11-25 07:12:12',NULL,'single','417',NULL),
(12,39,18,18,1,'cancelled','2024-11-25 07:12:14',NULL,'single','417',NULL),
(13,39,18,18,1,'cancelled','2024-11-25 07:13:36',NULL,'single','417',NULL),
(14,39,18,18,1,'cancelled','2024-11-25 07:15:19',NULL,'single','417',NULL),
(15,39,18,18,1,'cancelled','2024-11-25 07:17:32',NULL,'single','417',NULL),
(16,39,18,18,1,'cancelled','2024-11-25 07:18:27',NULL,'single','417',NULL),
(17,39,18,18,1,'completed','2024-11-25 07:19:14','2024-11-25 07:59:46','single','417',NULL),
(18,39,NULL,NULL,NULL,'completed','2024-11-25 08:16:08','2024-11-26 08:07:49','cart','5687',26),
(19,39,NULL,NULL,NULL,'completed','2024-11-25 08:17:31','2024-11-25 08:22:40','cart','5687',26),
(20,39,18,18,13,'completed','2024-11-25 08:26:17','2024-11-25 08:26:22','single','5421',NULL),
(21,39,NULL,NULL,NULL,'completed','2024-11-25 09:13:18','2024-11-25 09:21:14','cart','15859',25),
(22,39,NULL,NULL,NULL,'completed','2024-11-25 09:28:21','2024-11-25 09:34:53','cart','15859',25),
(23,39,NULL,NULL,NULL,'completed','2024-11-25 09:36:54','2024-11-25 09:37:50','cart','5687',26),
(24,39,NULL,NULL,NULL,'completed','2024-11-25 09:40:35','2024-11-25 09:40:43','cart','15859',25),
(25,39,NULL,NULL,NULL,'completed','2024-11-25 09:42:39','2024-11-25 09:42:53','cart','15859',25),
(26,39,NULL,NULL,NULL,'completed','2024-11-25 09:45:24','2024-11-25 09:45:30','cart','15859',25),
(27,39,NULL,NULL,NULL,'completed','2024-11-25 10:37:01','2024-11-25 10:37:21','cart','1698',29),
(28,39,NULL,NULL,NULL,'completed','2024-11-25 11:23:58','2024-11-26 08:33:16','cart','5687',26),
(29,39,NULL,NULL,NULL,'completed','2024-11-25 11:29:09','2024-11-26 08:08:04','cart','5687',26),
(30,39,NULL,NULL,NULL,'completed','2024-11-26 07:49:31','2024-11-26 07:49:40','cart','1507',30),
(31,39,130,23,10,'completed','2024-11-26 08:37:15','2024-11-26 08:37:21','single','2210',NULL),
(32,39,NULL,NULL,NULL,'completed','2024-11-26 10:57:17','2024-11-26 10:57:43','cart','1677',31),
(33,39,132,23,1,'completed','2024-12-01 17:17:36','2024-12-01 17:17:41','single','110',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `vendor` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `instock` int(11) NOT NULL DEFAULT 1,
  `main_image` text NOT NULL,
  `trending` ENUM('yes','no') NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `vendor` (`vendor`),
  KEY `brand` (`brand`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`vendor`) REFERENCES `shops` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`brand`) REFERENCES `brands` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES
(12,5,2,18,'Tasty Frozen Hat','Vergo vomer vilicus communis. Ducimus adeo aequitas conforto argentum dedecor candidus conscendo. Brevis tutamen comprehendo strues compello civis coadunatio terminatio amplexus toties.',783.00,-5,'imagemain.jpg','yes','2024-10-14 07:48:25'),
(13,5,2,18,'Incredible Granite Gloves','Turpis argentum callide coma decens assumenda. Ascisco curatio tametsi vulnus truculenter numquam tactus cognomen. Aestas quae bestia.',159.00,-3,'imagemain.jpg','yes','2024-10-14 07:48:27'),
(14,5,2,18,'Rustic Frozen Mouse','Caput volubilis annus. Tero defetiscor commodo cognatus ancilla aestas. Vulnero caelum tremo versus vindico deduco virga auditor aequitas adiuvo.',19.00,1,'imagemain.jpg','yes','2024-10-14 07:48:29'),
(15,5,2,18,'Rustic Bronze Mouse','Umerus adversus vel avaritia ceno vulgus confugo. Administratio accommodo tantillus. Atavus ademptio amet angustus.',203.00,-3,'imagemain.jpg','yes','2024-10-14 07:48:32'),
(16,5,2,18,'Modern Plastic Tuna','Agnosco thesaurus voluptatibus artificiose animadverto illo subiungo attero. Reiciendis supra admoneo. Tollo aestivus derideo corpus caelestis eos totus vehemens fuga apostolus.',1.00,1,'imagemain.jpg','yes','2024-10-14 07:48:33'),
(17,5,2,18,'Fantastic Frozen Ball','Delicate defendo verbum cunabula. Bellicus summopere creber villa cupiditate. Aggredior vinitor cibus vos cohaero.',307.00,-4,'imagemain.jpg','yes','2024-10-14 07:48:35'),
(18,5,2,18,'Unbranded Steel Salad','Curto quos utique carus delinquo. Censura solio thesis. Sol cimentarius auditor.',417.00,-16,'imagemain.jpg','yes','2024-10-14 07:49:37'),
(19,12,2,18,'Incredible Plastic Tuna','Patria usitas pecus dolores suppellex inventore adsidue. Incidunt substantia molestiae assentator cupiditas deinde veritas blanditiis. Tergum casus deporto demoror eligendi unus catena.',447.00,-6,'images/product1-2.jpg','yes','2024-10-14 07:53:52'),
(20,12,2,18,'Fantastic Concrete Chicken','Sub veritatis aeternus velut desidero. Adulescens asporto possimus utroque villa. Voluptatibus denego capio curia vicissitudo ipsa natus defendo acerbitas.',945.00,-37,'images/product2-2.jpg','yes','2024-10-14 07:54:11'),
(21,12,2,18,'Generic Granite Pizza','Theca universe vester utroque. Summisse calculus vobis cogo animadverto chirographum arceo. Magni curis illum arbustum ustulo triduana sequi mollitia.',818.00,-3,'images/product2-6.jpg','yes','2024-10-14 08:01:51'),
(22,12,2,18,'Modern Cotton Keyboard','Celo nostrum coniuratio sto volaticus summisse vesper unde denuncio. Uter neque caelestis paulatim caput utrimque. Sum amet video tandem amita certus textilis cito cetera auditor.',361.00,1,'images/product2-6.jpg','yes','2024-10-14 08:01:58'),
(23,12,2,18,'Elegant Fresh Ball','Subnecto virtus defendo dolores cunabula demonstro damnatio curtus perspiciatis benevolentia. Clamo tempora ab temptatio doloremque varius. Iste credo aliqua celo amicitia stella versus conduco.',451.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:01'),
(24,12,2,18,'Fantastic Steel Tuna','Illo aegre adipisci error tripudio tibi. Cimentarius concedo chirographum denuo supplanto crepusculum cras terebro decor. Vis compello excepturi praesentium adimpleo quo tantillus patrocinor alias culpa.',649.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:02'),
(25,12,2,18,'Bespoke Granite Pizza','Casso vigor possimus tandem varius ventosus comprehendo. Tactus aperiam beneficium volaticus defendo dolorum. Admoveo consequatur defero balbus sto candidus praesentium strues absum dapifer.',741.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:04'),
(26,12,2,18,'Handmade Bronze Pizza','Tutis vomer desipio. Ciminatio vulgaris vulnero acidus conscendo. Curvo talus tot defaeco avaritia.',574.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:05'),
(27,12,2,18,'Sleek Cotton Keyboard','Voco adulescens veniam audax stultus denego dedico cedo vitium vita. Vulariter tonsor ab thermae bos calco creator maxime. Labore stella admoneo vorago attonbitus dolores venustas abbas vergo deputo.',417.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:07'),
(28,12,2,18,'Handcrafted Concrete Fish','Conspergo ademptio vigor cresco corrigo cunae. Ambitus aer conatus canis. Urbs caecus velum dolorem crur paulatim.',688.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:08'),
(29,12,2,18,'Practical Soft Chicken','Vomica caveo aedificium. Impedit acies depromo dicta catena maiores. Coadunatio ad sapiente audeo asperiores.',974.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:10'),
(30,12,2,18,'Handcrafted Concrete Cheese','Patria quibusdam calculus adeo est. Libero deprecator arma. Auctus theatrum annus spectaculum in asporto.',996.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:11'),
(31,12,2,18,'Modern Cotton Pizza','Pauci undique vitae callide dens veritatis itaque una umerus. Talis vesica tunc admiratio arto caelestis. Occaecati timor cursim tyrannus odio.',338.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:13'),
(32,12,2,18,'Electronic Steel Towels','Adduco sperno cuius pariatur delinquo argumentum amaritudo cunabula optio velociter. Conforto ambitus suasoria. Cohors vomito nisi validus appello textus vobis.',960.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:14'),
(33,12,2,18,'Unbranded Frozen Salad','Adeptio calculus dignissimos arcus calco amicitia arceo campana conforto culpo. Ex desolo cogo considero teneo chirographum beneficium cunabula cupiditate. Combibo angustus synagoga timidus studio.',113.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:16'),
(34,12,2,18,'Generic Frozen Tuna','Vel ara casus aperiam apostolus. Admoveo velut carbo vere solium censura trans labore qui celo. Desidero facilis venio dolorum admitto vita defendo adfectus aperio confido.',911.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:17'),
(35,12,2,18,'Gorgeous Steel Chips','Trucido spoliatio compono audentia libero vitae validus. Repudiandae ea vetus vereor ante verumtamen amiculum. Consequatur coma verto aggredior debitis derelinquo.',930.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:19'),
(36,12,2,18,'Elegant Granite Chair','Cupiditas crastinus verecundia cupressus architecto cernuus. Sto eius stella constans coepi ipsum speculum censura coma. Denuncio defetiscor corrumpo beatae.',113.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:20'),
(37,12,2,18,'Handmade Concrete Bike','Cognomen caute defessus. Cinis admiratio verbera cornu tenax ciminatio. Depraedor acsi admoveo vulgus pecco.',895.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:21'),
(38,12,2,18,'Oriental Plastic Pizza','Terebro sub creo censura laboriosam conspergo tubineus pecus uxor patruus. Crustulum vinum deleniti textus videlicet bos cruentus sordeo. Velut usitas territo claudeo universe est cupiditate doloribus deporto cornu.',429.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:23'),
(39,12,2,18,'Rustic Granite Gloves','Textus pectus vinitor est textilis tergo id sint aptus. Cogito speculum somnus. Color timor triumphus tolero denuncio angelus terebro.',918.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:24'),
(40,12,2,18,'Handmade Granite Pants','Eligendi esse vulticulus ancilla. Aeger tribuo velut maxime trepide aiunt degusto ustulo vado pauci. Sol caecus nemo.',559.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:26'),
(41,12,2,18,'Gorgeous Frozen Chair','Spoliatio absconditus temptatio voluptas torqueo defetiscor molestiae aedificium. Subnecto vinitor clibanus arceo acervus aufero. Delectus volo annus suggero tum crapula confido appello clibanus.',323.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:27'),
(42,12,2,18,'Awesome Granite Chips','Blanditiis tenax occaecati. Amplexus atque comedo textor adopto. Quia tergeo vir ara animadverto nemo viriliter.',660.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:29'),
(43,12,2,18,'Ergonomic Plastic Towels','Acquiro acsi deprimo speculum creptio truculenter adstringo viduo bellum. Utor caries vulgaris virtus surgo amoveo sublime molestias aequitas aggredior. Totidem vespillo defessus appello clibanus vulgivagus amissio triumphus illo.',309.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:31'),
(44,12,2,18,'Handcrafted Cotton Gloves','Praesentium caste ater aufero. Ulterius caelestis auctor taceo. Quis vobis crebro.',835.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:34'),
(45,12,2,18,'Handmade Fresh Bike','Magni et cras concedo vis vado amiculum aptus. Arma degusto aqua attero tabula pauper collum benigne uterque totam. Solio circumvenio comminor audentia correptius abduco conatus.',438.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:36'),
(46,12,2,18,'Bespoke Metal Pants','Ipsam utique comminor voluptates patior crustulum bibo absorbeo. Angustus alii suppellex tredecim tot. Cibus censura calco cras antiquus dicta aurum decet speciosus viduo.',590.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:38'),
(47,12,2,18,'Bespoke Granite Keyboard','Vita amet claustrum tamdiu impedit. Claudeo conduco acquiro. Bonus utrum varius autem crustulum.',16.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:40'),
(48,12,2,18,'Tasty Rubber Soap','Laborum error absens allatus canto occaecati cogito. Deludo cito in claudeo. Claudeo cado auctor suppono ustilo condico iure careo.',947.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:41'),
(49,12,2,18,'Recycled Steel Fish','Viduo cognomen beatae bellum aestivus vulgaris. Turpis capitulus spectaculum aptus agnitio paens ocer mollitia surgo. Crastinus sol vehemens.',803.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:43'),
(50,12,2,18,'Handcrafted Concrete Chair','Vomer territo sopor certe armarium atrocitas tunc. Culpa sapiente cubitum tres. Tenuis perspiciatis absorbeo sollicito agnosco cuppedia careo testimonium ait damno.',194.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:45'),
(51,12,2,18,'Generic Plastic Soap','Sto id sono delicate voco temperantia suggero armarium dolore xiphias. Distinctio sed apto absorbeo harum. Cavus ulterius carcer tamquam utor.',526.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:47'),
(52,12,2,18,'Gorgeous Metal Towels','Ager causa vetus ad clibanus ulciscor abscido pecco. Tergo ducimus cometes ea. Defendo subito tergeo adiuvo vito.',836.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:49'),
(53,12,2,18,'Generic Soft Shoes','Aequus comprehendo aperio vaco facere amissio curtus. Thema tener defessus angustus. Speculum communis utrimque quo minima ultra curriculum abeo.',112.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:50'),
(54,12,2,18,'Practical Bronze Hat','Demum campana vorago apostolus arceo absens triduana facilis somnus curso. Torqueo deduco dens laboriosam deludo. Carmen denique crux concido.',425.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:52'),
(55,12,2,18,'Elegant Frozen Table','Vesco calamitas appono defleo aggero coaegresco quae. Sum territo curatio truculenter ager trans atqui sublime illum. Eius venio depopulo taedium coadunatio comes vulgaris tergo acerbitas.',603.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:54'),
(56,12,2,18,'Rustic Frozen Bacon','Turpis speculum subiungo bestia umerus non vero ut templum. Comparo occaecati hic. Aut tempus decimus crapula demulceo administratio nihil bellum virgo voluptatibus.',209.00,1,'images/product2-6.jpg','yes','2024-10-14 08:02:56'),
(57,12,2,18,'Rustic Rubber Tuna','Callide vulnero ars nam validus. Texo somniculosus damnatio copia. Spectaculum alter voluptatem odio molestias coadunatio dens.',213.00,1,'images/product2-9.jpg','yes','2024-10-14 08:03:01'),
(58,5,2,18,'Generic Wooden Car','Cetera aperiam dedico vindico clarus vinum cenaculum. Conatus quibusdam tollo saepe in demum. Credo necessitatibus absconditus claudeo concido nobis subnecto adsum coruscus.',840.00,1,'images/product2-1.jpg','yes','2024-10-14 08:03:31'),
(59,5,2,18,'Sleek Metal Hat','Arcus temeritas summisse venustas solitudo annus vehemens comptus. Explicabo custodia voluptatem. Thema angustus subnecto vomica cubicularis adinventitias.',907.00,1,'images/product2-1.jpg','yes','2024-10-14 08:03:33'),
(60,5,2,18,'Handcrafted Wooden Fish','Aperiam voveo delibero nisi certus. Currus verecundia appello certe ducimus. Carbo denego coepi thorax volubilis audax comptus tam.',724.00,1,'images/product2-1.jpg','yes','2024-10-14 08:03:35'),
(61,5,2,18,'Electronic Plastic Bike','Id soluta subseco celer inventore careo sollicito. Comprehendo sto cribro quam excepturi statua labore coaegresco. Decretum debeo tunc alienus combibo conitor convoco volaticus conventus.',665.00,1,'images/product2-1.jpg','yes','2024-10-14 08:03:36'),
(62,5,2,18,'Electronic Metal Hat','Uter minus sublime approbo adficio conor cuppedia. Vulariter molestiae accendo nesciunt minima curriculum adfectus calculus. Ascit accommodo acervus vereor vir conscendo.',361.00,1,'images/product2-1.jpg','yes','2024-10-14 08:03:39'),
(63,5,2,18,'Awesome Cotton Shirt','Suffoco contra armarium. Nesciunt balbus suppono tyrannus amor. Magni delego cogo aggero officiis.',857.00,1,'images/product2-1.jpg','yes','2024-10-14 08:03:40'),
(64,5,2,18,'Modern Granite Computer','Utpote demulceo advoco civitas administratio vita terebro aeternus. Distinctio deleo tantillus barba succurro voluptatem succedo calamitas tamisium. Rerum ver tener reiciendis stipes labore caute amoveo.',645.00,1,'images/product2-1.jpg','yes','2024-10-14 08:03:42'),
(65,5,2,18,'Bespoke Frozen Car','Censura texo vinculum valde valde viriliter aperiam aperiam. Tripudio comprehendo cohaero suscipit tempora curvo vester. Utilis minima contego pax accedo cogo illo terebro chirographum.',717.00,1,'images/product2-1.jpg','yes','2024-10-14 08:03:45'),
(66,5,2,18,'Gorgeous Steel Tuna','Sustineo colo admoveo temeritas suadeo. Vereor surculus appono. Copia tutamen articulus sodalitas aliqua terror uter alo theologus nemo.',645.00,1,'images/product2-1.jpg','yes','2024-10-14 08:03:46'),
(67,5,2,18,'Practical Wooden Gloves','Tabula summisse ulterius aestas aufero exercitationem. Appono viriliter templum. Tristis tergeo eaque curvo ancilla conor.',846.00,1,'images/product2-1.jpg','yes','2024-10-14 08:03:48'),
(68,5,2,18,'Modern Concrete Soap','Adipisci impedit victoria conduco clam depulso ullus accedo voro adipisci. Dignissimos creta strenuus. Cenaculum alveus vestigium.',598.00,1,'images/product2-1.jpg','yes','2024-10-14 08:03:50'),
(69,5,2,18,'Handmade Plastic Hat','Aegrus vado conscendo auditor nam crustulum dicta. Ager vilicus caries undique. Clamo quibusdam conspergo dolorum circumvenio.',110.00,1,'images/product2-1.jpg','yes','2024-10-14 08:03:52'),
(70,5,2,18,'Refined Granite Chair','Spectaculum speculum suscipit illum fuga voluptatem. Demum candidus auctus adulescens atrox territo asporto suadeo. Adsidue tactus paens cunabula suppono avaritia vicinus ambitus.',834.00,1,'images/product2-1.jpg','yes','2024-10-14 08:03:53'),
(71,5,2,18,'Intelligent Rubber Car','Arcus ullam verbera. Fugiat acer demens celebrer tenus quibusdam. Patrocinor aliquam chirographum desidero ex.',274.00,1,'images/product2-1.jpg','yes','2024-10-14 08:03:55'),
(72,5,2,18,'Small Soft Towels','Crepusculum traho peior curia adflicto calco absorbeo defaeco. Nisi soluta verbum conforto solium adinventitias suscipio. Vomica deficio cursim.',157.00,1,'images/product2-1.jpg','yes','2024-10-14 08:03:57'),
(73,5,2,18,'Incredible Plastic Gloves','Consequatur considero tardus vitiosus comprehendo circumvenio. Decerno angelus adeo animadverto careo solvo iure. Censura amicitia ducimus paens.',628.00,1,'images/product2-1.jpg','yes','2024-10-14 08:03:58'),
(74,5,2,18,'Unbranded Fresh Soap','Adsum amplitudo comedo. Vitium suffragium caries repudiandae rerum antea vesco recusandae cur. Textor doloribus conservo.',618.00,1,'images/product2-1.jpg','yes','2024-10-14 08:04:01'),
(75,5,2,18,'Practical Steel Chicken','Bos cui dedico aveho aequitas stella ex succurro acer credo. Velum creber curia pauper voluntarius talus conatus. Cotidie celebrer caterva cito validus socius sustineo.',184.00,1,'images/product2-1.jpg','yes','2024-10-14 10:57:44'),
(76,5,2,18,'Elegant Bronze Bacon','Aspicio textor aegrus. Decens calcar alo. Laudantium succedo defleo vulgaris calculus.',27.00,1,'https://loremflickr.com/640/480/business?lock=4566018902982656','yes','2024-10-14 10:58:36'),
(77,5,2,18,'Tasty Wooden Chicken','Solus speciosus socius socius defluo chirographum despecto tabgo solus. Barba surgo centum adulatio uberrime voluptate beatus conservo temperantia vapulus. Suffragium solio trans sollicito super patrocinor aestus quasi caelum.',391.00,1,'https://loremflickr.com/640/480/business?lock=691309824180224','yes','2024-10-14 10:58:37'),
(78,5,2,18,'Unbranded Rubber Hat','Cubicularis aurum dapifer. Provident crur strues torrens eligendi annus candidus denique. Celebrer defleo contabesco.',369.00,1,'https://loremflickr.com/640/480/business?lock=4718199301996544','yes','2024-10-14 10:58:42'),
(79,5,2,18,'Oriental Cotton Bacon','Sono conforto ab. Tego careo vulgus audio triumphus aperiam aequus utor deserunt. Ullam cornu torqueo.',466.00,1,'https://loremflickr.com/640/480/business?lock=6557091336552448','yes','2024-10-14 10:58:45'),
(80,5,2,18,'Ergonomic Soft Ball','Iusto sortitus volubilis terra. Adeptio depraedor comptus artificiose minus. Coerceo dapifer pauper coepi sperno atrox voluptatem angulus cupiditate.',516.00,1,'https://loremflickr.com/640/480/business?lock=4734262139944960','yes','2024-10-14 10:58:49'),
(81,5,2,18,'Practical Cotton Mouse','Desipio tergiversatio vestrum corona. Tredecim accedo vulnus conduco vorax baiulus alo. Aranea officiis vulnus coaegresco coma.',222.00,1,'https://loremflickr.com/640/480/business?lock=3485847458414592','yes','2024-10-14 10:58:52'),
(82,5,2,18,'Fantastic Soft Salad','Sui conduco deleniti bis quibusdam vorax. Confugo ago desidero cognomen careo aperiam trepide arca cogo volup. Quos crux compono repellendus truculenter aperiam accusamus charisma.',639.00,1,'https://loremflickr.com/640/480/business?lock=7019694439530496','yes','2024-10-14 10:58:56'),
(83,5,2,18,'Handmade Concrete Tuna','Aegrus tenus venia vilitas curto tonsor. Alii tabernus constans territo vado crinis tempore consectetur tenax tracto. Consectetur nulla thesis.',330.00,1,'https://loremflickr.com/640/480/business?lock=4300016589996032','yes','2024-10-14 10:58:59'),
(84,5,2,18,'Generic Wooden Shirt','Callide despecto circumvenio. Corroboro demergo sublime cariosus mollitia incidunt vulnus patria artificiose aggero. Aperiam arbustum audeo ambulo.',971.00,1,'https://loremflickr.com/640/480/business?lock=267076335828992','yes','2024-10-14 10:59:03'),
(85,5,2,18,'Electronic Frozen Chicken','Tredecim tersus infit. Aestivus volubilis allatus dolorum volutabrum considero. Turbo armarium color suus.',510.00,1,'https://loremflickr.com/640/480/business?lock=1354077436903424','yes','2024-10-14 10:59:06'),
(86,5,2,18,'Gorgeous Concrete Hat','Non via aeger titulus administratio capto textor adulatio. Cui solio uterque uxor. Ars patior vox.',899.00,1,'https://loremflickr.com/640/480/business?lock=6075203564077056','yes','2024-10-14 10:59:10'),
(87,5,2,18,'Refined Frozen Computer','Canonicus velum depraedor verus denique delectus turbo laborum ambulo cognatus. Venio aro bibo. Arto vivo cetera subiungo deleo neque debitis audio.',95.00,1,'https://loremflickr.com/640/480/business?lock=918261285781504','yes','2024-10-14 10:59:13'),
(88,5,2,18,'Tasty Wooden Chips','Auxilium eum solum aspernatur creator. Civis vilicus somniculosus color alveus urbanus ventus cohibeo. Adversus vigilo sordeo vulgus vilicus dignissimos verto ventosus triumphus aegre.',417.00,1,'https://loremflickr.com/640/480/business?lock=6176014885453824','yes','2024-10-14 10:59:18'),
(89,5,2,18,'Fantastic Wooden Shirt','Ager triumphus adeo acidus tenax clam abundans. Tego accedo ducimus volaticus tenax supra caput sortitus. Approbo denuo sortitus apparatus sunt sint alioqui arca volaticus denuncio.',535.00,1,'https://loremflickr.com/640/480/business?lock=7868552566538240','yes','2024-10-14 10:59:22'),
(90,5,2,18,'Bespoke Soft Mouse','Volutabrum atrox coepi desparatus conatus ullam aequitas bonus apparatus acsi. Vilicus thymum dens vox urbs. Curatio impedit cogito aptus congregatio solus molestias.',147.00,1,'https://loremflickr.com/640/480/business?lock=1084713137602560','yes','2024-10-14 10:59:26'),
(91,5,2,18,'Handcrafted Concrete Bike','Vado strenuus adficio vix auditor asper depereo vulgus barba carpo. Comitatus demo tabella aggero totam collum talio. Ulterius vita vomica undique adopto veniam credo abbas.',282.00,1,'https://loremflickr.com/640/480/business?lock=6515818898653184','yes','2024-10-14 10:59:29'),
(92,5,2,18,'Luxurious Bronze Sausages','Trucido dolorum adipisci decerno venustas. Subseco corrigo sponte harum aeneus voluptates attonbitus causa demonstro. Thema vomer condico.',503.00,1,'https://loremflickr.com/640/480/business?lock=1395831693377536','yes','2024-10-14 10:59:33'),
(93,5,2,18,'Modern Rubber Cheese','Voluptatem corona atrocitas thema audacia. Vereor aer conduco saepe cinis subvenio statim conitor anser cuppedia. Nulla sodalitas curto veritas.',234.00,1,'https://loremflickr.com/640/480/business?lock=1818801756700672','yes','2024-10-14 10:59:37'),
(94,5,2,18,'Oriental Metal Hat','Defero calamitas crudelis clamo chirographum creator. Tersus depereo amita adicio tibi dedico adeptio traho. Curto sub facere civitas aduro adsuesco aegrus.',261.00,1,'https://loremflickr.com/640/480/business?lock=5367787453153280','yes','2024-10-14 10:59:40'),
(95,5,2,18,'Practical Rubber Sausages','Bis iusto decimus quo conitor. Vis cunctatio tristis videlicet timidus. Admiratio clibanus tutis adaugeo ab carbo.',317.00,1,'https://loremflickr.com/640/480/business?lock=5134628553752576','yes','2024-10-14 10:59:44'),
(96,5,2,18,'Tasty Frozen Bacon','Arca ago tolero. Sono atqui impedit vilicus cogito adaugeo ustulo canto voluptates. Thermae vestigium auditor dolorem sui coniuratio acies dens stella cursus.',944.00,1,'https://loremflickr.com/640/480/business?lock=5750395984936960','yes','2024-10-14 10:59:47'),
(97,12,3,18,'Bespoke Wooden Table','Vilis stips vulticulus theatrum accommodo custodia. Virtus sub advoco pariatur. Bis tantillus vulariter conservo tabesco antea caries dedico.',525.00,1,'https://loremflickr.com/640/480/business?lock=5934752093700096','no','2024-10-14 10:59:59'),
(98,12,3,18,'Sleek Wooden Bacon','Cur adstringo caritas molestiae alveus tolero. Cunctatio uredo impedit sortitus. Appello stillicidium verto succurro sollers consequatur civis.',859.00,1,'https://loremflickr.com/640/480/business?lock=5593837950992384','no','2024-10-14 11:02:13'),
(99,12,3,18,'Recycled Granite Computer','Colo ambitus corrumpo. Acer alo deserunt summopere adfero crepusculum tabesco arceo. Uxor coaegresco adulescens urbanus verto pecus carmen voluptas quia.',610.00,1,'https://loremflickr.com/640/480/business?lock=7705971767902208','no','2024-10-14 11:02:14'),
(100,12,3,18,'Refined Steel Computer','Clementia recusandae voluptas laborum cado appono compello carpo adsum. Pectus timor sopor usitas conqueror clam fugit urbanus blandior. Magnam comedo assumenda cohors suus admiratio quos velociter asporto ventus.',140.00,1,'https://loremflickr.com/640/480/business?lock=3919262410342400','no','2024-10-14 11:02:15'),
(101,12,3,18,'Generic Soft Tuna','Chirographum tondeo sit. Ventosus ambulo strues ullus absum repudiandae pauper strenuus veniam complectus. Adsum spiritus consequuntur curis conventus depopulo esse patruus.',461.00,1,'https://loremflickr.com/640/480/business?lock=7253208713920512','no','2024-10-14 11:02:16'),
(102,12,3,18,'Awesome Fresh Keyboard','Curiositas perspiciatis tergeo ambitus dolorum tenuis tam custodia. Cauda voco bos vereor dedecor apostolus capillus utique. Defetiscor talio vespillo fugit adfero perferendis.',171.00,1,'https://loremflickr.com/640/480/business?lock=7974628299374592','no','2024-10-14 11:02:17'),
(103,12,3,18,'Unbranded Plastic Chips','Praesentium alter amplexus. Cribro spes caritas virtus bardus arma paulatim demo. Provident doloremque studio allatus officiis numquam corrumpo doloremque.',711.00,1,'https://loremflickr.com/640/480/business?lock=8401397561163776','no','2024-10-14 11:02:18'),
(104,12,3,18,'Bespoke Frozen Sausages','Aestivus usque curia textilis conscendo thema termes cotidie patria. Ventosus xiphias clam terga occaecati cunabula praesentium thalassinus careo. Cursus color valetudo vester eius volo vociferor.',927.00,1,'https://loremflickr.com/640/480/business?lock=628801794998272','no','2024-10-14 11:02:19'),
(105,12,3,18,'Refined Bronze Fish','Virgo totam canis ex claro adulescens cursim stips. Accommodo beatus peior. Vere tardus bestia theca tres.',958.00,1,'https://loremflickr.com/640/480/business?lock=6390465433698304','no','2024-10-14 11:02:20'),
(106,12,3,18,'Practical Metal Table','Adipiscor ubi solutio texo adduco amplitudo. Currus colligo copia quam termes. Id aequitas amet solio sunt dedecor adsuesco cito deprecator harum.',865.00,1,'https://loremflickr.com/640/480/business?lock=360861950541824','no','2024-10-14 11:02:21'),
(107,12,3,18,'Fantastic Granite Cheese','Confido tres caelestis spiritus tracto cito ulciscor deduco ait peccatus. Caterva victus illum tondeo cunae comitatus viridis curia. Accommodo dignissimos conitor una despecto rem.',583.00,1,'https://loremflickr.com/640/480/business?lock=5748696517967872','no','2024-10-14 11:02:23'),
(108,12,3,18,'Small Frozen Shoes','Autem vel appello curvo adversus. Quibusdam canonicus spiculum trucido quae socius thema testimonium cultellus. Culpa cum cruentus vulgivagus abscido.',32.00,1,'https://loremflickr.com/640/480/business?lock=3582459897708544','no','2024-10-14 11:02:24'),
(109,12,3,18,'Gorgeous Concrete Towels','Audax pauper undique at urbs. Corpus stabilis vulgus credo ademptio collum nihil. Aeneus censura veritas claudeo bibo.',696.00,1,'https://loremflickr.com/640/480/business?lock=8132614906970112','no','2024-10-14 11:02:26'),
(110,12,3,18,'Fantastic Rubber Tuna','Velum celer strues debeo. Cultellus derideo abutor atrocitas minima laboriosam blanditiis caste. Bene voluptate accedo audacia turbo.',4.00,1,'https://loremflickr.com/640/480/business?lock=8304926222450688','no','2024-10-14 11:02:27'),
(111,12,3,18,'Intelligent Wooden Bacon','Comminor cernuus suppono adficio demoror venio conitor. Sub tracto desidero carus tamquam acsi apto compello est. Viduo voluntarius advenio vobis solvo carbo.',55.00,1,'https://loremflickr.com/640/480/business?lock=6940471383293952','no','2024-10-14 11:02:28'),
(112,12,3,18,'Small Cotton Ball','Vomer curriculum aliquam adversus deleniti suasoria avarus varius voluptatibus vis. Utilis commodo attonbitus tabernus caelum vorago utique civis non odio. Video atrocitas nisi non canis.',741.00,1,'https://loremflickr.com/640/480/business?lock=8394725117657088','no','2024-10-14 11:02:28'),
(113,12,3,18,'Handcrafted Cotton Gloves','Amplexus damno tandem tergum omnis valde nostrum demitto aqua. Arbitro compono angulus aegrotatio. Explicabo creber censura validus decet depopulo arcus vacuus ciminatio aufero.',724.00,1,'https://loremflickr.com/640/480/business?lock=265598403608576','no','2024-10-14 11:02:29'),
(114,12,3,18,'Rustic Rubber Shoes','Voluptatum conspergo complectus. Dolor cervus mollitia iure quam speciosus. Ad vomica artificiose umbra.',635.00,1,'https://loremflickr.com/640/480/business?lock=5589999569338368','no','2024-10-14 11:02:30'),
(115,12,3,18,'Intelligent Wooden Bike','Arbustum clam caelum. Coerceo cinis tremo. Utpote in victus patria adeo convoco ventito.',679.00,1,'https://loremflickr.com/640/480/business?lock=8121653986852864','no','2024-10-14 11:02:31'),
(116,12,3,18,'Ergonomic Cotton Table','Cauda absorbeo corrumpo crebro cresco strues texo fuga. Adficio porro claro verus aperiam. Vilicus valens tempore.',413.00,1,'https://loremflickr.com/640/480/business?lock=2944661649883136','no','2024-10-14 11:02:32'),
(117,12,3,18,'Modern Concrete Keyboard','Audeo carbo laudantium desolo. Termes sollicito succedo sono depereo amaritudo dolore. Celo absorbeo defleo verbum eveniet acies adflicto.',478.00,1,'https://loremflickr.com/640/480/business?lock=1806274721218560','no','2024-10-14 11:02:34'),
(118,12,3,18,'Intelligent Metal Fish','Quod acquiro explicabo tergeo triduana adfectus. Ademptio termes voco corrumpo fugiat cenaculum quo. Custodia surgo carmen tres supellex vicissitudo.',344.00,1,'https://loremflickr.com/640/480/business?lock=8840269319372800','no','2024-10-14 11:02:36'),
(119,12,3,18,'Oriental Wooden Salad','Cultellus arbor voluntarius appositus speculum doloremque stabilis pecus terra. Aeger verus desolo ocer calculus spiritus. Toties supplanto curtus adicio magni thesaurus coniuratio dicta theatrum stipes.',377.00,1,'https://loremflickr.com/640/480/business?lock=8893608736325632','no','2024-10-14 11:02:37'),
(120,12,3,18,'Tasty Frozen Fish','Asperiores porro unde candidus dapifer suppellex. Adfectus clibanus adfectus vivo audentia vorax derelinquo ab studio. Super bardus defetiscor cilicium contra vivo titulus audax ater.',939.00,1,'https://loremflickr.com/640/480/business?lock=8966538451222528','no','2024-10-14 11:02:38'),
(121,12,3,18,'Ergonomic Fresh Shirt','Talus aro tyrannus cattus commodi iusto debilito cupiditate armarium vilicus. Venustas depono aqua usus apparatus defaeco. At crudelis ustilo caelestis tergeo conqueror creptio.',124.00,1,'https://loremflickr.com/640/480/business?lock=3566288473423872','no','2024-10-14 11:02:40'),
(122,12,3,18,'Generic Bronze Chips','Vel illo attollo volaticus convoco speciosus amaritudo surculus. Vobis eum clamo excepturi condico. Sollers ubi tricesimus harum dolorem.',693.00,1,'https://loremflickr.com/640/480/business?lock=4650507652038656','no','2024-10-14 11:02:41'),
(123,12,3,18,'Gorgeous Metal Tuna','Tepesco nihil sequi varius trans pecco curso amplexus spiculum volup. Synagoga sequi vereor recusandae cupressus complectus acies amicitia tempora crux. Vindico tutis degero corrumpo coaegresco valeo verecundia somniculosus.',781.00,1,'https://loremflickr.com/640/480/business?lock=604914900271104','no','2024-10-14 11:02:43'),
(124,12,3,18,'Ergonomic Cotton Pants','Angulus aqua taedium. Absconditus canis artificiose cotidie antepono vereor. Vindico comes decens confugo.',662.00,1,'https://loremflickr.com/640/480/business?lock=8015480879054848','no','2024-10-14 11:02:44'),
(125,12,3,18,'Electronic Fresh Mouse','Derideo uter aetas. Cibus convoco demitto caries coadunatio valens cohaero. Molestiae vulgus timidus acidus.',392.00,1,'https://loremflickr.com/640/480/business?lock=5238012124332032','no','2024-10-14 11:02:45'),
(126,12,3,18,'Handcrafted Cotton Towels','Bis atrocitas nulla rem inventore vae balbus cetera. Alter deripio deinde cupiditas. Adhuc in somniculosus certe basium titulus tibi.',541.00,1,'https://loremflickr.com/640/480/business?lock=817401232883712','no','2024-10-14 11:02:46'),
(127,12,3,18,'Modern Concrete Mouse','Stillicidium texo ipsam amet eum abeo abduco vinum demonstro debeo. Defungo coadunatio patria. Unde id cometes crux asporto atrox thermae dens.',954.00,1,'https://loremflickr.com/640/480/business?lock=2787160316968960','no','2024-10-14 11:02:47'),
(128,12,3,18,'Sleek Granite Towels','Qui deserunt absorbeo demitto neque. Contabesco damno vitiosus acsi velit utroque circumvenio terebro. Decimus vapulus usque comburo demergo astrum tenus.',742.00,1,'https://loremflickr.com/640/480/business?lock=7708894444912640','no','2024-10-14 11:02:48'),
(129,12,3,18,'Tasty Wooden Fish','Tam agnosco repellat cervus. Desipio utique solio cruentus suadeo eveniet. Depulso vilicus cupiditate stipes vox vel nobis templum cena.',184.00,1,'https://loremflickr.com/640/480/business?lock=4946329109266432','no','2024-10-14 11:02:49'),
(130,15,7,23,'Context phone 101','A good phone for use cheap and affordable',221.00,236,'https://plus.unsplash.com/premium_photo-1680985551009-05107cd2752c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHBob25lfGVufDB8fDB8fHww','no','2024-10-24 10:12:53'),
(131,16,12,23,'Inifinix Hot 40i','\n\nInfinix Hot 40i key features\n\nDual Sim, 3G, 4G, VoLTE, Wi-Fi, NFC\nUnisoc T606, Octa Core, 1.6 GHz Processor\n4 GB RAM, 128 GB inbuilt\n5000 mAh Battery with 18W Fast Charging\n6.56 inches, 720 x 1612 px, 90 Hz Display with Punch Hole\n50 MP + 0.08 MP Dual Rear & 32 MP Front Camera\nMemory Card Supported, up to 1 TB\nAndroid v13\n',126.00,400,'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxIQEhUSEBIVEBUVFRUWFRUPFQ8VFRUVFRUWFxUXFRUYHSggGBolGxUVITEhJSkrLi4uFx8zODMsNygtLysBCgoKDg0OGxAQGy8lHyUtLS0tLS0tNy0tLS0tLy0tLS0tLSswLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLf/AABEIAOEA4QMBEQACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAABQECAwYHBAj/xABREAABAwIBBAwGDwQJBQAAAAABAAIDBBEhBRIxUQYTIkFhcXOBkZK00RQVMjVTsgcWJUJSVHKTlKGxs8HS0yOCpOEzNENiY2Si4vAkdIOEo//EABoBAQADAQEBAAAAAAAAAAAAAAACAwQBBQb/xAAzEQACAQIEBAUDAwQDAQAAAAAAAQIDEQQSIVExM0FxEyIygdEFYZEUUrE0ocHwQkNyI//aAAwDAQACEQMRAD8A7igCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIC2SQNF3ENA0lxAHSUSucbtxPL4zi+ETxMkI6QFLKyPiRHjKPW7qS/lTKx4kR4yi1u6kv5UyseJEeM4tbupL+VMrHiRHjSLWepL3JlY8SO5TxrF8I9STuTIzniw3KeNofhHqSdy7kkPFhuUflmAC5fYay2TuTJIeLDc8LtmOTwbGriB1OdYjjB0KNiWZFfbhk/43D1wljt0Dsxyf8bh64Swui3255O+OQddqWFx7c8nfHIOu1LC49ueTvjkHXalhcuGzDJ/xuHrhLC6HtwoPjcPXCWGZFWbLqBxDRVwknQM8XKWGZExDK14DmODgdBaQQecLh1O5egCAIAgCAIAgCAIAgISFm3TvkkOc2NxjiYfJBbhI8jfcTcA7wGGkq21o6FD80rvoex1WSbRi/D3C4w4b8V1Xl3JXMTpHjTI0fvM/Illscuy60ukPvxFn5E02ONsscZR749LP011JFcqliIqDXZxLJY82+Acy5A4XAY9CuioW1Mk68r6LT/fuIsrTMNqmMW+HFew4wcf+aFPIv8AiV583clg+4uDcHQRvqJW2cZ9kmpqa2tbSxPLWBzmhpvmARtaZZXj35u8NAOGB41zK5yyI9HDU1CGd8WYYdhlhjW1d/8ADkDBzNsbLSsHDdl3isy+1H/PV3z/APtXf0cN2PEZbJsODhZ1bWuB0h04IPGC1P0cN2PFZh9oUPxip68f5E/Rw3Y8Vnm9qdJtu0+Gz7ZpzNsjztGdozNNje2m2Kj+mpXy31O+JI9PtDi+M1Xzkf5FL9HDdnPFZmZsPDRZtbWtA0Bs4AHEA1P0cN2PFZd7Uv8APV3z/wDtT9HDdjxWYpthucP67WE/4koe3nbYXR4OG7His9vsV1lTQV5pJZC6NxawtF8x22B21SMHvDdhaRoxHGsc4ODysnf/AJI7qqSwIAgCAIAgCAIAgCAg6SwZMTo2yc8dnuuOgK9vRGdaXb+5qOz/AGYOyZTgNsZpSbXGAAtnOt+80AaMdTbGFS3QrwqlJOUupw7KWzCsmkMhnlad7Nkm3PFY4c1lXdmuyOg+xZ7I0zpRTVchkz75jneVcAkhzvfYAkE47mxJuLTj5tGU1VlV0dkdc6cFNJIwvNLiUt9mICXOZepbNEHCxCknZnJQurrieXJW5zo/gkFvA118OsHc1lKT1uVyjezOZVQ91n8lU9pYpYbmvt8HpR5USazV6BArmoBmoBmoG7K5FMyTTmfwnNO2acXHNDszMvm3tfNwVrwfmzIy/rF1RLxx52gjnSVKSJRxUGZZaJ7W5xGGsEFVX1sXRmnwPPmoSKZq6CFox7rx8nS9pevOxXMXb5Loen3O4rGXBAEAQBAEAQBAEAQGumS0bwNO3VHrSK9LgZaj8krfc5D7O1PIXwy2JbmFhI0BwOdjxgnqHUoVF1O4WV4WfE5ZBWNaxzCxrrm4dYZwNjhnbzccRv2Cinpaxe1d3uSuwClfLXQBgvmvDjxNxN+M2b+8F2mvMiNV2gz6tbmAadFsUtIzJQfAhptlNAx+YaqEPva22RXvqIzr34F3U74NndEtC9rxnMcHDWEu1xI5Ty0TP2z/AJDPWkU5vgVRhojl9QPdd/JVPaWKzDcx9vg1/wDWidzV6BWVzUBXNQFsmC6iqs7KxFyus8jXiPx7+denR1h2POmtTPDLZdlErJJldhY6CLLJOjqWRruJizVnas7HqRkpJNFM1cJEFSj3Yj5Ol7S9ediuYu3yXQ9PudvWQuCAIAgCAIAgCAIAgNWIuHjXPOOkvWrhFP7GOaumu5fl7Y/BWQGGVoLSN+/GDfTcHEEYhUqTb1ORioJZdDkVb7DYEhzKkht9DmNcesC31VNUU+DEsao8UdE2HbBYaGPPjOfJYbpwbcgXsDhoxNsO9d0g7EJSlWjmT9iM2ZVUlRUQZNieYBMHPne04thYCXAcea/oA0EqutLKW4WF1msaFUZaoAY44cn0s9M5pvLJJI2doB3RfJ/ZusWnNt76wVGV7my5sWwytNBXspI5XTUlVBHUUxk8pscmhh4Qb9H94q+lLMnHYzYiNlmOoZPd+1dybPXkU5ozQflRzGYe7D+Rqe0sVmG5j7fBpfLRsAat5UVzEBXMQHkqXY8SsgjLVleRD1Um6B1H6t9elRVtDFUlZ3MzXKxoNFzZFFxK2iQpX3FlhxELPMbsHPRwZnLVlNpr8A92I+Tpe0yLBieZ7fJdD0+521ZC8IAgCAIAgCAIAgCA1sgZmcN+om0/KkVybvb7GSXBv7mTLGVYqWIyTODGi2J1nAADfJ1fzI4lYJOWiOWZV9lmJkhbHCZG38rbQCeYRuA4rrvjW6HHg4vizd9gezanrwWxktcNLH2DhfRoJBGojiIBsDKTU1dFcaToO3RkN7JMMtHWU+U4ozMyMOZNG3S6JwIdbiBcecHQCqpRzR7GqEsrtuc/Zk/JxcZm5RphSFhb4PNHJt7AcQNrHlyAgbvfVOZ3tYvsT2xCM19eyqijdFSUsEdPTCS+cWR6HOO+Sbnn4FpoQt5jHiqitlOp0D/2h5Jn3kqta1Md/JE5zpyw/kantMaUOY+xu/6kbKGLcVlwYgKPFgTqXUruxyTsrkTUOwWuEdTA2Q1Y5bqaMdZ6GGlq8LE6MFplC+qFKpeKueuOS6rcSzie+llsQVmqwzKx2EnCSZLWuvKejseqndXRrjTbLEZ/wqU/xMiwYnmLt8miHo9ztiyF4QBAEAQBAEAQBAEBrTz+y/8AYm9aRaEvN7f4McvT7nKPZ3yi/PhiBIbml3AXE5v1Bv8ArOtV1OhbQ4XORBtw45wFrYG9zfVxfiqy8ltiOUpIKljo3FpB3j9vBgDzKdP1Irqq8GfWjQ2Vma9ocCMQ7FSaaehmpTUo2Zq2UPY9oC4yimYXXviBp47XU4TTeqX4I1ozivI3+T0U8TYxmsaGAbwFleYMxlozu/8AxN+8lXLasnL0RNCgF8sP5Cp7TGoUeaz0VyYm1hi2EC4MS4PNXmwA1q6iru5RXlZWIWrK2QRjkyEr3LbSRhrvQgpDdy9CKtEhHSJ6IhZVTkVOR6IXPJAaXXJAABOk6FnlJJXZ1Sm3ZM36mgzGNaSXEAAk753yvBnPNJyPo6cMkFHY1x+GWGcjTdpkXn4jmLt8mqPoZ2tZDQEAQBAEAQBAEAQBAaztedTvI97LK7DHDbHh2G/uSVpvaRky3gzSfZJ2N+MYQ+O23RgltzYHOAzmk6jmtIOgEanErs6d0VUayi7M4dU7H6uN2Y6nlB5OQ34i0EHmWfJLY3KcX1N69j7YLLtzJqhhYxtnEPFiT8ED/mBO+rqVJ3uzHi8SlBqJ3ujmU6kTDhqhItN1nZ6kXdEXlOi981X0qnRmHE0GtYkdQYlzhowY06wy9yODOc+x1WVq3Kaulo7I0WjF8sP/AO3qe0xqulzWelHkxNxDFquRLgxLg8OVI7LTQehhrO8iAqVtiZpM17Kj7LfQjdmKrrJIjoI7rZOViL1PSWrLJlL4k9sSoc+QyEYM0fKOjoF/qXn42pljl3N/06lmnnfBfybaWryj2zUqnDK7OQpu0SLHX5i7FseWztayGkIAgCAIAgCAIAgCAhckizHA70sw/wDo5XvUojojw1mTSDeK1vgOJFvkuF7DgII1WVsJNFFWjGR4DSG+MLyf7ogP1lw+xWZvsZ/Bt1Z5iKoE2gFrm13sBtvXGtdzIqlS+566aerb/Yf62d6jJpkIUsr0ZJQ19T8XPWjt6yqcYGuE5IyGnnmwmcI2b7IyS48BdhYcWPCo6LgXXb4maWmDQA0WAwAG8FZCRRVpXOXwTiPK7yQT/wBPUjDX4TGu0IOVVpF85qnRi2bBLlB7vJ3A4MT0r0o0YrjqYZYicuGhWhe4Ove99N98KdSCcbHaTkpXPZlMhwuN9V0FbiUV35tDWqq69CKRS2zWq4Zz7al6NFZY3M1nJmenhACjOV2WqCSKOZcqu5lqRuzfsj0G0RNZv6XfKOnowHMvCr1fEm5Hv4aj4VJR69e56XNVJeafVNJywwDSYKYC/DUyLHXf/wBF2L4K8H3O0rKaAgCAIAgCAIAgCAICFye7cv5ab7xy0W4FC692XyFWIhIwlTKmW3QokZGOUWipmdjlBosgzK0qDNUGXEXQsauccqiBld1/RVI/iWK/CStWfb4K68L0kvv8mwtavWuY1TM8OCPUuUAJs7DUmWxkxENbkXlAWutVPUzPgQMdISblbnUSVjkYWPS6nwVWcSPfsbydtkwJG5Zujx+9HTjzFZcZVyU9OL0J4WjnqXfBa/Bubmrxj2DE4Lpw06owy1HyNL2mRY6/r9vkvp+j3OyrMXhAEAQBAEAQBAEAQEFQHcv5ab7xy1W4GdcPcveVNEZGIlTKmWkrpTIua5caKGZmOVbRKLM7XKDRqgzIComhHG6/zs/kqntLFbhuY+3wJryLuTsEu8ebuXqQZFU76npvgrkdyHiZNmyAHfw7le43gU16N4Mtyk4YDWlHc8eWjMMEYKskw2eh8KqzlbZseRKHaohcbp26P4Do+0rzMTVzz+yPXwtLJT14vU9j2qgvMLmqRw0us89R8jS9pkWSt612Loeh9zsizGgIAgCAIAgCAIAgCA1+gOD74ftZfvHLWuhmXXuy95ViIsxkqRUy0ldKpFQVxopZlY5QaOIzMcoNGiDMzSos0xZx6u87P5Kp7SxTw3Nfb4LH6USjl6US6mjPBUXFjp+1aIl7pdUeDKDrY6it1JX0JRo30Mc1Ttjr6NCKk4qx4NX6TXzPLb8klk6HPcGgtBOAzjYX41nqyyptoqf0zEJdPye2oljhcGuG2uB3TYzgOAuOF1RCE6qutF9/gUsDK95Hvj2QZ2mKw4HgnosFQ8FbhL+x6qp36nvgqmSC7Txg4EcyzTpyhxIzpyjxKvCiUs0evHu1HbH9hS9plWWt612Loej3OyLMaAgCAIAgCAIAgCAIDXaU/wBJy033jlsjwRm37sueVYkQZjupFTLSV0qZUFCtmRjlFogZmOUGi2DMzXKDRqgzkVd52fyVT2li7hua+3waVrFEk8r1Io0U0YHu1K+KN1NFKpwe069/vWui7MujCz0I9gDe5a22xNx6kjk4F51NH16lmrNRX3MtSayux65ZBoAVMU+LMFipbYYJe7OntyZPuhvHeP4FUVoaFkWnoyebUAkt0OG8fw1rzpU2lfoYJrLJxNOrfPcXI0vapVhrev2Lafp9zsKzl4QBAEAQBAEAQBAEBrdOf6TlpfXK2w4Iy9X3YcVakQZbddKpFLrpUygKEC9pUWRMzSotEomZhUGjTBnLhSGbK0gbpFPUuA12qY8PrUaElGq7myLtFHpkwXswRrgjzSFaIxNkGeeV28Oey00o9WQxWIjSjq7FkMVzjoVsppLQ8Kt9WprSOvY2g0DWRh0ZzgWgkjhXmeO5TtLc2UqqqU7p3ItjDdam9CZIxU5dvLPKaQsSlFkrN3TsFkq4i+iOnly660xthYN0a7XVuFV6ep5+L9fsaxBO5+WIi7EiKlF9f/UyaeleXjoKFWy2+Syg24a7/B21YDUEAQBAEAQBAEAQBAaxCcZOWl9crdT9KMj4vuVcVaitlhKkVspdCti66VlzSo2OGVpUWiSMrHKDRfA57kuoZHlmR0jmsHg1Ti4gD+tRa1VShKVRqKuapzjCmnJ2X3PTskyjTOfnQuLnHy7AhpOsE769zC4eqlaeiMb+tUaSsry7fLNdkqydAsvQjTSMNb69iJ6QtFfl/l/BY2e+lTynnyxEqjvNtv7maOVRcSDmuhOZGyhmHMf5DsMfek/gsdejmWaPFHpfS8Z4U8k/S/7MlDE1pxCzZpNH1Nj3U8zG6LKmUZM40VqMoi1ycB9fAOFIUHexx2iszNfmqDI4vdpcb/yXoRgoRUUeTUlmbZCUPnePk6XtL14v1HnLt8mjD8v3+DuS801hAEAQBAEAQBAEAQGrRHGTlpfXK9Cn6UYpcX3BKtK2WldIMpdCtlLrpWy4FcBkaVFomjK0qDRbE5BsiPukeTn+/ar/AKZ/Uy7P+UUfVlfCx/8AS/hlpcvoD5ywAXUjpc1ikcue+konnet8rD+aqnUiiyMWeyopS1um6qjUTZOSsiVqg6JrC3dNLW4PxDSQNG+As9PLUbT4n0lDEzpxWvRHmOUTvNaOt3qzwFuaXjZdEjEXPfib8+ACk3CBmnWlPVsvYM3h+xUSqt8CrMRNAb5Xj5Ol7S9eNjuau3ybMNy/f4O5LAbAgCAIAgCAIAgCAIDU2HdS8tL65Xo0vSjDP1PuVVpU2WkrpBlLoQZS66VsqCuBF7SuMmjK1yg0XI5Ll9hdlI23opz/ABDe9W/TGliZX2f8or+pxcsKrdHf+T1QZNe73thrdh9Wle86sYnzNmz3xZHA8o34BgFU8Q+hJRXU9kFEG6BZVSqtlisuB7GRWVTkLllWy7V2D1IzehJ1kOdGB/dH2LPTladz6HLemuyNfpmjEEXIO/q3sOlaq05LhwIUpNqz4ozOKzlhYVIiRGTvO8fyKXtL15WO5q7fJuw3L9/g7msBsCAIAgCAIAgCAIAgNRad1Ly0vrlelS9CPPm/MypKtKi1dIsohBlF0gyoK4cRcCuE0ZGlRLonMa8e6buQqD/EMXMD/Uvt/lE8Xrhv92ZsoXqnyxe0KLBeFwFy4SSb0RgnkaRbOCnGMtiUqE2iYkka5ozHB2AvbeNlkipRfmR9FFpxVtjWq05kzTvPu3n0j7Lc622zU+xmayVF9zI5UFxYV0iROTfO8fyKXtD15WO5q7fJuw3L9/g7osBsCAIAgCAIAgCAIAgNPB3UvLS+uV6dL0I86p6mZIm3cBa+OOn8FOTsitasVLM02AIwHlAg84SDujk1ZmEqZUyhK6VsqCuHC4FcLEXtK4WxOb1XnN3IVHaGKvBf1Eu3+UXYrkR7/JsTDgF6zPlTI1RYLjhiVxElFt2IWtr87fsBvLXTpWNkUorQj5KhxBIV6ik7Mlm6lcm5UeHakq0YtHadR3uiVyuNtizm+ULOHGMVlpeWWV8DXN+JDMuKLoZg9ocN8ArNKOVtMtUlJJoFARWTfO8fyKXtD15OO5q7fJuw3L9/g7osBsCAIAgCAIAgCAIAgNO9/Ly0vrFenR9CPMq+tmSAjOBOgEE3tovw4Kc+BCL82pZI+5ve/GA36gpRWhCbuyxSK2UQixdCJcCuE0XtK4y2LOb1fnM8hP2iNV4H+pl2f8o0YnkR7/JsULhmjiC9WS1Pl5K0mi4yplCRgq3EsdxfiFOCWZF9NGrPcXutfBegtEHdkpBTblZpT1L46RLG0VipeIRjoSdN5JGr8VmqPzI24bgzFTtzbtGi9xz6fr+1Qq6u5dGOVWMhVYIvJnnaP5FL2h68nHc1dvk3Ybl+/wAHdFgNgQBAEAQBAEAQBAEBph8uXlpfWK9Sj6EeVW9bLJ/JPFw/grSq4j0fyI+1dIsrdCLKXXSDF0OFwK4SReCuFqZoAAOVHA6DT1A/iI1loNqu2jfNXopEzDTkCxOi/wBq9eVePFHg/oKkpvoj0MiaNOPGqZVpPgbKeCpx46l1UwPY5mi4w495RpzcZqTNE6alBxRpToXMkxG/iveUlKOh42RxlZmz5OjDgvPquzLUZqqNrBcqMW5M5YpTR2bY6XY8WpZ6tS89Oh6VCnlhr1PBJuX48XSrk1KJJoyFQIkXkvztH8il7Q9eTjuau3ybsNy/f4O6rAawgCAIAgCAIAgCAIDS3eXLy0nrFerR9CPJretlHC+Bx41aUlAANAtxLpFhDjKXXSDCHC4LhJFwXCaZz9zrZUPIT9ojWShz5HpvkxJ/bFusUDbEsBtiWB56qnZJpGOsK6lWlT0XAqqUYz4lsMbmeS7pVsq8ZcUU/pfuX2ubuOcd7UOZVSqtqy0RbChGOpeZFTYuMFUzPHDvKcJZWRauYWOuMdO/x76uKmR+S/O0fyKbtD15GOd6q7fJuw6tT9/g7qsBrCAIAgCAIAgCAIAgNKd5cvLSesV6tDlo8ivzGFcUFEOMoukSiHGUXThcCuHS5cJI5rlOuZDlRmeQ3bGTxgnAZxla4AnhsOkLFRko13fqeqleirGwbYvRsUDbF2wKbYlgNsSwKbYlgU2xLAoZFywKbYlgUz01FiHyBWslyuMwh2Z4NGSMRniZziOa/wBRXl4mSdTTojXTVoa7nfVkLwgCAIAgCAIAgCAIDT8tUz4JnPLSYZN0HNBO1ye+DxqOkHWbLfhqqtlZ52KpPNmXA822t1jpC2XRisxtg1jpCXRzK9i3bBrHSEujmV7DbBrHSF26I5ZbFNsGsdIS63GV7FRINY6QuXQyy2LxINY6QuXR3K9jlXsobGpZJNtibtjHEuuy7ixxADw4DHNOa0ggYWPN5+Jp+bMj1MJVWXLI0yKHKLdy2Z7QMLeEsbbmLxZUqrNaZn+TXki+hm8Hyp6d/wBLi/UXfGqfuf5GSOw8Hyp6d/0uL9RPGqfuf5GSOw8Hyp6d/wBLi/UTxqn7n+RkjsPB8qemf9Li/UTxqn7n+RkjsPBsqemf9Li/UTxqn7n+RkjsU8Gyp6Z/0uL9RPGqfuf5GSOw8Gyp6Z/0uL9Rc8ap+5/kZI7GOamyidy+Z5B3vCY3X5g83R1Zvq/yMkV0Oi+wlsMqBOKiaMshYc8OeCDJIAQwMBxzRnOJJGOHGo2txOXzPTgd6USYQBAEAQBAEAQBAEAQHmOT4TpijP7jO5SzPcjkjsPF0Poo+ozuTNLcZI7DxdD6KPqM7kzS3GSOw8XQ+ij6jO5M0txkjsPF0Poo+ozuTNLcZI7DxdD6KPqM7kzS3GSOw8XQ+ij6jO5M0txkjsUOTofQx9RncmaW4yR2LPFNP6CL5uPuTNLcZI7FfFNP6CL5uPuTM9xkjsPFNP6CL5uPuTM9xkjsPFNP6CL5uPuTM9xkjsPFNP6CL5uPuTM9xkjsPFNP6CL5uPuTM9xkjsPFNP6CL5uPuTM9xkjsPFNP6CL5uPuTM9xkjsVbkuAYiCIHgjj7lzM9xkjsesBcJBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQH/2Q==','no','2024-12-01 16:35:49'),
(132,16,9,23,'Inifinix Smart 8','Features\n1. Dual sim 3G 4G WI-FI\n2 . 3GB RAM\n3. 64GB inbult storage\n4. 5000 mAh battery',110.00,399,'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBISFRgVERISEhIYGBESGBISEhERGBERGBgZGhgUGBgcIS4lHB4rIRgYJjgnLi8xNTU1GiQ7QDszPy40NTEBDAwMEA8QHhISHjQsJSE0NTExMTc0NDQ0NDQ0NDQ0NDQxNDQ0NDQ0NDQ0NDQ0MTQ0NDQ0NDE0NDQ0NDQxNDQ0NP/AABEIAO4A1AMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAAAQIDBAcGBQj/xABKEAABAwEBCQkLCgcAAwAAAAABAAIDEQQFBhIhMUFRcfAHMmFyc5GxtNETFCI0NVSBkrLB0hYXI0JSU4KUoeEVJTNiorPxQ2OE/8QAGgEAAgMBAQAAAAAAAAAAAAAAAAIBAwQFBv/EAC0RAAICAQIFAwIGAwAAAAAAAAABAhEDITEEEjJRcRQzQSJhBRMVgaHRI0Lw/9oADAMBAAIRAxEAPwDZkIQgAQhCABCSqEAKhIhACoSIqosAQhFVICoSVSoAEISVQAqEiEAKhIhACoSIqgBUIQgAQhCABCEIAEIQgBFHK+mTKVKqto3w1HpCWT0ATWSfTToUbwQM/rFNtVrjgjfLI4MYxpcXHI1ozrMrsX52yckwu71hytoxr5XNzOeXVDK6AEqi5bBzKO5oU9scw0DXO1OKdFaXux4L/WKxf5XW2F2F3wZQDUsmYx7TwVaAQtQvNvoiujEXMb3OVmCJIialhOR7T9ZhoaHgoq5Ypx3YylF/B0THk/VI1uKkA1+sVGCo22tpdg+FjyOI8E46YjrS9K1ZO+yLeBr53dqz7dIvzlsWDBZR9O4Aufjf3MPJDA1udzqGmimQrQGvWVWqASXb8PGGTSPAOPGyyxFnMXkp1JJN9gSt0eTZ7mXwSgPdI5hOOk1rmY7WWscA3VQKX+BXf++Z+dtfxrTAhY/WT7I0+niZp/Ab4PvmfnbX8ajde7fAclpweAW20UHOSf1WnpVK4uf2J9PEy75N3w+dn87Ol+TV8PnZ/PTrvb4oZpLNKyzOwZnMowh2ATjGE0O+qSKgHMSvCvAsFshbL30HxxuLO5xSPD3NcMLDcPCdgtNWDLjpWmm2OduLla0+Ct4YppanP/Jq+Hzs/np1ILgXwffs/PWv41plUFyT1UvsP6eJmf8AAb4PvmfnbX8aR1wb4Mvdmk6BbrUD+r1puEiqlcTLsg/IiZze1fvdCx2kWa6Ye6Mlod3ShfE1xAEjXjfMBpWtcRJriotnBWTbplla8WdxAwsK0RVplY6F7iNVWgrTrkuLoIicZMcROstFVshLmimZZx5ZUXUIQnFBCEIAEIQgBFTtrqGuhrjzUVxUbe2pppa4c5CSewHA7o10D3tAyvgSS1eNLWNc4N1VA5lnFpum6haHUDstKGq1q/i959pshZEKzRkTMbneWg4TBwlpNOGiwS0SHGHAggkUIIIIygg5CNCbC6ikLJWye1yFrspLTkJ+sMzhwLoNzK3uiugwAkNeJInjMWlpcK6iwLlonso7DwnPyNzrQNyi9x8khtT2kRMDmsOaSV2LwdIaK49LlMnoyUa6LUFDHGwODstKFrSN66pOEOHHRcNfBfBMZjZbAC+QOMbpGtw3F+djAcWLO44lXdezd0DDZO4yDH3PvoYR4KEYH6qj8lyVsbnrRGnNlWcNP85dx7T1WBJehflK+fvO3sMdowixry3AJeP/ABvbkDjmcMR5qow/zg8e0dVgVck4xafYeDuSO3BSpmElquajpD6oqmYSQvTEUPJSVUWETkTsHSfQO1TFWQ2kKXIBrmSYWgDpSGUZz70zpbsi7JKHgHpSgcPMoO6aB7kF508yR5oR+4csjlt0amBZuWk6vKtFuL4vDyUPsBZnf/vLPysnV5VplxPF4eSh9hq6nDS5saZhzL6mX0IQryoEIQgAQhCAEVW074aj0hWlVnPhDUekJWQxJMq5O+e8yw2wmSSLAlOWWJ3c3P4+Zx4SF793rqMskT5pKlrBiaMr3nE1jeElZDde6VptmE+0SOLRjELHlkcY+yAN+RnJRGLa0Fbo6S5O5zc9rsJ4kmp9V7xgfiDAKjgK7i0NEUL+5tawMjeWNaKBuCwkABfP3fz4nYdnfJE8Yw6N7mnmrQ+latue34fxBrobRg98sbU0GCJ4t6XUzEEgED7QOeihxcd3Y0XZzV5dpdDYrdbYwHWiNgDXOGEWFzcNzqZ8ZqeKuRkuhPhmeCacTNb3QvfN4YcKlz61o5ufB0Zl0sr5737W8PiM1gnqzBxYMkWMhoJxB7QSME74Hmidar2Wu7sxlred93oWyYNcoaQcRbwYVE92RQbpc+H3hbA3udpkgEjwBQ4TBG9jvwuJHMvZheXXWLjiJdMTrNkgJXj2CK0Xft7Z3x9zscWC3Bytjiaa9zByF7jlpkGpe48fzh/HtPVYFRlf0vwy3H1I7HCS4SZVNJXITOoSFyaDU5acPAmVUHfFBXK45BobmJQ5UgUXLYtyTtaKZB+ru1VzaCcgoOHGVWFSanGVOxqzyzy2RasSjuPFTlJKla1IxqeAqXO9xZNIAEjk4oayqtx4pS2RRKZx9/w+js/LSdXlWmXF8Xh5KH2GrOt0VtI7Ny0nV5VolwzWzw8lEP8AALv8NHkxqJgyv6j0EIQtBWCEIQAIQhAAqc2/9HvCuKnNv/w+8JWQ9jhN12ZzIbPSuAZyXaMIMcW1/VZFaraTiqaHLwrf77bjNt9mkgLgx5o+N5+pK3G0ngyg8BK+dbrWGezSOitEbo3tJ8F2f+5p+s3hCmMlVEOOtkdokGF4FacJri4V0e5hI8XShwa0PdGup9gsdUc4auYs8xaC1rA5zqAEjGNWnUte3Kr0JLOTa7Swskc0sjjdic1jqFz3DMTQADRrUSkkhkjR7TZI5WFkrGSMdlY9oe12sFeALwLlYWF3nHxcJ+D6pdRdPg1CqzXPbIavwXaKtOIc6qt/A1ElmsscbQyNjGMbiDGNDWgcACzSTyy/lLT1WBahDGGNDcwrkxZ6rLpPLL+UtPVYEk19D8DY+peTrimOTymOXIs6YyTenUqUYrjKsWl9MHPjDiNIByIEdCQMmUcIOQqrK7LcclHcGNVhjUxraJ1Dn29CIcLKWr0FnkvYkwwOFK0k5MiVrBr19ikC1w4eEfizPJtgxilYE1oUjVo2QtHH7pP9OzctJ1eVaBcDxaHk4/ZCz7dI3lm5aTq8q0G4Pi0PJx+yFtwu4Ix5epnooQhXFYIQhAAhCEAIqsw8L0HpCtKvPvhqPSFDIexC9gI968u6Vg7qMCaGG0x5mysa4jVXIvXUZCpnH5WhMZNaHiXOuHZYXYUVis8TvtMjbhDUV7cZdnCGtUjQqdb3LE12JGhOpwpoSq2LIoDRZXL5Zfx7T1WBaosrl8sv49p6rAoydEvBOPqXk61xUZTnFNauKdQSeLCweCoUrGeDwtz6W/selStZUU2rpVfuhaeEZexPiir+4kreiGOkzN5zjKVnPwpHtGVuQ/odBSsWtILSRYYpGqNikBUt0JuSAJapqcEjdglRx+6R/Ts3LSdXlWhXCbSzw8lF7AWebpH9Oz8tJ1eVaLcbxeHkofYaujg6EYs3Uy8hCFcVAhCEACEIQAKpLvvR2K2qku+9HYlZD2ESFKhVyIQ0BPamkJzVQWoeEqQJVagBZVL5Zfx7T1WBaqsqm8sv5S09VgUZOiXgbH1LydU4p8TM6id2K0w16Fxfg6T0JGKG1R/WHp1aVO1LVNFtO0Vt07PPa6nCDiI0jtTwymMY2nIfceFLNFg4xvT/AI/siInRUZxwLUsiaI31JGHQpWqPBpjbkz6R+3CnMSO71HVUShOTQUtUJkHH7o39Oz8tJ1eVaHcLxeHkovZCzvdGP0dm5aTq8q0O4Xi8PJReyF0+H6EYM3Wz0UIQryoEIQgAQhCABVp98NR6QrKrTb4andISsh7DUIQqpBEQpQkSgqksoe1Kmgpaq1AKsptHll/HtPVYFqqyqfyy/j2nqsCXJ0S8DQ6l5OpOUKzZzjppx+lVXqxHjo7aq4sddDpSLRCjJUjjVQPKdFW4OdzbbbYoj4PF6NfAlLtttvc0u2226FF1qiUqJGOpkUgFcmI6NOpU2uwcmNugZRwjsVhjwRUGoV0Z2iSQFOBTA6uXnz/ulOLVpU+CbOR3RT9HZ+Wk6vKtHuL4vDyUPsBZvuhn6Oz8tJ1eVaRcbxeHkofYaunw/QjBn62X0IQtBSCEIQAIQhACKvPvhqPSFYVeffjinpCV7EPYakKVNVMhooEoTUqqLR4SgplUoKsiQ0OBWVz+WX8e09VgWphZZP5Yfx7T1WBRk6JeCcfUvJ1LgpLO7N6RrzjbQmFJkya1xIumdOSPSwajEqzyrNlfUA6f0KS2WfFhD09q1ShceaP7mdSp0yg92223ua52223vR5UZdttt76C9RH4W223uRpINW4jn0O19v/UzC222xcyh2222vKl2IcC3G8O4DoO2MJ4fTbKqY2/bbnUjJj9bH/d2j3qyORfIjdaM5vdCIwLPT76TF/8APKtJuN4vDyUPsNWaboO8s5/9snV5VpdxvF4eSh9hq7PDe2jDm6mXkIQrykEIQgAQhCABVp98OKekKyq0+/HFPSEstgGJqcU0rPJjRERVFUBIWi1S1TaoqnQDll8vll/KWnqsC09ZhJ5Yfx7T1WBRkf8Ajl4CPUvJ1ZCaVIVG5cFM6ZfsRxBegMm2NedY8ivgrrcM04qzJlX1Hl26z0NW5NGhec47bbe/3pgvHtUOdvN2KvPhSfNE0YZWqZXwtttugAdtttryqM7bbe5Jhbbba1ko0cpYa7bbbWpWlVWu2221qRjkkkJKCZzt/g8CDlZOfveX9VqFx/6EPJRewFl1/R8Cz8rJ1eVajcbxeHkofYC7XB+yjk541NovIQhaykEIQgAQhCABVZ9+OKekK0qs++Gp3SEk9gIykSlNWZlkQQEFAKUcCUIKE6JoWqzGTyw/j2jqsC01Zi/yw/j2jqsCjJ7cvDBdS8nXFRlSFRuC4CZ0yzY30IrkyFeqci8ON1DrXpWafFgn0H3LdwmVL6WZ8sflCylUbQObSr8wVGTF2aVrmEHR507NtKrE7bba816ZucZP1GtUnhZJRNMZiYW2vb/uRSsdtttwjIoNv+bc+RK12222rIq6LKvY8O/U+BByr/8ARLtm1LVbjeLw8lD7DVk9+R8CDlJP9EvB2e9axcbxeHkofYC7HCe0jkcV7jLyEIWkzAhCEACEIQAirT74andIVlVrRvhxXdIST2JREkQVG99P2osknRbFD0BNr7koQhkKiqRBTIkWqzKTyw/j2jqsC0tZpIf5w/j2jqsCjJ7cvDBdUfJ1yYU5IQvOpnSGFTMfUcO2NROSA0xhWwlTFaPQZNio7n7VDK1MY8OGLLoS4S3wzaalHLroV3tIyKu9gdvRQ/Z06uxXXCqhfGmkr1Q8ZHnPbsU0Hbb9lceK7/L9qmP06VC+It0cBGMHUqWmWRlRzV9+9g5ST/RLtm961q43i8PJQ+w1ZLfgPBg5ST/RKtauN4vDyUPsBdbhfbRzuJd5GXkIQtJnBCEIAEIQgBFVtO+HFPSFaVW1b4andISZOklbkRKo29zvBwWF++qCwubjxZs6upFjZchrcgzYhiyU4EtUhRVQhkKglIhWIkFmknld/KWjqsC0pZpKf5u/j2jqsCXJ7UvDD/ZeTrqoTQUq82mdIQpqcU0p4sKAGmMZVKx+FwHRmOpQoVsZtCONkxxIqmNfp584TqZxjGntTqcou0xGu417FEWkaOEEVB1qwlIqtEcsZb6EU0cZfu0BsBFR9LJiy0+glyFarcbxeHkofYaswv8AWUZZ+Vk6vKtPuN4vDyUPsBdjhq/LVGDP1svIQhXlIIQhAAhCEAIqlq3w1OHR2K2op48IaCMYOgpJq1RKepTJSILXg0LCeFtCP1KQh/2H8ze1ZHCXYutCVQjBd92/mb2pMF32H8ze1HK+wykhUFJgP+7fzN7Upa/7t/8Aj2plFhzLuIsZvzum+yXSdKG1wJmyYNaYUb7PGwj04LxrC2bBf9h/+PauMv8ALynXQAfCCydoDfCADZGA1DSa4iDWhx5TiVkVdqS0Ysn8p7FOyX53Oe0HvljP7JA5rm8BxUU/ysuf55D6x7FnL9zq6bSR3tLrAjeDqOHXnATfm7un5rN6jPjWR/heJu7f/fsWern2RpBvrud55D6zuxNN9dzvO4fWPYs5+bu6Xms3qs+NHzeXT81m9Rnxo/S8fd/x/Qern2Ro3yruf53D6x7EfKu5/ncPrHsWc/N3dLzWb1WfGj5u7peazeqz41K/DMfd/wAf0R6ufZGjfKu53ncPrHsStvsueMlshH4ndizj5u7p+ay+oz40fN3dPzWX1GfGm/Tcfdh6qfZGki+652e1w+hx7E5191zgK9+Q+guJ5gFmnzd3T81m9SP40Hc7unmssx/CwdL1P6fj7sj1UuyL19V9sdrmY2AOMEQmfhOBaZHuYW1DcoFMQrjxre7lxlsETXYi2OJpGghoBWTXkbl8zZWzW8NZGwteIcJr3yOaatDy3E1oIBoCa0WyBbIRUYqMdkUSk5O2OQhCcUEIQgAQhCABCEIARCVCAEohKhAAhCEACRKhAAhCEACEIQAIQhAAhCEACEIQAiVCEACEIQAIQhAH/9k=','no','2024-12-01 16:41:49'),
(133,16,20,23,'Google Pixel 5','<div id=\"specs-list\">\n<table cellspacing=\"0\">\n<tbody>\n<tr class=\"tr-hover\">\n<th rowspan=\"15\" scope=\"row\">Network</th>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/network-bands.php3\">Technology</a></td>\n<td class=\"nfo\"><a class=\"link-network-detail collapse\" href=\"https://www.gsmarena.com/google_pixel_5-10386.php\" data-spec=\"nettech\">GSM / CDMA / HSPA / EVDO / LTE / 5G</a></td>\n</tr>\n</tbody>\n</table>\n<table cellspacing=\"0\">\n<tbody>\n<tr>\n<th rowspan=\"2\" scope=\"row\">Launch</th>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=phone-life-cycle\">Announced</a></td>\n<td class=\"nfo\" data-spec=\"year\">2020, September 30</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=phone-life-cycle\">Status</a></td>\n<td class=\"nfo\" data-spec=\"status\">Available. Released 2020, October 15</td>\n</tr>\n</tbody>\n</table>\n<table cellspacing=\"0\">\n<tbody>\n<tr>\n<th rowspan=\"6\" scope=\"row\">Body</th>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/google_pixel_5-10386.php\">Dimensions</a></td>\n<td class=\"nfo\" data-spec=\"dimensions\">144.7 x 70.4 x 8 mm (5.70 x 2.77 x 0.31 in)</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/google_pixel_5-10386.php\">Weight</a></td>\n<td class=\"nfo\" data-spec=\"weight\">151 g (5.33 oz)</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=build\">Build</a></td>\n<td class=\"nfo\" data-spec=\"build\">Glass front (Gorilla Glass 6), aluminum back, aluminum frame</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=sim\">SIM</a></td>\n<td class=\"nfo\" data-spec=\"sim\">Nano-SIM and eSIM</td>\n</tr>\n<tr>\n<td class=\"ttl\">&nbsp;</td>\n<td class=\"nfo\" data-spec=\"bodyother\">IP68 dust/water resistant (up to 1.5m for 30 min)</td>\n</tr>\n</tbody>\n</table>\n<table cellspacing=\"0\">\n<tbody>\n<tr>\n<th rowspan=\"5\" scope=\"row\">Display</th>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=display-type\">Type</a></td>\n<td class=\"nfo\" data-spec=\"displaytype\">OLED, 90Hz, HDR10+</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/google_pixel_5-10386.php\">Size</a></td>\n<td class=\"nfo\" data-spec=\"displaysize\">6.0 inches, 87.6 cm<sup>2</sup>&nbsp;(~85.9% screen-to-body ratio)</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=resolution\">Resolution</a></td>\n<td class=\"nfo\" data-spec=\"displayresolution\">1080 x 2340 pixels, 19.5:9 ratio (~432 ppi density)</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=screen-protection\">Protection</a></td>\n<td class=\"nfo\" data-spec=\"displayprotection\">Corning Gorilla Glass 6</td>\n</tr>\n<tr>\n<td class=\"ttl\">&nbsp;</td>\n<td class=\"nfo\" data-spec=\"displayother\">Always-on display</td>\n</tr>\n</tbody>\n</table>\n<table cellspacing=\"0\">\n<tbody>\n<tr>\n<th rowspan=\"4\" scope=\"row\">Platform</th>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=os\">OS</a></td>\n<td class=\"nfo\" data-spec=\"os\">Android 11, upgradable to Android 14</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=chipset\">Chipset</a></td>\n<td class=\"nfo\" data-spec=\"chipset\">Qualcomm SM7250 Snapdragon 765G 5G (7 nm)</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=cpu\">CPU</a></td>\n<td class=\"nfo\" data-spec=\"cpu\">Octa-core (1x2.4 GHz Kryo 475 Prime &amp; 1x2.2 GHz Kryo 475 Gold &amp; 6x1.8 GHz Kryo 475 Silver)</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=gpu\">GPU</a></td>\n<td class=\"nfo\" data-spec=\"gpu\">Adreno 620</td>\n</tr>\n</tbody>\n</table>\n<table cellspacing=\"0\">\n<tbody>\n<tr>\n<th rowspan=\"5\" scope=\"row\">Memory</th>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=memory-card-slot\">Card slot</a></td>\n<td class=\"nfo\" data-spec=\"memoryslot\">No</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=dynamic-memory\">Internal</a></td>\n<td class=\"nfo\" data-spec=\"internalmemory\">128GB 8GB RAM</td>\n</tr>\n<tr>\n<td class=\"ttl\">&nbsp;</td>\n<td class=\"nfo\" data-spec=\"memoryother\">UFS 2.1</td>\n</tr>\n</tbody>\n</table>\n<table cellspacing=\"0\">\n<tbody>\n<tr>\n<th class=\"small-line-height\" rowspan=\"4\" scope=\"row\">Main Camera</th>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=camera\">Dual</a></td>\n<td class=\"nfo\" data-spec=\"cam1modules\">12.2 MP, f/1.7, 27mm (wide), 1/2.55\", 1.4&micro;m, dual pixel PDAF, OIS<br>16 MP, f/2.2, 117˚ (ultrawide), 1.0&micro;m</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=camera\">Features</a></td>\n<td class=\"nfo\" data-spec=\"cam1features\">LED flash, Pixel Shift, Auto-HDR, panorama</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=camera\">Video</a></td>\n<td class=\"nfo\" data-spec=\"cam1video\">4K@30/60fps, 1080p@30/60/120/240fps; gyro-EIS</td>\n</tr>\n</tbody>\n</table>\n<table cellspacing=\"0\">\n<tbody>\n<tr>\n<th class=\"small-line-height\" rowspan=\"4\" scope=\"row\">Selfie camera</th>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=secondary-camera\">Single</a></td>\n<td class=\"nfo\" data-spec=\"cam2modules\">8 MP, f/2.0, 24mm (wide), 1/4.0\", 1.12&micro;m</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=secondary-camera\">Features</a></td>\n<td class=\"nfo\" data-spec=\"cam2features\">HDR</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=secondary-camera\">Video</a></td>\n<td class=\"nfo\" data-spec=\"cam2video\">1080p@30fps</td>\n</tr>\n</tbody>\n</table>\n<table cellspacing=\"0\">\n<tbody>\n<tr>\n<th rowspan=\"3\" scope=\"row\">Sound</th>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=loudspeaker\">Loudspeaker</a></td>\n<td class=\"nfo\">Yes, with stereo speakers</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=audio-jack\">3.5mm jack</a></td>\n<td class=\"nfo\">No</td>\n</tr>\n</tbody>\n</table>\n<table cellspacing=\"0\">\n<tbody>\n<tr>\n<th rowspan=\"9\" scope=\"row\">Comms</th>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=wi-fi\">WLAN</a></td>\n<td class=\"nfo\" data-spec=\"wlan\">Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=bluetooth\">Bluetooth</a></td>\n<td class=\"nfo\" data-spec=\"bluetooth\">5.0, A2DP, LE, aptX HD</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=gnss\">Positioning</a></td>\n<td class=\"nfo\" data-spec=\"gps\">GPS, GLONASS, GALILEO, QZSS, BDS</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=nfc\">NFC</a></td>\n<td class=\"nfo\" data-spec=\"nfc\">Yes</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=fm-radio\">Radio</a></td>\n<td class=\"nfo\" data-spec=\"radio\">No</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=usb\">USB</a></td>\n<td class=\"nfo\" data-spec=\"usb\">USB Type-C 3.1</td>\n</tr>\n</tbody>\n</table>\n<table cellspacing=\"0\">\n<tbody>\n<tr>\n<th rowspan=\"9\" scope=\"row\">Features</th>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=sensors\">Sensors</a></td>\n<td class=\"nfo\" data-spec=\"sensors\">Fingerprint (rear-mounted), accelerometer, gyro, proximity, compass, barometer</td>\n</tr>\n</tbody>\n</table>\n<table cellspacing=\"0\">\n<tbody>\n<tr>\n<th rowspan=\"7\" scope=\"row\">Battery</th>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=rechargeable-battery-types\">Type</a></td>\n<td class=\"nfo\" data-spec=\"batdescription1\">Li-Po 4080 mAh, non-removable</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=battery-charging\">Charging</a></td>\n<td class=\"nfo\">18W wired, PD2.0<br>12W wireless<br>5W reverse wired</td>\n</tr>\n</tbody>\n</table>\n<table cellspacing=\"0\">\n<tbody>\n<tr>\n<th rowspan=\"6\" scope=\"row\">Misc</th>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=build\">Colors</a></td>\n<td class=\"nfo\" data-spec=\"colors\">Just Black, Sorta Sage</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=models\">Models</a></td>\n<td class=\"nfo\" data-spec=\"models\">GD1YQ, GTT9Q, G5NZ6</td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/glossary.php3?term=price\">Price</a></td>\n<td class=\"nfo\" data-spec=\"price\"><a href=\"https://www.gsmarena.com/google_pixel_5-price-10386.php\">$&thinsp;129.99 / &euro;&thinsp;162.00 / &pound;&thinsp;137.95</a></td>\n</tr>\n</tbody>\n</table>\n<table cellspacing=\"0\">\n<tbody>\n<tr>\n<th rowspan=\"3\" scope=\"row\">Tests</th>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/gsmarena_lab_tests-review-751p2.php\">Display</a></td>\n<td class=\"nfo\"><a class=\"noUnd\" href=\"https://www.gsmarena.com/google_pixel_5-review-2185p3.php\">699 nits max brightness (measured)</a></td>\n</tr>\n<tr>\n<td class=\"ttl\"><a href=\"https://www.gsmarena.com/gsmarena_lab_tests-review-751p6.php\">Battery (old)</a></td>\n<td class=\"nfo\" data-spec=\"batlife\">\n<div><a href=\"https://www.gsmarena.com/google_pixel_5-10386.php\">Endurance rating 95h</a></div>\n</td>\n</tr>\n<tr></tr>\n</tbody>\n</table>\n</div>\n<p class=\"note\"><strong>Disclaimer.</strong> We can not guarantee that the information on this page is 100% correct</p>',570.00,450,'https://fdn2.gsmarena.com/vv/bigpic/google-pixel-5-5g.jpg','no','2024-12-01 17:12:34');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_info`
--

DROP TABLE IF EXISTS `products_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `tags` longtext DEFAULT NULL CHECK (json_valid(`tags`)),
  `other_images` longtext DEFAULT NULL CHECK (json_valid(`other_images`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `orders` int(255) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `products_info_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_info`
--

LOCK TABLES `products_info` WRITE;
/*!40000 ALTER TABLE `products_info` DISABLE KEYS */;
INSERT INTO `products_info` VALUES
(1,4,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"image1.jpg\",\"image2.jpg\",\"image3.jpg\"]}','2024-10-14 07:45:48',0),
(2,5,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"image1.jpg\",\"image2.jpg\",\"image3.jpg\"]}','2024-10-14 07:45:58',0),
(3,6,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"image1.jpg\",\"image2.jpg\",\"image3.jpg\"]}','2024-10-14 07:46:07',0),
(4,7,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"image1.jpg\",\"image2.jpg\",\"image3.jpg\"]}','2024-10-14 07:46:11',0),
(5,8,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"image1.jpg\",\"image2.jpg\",\"image3.jpg\"]}','2024-10-14 07:46:15',0),
(6,9,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"image1.jpg\",\"image2.jpg\",\"image3.jpg\"]}','2024-10-14 07:46:18',0),
(7,10,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"image1.jpg\",\"image2.jpg\",\"image3.jpg\"]}','2024-10-14 07:46:22',0),
(8,11,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"image1.jpg\",\"image2.jpg\",\"image3.jpg\"]}','2024-10-14 07:46:25',0),
(9,12,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"image1.jpg\",\"image2.jpg\",\"image3.jpg\"]}','2024-10-14 07:48:25',0),
(10,13,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"image1.jpg\",\"image2.jpg\",\"image3.jpg\"]}','2024-10-14 07:48:27',0),
(11,14,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"image1.jpg\",\"image2.jpg\",\"image3.jpg\"]}','2024-10-14 07:48:30',0),
(12,15,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"image1.jpg\",\"image2.jpg\",\"image3.jpg\"]}','2024-10-14 07:48:32',0),
(13,16,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"image1.jpg\",\"image2.jpg\",\"image3.jpg\"]}','2024-10-14 07:48:33',0),
(14,17,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"image1.jpg\",\"image2.jpg\",\"image3.jpg\"]}','2024-10-14 07:48:35',0),
(15,18,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"image1.jpg\",\"image2.jpg\",\"image3.jpg\"]}','2024-10-14 07:49:37',0),
(16,19,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product1-4.jpg\",\"images/product1-3.jpg\",\"images/product1-1.jpg\"]}','2024-10-14 07:53:52',0),
(17,20,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 07:54:11',0),
(18,21,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:01:51',0),
(19,22,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:01:58',0),
(20,23,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:01',0),
(21,24,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:02',0),
(22,25,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:04',0),
(23,26,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:05',0),
(24,27,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:07',0),
(25,28,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:08',0),
(26,29,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:10',0),
(27,30,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:11',0),
(28,31,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:13',0),
(29,32,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:14',0),
(30,33,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:16',0),
(31,34,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:17',0),
(32,35,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:19',0),
(33,36,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:20',0),
(34,37,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:21',0),
(35,38,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:23',0),
(36,39,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:24',0),
(37,40,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:26',0),
(38,41,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:27',0),
(39,42,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:29',0),
(40,43,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:32',0),
(41,44,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:35',0),
(42,45,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:37',0),
(43,46,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:38',0),
(44,47,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:40',0),
(45,48,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:42',0),
(46,49,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:43',0),
(47,50,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:45',0),
(48,51,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:47',0),
(49,52,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:49',0),
(50,53,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:50',0),
(51,54,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:52',0),
(52,55,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:54',0),
(53,56,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:02:56',0),
(54,57,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:02',0),
(55,58,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:32',0),
(56,59,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:33',0),
(57,60,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:35',0),
(58,61,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:37',0),
(59,62,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:39',0),
(60,63,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:41',0),
(61,64,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:42',0),
(62,65,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:45',0),
(63,66,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:47',0),
(64,67,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:48',0),
(65,68,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:50',0),
(66,69,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:52',0),
(67,70,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:54',0),
(68,71,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:55',0),
(69,72,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:57',0),
(70,73,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:03:59',0),
(71,74,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 08:04:02',0),
(72,75,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:57:44',0),
(73,76,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:58:36',0),
(74,77,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:58:37',0),
(75,78,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:58:42',0),
(76,79,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:58:45',0),
(77,80,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:58:49',0),
(78,81,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:58:52',0),
(79,82,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:58:56',0),
(80,83,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:58:59',0),
(81,84,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:59:03',0),
(82,85,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:59:06',0),
(83,86,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:59:10',0),
(84,87,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:59:14',0),
(85,88,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:59:18',0),
(86,89,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:59:22',0),
(87,90,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:59:26',0),
(88,91,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:59:29',0),
(89,92,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:59:33',0),
(90,93,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:59:37',0),
(91,94,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:59:40',0),
(92,95,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:59:44',0),
(93,96,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:59:48',0),
(94,97,'{\"tags\":[\"new\",\"trending\",\"pricy\"]}','{\"other_images\":[\"images/product2-4.jpg\",\"images/product2-3.jpg\",\"images/product2-1.jpg\"]}','2024-10-14 10:59:59',0),
(95,98,'{\"tags\":[\"new\",\"platforms\",\"pricy\"]}','{\"other_images\":[\"https://picsum.photos/seed/RM892be/640/480\",\"https://loremflickr.com/640/480?lock=8003755618336768\",\"https://loremflickr.com/640/480?lock=4300359658897408\"]}','2024-10-14 11:02:13',0),
(96,99,'{\"tags\":[\"new\",\"platforms\",\"pricy\"]}','{\"other_images\":[\"https://loremflickr.com/640/480?lock=6508096396460032\",\"https://picsum.photos/seed/3foZMz/640/480\",\"https://loremflickr.com/640/480?lock=1885816787828736\"]}','2024-10-14 11:02:14',0),
(97,100,'{\"tags\":[\"new\",\"systems\",\"pricy\"]}','{\"other_images\":[\"https://loremflickr.com/640/480?lock=8631702997958656\",\"https://picsum.photos/seed/s4X1v3/640/480\",\"https://picsum.photos/seed/MCQTM/640/480\"]}','2024-10-14 11:02:15',0),
(98,101,'{\"tags\":[\"new\",\"mindshare\",\"pricy\"]}','{\"other_images\":[\"https://loremflickr.com/640/480?lock=4498239663374336\",\"https://picsum.photos/seed/raSghymMCS/640/480\",\"https://loremflickr.com/640/480?lock=7640752960045056\"]}','2024-10-14 11:02:16',0),
(99,102,'{\"tags\":[\"new\",\"paradigms\",\"pricy\"]}','{\"other_images\":[\"https://loremflickr.com/640/480?lock=6858963370901504\",\"https://loremflickr.com/640/480?lock=6802191067119616\",\"https://picsum.photos/seed/ifpLLD5c/640/480\"]}','2024-10-14 11:02:17',0),
(100,103,'{\"tags\":[\"new\",\"portals\",\"pricy\"]}','{\"other_images\":[\"https://loremflickr.com/640/480?lock=4754360296800256\",\"https://picsum.photos/seed/XN2bmBHPo/640/480\",\"https://loremflickr.com/640/480?lock=621343007571968\"]}','2024-10-14 11:02:18',0),
(101,104,'{\"tags\":[\"new\",\"eyeballs\",\"pricy\"]}','{\"other_images\":[\"https://picsum.photos/seed/CLIyOD/640/480\",\"https://loremflickr.com/640/480?lock=8991232931921920\",\"https://picsum.photos/seed/62n6M/640/480\"]}','2024-10-14 11:02:19',0),
(102,105,'{\"tags\":[\"new\",\"portals\",\"pricy\"]}','{\"other_images\":[\"https://loremflickr.com/640/480?lock=200619851776\",\"https://loremflickr.com/640/480?lock=4360959894224896\",\"https://loremflickr.com/640/480?lock=4934607946383360\"]}','2024-10-14 11:02:20',0),
(103,106,'{\"tags\":[\"new\",\"metrics\",\"pricy\"]}','{\"other_images\":[\"https://loremflickr.com/640/480?lock=46274168487936\",\"https://picsum.photos/seed/HlFwY/640/480\",\"https://loremflickr.com/640/480?lock=914870113402880\"]}','2024-10-14 11:02:21',0),
(104,107,'{\"tags\":[\"new\",\"platforms\",\"pricy\"]}','{\"other_images\":[\"https://picsum.photos/seed/NczPHv/640/480\",\"https://loremflickr.com/640/480?lock=5032957716725760\",\"https://picsum.photos/seed/PrM0XuF7/640/480\"]}','2024-10-14 11:02:23',0),
(105,108,'{\"tags\":[\"new\",\"technologies\",\"pricy\"]}','{\"other_images\":[\"https://picsum.photos/seed/ENdTulBR/640/480\",\"https://loremflickr.com/640/480?lock=4702158486241280\",\"https://loremflickr.com/640/480?lock=5834797341474816\"]}','2024-10-14 11:02:25',0),
(106,109,'{\"tags\":[\"new\",\"relationships\",\"pricy\"]}','{\"other_images\":[\"https://loremflickr.com/640/480?lock=854376757329920\",\"https://picsum.photos/seed/QDijjWjQ3/640/480\",\"https://loremflickr.com/640/480?lock=4915948458868736\"]}','2024-10-14 11:02:26',0),
(107,110,'{\"tags\":[\"new\",\"technologies\",\"pricy\"]}','{\"other_images\":[\"https://picsum.photos/seed/kDdeoPs9Xq/640/480\",\"https://loremflickr.com/640/480?lock=2223272668168192\",\"https://picsum.photos/seed/K8KSvJUR/640/480\"]}','2024-10-14 11:02:27',0),
(108,111,'{\"tags\":[\"new\",\"models\",\"pricy\"]}','{\"other_images\":[\"https://picsum.photos/seed/nWp2d/640/480\",\"https://loremflickr.com/640/480?lock=3362165306163200\",\"https://loremflickr.com/640/480?lock=5494692842045440\"]}','2024-10-14 11:02:28',0),
(109,112,'{\"tags\":[\"new\",\"technologies\",\"pricy\"]}','{\"other_images\":[\"https://loremflickr.com/640/480?lock=1379680324157440\",\"https://picsum.photos/seed/yamYrQ/640/480\",\"https://loremflickr.com/640/480?lock=1280301969965056\"]}','2024-10-14 11:02:28',0),
(110,113,'{\"tags\":[\"new\",\"portals\",\"pricy\"]}','{\"other_images\":[\"https://loremflickr.com/640/480?lock=7678784251625472\",\"https://loremflickr.com/640/480?lock=5973274305495040\",\"https://picsum.photos/seed/ux0ua3F3/640/480\"]}','2024-10-14 11:02:29',0),
(111,114,'{\"tags\":[\"new\",\"portals\",\"pricy\"]}','{\"other_images\":[\"https://loremflickr.com/640/480?lock=7881247000887296\",\"https://loremflickr.com/640/480?lock=5606793145221120\",\"https://picsum.photos/seed/rjz1DmU/640/480\"]}','2024-10-14 11:02:30',0),
(112,115,'{\"tags\":[\"new\",\"partnerships\",\"pricy\"]}','{\"other_images\":[\"https://loremflickr.com/640/480?lock=69438298652672\",\"https://loremflickr.com/640/480?lock=5644213993603072\",\"https://loremflickr.com/640/480?lock=1745682320850944\"]}','2024-10-14 11:02:31',0),
(113,116,'{\"tags\":[\"new\",\"mindshare\",\"pricy\"]}','{\"other_images\":[\"https://picsum.photos/seed/0E5qPOObJ/640/480\",\"https://loremflickr.com/640/480?lock=2435004049129472\",\"https://loremflickr.com/640/480?lock=115426629517312\"]}','2024-10-14 11:02:32',0),
(114,117,'{\"tags\":[\"new\",\"deliverables\",\"pricy\"]}','{\"other_images\":[\"https://picsum.photos/seed/yQJYZ3Q/640/480\",\"https://picsum.photos/seed/ygVq8/640/480\",\"https://picsum.photos/seed/ZQDONrE1/640/480\"]}','2024-10-14 11:02:34',0),
(115,118,'{\"tags\":[\"new\",\"e-business\",\"pricy\"]}','{\"other_images\":[\"https://picsum.photos/seed/5LGpVc/640/480\",\"https://picsum.photos/seed/Lfy02n/640/480\",\"https://loremflickr.com/640/480?lock=3921291323113472\"]}','2024-10-14 11:02:36',0),
(116,119,'{\"tags\":[\"new\",\"schemas\",\"pricy\"]}','{\"other_images\":[\"https://picsum.photos/seed/RLkFserA/640/480\",\"https://picsum.photos/seed/G7Uua/640/480\",\"https://picsum.photos/seed/7JU0VXdudA/640/480\"]}','2024-10-14 11:02:37',0),
(117,120,'{\"tags\":[\"new\",\"action-items\",\"pricy\"]}','{\"other_images\":[\"https://picsum.photos/seed/0jvkh/640/480\",\"https://picsum.photos/seed/MwT6Yw/640/480\",\"https://loremflickr.com/640/480?lock=5781305383976960\"]}','2024-10-14 11:02:38',0),
(118,121,'{\"tags\":[\"new\",\"users\",\"pricy\"]}','{\"other_images\":[\"https://loremflickr.com/640/480?lock=737806664073216\",\"https://picsum.photos/seed/xlDqdCyMo/640/480\",\"https://picsum.photos/seed/MY3gfkx/640/480\"]}','2024-10-14 11:02:40',0),
(119,122,'{\"tags\":[\"new\",\"bandwidth\",\"pricy\"]}','{\"other_images\":[\"https://loremflickr.com/640/480?lock=4806404384751616\",\"https://picsum.photos/seed/Iqx6hd4/640/480\",\"https://loremflickr.com/640/480?lock=2279944270905344\"]}','2024-10-14 11:02:41',0),
(120,123,'{\"tags\":[\"new\",\"solutions\",\"pricy\"]}','{\"other_images\":[\"https://picsum.photos/seed/M417it8VmS/640/480\",\"https://loremflickr.com/640/480?lock=4058333526884352\",\"https://picsum.photos/seed/Y6Cn3qlW/640/480\"]}','2024-10-14 11:02:43',0),
(121,124,'{\"tags\":[\"new\",\"initiatives\",\"pricy\"]}','{\"other_images\":[\"https://loremflickr.com/640/480?lock=1830757802704896\",\"https://loremflickr.com/640/480?lock=6058209685012480\",\"https://loremflickr.com/640/480?lock=7696285888937984\"]}','2024-10-14 11:02:44',0),
(122,125,'{\"tags\":[\"new\",\"systems\",\"pricy\"]}','{\"other_images\":[\"https://loremflickr.com/640/480?lock=4928654582743040\",\"https://picsum.photos/seed/AR0hRwk/640/480\",\"https://picsum.photos/seed/YfrqtLRAI/640/480\"]}','2024-10-14 11:02:46',0),
(123,126,'{\"tags\":[\"new\",\"experiences\",\"pricy\"]}','{\"other_images\":[\"https://picsum.photos/seed/GfUe4/640/480\",\"https://picsum.photos/seed/4r7CO/640/480\",\"https://picsum.photos/seed/KZAPzmSb0b/640/480\"]}','2024-10-14 11:02:46',0),
(124,127,'{\"tags\":[\"new\",\"partnerships\",\"pricy\"]}','{\"other_images\":[\"https://picsum.photos/seed/XzbC8j/640/480\",\"https://loremflickr.com/640/480?lock=3979749068111872\",\"https://loremflickr.com/640/480?lock=2573919353569280\"]}','2024-10-14 11:02:47',0),
(125,128,'{\"tags\":[\"new\",\"eyeballs\",\"pricy\"]}','{\"other_images\":[\"https://picsum.photos/seed/wIQvX/640/480\",\"https://loremflickr.com/640/480?lock=4424920675123200\",\"https://picsum.photos/seed/gCyTYqgEhS/640/480\"]}','2024-10-14 11:02:48',0),
(126,129,'{\"tags\":[\"new\",\"partnerships\",\"pricy\"]}','{\"other_images\":[\"https://picsum.photos/seed/S0JiAR4/640/480\",\"https://loremflickr.com/640/480?lock=8945336619892736\",\"https://picsum.photos/seed/Np9g39kW2n/640/480\"]}','2024-10-14 11:02:49',0),
(127,130,'{\"tags\":[\"new\",\"Affordab;e\"]}','{\"other_images\":[\"https://images.unsplash.com/photo-1507955987999-df4864ee80d4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cGhvbmV8ZW58MHx8MHx8fDA%3D\"]}','2024-10-24 10:12:54',0),
(128,131,'{\"tags\":[\"infinix\",\"xos\",\"android 13\",\"infinix not\"]}','{\"other_images\":[]}','2024-12-01 16:35:49',0),
(129,132,'{\"tags\":[\"infinix\",\"smart phone\",\"smart 8\"]}','{\"other_images\":[]}','2024-12-01 16:41:49',0),
(130,133,'{\"tags\":[\"google\",\"android 11\",\"pixel 5\"]}','{\"other_images\":[]}','2024-12-01 17:12:35',0);
/*!40000 ALTER TABLE `products_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_owners`
--

DROP TABLE IF EXISTS `shop_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_owners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `contact_email_2` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lasttname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contact_email_2` (`contact_email_2`(191))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_owners`
--

LOCK TABLES `shop_owners` WRITE;
/*!40000 ALTER TABLE `shop_owners` DISABLE KEYS */;
INSERT INTO `shop_owners` VALUES
(2,32,NULL,'2024-10-05 15:17:44',NULL,'some name','some las name'),
(3,33,NULL,'2024-10-05 15:18:50',NULL,'some name','some las name'),
(4,34,NULL,'2024-10-05 15:19:27',NULL,'some name','some las name'),
(5,40,NULL,'2024-10-20 08:41:03',NULL,'Charles','Kahuho');
/*!40000 ALTER TABLE `shop_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shops` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `shop_email` text NOT NULL,
  `shop_name` text NOT NULL,
  `business_registration_number` text NOT NULL,
  `bank_account_details` text DEFAULT NULL,
  `tax_identification_number` text DEFAULT NULL,
  `status` enum('active','pending','suspended') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  UNIQUE KEY `business_registration_number` (`business_registration_number`(191)) USING HASH,
  UNIQUE KEY `bank_account_details` (`bank_account_details`(191)) USING HASH,
  UNIQUE KEY `tax_identification_number` (`tax_identification_number`(191)) USING HASH,
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `shops_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users`.`id` (`owner_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES
(18,33,'bora@gmail.com','borabora','46579800-20ed03y0',NULL,NULL,'active','2024-10-11 06:02:13',NULL),
(23,40,'cmkahuho@gmail.com','Cartnest official','85999485o4995-4995nnr-',NULL,NULL,'active','2024-10-20 16:21:47',NULL);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `password` text NOT NULL,
  `resetToken` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(32,'some user','vendor@vendor.com','vendor','2024-10-05 15:17:44',NULL,'$2a$10$ccGvs8cmaVy206l67YAcbO5q4bzwoX8mj1aGbNaNdNQDx6z7jSH5u',NULL),
(33,'some user','vendor@vendor1.com','vendor','2024-10-05 15:18:50',NULL,'$2a$10$NUwnIR/I2hGGzrTkkNL/Cu8mYGzuYKozkELN5tBLxAxRYN35FP6Ny',NULL),
(34,'some user','vendor@vendor2.com','vendor','2024-10-05 15:19:27',NULL,'$2a$10$5.V85i/K4KN/XvY4iYCKGebwUhs7TLoZeIhNnkoqZX6MGdGXU/Ivu',NULL),
(35,'some user','admin@admin2.com','admin','2024-10-05 15:19:54',NULL,'$2a$10$.O.YEKy.hp7P4g/ln6KzP.SL5imFf9TCpEp34bWl5fjTaOG4g0SaC',NULL),
(36,'some user','customer@customer.com','customer','2024-10-05 15:20:19',NULL,'$2a$10$8Cn/rX8zMJQ3sUUEcqPNb.EukN2cvWXp9ASQnNvadZyXrQgkhs1ce',NULL),
(38,'some user','customer@customers.com','customer','2024-10-20 08:36:00',NULL,'$2a$10$6vFjtRpXIXlb7tC8Nek5wON4bNeeN1Xe28HLQgWvKGjPe8ruJSzxS',NULL),
(39,'Alaric78','ckcharles004@gmail.com','customer','2024-10-20 08:40:22','2024-12-01 14:43:25','$2a$10$t1CLA8hcDXXQGdQqhfUYz.idwUZQlmlLfEiALfN90PYrOdIf0m9nu',53343982),
(40,'Alaric78','ckagenou96@gmail.com','vendor','2024-10-20 08:41:03',NULL,'$2a$10$bJhtEihh4HtHLu3VUWsHBOZ611zMvFvVFieEQhZcrAgMYj0iypbqO',NULL),
(41,'Alex','urbankollyk@gmail.com','customer','2024-10-24 09:56:25',NULL,'$2a$10$I/vaYLzfQXY2cEShkzK.8ubsN7NindZu//BCUdVo4aMSpKRvxkkfG',NULL),
(42,'cmkahuho','cmkahuho@gmail.com','admin','2024-10-25 08:56:56','2024-11-20 09:41:28','$2a$10$tem2hemrtEzgpV.vzivITOAIr2kgsDzT12qZLzYp5eVfBT4IlrPsG',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_details`
--

DROP TABLE IF EXISTS `vendor_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `business_type` text NOT NULL,
  `business_logo` text DEFAULT NULL,
  `business_description` text NOT NULL,
  `years_in_business` text NOT NULL,
  `location` text NOT NULL,
  `operational_hours` text NOT NULL,
  `whatsapp_link` text DEFAULT NULL,
  `twitter_link` text DEFAULT NULL,
  `website_url` text DEFAULT NULL,
  `instagram_link` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`),
  CONSTRAINT `vendor_details_idfk_22` FOREIGN KEY (`vendor_id`) REFERENCES `shops` (`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_details`
--

LOCK TABLES `vendor_details` WRITE;
/*!40000 ALTER TABLE `vendor_details` DISABLE KEYS */;
INSERT INTO `vendor_details` VALUES
(2,18,'retail',NULL,'Comis anser corrupti delectus debeo delego alienus a cornu thesis. Inflammatio ventito adflicto decor apparatus super demens. Depromo utroque atavus debitis.','1','kenya','fulltime',NULL,NULL,NULL,NULL),
(6,23,'Retail',NULL,'Official shop for cartnest shopping','1','Nairobi, Kenya','fulltime',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vendor_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-12-06 15:18:36
