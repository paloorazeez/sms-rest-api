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
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `school_class_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_subject_class` (`school_class_id`),
  KEY `FK_subject_subject` (`teacher_id`),
  CONSTRAINT `FK_subject_class` FOREIGN KEY (`school_class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `FK_subject_subject` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FKdvgvxo0oxhxeepkkwug7vg4w4` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FKkxcovnbpkm2f19eu68j6cpu06` FOREIGN KEY (`school_class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (14,'Tamil',9,2,0,'2018-11-18 16:50:07'),(15,'Hindi',9,5,0,'2018-11-18 16:50:07'),(16,'Tamil',1,2,0,'2018-11-18 16:51:59'),(17,'Hindi',1,5,0,'2018-11-18 16:51:59'),(18,'Science',9,2,0,'2018-11-18 16:57:58'),(19,'Maths',1,5,0,'2018-11-18 16:59:03'),(20,'Telugu',10,5,0,'2018-11-19 00:54:24'),(21,'Social',10,2,0,'2018-11-19 00:54:24'),(22,'Physics',1,6,0,'2018-11-19 01:36:05'),(23,'English',11,14,0,'2018-12-01 08:47:43'),(24,'Quran',1,8,0,'2018-12-02 16:56:13'),(25,'eng',12,2,0,'2018-12-03 09:43:24'),(26,'mal',12,8,0,'2018-12-03 09:43:42');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
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
