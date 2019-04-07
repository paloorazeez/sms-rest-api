-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: sms
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `message` blob,
  `subject_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_sbj_asn_idx` (`subject_id`),
  CONSTRAINT `FKp1gsvxfhi4e5ek8pubhmnh6ol` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `fk_sbj_asn` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,'assignment1','maths assignemt',_binary 'It is mandatory for the students to submit all their assignments before the given deadline to score the highest grades. We create the magic in their life by delivering all their work before the asked deadline, so they do not have to suffer from grades loss. We even can meet any of your urgent deadlines.',23,'2018-12-25 21:52:54',1),(2,'assignment1','maths assignemt',_binary 'Students Assignment Help is a reputed organization that furnishes you with 100% plagiarism free and original assignment text. Our company has gained this reputation by serving students with the original and unique assignment content after doing a lot of hard work and proper research.',23,'2018-12-25 21:53:47',0);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `present` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKnq6vm31it076obtjf2qp5coim` (`student_id`),
  KEY `FKsmbis92ybw23wy803sko4ovrm` (`teacher_id`),
  CONSTRAINT `FKnq6vm31it076obtjf2qp5coim` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `FKsmbis92ybw23wy803sko4ovrm` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,1,6,'2018-12-22','09:00:00','17:00:00',1),(2,1,6,'2018-12-21','09:00:00','17:00:00',0),(3,1,6,'2018-12-23','09:00:00','17:00:00',0);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `class_teacher_id` int(11) DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_class_teacher` (`class_teacher_id`),
  CONSTRAINT `FK_class_teacher` FOREIGN KEY (`class_teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FKp3d62vtdb36k1tye1ko6oxgim` FOREIGN KEY (`class_teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'1st Std',5,1,'2018-11-18 16:51:59'),(9,'2nd Std',5,0,'2018-11-18 16:50:07'),(10,'3rd Std',2,0,'2018-11-19 00:54:24'),(11,'1st Std',14,0,'2018-12-01 08:47:43'),(12,'3rd std',8,0,'2018-12-03 09:43:24');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'event1','Since Android Support Library 22.2.1, Google has changed default textSize of items in NavigationView from 16sp to 14sp, which suits Material Design guideline well. However, in some cases(for example, when you want to support Chinese language), it seems larger textSize is better. Solution is simple:',_binary 'sample message','2019-01-06 11:21:45',0,'2018-12-18 12:00:00',4,'/Users/azeezpaloor/Downloads/Images/server/out/events/2019-01-06//Users/azeezpaloor/Downloads/Images/server/out/sports.png',NULL),(2,'event1','Since Android Support Library 22.2.1, Google has changed default textSize of items in NavigationView from 16sp to 14sp, which suits Material Design guideline well. However, in some cases(for example, when you want to support Chinese language), it seems larger textSize is better. Solution is simple:',_binary 'sample message','2018-12-24 21:33:53',0,'2018-12-18 12:00:00',1,'/Users/azeezpaloor/Downloads/Images/server/out/library.png',NULL),(3,'event1','Since Android Support Library 22.2.1, Google has changed default textSize of items in NavigationView from 16sp to 14sp, which suits Material Design guideline well. However, in some cases(for example, when you want to support Chinese language), it seems larger textSize is better. Solution is simple:',_binary 'sample message','2019-01-01 15:35:50',0,'2018-12-18 12:00:00',2,'/Users/azeezpaloor/Downloads/Images/server/out/exam.png',NULL),(4,'event1wwww','Since Android Support Library 22.2.1, Google has changed default textSize of items in NavigationView from 16sp to 14sp, which suits Material Design guideline well. However, in some cases(for example, when you want to support Chinese language), it seems larger textSize is better. Solution is simple:',_binary 'sample message','2019-01-06 11:47:01',0,'2018-12-18 12:00:00',10,'/Users/azeezpaloor/Downloads/Images/server/out/events/2019-01-06/1546755394063sports.png',NULL),(5,'event1wwww','Since Android Support Library 22.2.1, Google has changed default textSize of items in NavigationView from 16sp to 14sp, which suits Material Design guideline well. However, in some cases(for example, when you want to support Chinese language), it seems larger textSize is better. Solution is simple:',_binary 'sample message','2019-01-06 11:24:45',0,'2018-12-18 12:00:00',6,'/Users/azeezpaloor/Downloads/Images/server/out/events/2019-01-06//Users/azeezpaloor/Downloads/Images/server/out/sports.png',NULL),(6,'simulator','jjjj',_binary 'sfsfs','2019-01-06 11:53:50',0,NULL,1,'/Users/azeezpaloor/Downloads/Images/server/out/events/2019-01-06/1546755818688ghost.png',NULL),(7,'database','dfdfj',_binary 'dfkdfjkjd','2019-01-06 12:14:59',0,NULL,1,'/Users/azeezpaloor/Downloads/Images/server/out/events/2019-01-06/1546757097441exam.png',NULL),(8,'errrr','rrrr',_binary 'rrrrr','2019-01-06 12:16:33',0,NULL,1,'/Users/azeezpaloor/Downloads/Images/server/out/events/2019-01-06/1546757193171ghost.png',NULL),(9,'aaa','aaa',_binary 'aaa','2019-01-06 12:19:38',0,NULL,1,'/Users/azeezpaloor/Downloads/Images/server/out/events/2019-01-06/1546757378019ghost.png',NULL),(10,'nn','nn',_binary 'mmm','2019-01-06 12:20:37',0,NULL,1,'/Users/azeezpaloor/Downloads/Images/server/out/events/2019-01-06/1546757437719exam.png',NULL),(11,'rarra','rar',_binary 'rar','2019-01-06 12:25:14',0,NULL,1,'/Users/azeezpaloor/Downloads/Images/server/out/events/2019-01-06/1546757714669ghost.png',NULL);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_active` int(1) DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_subjects`
--

DROP TABLE IF EXISTS `exam_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exam_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `exam_date` datetime DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_exm_exsbj_idx` (`exam_id`),
  KEY `fk_sbj_exsbj_idx` (`subject_id`),
  CONSTRAINT `fk_exm_exsbj` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  CONSTRAINT `fk_sbj_exsbj` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_subjects`
--

LOCK TABLES `exam_subjects` WRITE;
/*!40000 ALTER TABLE `exam_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_subjects` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Updated feedback',_binary 'Since Android Support Library 22.2.1, Google has changed default textSize of items in NavigationView from 16sp to 14sp, which suits Material Design guideline well. However, in some cases(for example, when you want to support Chinese language), it seems larger textSize is better. Solution is simple',1,2,'2018-12-31 20:39:01',1),(3,'attendance is very low',_binary 'Since Android Support Library 22.2.1, Google has changed default textSize of items in NavigationView from 16sp to 14sp, which suits Material Design guideline well. However, in some cases(for example, when you want to support Chinese language), it seems larger textSize is better. Solution is simple',1,2,'2018-12-25 07:12:42',1),(4,'Progress Report not signed yet',_binary 'Since Android Support Library 22.2.1, Google has changed default textSize of items in NavigationView from 16sp to 14sp, which suits Material Design guideline well. However, in some cases(for example, when you want to support Chinese language), it seems larger textSize is better. Solution is simple',8,2,'2019-01-01 15:37:46',1),(5,'test',_binary 'Since Android Support Library 22.2.1, Google has changed default textSize of items in NavigationView from 16sp to 14sp, which suits Material Design guideline well. However, in some cases(for example, when you want to support Chinese language), it seems larger textSize is better. Solution is simple',8,2,'2019-01-01 15:37:46',1),(6,'hhhh',_binary 'kkk',1,NULL,'2019-01-10 07:34:32',0),(7,'hhhhh',_binary 'kkkkk',1,8,'2019-01-10 21:14:11',0),(8,'hiiii',_binary 'jiiiiiii',4,8,'2019-01-10 21:29:02',0),(9,'uiuii',_binary 'jkjkjkjkjkj',6,8,'2019-01-10 21:35:35',0);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_reply`
--

LOCK TABLES `feedback_reply` WRITE;
/*!40000 ALTER TABLE `feedback_reply` DISABLE KEYS */;
INSERT INTO `feedback_reply` VALUES (1,3,1,_binary 'I will ensure that eveything will be fine now onwads','2018-12-25 10:42:35',0),(2,3,2,_binary 'I dont know what to do','2018-12-25 10:42:35',0),(11,3,2,_binary 'can','2018-12-25 10:42:35',0),(14,1,2,_binary 'hiiii','2018-12-25 14:41:28',0),(15,1,2,_binary 'hiiii','2018-12-25 14:42:00',0),(16,1,2,_binary 'how are you?','2018-12-25 14:42:00',0),(17,4,2,_binary 'kkkkkk','2018-12-25 14:46:11',0),(18,1,2,_binary 'Njan nannavum','2018-12-26 07:17:25',0),(19,4,2,_binary 'I agreed','2018-12-26 23:52:47',0),(20,1,2,_binary 'Ok I will take care','2018-12-28 12:12:18',0),(21,7,2,_binary 'what the hell','2019-01-10 21:41:56',0),(22,6,2,_binary 'hhhhh','2019-01-10 21:42:14',0),(23,7,2,_binary 'who are you?','2019-01-10 21:42:42',0),(24,7,3,_binary 'uuuuu','2019-01-11 06:29:54',0),(25,7,2,_binary 'nokkam','2019-01-11 06:38:38',0);
/*!40000 ALTER TABLE `feedback_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `mark` decimal(20,2) DEFAULT NULL,
  `total` decimal(20,2) DEFAULT NULL,
  `result` varchar(45) DEFAULT NULL,
  `is_active` int(1) DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_std_mrk_idx` (`student_id`),
  KEY `fk_sbj_mrk_idx` (`subject_id`),
  KEY `fk_exm_mrk_idx` (`exam_id`),
  CONSTRAINT `fk_exm_mrk` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  CONSTRAINT `fk_sbj_mrk` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `fk_std_mrk` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `parent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `sex` enum('M','F') DEFAULT NULL,
  `phone_number1` varchar(50) DEFAULT NULL,
  `phone_number2` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent`
--

LOCK TABLES `parent` WRITE;
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
INSERT INTO `parent` VALUES (1,'Azeez',32,'1987-02-05','M','9620897195',NULL,NULL,0,'2018-11-21 09:04:48','Erumad'),(2,'Rashida',26,'1987-02-05','F','9620897195',NULL,NULL,0,'2018-11-21 09:04:48','Erumad'),(3,'Basheer',32,'1987-02-05','M','9620897195',NULL,NULL,0,'2018-11-21 08:49:52','Erumad'),(4,'Bushara',26,'1987-02-05','F','9620897195',NULL,NULL,0,'2018-11-21 08:49:52','Erumad'),(5,'Basheer',32,'1987-02-05','M','9620897195',NULL,NULL,0,'2018-11-21 08:51:24','Erumad'),(6,'Bushara',26,'1987-02-05','F','9620897195',NULL,NULL,0,'2018-11-21 08:51:24','Erumad'),(7,'John',40,'1978-11-21','M','7897987979','77987987','khkjhh',0,'2018-11-21 12:08:05','Erumad\n643239'),(8,'Lilly',35,'1987-11-29','F','77879798','7887','add',0,'2018-11-21 12:08:05','Erumad\nVettuvadi'),(9,'Azeez',32,'2018-12-15','M','878','786','',0,'2018-12-01 09:26:45','erumad'),(10,'Rashida',27,'2018-12-06','F','123','123','',0,'2018-12-01 09:26:45','emd');
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '0',
  `address` varchar(2500) NOT NULL DEFAULT '0',
  `contact_number` varchar(20) NOT NULL DEFAULT '0',
  `state` varchar(50) NOT NULL DEFAULT '0',
  `district` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (1,'Nilgiri School','Kayyunni','9620897195','Tamilnadu','Nilgiris'),(2,'Secret Heart','Kayyunni','9620897195','Kerala','Wayanad'),(4,'Nilgiri School','Kayyunni','9620897195','Tamilnadu','Nilgiris'),(5,'Nilgiri School','Kayyunni','9620897195','Tamilnadu','Nilgiris'),(6,'Nilgiri School','Kayyunni','9620897195','Tamilnadu','Nilgiris'),(7,'Nilgiri School','Kayyunni','9620897195','Tamilnadu','Nilgiris'),(8,'Nilgiri School','Kayyunni','9620897195','Tamilnadu','Nilgiris'),(9,'Nilgiri School','Kayyunni','9620897195','Tamilnadu','Nilgiris'),(10,'Nilgiri School','Kayyunni','9620897195','Tamilnadu','Nilgiris');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_user`
--

LOCK TABLES `sms_user` WRITE;
/*!40000 ALTER TABLE `sms_user` DISABLE KEYS */;
INSERT INTO `sms_user` VALUES (1,'azeez',1,'teacher',NULL,1,'2018-11-24 23:36:16','123',1),(2,'admin',1,'student',NULL,0,'2019-01-01 15:18:02','$2a$10$msMSnBuAf8PCbxisFUJ3x.52Q6wLIK9nW7ZBYIdg7uk3AH/2miGuy',1),(3,'rashida',8,'teacher',NULL,0,'2019-01-01 22:19:03','$2a$10$M0okk0mkeoOG62M0Myx9CONnsD8jKfPIIY.x351cBtg5VrBqYFbVG',1);
/*!40000 ALTER TABLE `sms_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Kerala'),(2,'Tamilnadu');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `student` VALUES (1,'2K18NMS1','Ayaan Muhammed Paloor',2,'M','2017-01-27','Erumad','686868668','hkhhk',11,0,'2019-01-01 10:35:51',1,2),(2,'2K18NMS1','Ayaan',5,'M','2017-01-27','Erumad',NULL,NULL,11,0,'2019-01-06 13:03:11',1,2),(3,'2K18NMS1','Ayaan',10,'M','2017-01-27','Erumad',NULL,NULL,1,0,'2018-12-28 06:43:38',1,2),(4,'2K18NMS1','Ayaan',5,'M','2017-01-27','Erumad',NULL,NULL,11,0,'2019-01-06 13:03:11',1,2),(6,'2K18NMS1','Basith Muhammed',5,'M','2017-01-27','Erumad',NULL,NULL,11,0,'2019-01-06 13:03:11',5,6),(7,'2K181001','Raju John',10,'M','2018-11-21','erumad\nkonnachal','977987979','paloorazeez@gmail.com',9,0,'2018-11-21 12:08:05',7,8),(8,'10001','Ayan M P',10,'M','2018-12-13','erumad','777777','',11,0,'2018-12-21 15:37:21',9,10);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (2,'Chinju',30,'F','Erumad','23232323','ererer','1987-12-01',0,'2018-12-02 16:33:46',1),(5,'Zakariya',50,'M','Bangalore','23232323','ererer','1947-12-01',0,'2018-12-02 16:33:46',1),(6,'Azeez',30,'M','Erumad','23232323','ererer','0015-12-01',1,'2018-12-02 16:33:46',1),(7,'Jameela',30,'F','Erumad','23232323','ererer','1987-12-01',0,'2018-12-02 16:33:46',1),(8,'Rashida',26,'F','Erumad','23232323','ererer','0015-12-01',1,'2018-12-02 16:33:46',1),(9,'Rashida',26,'F','Erumad','23232323','ererer','0015-12-01',1,'2018-12-02 16:33:46',1),(11,'Anurag',42,'M','Bangalore','987979879','paloorazeez@gmail.com','2018-11-19',0,'2018-12-02 16:33:46',1),(13,'Test',12,'M','a','111à','ss','2018-11-30',0,'2018-12-02 16:33:46',1),(14,'Azeez',32,'M','erumad','9620897195','paloorazeez@gmail.com','2018-12-01',0,'2018-12-02 16:33:46',1),(15,'Noufal',19,'M','Voyager Building White field Road, ITPB Near to Victor Building','09620897195','noufu@gmail.com','2018-12-30',0,'2018-12-30 05:24:19',1);
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

-- Dump completed on 2019-01-12  5:17:09
