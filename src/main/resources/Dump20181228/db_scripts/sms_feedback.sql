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
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `message` blob,
  `student_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_std_fb_idx` (`student_id`),
  KEY `fk_teacher_fb_idx` (`teacher_id`),
  CONSTRAINT `FK8x9xk5bvdd47pn4hb36j7qtsh` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FKnx2ciug1tx4kx3nea6xwhghs5` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `fk_std_fb` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `fk_teacher_fb` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Need improvement in Maths',_binary 'Since Android Support Library 22.2.1, Google has changed default textSize of items in NavigationView from 16sp to 14sp, which suits Material Design guideline well. However, in some cases(for example, when you want to support Chinese language), it seems larger textSize is better. Solution is simple',1,2,'2018-12-25 09:27:21',1),(3,'attendance is very low',_binary 'Since Android Support Library 22.2.1, Google has changed default textSize of items in NavigationView from 16sp to 14sp, which suits Material Design guideline well. However, in some cases(for example, when you want to support Chinese language), it seems larger textSize is better. Solution is simple',1,2,'2018-12-25 07:12:42',1),(4,'Progress Report not signed yet',_binary 'Since Android Support Library 22.2.1, Google has changed default textSize of items in NavigationView from 16sp to 14sp, which suits Material Design guideline well. However, in some cases(for example, when you want to support Chinese language), it seems larger textSize is better. Solution is simple',1,2,'2018-12-25 07:13:35',1),(5,'test',_binary 'Since Android Support Library 22.2.1, Google has changed default textSize of items in NavigationView from 16sp to 14sp, which suits Material Design guideline well. However, in some cases(for example, when you want to support Chinese language), it seems larger textSize is better. Solution is simple',1,2,'2018-12-25 07:09:56',1);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
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
