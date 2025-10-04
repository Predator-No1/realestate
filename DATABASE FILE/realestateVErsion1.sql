-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for realestatephp
DROP DATABASE IF EXISTS `realestatephp`;
CREATE DATABASE IF NOT EXISTS `realestatephp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `realestatephp`;

-- Dumping structure for table realestatephp.about
DROP TABLE IF EXISTS `about`;
CREATE TABLE IF NOT EXISTS `about` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.about: ~1 rows (approximately)
INSERT INTO `about` (`id`, `title`, `content`, `image`) VALUES
	(10, 'About Us', '<p>&nbsp;</p>\r\n<p>Welcome to REAL ESTATE, your trusted real estate platform in Cameroon. We are dedicated to connecting buyers, sellers, renters, and property agents across the country, making property search and management simple, fast, and reliable.</p>\r\n<p>Our mission is to modernize the real estate experience in Cameroon by offering a user-friendly platform where anyone can find homes, land, commercial spaces, or investment opportunities with just a few clicks.</p>\r\n<p>What We Offer:<br />- Verified property listings across major cities and towns<br />- Easy search filters for rent, sale, or lease<br />- Direct connection with trusted agents and landlords<br />- Tools for posting and managing your property online</p>\r\n<p>Developed as part of a final-year project at IAI, our platform combines local insight with digital innovation to serve the growing real estate needs in Cameroon.</p>\r\n<p>Contact Us <br />For more information or inquiries: <br />Email: <strong>merlisskenmogne@gmail.com</strong></p>\r\n<p>&nbsp;</p>', 'aboutimage.jpg');

-- Dumping structure for table realestatephp.admin
DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `auser` varchar(50) NOT NULL,
  `aemail` varchar(50) NOT NULL,
  `apass` varchar(50) NOT NULL,
  `adob` date NOT NULL,
  `aphone` varchar(15) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.admin: ~1 rows (approximately)
INSERT INTO `admin` (`aid`, `auser`, `aemail`, `apass`, `adob`, `aphone`) VALUES
	(9, 'admin', 'admin@gmail.com', '6812f136d636e737248d365016f8cfd5139e387c', '2025-06-05', '698 73 35 50');

-- Dumping structure for table realestatephp.city
DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) NOT NULL,
  `sid` int NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.city: ~5 rows (approximately)
INSERT INTO `city` (`cid`, `cname`, `sid`) VALUES
	(9, 'yaounde', 2),
	(10, 'ngoundere', 4),
	(11, 'bafoussam', 3),
	(12, 'douala', 7),
	(13, 'garoua', 10);

-- Dumping structure for table realestatephp.contact
DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(250) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.contact: ~1 rows (approximately)
INSERT INTO `contact` (`cid`, `name`, `email`, `phone`, `subject`, `message`) VALUES
	(7, 'kenmogne', 'kenmogne@gmail.com', '698 73 35 50', 'rent building for iai', 'i wish to rent a room in capaceca');

-- Dumping structure for table realestatephp.feedback
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `fid` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `fdescription` varchar(300) NOT NULL,
  `status` int NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.feedback: ~2 rows (approximately)
INSERT INTO `feedback` (`fid`, `uid`, `fdescription`, `status`, `date`) VALUES
	(7, 28, 'i found my dreamed home here in mimboman using this site', 1, '2022-07-23 16:07:08'),
	(8, 33, 'this is just so wonderful 5 stars with no doubts', 1, '2022-07-23 21:51:09');

-- Dumping structure for table realestatephp.messages
DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`uid`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.messages: ~4 rows (approximately)
INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `message`, `created_at`) VALUES
	(1, 36, 28, 'yo', '2025-10-03 16:23:42'),
	(2, 36, 28, 'yo\r\n', '2025-10-03 16:27:46'),
	(3, 28, 36, 'yo', '2025-10-03 16:54:27'),
	(4, 28, 36, 'yo', '2025-10-03 16:54:33');

-- Dumping structure for table realestatephp.property
DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `pcontent` longtext NOT NULL,
  `type` varchar(100) NOT NULL,
  `bhk` varchar(50) NOT NULL,
  `stype` varchar(100) NOT NULL,
  `bedroom` int NOT NULL,
  `bathroom` int NOT NULL,
  `balcony` int NOT NULL,
  `kitchen` int NOT NULL,
  `hall` int NOT NULL,
  `floor` varchar(50) NOT NULL,
  `size` int NOT NULL,
  `price` int NOT NULL,
  `location` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `feature` longtext NOT NULL,
  `pimage` varchar(300) NOT NULL,
  `pimage1` varchar(300) NOT NULL,
  `pimage2` varchar(300) NOT NULL,
  `pimage3` varchar(300) NOT NULL,
  `pimage4` varchar(300) NOT NULL,
  `uid` int NOT NULL,
  `status` varchar(50) NOT NULL,
  `mapimage` varchar(300) NOT NULL,
  `topmapimage` varchar(300) NOT NULL,
  `groundmapimage` varchar(300) NOT NULL,
  `totalfloor` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isFeatured` int DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.property: ~9 rows (approximately)
