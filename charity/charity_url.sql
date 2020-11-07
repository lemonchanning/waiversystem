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
-- Table structure for table `url`
--

DROP TABLE IF EXISTS `url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`url`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url`
--

LOCK TABLES `url` WRITE;
/*!40000 ALTER TABLE `url` DISABLE KEYS */;
INSERT INTO `url` VALUES (1,7,'http://localhost:8080/waiver5619/6defa7b26b9d46adb4c416309e823734.jpg',NULL),(2,7,'http://localhost:8080/waiver5619/ca728197dad94ca3be0fb81bc7a86008.jpg',NULL),(3,8,'http://localhost:8080/waiver5619/dd49df1dcd964834aa7cf049b24b353b.jpg',NULL),(4,8,'http://localhost:8080/waiver5619/9a474118523f4d79a6b0c3bc392ced83.jpg',NULL),(5,9,'/Users/channing/Documents/workspace-sts-3.9.13.RELEASE/waiversystem/src/main/webapp/resources/image/d701cbf8edb84fbbb44bfc004984d0dd.jpg','d701cbf8edb84fbbb44bfc004984d0dd.jpg'),(6,9,'/Users/channing/Documents/workspace-sts-3.9.13.RELEASE/waiversystem/src/main/webapp/resources/image/67e0d0d071bc4c29a674c335ee73153e.jpg','67e0d0d071bc4c29a674c335ee73153e.jpg'),(7,11,'/Users/channing/Documents/workspace-sts-3.9.13.RELEASE/upload/4fa7bc75cb6944a6826b72d00cbe9ce9.jpg','4fa7bc75cb6944a6826b72d00cbe9ce9.jpg'),(8,12,'/Users/channing/Documents/workspace-sts-3.9.13.RELEASE/upload/e4fcebe61eda4735ab53d07d71b6d5f8.jpg','e4fcebe61eda4735ab53d07d71b6d5f8.jpg'),(11,14,'/Users/channing/Documents/workspace-sts-3.9.13.RELEASE/upload/957215ed46af4a78aec5615a85f9ff87.jpg','957215ed46af4a78aec5615a85f9ff87.jpg'),(12,14,'/Users/channing/Documents/workspace-sts-3.9.13.RELEASE/upload/21414e87e1494c51bbffed2d7f9034e4.jpg','21414e87e1494c51bbffed2d7f9034e4.jpg');
/*!40000 ALTER TABLE `url` ENABLE KEYS */;
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
