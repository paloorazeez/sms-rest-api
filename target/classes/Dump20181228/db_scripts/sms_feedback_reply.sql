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
-- Table structure for table `feedback_reply`
--

DROP TABLE IF EXISTS `feedback_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `feedback_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` blob,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_usr_fbr_idx` (`user_id`),
  KEY `FKbpnhh37vewd38yycdhyde7j66` (`feedback_id`),
  CONSTRAINT `FKbpnhh37vewd38yycdhyde7j66` FOREIGN KEY (`feedback_id`) REFERENCES `feedback` (`id`),
  CONSTRAINT `FKp47mwr819yah73w71l7wbi1d6` FOREIGN KEY (`user_id`) REFERENCES `sms_user` (`id`),
  CONSTRAINT `fk_usr_fbr` FOREIGN KEY (`user_id`) REFERENCES `sms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_reply`
--

LOCK TABLES `feedback_reply` WRITE;
/*!40000 ALTER TABLE `feedback_reply` DISABLE KEYS */;
INSERT INTO `feedback_reply` VALUES (1,3,1,_binary 'I will ensure that eveything will be fine now onwads','2018-12-25 10:42:35',0),(2,3,2,_binary 'I dont know what to do','2018-12-25 10:42:35',0),(11,3,2,_binary 'can','2018-12-25 10:42:35',0),(14,1,2,_binary 'hiiii','2018-12-25 14:41:28',0),(15,1,2,_binary 'hiiii','2018-12-25 14:42:00',0),(16,1,2,_binary 'how are you?','2018-12-25 14:42:00',0),(17,4,2,_binary 'kkkkkk','2018-12-25 14:46:11',0),(18,1,2,_binary 'Njan nannavum','2018-12-26 07:17:25',0),(19,4,2,_binary 'I agreed','2018-12-26 23:52:47',0),(20,1,2,_binary 'Ok I will take care','2018-12-28 12:12:18',0);
/*!40000 ALTER TABLE `feedback_reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-28 21:54:05
