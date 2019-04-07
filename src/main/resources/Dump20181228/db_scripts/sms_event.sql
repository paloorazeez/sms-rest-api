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
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `message` blob,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` int(1) DEFAULT '1',
  `expiry_date` datetime DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_event_school_idx` (`school_id`),
  CONSTRAINT `FKrb1hb8eolrk9hqm92nb8ldpk8` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'event1','Since Android Support Library 22.2.1, Google has changed default textSize of items in NavigationView from 16sp to 14sp, which suits Material Design guideline well. However, in some cases(for example, when you want to support Chinese language), it seems larger textSize is better. Solution is simple:',_binary 'sample message','2018-12-24 21:33:53',0,'2018-12-18 12:00:00',1,'/Users/azeezpaloor/Downloads/Images/server/out/sports.png',NULL),(2,'event1','Since Android Support Library 22.2.1, Google has changed default textSize of items in NavigationView from 16sp to 14sp, which suits Material Design guideline well. However, in some cases(for example, when you want to support Chinese language), it seems larger textSize is better. Solution is simple:',_binary 'sample message','2018-12-24 21:33:53',0,'2018-12-18 12:00:00',1,'/Users/azeezpaloor/Downloads/Images/server/out/library.png',NULL),(3,'event1','Since Android Support Library 22.2.1, Google has changed default textSize of items in NavigationView from 16sp to 14sp, which suits Material Design guideline well. However, in some cases(for example, when you want to support Chinese language), it seems larger textSize is better. Solution is simple:',_binary 'sample message','2018-12-24 21:33:53',0,'2018-12-18 12:00:00',1,'/Users/azeezpaloor/Downloads/Images/server/out/exam.png',NULL);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
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