INSERT INTO `property` (`pid`, `title`, `pcontent`, `type`, `bhk`, `stype`, `bedroom`, `bathroom`, `balcony`, `kitchen`, `hall`, `floor`, `size`, `price`, `location`, `city`, `state`, `feature`, `pimage`, `pimage1`, `pimage2`, `pimage3`, `pimage4`, `uid`, `status`, `mapimage`, `topmapimage`, `groundmapimage`, `totalfloor`, `date`, `isFeatured`) VALUES
	(25, 'awae home', '', 'house', '4 BHK', 'sale', 4, 2, 0, 1, 1, '2nd Floor', 1869, 219690000, 'entre iai', 'litoral', 'center', '<p>&nbsp;</p>\r\n<!---feature area start--->\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Property Age : </span>10 Years</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Swiming Pool : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Parking : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">GYM : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Type : </span>Appartment</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Security : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Dining Capacity : </span>10 People</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Church/Temple : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">3rd Party : </span>No</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Elevator : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">CCTV : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Water Supply : </span>Ground Water / Tank</li>\r\n</ul>\r\n</div>\r\n<!---feature area end---->\r\n<p>&nbsp;</p>', 'zillhms1.jpg', 'zillhms2.jpg', 'zillhms3.jpg', 'zillhms4.jpg', 'zillhms5.jpg', 30, 'available', 'floorplan_sample.jpg', 'zillhms7.jpg', 'zillhms6.jpg', '2 Floor', '2025-06-26 22:29:20', 1),
	(26, 'maeva home', '', 'house', '4 BHK', 'rent', 4, 2, 0, 1, 1, '2nd Floor', 1869, 219690000, 'mimboman', 'yaounde', 'adamawa', '<p>&nbsp;</p>\r\n<!---feature area start--->\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Property Age : </span>10 Years</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Swiming Pool : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Parking : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">GYM : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Type : </span>Appartment</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Security : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Dining Capacity : </span>10 People</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Church/Temple : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">3rd Party : </span>No</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Elevator : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">CCTV : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Water Supply : </span>Ground Water / Tank</li>\r\n</ul>\r\n</div>\r\n<!---feature area end---->\r\n<p>&nbsp;</p>', 'zillhms1.jpg', 'zillhms2.jpg', 'zillhms3.jpg', 'zillhms4.jpg', 'zillhms5.jpg', 36, 'available', 'floorplan_sample.jpg', 'zillhms7.jpg', 'zillhms6.jpg', '2 Floor', '2025-06-26 22:29:20', 1),
	(28, 'ally home.', '', 'house', '4 BHK', 'sale', 4, 2, 0, 1, 1, '2nd Floor', 1869, 219690000, 'bastos', 'douala', 'litoral', '<p>&nbsp;</p>\r\n<!---feature area start--->\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Property Age : </span>10 Years</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Swiming Pool : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Parking : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">GYM : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Type : </span>Appartment</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Security : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Dining Capacity : </span>10 People</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Church/Temple : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">3rd Party : </span>No</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Elevator : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">CCTV : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Water Supply : </span>Ground Water / Tank</li>\r\n</ul>\r\n</div>\r\n<!---feature area end---->\r\n<p>&nbsp;</p>', 'zillhms1.jpg', 'zillhms2.jpg', 'zillhms3.jpg', 'zillhms4.jpg', 'zillhms5.jpg', 36, 'available', 'floorplan_sample.jpg', 'zillhms7.jpg', 'zillhms6.jpg', '2 Floor', '2025-06-26 22:29:20', 1),
	(30, 'lionel home', '', 'house', '4 BHK', 'sale', 4, 2, 0, 1, 1, '2nd Floor', 1869, 219690000, 'odza', 'yaounde', 'west', '<p>&nbsp;</p>\r\n<!---feature area start--->\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Property Age : </span>10 Years</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Swiming Pool : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Parking : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">GYM : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Type : </span>Appartment</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Security : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Dining Capacity : </span>10 People</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Church/Temple : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">3rd Party : </span>No</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Elevator : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">CCTV : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Water Supply : </span>Ground Water / Tank</li>\r\n</ul>\r\n</div>\r\n<!---feature area end---->\r\n<p>&nbsp;</p>', 'zillhms1.jpg', 'zillhms2.jpg', 'zillhms3.jpg', 'zillhms4.jpg', 'zillhms5.jpg', 36, 'available', 'floorplan_sample.jpg', 'zillhms7.jpg', 'zillhms6.jpg', '2 Floor', '2025-06-26 22:29:20', 1),
	(31, 'awoulbe home', '', 'house', '4 BHK', 'rent', 4, 2, 0, 1, 1, '2nd Floor', 1869, 219690000, 'happy', 'bafoussam', 'south', '<p>&nbsp;</p>\r\n<!---feature area start--->\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Property Age : </span>10 Years</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Swiming Pool : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Parking : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">GYM : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Type : </span>Appartment</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Security : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Dining Capacity : </span>10 People</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Church/Temple : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">3rd Party : </span>No</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Elevator : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">CCTV : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Water Supply : </span>Ground Water / Tank</li>\r\n</ul>\r\n</div>\r\n<!---feature area end---->\r\n<p>&nbsp;</p>', 'zillhms1.jpg', 'zillhms2.jpg', 'zillhms3.jpg', 'zillhms4.jpg', 'zillhms5.jpg', 30, 'available', 'floorplan_sample.jpg', 'zillhms7.jpg', 'zillhms6.jpg', '2 Floor', '2025-06-26 22:29:20', 1),
	(32, 'iai home', '', 'house', '4 BHK', 'sale', 4, 2, 0, 1, 1, '2nd Floor', 1869, 219690000, 'concorde', 'yaounde', 'west', '<p>&nbsp;</p>\r\n<!---feature area start--->\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Property Age : </span>10 Years</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Swiming Pool : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Parking : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">GYM : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Type : </span>Appartment</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Security : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Dining Capacity : </span>10 People</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Church/Temple : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">3rd Party : </span>No</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Elevator : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">CCTV : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Water Supply : </span>Ground Water / Tank</li>\r\n</ul>\r\n</div>\r\n<!---feature area end---->\r\n<p>&nbsp;</p>', 'zillhms1.jpg', 'zillhms2.jpg', 'zillhms3.jpg', 'zillhms4.jpg', 'zillhms5.jpg', 28, 'available', 'floorplan_sample.jpg', 'zillhms7.jpg', 'zillhms6.jpg', '2 Floor', '2025-06-26 22:29:20', 1),
	(33, 'mimboman home', '', 'house', '4 BHK', 'rent', 4, 2, 0, 1, 1, '2nd Floor', 1869, 219690000, 'awae', 'garoua', 'south', '<p>&nbsp;</p>\r\n<!---feature area start--->\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Property Age : </span>10 Years</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Swiming Pool : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Parking : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">GYM : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Type : </span>Appartment</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Security : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Dining Capacity : </span>10 People</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Church/Temple : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">3rd Party : </span>No</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Elevator : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">CCTV : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Water Supply : </span>Ground Water / Tank</li>\r\n</ul>\r\n</div>\r\n<!---feature area end---->\r\n<p>&nbsp;</p>', 'zillhms1.jpg', 'zillhms2.jpg', 'zillhms3.jpg', 'zillhms4.jpg', 'zillhms5.jpg', 30, 'available', 'floorplan_sample.jpg', 'zillhms7.jpg', 'zillhms6.jpg', '2 Floor', '2025-06-26 22:29:20', 1),
	(34, 'mimboman home', '', 'house', '4 BHK', 'rent', 4, 2, 0, 1, 1, '2nd Floor', 1869, 219690000, 'awae', 'garoua', 'south', '<p>&nbsp;</p>\r\n<!---feature area start--->\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Property Age : </span>10 Years</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Swiming Pool : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Parking : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">GYM : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Type : </span>Appartment</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Security : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Dining Capacity : </span>10 People</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Church/Temple : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">3rd Party : </span>No</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Elevator : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">CCTV : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Water Supply : </span>Ground Water / Tank</li>\r\n</ul>\r\n</div>\r\n<!---feature area end---->\r\n<p>&nbsp;</p>', 'zillhms1.jpg', 'zillhms2.jpg', 'zillhms3.jpg', 'zillhms4.jpg', 'zillhms5.jpg', 30, 'available', 'floorplan_sample.jpg', 'zillhms7.jpg', 'zillhms6.jpg', '2 Floor', '2025-06-26 22:29:20', 1),
	(35, 'mimboman home', '', 'house', '4 BHK', 'rent', 4, 2, 0, 1, 1, '2nd Floor', 1869, 219690000, 'awae', 'garoua', 'south', '<p>&nbsp;</p>\r\n<!---feature area start--->\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Property Age : </span>10 Years</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Swiming Pool : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Parking : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">GYM : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Type : </span>Appartment</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Security : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Dining Capacity : </span>10 People</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Church/Temple : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class="col-md-4">\r\n<ul>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">3rd Party : </span>No</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Elevator : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">CCTV : </span>Yes</li>\r\n<li class="mb-3"><span class="text-secondary font-weight-bold">Water Supply : </span>Ground Water / Tank</li>\r\n</ul>\r\n</div>\r\n<!---feature area end---->\r\n<p>&nbsp;</p>', 'zillhms1.jpg', 'zillhms2.jpg', 'zillhms3.jpg', 'zillhms4.jpg', 'zillhms5.jpg', 30, 'available', 'floorplan_sample.jpg', 'zillhms7.jpg', 'zillhms6.jpg', '2 Floor', '2025-06-26 22:29:20', 1);

