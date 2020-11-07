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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '0-common_user;1-admin;2-poster',
  `create_time` timestamp NULL DEFAULT NULL,
  `credits` double(30,0) DEFAULT NULL,
  `headerUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,'admin','123456','123','234@qq.com',1,'2019-12-31 16:00:00',100,NULL),(1,'sam','123','123','111@qq.com',0,'2020-05-01 16:00:00',1,NULL),(2,'linda','1','123','332@qq.com',0,'2020-08-08 16:00:00',2,NULL),(3,'SDD','1234565d5a7','5d5a7','qwer@gmail.com',0,'2020-10-31 18:00:21',0,'http://localhost:8080/waiver5619/user/header/afaced24d1744c8a88d8674ef375d655.jpeg'),(4,'Amy','e05883cc20894634b39683bbc59b4aeb','52f37','1111@qq.com',0,'2020-11-05 04:08:09',0,'http://localhost:8080/waiver5619/user/header/14c367ad083741a29befe93beccc4db5.jpg'),(5,'dog','5f4f5d7c7d2d61d9478b0a7a78e53c29','62ce7','1234@qq.com',0,'2020-11-07 13:52:57',0,'http://localhost:8080/waiver5619/user/header/a466d2be40cb45d7b6810dbf6b9d29eb.jpeg'),(6,'Villa','829fe5fa31b178271cd7080bfdd1aa9d','e2255','123456@163.com',0,'2020-11-07 18:11:44',0,'http://localhost:8080/waiver5619/user/header/d267bacf9911499eac8234d206db7f81.jpeg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
