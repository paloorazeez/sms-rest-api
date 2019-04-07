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
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roll_number` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` enum('M','F') DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(2000) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `school_class_id` int(11) DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `parent1_id` int(11) DEFAULT NULL,
  `parent2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_student_class` (`school_class_id`),
  KEY `FK_student_parent` (`parent1_id`),
  KEY `FK_student_parent_2` (`parent2_id`),
  CONSTRAINT `FK3x69em2gd624esnmnvvihdj2f` FOREIGN KEY (`parent1_id`) REFERENCES `parent` (`id`),
  CONSTRAINT `FK8fx7xrxdqbk26ytr2l8hmr78f` FOREIGN KEY (`school_class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `FK_student_class` FOREIGN KEY (`school_class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `FK_student_parent` FOREIGN KEY (`parent1_id`) REFERENCES `parent` (`id`),
  CONSTRAINT `FK_student_parent_2` FOREIGN KEY (`parent2_id`) REFERENCES `parent` (`id`),
  CONSTRAINT `FKd4frkan1g28iva5uuke14n90e` FOREIGN KEY (`parent2_id`) REFERENCES `parent` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'2K18NMS1','Ayaan Muhammed Paloor',2,'M','2017-01-27','Erumad','686868668','hkhhk',1,0,'2018-11-21 09:12:11',1,2),(2,'2K18NMS1','Ayaan',5,'M','2017-01-27','Erumad',NULL,NULL,NULL,0,'2018-10-07 14:23:01',1,2),(3,'2K18NMS1','Ayaan',10,'M','2017-01-27','Erumad',NULL,NULL,1,0,'2018-12-28 06:43:38',1,2),(4,'2K18NMS1','Ayaan',5,'M','2017-01-27','Erumad',NULL,NULL,NULL,0,'2018-11-21 07:53:18',1,2),(6,'2K18NMS1','Basith Muhammed',5,'M','2017-01-27','Erumad',NULL,NULL,NULL,0,'2018-11-21 08:51:24',5,6),(7,'2K181001','Raju John',10,'M','2018-11-21','erumad\nkonnachal','977987979','paloorazeez@gmail.com',9,0,'2018-11-21 12:08:05',7,8),(8,'10001','Ayan M P',10,'M','2018-12-13','erumad','777777','',11,0,'2018-12-21 15:37:21',9,10);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
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
