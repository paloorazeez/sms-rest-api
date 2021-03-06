-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: sms
-- ------------------------------------------------------
-- Server version	8.0.13

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
-- Table structure for table `sms_user`
--

DROP TABLE IF EXISTS `sms_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sms_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `link_id` int(11) DEFAULT NULL,
  `user_type` varchar(45) NOT NULL,
  `expire_date` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(100) NOT NULL,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_user`
--

LOCK TABLES `sms_user` WRITE;
/*!40000 ALTER TABLE `sms_user` DISABLE KEYS */;
INSERT INTO `sms_user` VALUES (1,'azeez',1,'teacher',NULL,1,'2018-11-24 23:36:16','123',1),(2,'admin',1,'teacher',NULL,0,'2018-11-24 23:36:37','$2a$10$msMSnBuAf8PCbxisFUJ3x.52Q6wLIK9nW7ZBYIdg7uk3AH/2miGuy',1);
/*!40000 ALTER TABLE `sms_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-28 21:54:06
