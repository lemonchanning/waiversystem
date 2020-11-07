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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `post_name` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `target_id` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,6,'PLEASE CONTRIBUTE YOURSELF!!!','Sam','I can help','2020-10-27 16:00:00',NULL),(2,1,6,'PLEASE CONTRIBUTE YOURSELF!!!','Sam','1','2020-10-27 16:00:00',NULL),(3,1,6,'PLEASE CONTRIBUTE YOURSELF!!!','Sam','2','2020-10-27 05:13:10',NULL),(4,1,6,'PLEASE CONTRIBUTE YOURSELF!!!','Sam','3','2020-10-27 05:15:40',NULL),(5,1,6,'PLEASE CONTRIBUTE YOURSELF!!!','Sam','4','2020-10-27 16:00:00',NULL),(6,1,6,'Let\'s do the donation!','Sam','12345','2020-10-28 18:25:01',NULL),(7,1,6,'Let\'s do the donation!','Sam','nihsad','2020-10-29 14:46:30',NULL),(8,1,8,'Help','Sam','mercy!','2020-11-06 10:38:37',NULL),(9,1,9,'ERD challenges ','Sam','s','2020-11-06 13:02:20',NULL),(10,1,8,'Help','Sam','kkkk','2020-11-07 06:21:35',NULL),(16,4,10,'HIIII','Amy','dss','2020-11-07 13:29:48','http://localhost:8080/waiver5619/user/header/14c367ad083741a29befe93beccc4db5.jpg'),(17,5,10,'HIIII','dog','sdasd','2020-11-07 18:09:25','http://localhost:8080/waiver5619/user/header/a466d2be40cb45d7b6810dbf6b9d29eb.jpeg'),(18,6,10,'HIIII','Villa','I am villa!','2020-11-07 18:12:22',NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-07 23:18:13