-- Dumping structure for table realestatephp.state
DROP TABLE IF EXISTS `state`;
CREATE TABLE IF NOT EXISTS `state` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `sname` varchar(100) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.state: ~7 rows (approximately)
INSERT INTO `state` (`sid`, `sname`) VALUES
	(2, 'center'),
	(3, 'west'),
	(4, 'adamawa'),
	(7, 'litoral'),
	(9, 'north'),
	(10, 'far north'),
	(15, 'south');

-- Dumping structure for table realestatephp.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) NOT NULL,
  `uemail` varchar(100) NOT NULL,
  `uphone` varchar(20) NOT NULL,
  `upass` varchar(50) NOT NULL,
  `utype` varchar(50) NOT NULL,
  `uimage` varchar(300) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table realestatephp.user: ~6 rows (approximately)
INSERT INTO `user` (`uid`, `uname`, `uemail`, `uphone`, `upass`, `utype`, `uimage`) VALUES
	(28, 'Christine', 'christine@mail.com', '7777444455', '6812f136d636e737248d365016f8cfd5139e387c', 'agent', 'gr7.png'),
	(29, 'Alice', 'alice@mail.com', '7775552214', '6812f136d636e737248d365016f8cfd5139e387c', 'user', 'avatarm2-min.jpg'),
	(30, 'fono lionel', 'fono@mail.com', '7896665555', '6812f136d636e737248d365016f8cfd5139e387c', 'user', 'avatarm7-min.jpg'),
	(31, 'emate', 'emate@mail.com', '7896547855', '6812f136d636e737248d365016f8cfd5139e387c', 'user', 'user-default-3-min.png'),
	(35, 'Michel', 'michael@mail.com', '8542221140', '6812f136d636e737248d365016f8cfd5139e387c', 'agent', 'usric.png'),
	(36, 'merliss', 'merlisskenmogne@gmail.com', '690699521', 'fe6a7b73c8666bd1d78d3fa11beac2f3c47ed87c', 'user', 'Screenshot 2025-04-28 123751.png');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
