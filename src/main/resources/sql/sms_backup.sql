-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.13-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for sms
DROP DATABASE IF EXISTS `sms`;
CREATE DATABASE IF NOT EXISTS `sms` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sms`;

-- Dumping structure for table sms.class
DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `class_teacher_id` int(11) DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_class_teacher` (`class_teacher_id`),
  CONSTRAINT `FK_class_teacher` FOREIGN KEY (`class_teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table sms.class: ~1 rows (approximately)
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` (`id`, `name`, `class_teacher_id`, `is_active`, `created_date`) VALUES
	(1, '1st Std', 2, 1, '2018-10-06 20:42:44');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;

-- Dumping structure for table sms.district
DROP TABLE IF EXISTS `district`;
CREATE TABLE IF NOT EXISTS `district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_district_state` (`state_id`),
  CONSTRAINT `FK_district_state` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- Dumping data for table sms.district: ~46 rows (approximately)
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` (`id`, `name`, `state_id`) VALUES
	(1, 'Alappuzha', 1),
	(2, 'Ernakulam', 1),
	(3, 'Idukki', 1),
	(4, 'Kannur', 1),
	(5, 'Kasaragod', 1),
	(6, 'Kollam', 1),
	(7, 'Kottayam', 1),
	(8, 'Kozhikode', 1),
	(9, 'Malappuram', 1),
	(10, 'Palakkad', 1),
	(11, 'Pathanamthitta', 1),
	(12, 'Thiruvananthapuram', 1),
	(13, 'Thrissur', 1),
	(14, 'Wayanad', 1),
	(15, 'Ariyalur', 2),
	(16, 'Chennai', 2),
	(17, 'Coimbatore', 2),
	(18, 'Cuddalore', 2),
	(19, 'Dharmapuri', 2),
	(20, 'Dindigul', 2),
	(21, 'Erode', 2),
	(22, 'Kanchipuram', 2),
	(23, 'Kanyakumari', 2),
	(24, 'Karur', 2),
	(25, 'Krishnagiri', 2),
	(26, 'Madurai', 2),
	(27, 'Nagapattinam', 2),
	(28, 'Namakkal', 2),
	(29, 'Nilgiris', 2),
	(30, 'Perambalur', 2),
	(31, 'Pudukkottai', 2),
	(32, 'Ramanathapuram', 2),
	(33, 'Salem', 2),
	(34, 'Sivaganga', 2),
	(35, 'Thanjavur', 2),
	(36, 'Theni', 2),
	(37, 'Thoothukudi', 2),
	(38, 'Tiruchirappalli', 2),
	(39, 'Tirunelveli', 2),
	(40, 'Tiruppur', 2),
	(41, 'Tiruvallur', 2),
	(42, 'Tiruvannamalai', 2),
	(43, 'Tiruvarur', 2),
	(44, 'Vellore', 2),
	(45, 'Viluppuram', 2),
	(46, 'Virudhunagar', 2);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;

-- Dumping structure for table sms.parent
DROP TABLE IF EXISTS `parent`;
CREATE TABLE IF NOT EXISTS `parent` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table sms.parent: ~2 rows (approximately)
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
INSERT INTO `parent` (`id`, `name`, `age`, `dob`, `sex`, `phone_number1`, `phone_number2`, `email`, `is_active`, `created_date`, `address`) VALUES
	(1, 'Azeez', 32, '1987-02-05', 'M', '9620897195', NULL, NULL, 1, '2018-10-07 18:08:21', 'Erumad'),
	(2, 'Rashida', 26, '1987-02-05', 'F', '9620897195', NULL, NULL, 1, '2018-10-07 18:08:21', 'Erumad');
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;

-- Dumping structure for table sms.school
DROP TABLE IF EXISTS `school`;
CREATE TABLE IF NOT EXISTS `school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '0',
  `address` varchar(2500) NOT NULL DEFAULT '0',
  `contact_number` varchar(20) NOT NULL DEFAULT '0',
  `state` varchar(50) NOT NULL DEFAULT '0',
  `district` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table sms.school: ~2 rows (approximately)
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` (`id`, `name`, `address`, `contact_number`, `state`, `district`) VALUES
	(1, 'Nilgiri School', 'Kayyunni', '9620897195', 'Tamilnadu', 'Nilgiris'),
	(2, 'Secret Heart', 'Kayyunni', '9620897195', 'Kerala', 'Wayanad');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;

-- Dumping structure for table sms.state
DROP TABLE IF EXISTS `state`;
CREATE TABLE IF NOT EXISTS `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table sms.state: ~2 rows (approximately)
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` (`id`, `name`) VALUES
	(1, 'Kerala'),
	(2, 'Tamilnadu');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;

-- Dumping structure for table sms.student
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
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
  CONSTRAINT `FK_student_class` FOREIGN KEY (`school_class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `FK_student_parent` FOREIGN KEY (`parent1_id`) REFERENCES `parent` (`id`),
  CONSTRAINT `FK_student_parent_2` FOREIGN KEY (`parent2_id`) REFERENCES `parent` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table sms.student: ~1 rows (approximately)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`id`, `roll_number`, `name`, `age`, `sex`, `dob`, `address`, `phone_number`, `email`, `school_class_id`, `is_active`, `created_date`, `parent1_id`, `parent2_id`) VALUES
	(1, '2K18NMS1', 'Ayaan', 5, 'M', '2017-01-27', 'Erumad', NULL, NULL, 1, 1, '2018-10-07 19:53:01', 1, 2);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- Dumping structure for table sms.subject
DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
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
  CONSTRAINT `FK_subject_subject` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table sms.subject: ~0 rows (approximately)
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` (`id`, `name`, `school_class_id`, `teacher_id`, `is_active`, `created_date`) VALUES
	(1, 'English', 1, 2, 1, '2018-10-06 21:59:47');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;

-- Dumping structure for table sms.teacher
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
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
  CONSTRAINT `FK_teacher_school` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table sms.teacher: ~2 rows (approximately)
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`id`, `name`, `age`, `sex`, `address`, `contact_number`, `email`, `dob`, `is_active`, `created_date`, `school_id`) VALUES
	(2, 'Jameela', 30, 'F', 'Erumad', '23232323', 'ererer', '0015-12-01', 1, '2018-10-06 20:27:44', 1),
	(5, 'Rajan', 35, 'M', 'Erumad', '34342334', 'ereree', '2018-10-06', 1, '2018-10-06 14:08:22', 2);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
