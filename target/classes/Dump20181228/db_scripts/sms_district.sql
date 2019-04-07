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
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_district_state` (`state_id`),
  CONSTRAINT `FK9q0dmy9dgad2d0ewohftj87cn` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`),
  CONSTRAINT `FK_district_state` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,'Alappuzha',1),(2,'Ernakulam',1),(3,'Idukki',1),(4,'Kannur',1),(5,'Kasaragod',1),(6,'Kollam',1),(7,'Kottayam',1),(8,'Kozhikode',1),(9,'Malappuram',1),(10,'Palakkad',1),(11,'Pathanamthitta',1),(12,'Thiruvananthapuram',1),(13,'Thrissur',1),(14,'Wayanad',1),(15,'Ariyalur',2),(16,'Chennai',2),(17,'Coimbatore',2),(18,'Cuddalore',2),(19,'Dharmapuri',2),(20,'Dindigul',2),(21,'Erode',2),(22,'Kanchipuram',2),(23,'Kanyakumari',2),(24,'Karur',2),(25,'Krishnagiri',2),(26,'Madurai',2),(27,'Nagapattinam',2),(28,'Namakkal',2),(29,'Nilgiris',2),(30,'Perambalur',2),(31,'Pudukkottai',2),(32,'Ramanathapuram',2),(33,'Salem',2),(34,'Sivaganga',2),(35,'Thanjavur',2),(36,'Theni',2),(37,'Thoothukudi',2),(38,'Tiruchirappalli',2),(39,'Tirunelveli',2),(40,'Tiruppur',2),(41,'Tiruvallur',2),(42,'Tiruvannamalai',2),(43,'Tiruvarur',2),(44,'Vellore',2),(45,'Viluppuram',2),(46,'Virudhunagar',2);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
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
