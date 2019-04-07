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
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` enum('M','F') DEFAULT NULL,
  `address` varchar(2500) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `is_active` int(1) DEFAULT '1',
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_teacher_school` (`school_id`),
  CONSTRAINT `FK_teacher_school` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`),
  CONSTRAINT `FKrg46bnmgbcccayv14naymqg3r` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (2,'Chinju',30,'F','Erumad','23232323','ererer','1987-12-01',0,'2018-12-02 16:33:46',1),(5,'Zakariya',50,'M','Bangalore','23232323','ererer','1947-12-01',0,'2018-12-02 16:33:46',1),(6,'Azeez',30,'M','Erumad','23232323','ererer','0015-12-01',1,'2018-12-02 16:33:46',1),(7,'Jameela',30,'F','Erumad','23232323','ererer','1987-12-01',0,'2018-12-02 16:33:46',1),(8,'Rashida',26,'F','Erumad','23232323','ererer','0015-12-01',1,'2018-12-02 16:33:46',1),(9,'Rashida',26,'F','Erumad','23232323','ererer','0015-12-01',1,'2018-12-02 16:33:46',1),(11,'Anurag',42,'M','Bangalore','987979879','paloorazeez@gmail.com','2018-11-19',0,'2018-12-02 16:33:46',1),(13,'Test',12,'M','a','111à','ss','2018-11-30',0,'2018-12-02 16:33:46',1),(14,'Azeez',32,'M','erumad','9620897195','paloorazeez@gmail.com','2018-12-01',0,'2018-12-02 16:33:46',1);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
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
