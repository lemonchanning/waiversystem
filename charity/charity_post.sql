-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: charity
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `administrator` varchar(45) DEFAULT 'admin',
  `username` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(255) DEFAULT '0' COMMENT '0-uninspected;1-inspected',
  `target_amount` double DEFAULT NULL,
  `actual_amount` double DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `like_count` int(11) DEFAULT NULL,
  `comment_count` int(11) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'admin','Sam',1,'I need help..','Save Life',1,10000,200,'2020-10-24 03:57:16',0,0,'221342'),(2,'admin','Sam',1,'hi world','second title',0,20000,2000,'2020-10-24 05:02:49',0,0,'324451'),(3,'admin','Sam',1,'It is time now','I NEED MONEY!!',1,20000,133,'2020-10-24 16:00:00',0,0,'33@qq.com'),(4,'admin','Linda',2,'BE KIND....','Covid-19',1,30000,20,'2020-10-24 16:00:00',0,0,'435er@gmail.com'),(5,'admin','Linda',2,'Just thanks','Cancer',1,20001,42,'2020-10-24 16:00:00',0,0,'sda@sina.com'),(6,'admin','Linda',2,'PLEASE CONTRIBUTE YOURSELF!!!','Let\'s do the donation!',0,23111,0,'2020-10-27 14:44:10',0,4,'322231'),(8,NULL,'Amy',4,'d','Help',0,100000,0,'2020-11-06 10:02:27',0,0,'s'),(9,NULL,'Amy',4,'sdsssss','ERD challenges ',0,111,0.01,'2020-11-06 12:17:34',0,0,'s'),(10,NULL,'Amy',4,'asdasd','HIIII',0,100000,1,'2020-11-07 11:40:30',0,3,'123456'),(13,NULL,'dog',5,'help+10086','helping people',0,10002,0,'2020-11-07 15:35:19',0,0,'333@qq'),(14,NULL,'dog',5,'dasd','helpmetoo',0,12342,0,'2020-11-07 15:41:46',0,0,'12342');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-07 23:18:14
