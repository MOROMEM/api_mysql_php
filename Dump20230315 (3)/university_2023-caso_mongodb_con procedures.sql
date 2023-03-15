CREATE DATABASE  IF NOT EXISTS `university_2023_caso_mongodb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `university_2023_caso_mongodb`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: university_2023_caso_mongodb
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advisor`
--

DROP TABLE IF EXISTS `advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advisor` (
  `s_ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `i_ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `i_ID` (`i_ID`),
  KEY `s_ID` (`s_ID`),
  CONSTRAINT `advisor_ibfk_2` FOREIGN KEY (`s_ID`) REFERENCES `student` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `advisor_ibfk_3` FOREIGN KEY (`i_ID`) REFERENCES `instructor` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisor`
--

LOCK TABLES `advisor` WRITE;
/*!40000 ALTER TABLE `advisor` DISABLE KEYS */;
INSERT INTO `advisor` VALUES ('00128','45565'),('12345','10101'),('23121','76543'),('44553','22222'),('45678','22222'),('76543','45565'),('76653','98345'),('98765','98345'),('98988','76766');
/*!40000 ALTER TABLE `advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classroom` (
  `building` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_number` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`building`,`room_number`),
  CONSTRAINT `classroom_ibfk_1` FOREIGN KEY (`building`) REFERENCES `department` (`building`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `classroom_ibfk_2` FOREIGN KEY (`building`) REFERENCES `department` (`building`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` VALUES ('Packard','101',500),('Painter','514',10),('Taylor','3128',70),('Watson','100',30),('Watson','120',50);
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credits` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('BIO-101','Intro. to Biology','Biology',4),('BIO-301','Genetics','Biology',4),('BIO-399','Computational Biology','Biology',3),('CS-101','Intro. to Computer Science','Comp. Sci.',4),('CS-190','Game Design','Comp. Sci.',4),('CS-315','Robotics','Comp. Sci.',3),('CS-319','Image Processing','Comp. Sci.',3),('CS-347','Database System Concepts','Comp. Sci.',3),('EE-181','Intro. to Digital Systems','Elec. Eng.',3),('FIN-201','Investment Banking','Finance',3),('HIS-351','World History','History',3),('MU-199','Music Video Production','Music',3),('PHY-101','Physical Principles','Physics',4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `building` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`dept_name`),
  KEY `building` (`building`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Biology','Watson',90000.00),('Comp. Sci.','Taylor',100000.00),('Elec. Eng.','Taylor',85000.00),('Finance','Painter',120000.00),('History','Painter',50000.00),('Music','Packard',80000.00),('Physics','Watson',70000.00);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `field` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_json` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES ('10101','Srinivasan','Comp. Sci.',65000.00,0),('12121','Wu','Finance',90000.00,1),('15151','Mozart','Music',40000.00,0),('22222','Einstein','Physics',95000.00,0),('32343','El Said','History',60000.00,1),('33456','Gold','Physics',87000.00,0),('45565','Katz','Comp. Sci.',75000.00,1),('58583','Califieri','History',62000.00,1),('76543','Singh','Finance',80000.00,0),('76766','Crick','Biology',72000.00,0),('83821','Brandt','Comp. Sci.',92000.00,1),('98345','Kim','Elec. Eng.',80000.00,1);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mongodb_objects`
--

DROP TABLE IF EXISTS `mongodb_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mongodb_objects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_mongodb` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mongodb_objects`
--

LOCK TABLES `mongodb_objects` WRITE;
/*!40000 ALTER TABLE `mongodb_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `mongodb_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mytables`
--

DROP TABLE IF EXISTS `mytables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mytables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `myvalues` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mytables`
--

LOCK TABLES `mytables` WRITE;
/*!40000 ALTER TABLE `mytables` DISABLE KEYS */;
/*!40000 ALTER TABLE `mytables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prereq`
--

DROP TABLE IF EXISTS `prereq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prereq` (
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prereq_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`course_id`,`prereq_id`),
  KEY `prereq_id` (`prereq_id`),
  CONSTRAINT `prereq_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `prereq_ibfk_2` FOREIGN KEY (`prereq_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prereq`
--

LOCK TABLES `prereq` WRITE;
/*!40000 ALTER TABLE `prereq` DISABLE KEYS */;
INSERT INTO `prereq` VALUES ('BIO-301','BIO-101'),('BIO-399','BIO-101'),('CS-190','CS-101'),('CS-315','CS-101'),('CS-319','CS-101'),('CS-347','CS-101'),('EE-181','PHY-101');
/*!40000 ALTER TABLE `prereq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!50001 DROP VIEW IF EXISTS `relations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `relations` AS SELECT 
 1 AS `ID`,
 1 AS `FOR_NAME`,
 1 AS `REF_NAME`,
 1 AS `N_COLS`,
 1 AS `TYPE`,
 1 AS `FOR_COL_NAME`,
 1 AS `REF_COL_NAME`,
 1 AS `POS`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `building` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_number` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_slot_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`course_id`,`sec_id`,`semester`,`year`,`building`,`room_number`,`time_slot_id`),
  KEY `building` (`building`,`room_number`),
  KEY `time_slot_id` (`time_slot_id`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`building`, `room_number`) REFERENCES `classroom` (`building`, `room_number`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `section_ibfk_3` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slot` (`time_slot_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES ('BIO-101','1','Summer',2017,'Packard','101','A'),('BIO-301','1','Summer',2018,'Painter','514','A'),('CS-190','1','Spring',2017,'Taylor','3128','A'),('CS-347','1','Fall',2017,'Taylor','3128','A'),('PHY-101','1','Fall',2017,'Watson','100','A'),('BIO-101','1','Summer',2017,'Painter','514','B'),('CS-319','1','Spring',2018,'Watson','100','B'),('FIN-201','1','Spring',2018,'Packard','101','B'),('CS-319','2','Spring',2018,'Taylor','3128','C'),('EE-181','1','Spring',2017,'Taylor','3128','C'),('HIS-351','1','Spring',2018,'Painter','514','C'),('CS-315','1','Spring',2018,'Watson','120','D'),('MU-199','1','Spring',2018,'Packard','101','D'),('CS-190','2','Spring',2017,'Taylor','3128','E'),('CS-101','1','Spring',2018,'Packard','101','F'),('CS-101','1','Fall',2017,'Packard','101','H');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_cred` decimal(3,0) DEFAULT NULL,
  `picture` longblob NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('00128','Zhang','Comp. Sci.',102,''),('12345','Shankar','Comp. Sci.',32,''),('19991','Brandt','History',80,''),('23121','Chavez','Finance',110,''),('44553','Peltier','Physics',56,''),('45678','Levy','Physics',46,''),('54321','Williams','Comp. Sci.',54,''),('55739','Sanchez','Music',38,''),('70557','Snow','Physics',56,''),('76543','Brown','Comp. Sci.',58,''),('76653','Aoi','Elec. Eng.',60,''),('98765','Bourikas','Elec. Eng.',98,''),('98988','Tanaka','Biology',120,'');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_image`
--

DROP TABLE IF EXISTS `student_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_image` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_cred` decimal(3,0) DEFAULT NULL,
  `picture` longblob NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_image`
--

LOCK TABLES `student_image` WRITE;
/*!40000 ALTER TABLE `student_image` DISABLE KEYS */;
INSERT INTO `student_image` VALUES ('00128','Zhang','Comp. Sci.',102,_binary '�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0�i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0�\0\0\0\0\0\0\0H�\0\0\0\0\0\0\0H\0\0\0\0�\�\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\��ُ\0�\�	�\��B~�\��ICC_PROFILE\0\0\0�lcms0\0\0mntrRGB XYZ \�\0\0\0\0\0\0&acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\08cprt\0\0@\0\0\0Nwtpt\0\0�\0\0\0chad\0\0�\0\0\0,rXYZ\0\0\�\0\0\0bXYZ\0\0\�\0\0\0gXYZ\0\0�\0\0\0rTRC\0\0\0\0\0 gTRC\0\0,\0\0\0 bTRC\0\0L\0\0\0 chrm\0\0l\0\0\0$mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\0\0\0\0\0s\0R\0G\0B\0 \0b\0u\0i\0l\0t\0-\0i\0n\0\0mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\02\0\0\0\0N\0o\0 \0c\0o\0p\0y\0r\0i\0g\0h\0t\0,\0 \0u\0s\0e\0 \0f\0r\0e\0e\0l\0y\0\0\0\0XYZ \0\0\0\0\0\0�\�\0\0\0\0\0\�-sf32\0\0\0\0\0J\0\0\����*\0\0�\0\0����������\0\0\�\0\0��XYZ \0\0\0\0\0\0o�\0\08\�\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��XYZ \0\0\0\0\0\0b�\0\0��\0\0\�para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[chrm\0\0\0\0\0\0\0\0\0�\�\0\0T{\0\0L\�\0\0��\0\0&f\0\0\\��\0\0H\0H\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0C\0	\Z!\Z\"$\"$�\�\0C�\�\0\0	�\�\0\0\0?\0\�u\�ԣq��\��\�*�̎�\"�F\�O1X/\�^\\c\�˗�cK�6_�o[#\�\�Q`�1�9�r?ڬ\�\�\�_K,>zkw��\�\��2���\��k:\�\�\"�4�I\�[Pq\�\�ۨ\�\�\r8�\�T	\�~kUMsZՓ@�ƙ5�\�n�\� \�ǌm\�\�\��?_Ϊ0��\�D\�9\ZZ\�_\�Y\'\�jz�8�r�7\�/��v�i�\�h:4s\�\�\r\�\�\�u\������h\�;=Jo0\�d\0IՈp:W;�h����\�~\�\�\r�fC\�{\�\�\�9�rE\�qh<#7\��\�\�pwI&\�\�\�\�ix\0[�\"\�v�� ooJ�-F�r?H�\�\n1�G \�5_\�X�!�0y\��އqῴ-\"{��{*\����\���ΰN\�H�\�N*�ՙ\�\�#�\�\�ua\�j������ڨ�TB\�X���\��\�\�W�\�M\�F�L>X�\�ظ܀|���sP\�1\�䱗�\�x��H\�\�\�b\"|ih��f�\r�Τ�J�W�\�F\�@�{�jW\��nm�*\�5o^x�T�O{\�&�n#B��:�\�;{}kc,�D�\�\�\�y�,��\�#)\�\�pG\�C�h�lm\n1n\�[�7�\0\�7�	M~/\�J9;���Ƹ�� x\�K�Z\\�0.3�rs�8�(�F�\��\��U�[\�K�Y�mp�\�7?f��Q�\�X\�d\�Ͽ��\�\�\�kN�\0\�I��k)Su\�P�T\�c.�]��rq\���Ut\�s΄T�\�=\'����\0N\�\����E\�\�\"�\�b?\�p\�S\��J�\�\�\�M\����J\�n^\�\�)|U��<S\�\�n�\�󩤵*{��%�\�\�	:�bp3\�\�T^�~���Kl���h׼c\��\���jv[�s\'\�\�I�q\�7Gғ\�H\rݤ\�x�?��\��\��j]4uZ20X�pA��NqO�P�4\�<Qō\�;v��un\�\Z���6\��\�\�K�b?�֮V�̐ޙ��1\�ĳ.O �;?\Z\���\�9e���q�Xi��\�i�]9\�㵟\��p�R;v\�\��\�[P��ԥ����Y\�n󤐁������\�J\��=�\��2�ci]-L�\�~8�\���F�&���u\�ͩ22�\0x�Z˳��y?�/�L�\�\��s�\�\�8\�$s\�Ȱ�T�9W�\�}r�\'2��c��M?\�/�h�]\�q�jY\�\�wal\r��e8`�ּ29$�	\�{����w�[xl�2~�\0�qڻ�\�\�\�\�z�el\����C\��8\��.��\0\�\�\�V��\0@\�u-:x��u[f��2{��O/�VL�f���H\�M�Ȼ�l\�Es�kI�\�\���f\�\�3���\0\n\�xZ�߼��\�i\�V�=·\nt�#\�Ym��\�\n\��)\��\�ɂv���e��?�\��MY\�U\�	G��\�C�J\�H3�+\����g�U\�/�.fLZ����\�ߧ>՟\�+��ۏ?\�1p\���^���y�\'Y\�\\�c\��1\�@}G\�Z���|Oo�\�j��=Ŭ6l�8�Jʱ�N�\�@.�\�\'�H\�U�0Teo�Μ\�L\';\�\�a\�\���P\�\�Fx\�NGBx���\�\�n\��p3���S�25\�/l7\��F)+v��w��K\�F�\�̙WS�B�9��(�U��yP� 䓒}�I�\�\�+(r@㡫V��,4�Ո\�{d��\0\Z�\�Y�\�*��{��.]�#N\�\�_<�?\Z�\�%@�rH\�\�\���M\�R%��=sAvO\�d�+\�<d�N\�\\x?\�rKCrS=$:��T��V��\����}��\��\�I�\����A\�\��Rj��o�O��\\���\�\�~\�3\�Z�m\��w3�9���.�\0\�\��\0]��^��,x�W�\�y�ƍ<\'gk\�Ho\�u%�ʻ�#��6\��p�a\���\�P�\0�o��\�<-9>c_�U�Z\�&�kk���\��\0h/d�\0��@*�M���w�[����\�of��3�\�J\�\�\�d22�ǎ�?�[o�\'�\�(\�H\\͕V\�\�\�o\\�_Oך�\��{�\0�h\�Av%Ώ�\�\�f��]D?�u6u��$s)!����\�x�\�ں\��\0\��\'��n��)��5_�q\�uΚT��R6aoS� tǱ���\0�\��\�r\�gi\�9�\�o󟴫���7����\�\�5\�c�4zy�\��\�'),('12345','Shankar','Comp. Sci.',32,_binary '�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0�i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0�\0\0\0\0\0\0\0H�\0\0\0\0\0\0\0H\0\0\0\0�\�\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\��ُ\0�\�	�\��B~�\��ICC_PROFILE\0\0\0�lcms0\0\0mntrRGB XYZ \�\0\0\0\0\04acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\08cprt\0\0@\0\0\0Nwtpt\0\0�\0\0\0chad\0\0�\0\0\0,rXYZ\0\0\�\0\0\0bXYZ\0\0\�\0\0\0gXYZ\0\0�\0\0\0rTRC\0\0\0\0\0 gTRC\0\0,\0\0\0 bTRC\0\0L\0\0\0 chrm\0\0l\0\0\0$mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\0\0\0\0\0s\0R\0G\0B\0 \0b\0u\0i\0l\0t\0-\0i\0n\0\0mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\02\0\0\0\0N\0o\0 \0c\0o\0p\0y\0r\0i\0g\0h\0t\0,\0 \0u\0s\0e\0 \0f\0r\0e\0e\0l\0y\0\0\0\0XYZ \0\0\0\0\0\0�\�\0\0\0\0\0\�-sf32\0\0\0\0\0J\0\0\����*\0\0�\0\0����������\0\0\�\0\0��XYZ \0\0\0\0\0\0o�\0\08\�\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��XYZ \0\0\0\0\0\0b�\0\0��\0\0\�para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[chrm\0\0\0\0\0\0\0\0\0�\�\0\0T{\0\0L\�\0\0��\0\0&f\0\0\\��\0\0H\0H\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342�\�\0C			\r\r2!!22222222222222222222222222222222222222222222222222�\�\0\0	�\�\0\0\0?\0\��(��t_\�k�n\�A�ppU?��.>��\�\�?�m�C��͑��\�%�w�w$�?*�h\�\��;��\�\�;�\�#\�v�C�\�w#<�\�\�b\�d�f�T7.\�\�P�\�J��c�ڍI\�Q8��\�$t⩜K�\�*�A\�Z[���NI�\�ʽ>jm!\\�\"y�?jj\�\�@�\�+\�8u g��qW\�i6pw\�u&�\��B<\�r\�@�ǒk�\��4\�i4�\0�c`23�+	VI\�\�4[Gb\\$x-���-\�&�k+�\�|\�=��\�x�e�\�?�\�\�4�?�CT���\�8�H\��g\n�\�酷���g�\�wI	\�i}zWW%\�\�O��\�\�\�4���I	cm�p�k\�\�4\�6�[E4+$*�h\�˜�}+��j\�\�Q��\�\�#���+\�\�q���\�K	\n�}q�®��.�v\�>�\�m\�-	��͎W�sԌ���%\�-�>���,m�c��\�]\r\�S\�饤��g}\�Q��c����6`\�7Eѥ���)�����Y\�\\�\�3-��k)\�\�\�4�\�\���-�\\�2wcTuoI���P���\�\�OL\�N3��\��Wt�\�\�Y���\�y\�>���<\�_Gqo\"r������\rw_M�7F;�;5\�R�>��5u�E;bbOץw՗�\�p\�^�l�\�\�>�\�_��D\r��?zA\�~�5�t\Zr~aʟC^l�\�\�탊z����\�<\�$���b\���k�\�\�%�ֹ��Ԛ�;kK\�\�r1Xr���.Y�ck�^\�S����{f�l\�9�0�S�\�.\�S\�c�\�q\�l�4�rUX\�\��\�h�� �\\�,UrTMx\��\�f�|�)\�\�B(p�Z�+s�\�t�h\">\\`)S4�n\�T�I�\�h=T���\�\�RV8mCAX�Uq}\�;f]\�\�3�b?\n\�㼋�~[fe`\�:���}k�5\'de*q�\�/w�����K�L��\0\��9�jv\�j�ؒt{\�v<�V�T��9q\rA%�\�4�\0��X,�\��_��\�\�\�\�N}\�\�>\�\��V��=\�V-Y��\�\���A�\��\�5�\��\�v�^SnbmMZ\��.\��p\�\��\0�V\���	�U\�2)J)\�ˌ\�z\Z6Z��3\�)�\�mg�\��[LH��~���YP��\�d�;T\�-.)\Z4qxzZ��\��<��\�\�\�\�\�\�ꈟ\�\�W���\�$\�K\�\�m��\0׬{��[M�\�$X�\�r\�\Z\�	\�\�\'\�n�\�\�*,w\�HҶ\�2t\�O�\�R]j0\�Y��[U�ی/;�h����\�J짣�Ť�{z\�+k`N\�<\�Ұ5V\�R�\�a�\0~X\�s\�}kUFR��0u\��Q59Υs5̙/#g\�\�*���O�\�\�<s]I(�II\�ݏ��hq�dQ�����\00�8\�Qd�\��\��\�q\"\�\�\�T6u��8nSg\�@a\�ֳ�\0\�\�I��4onm\� �2�\�ă��P�\�%!�\�t\Z^�s��\��P��̣\�V<���\�V>\�z��Ԕ�k�t�]�H�\�p\�W�7�����aإ^v�\�\�����]B�l\�\�c#�\�B?\�P������kZpPvFS���1A\�c=h_�c\�[\�@y\�E8�5H�\\o�e�������\��t�\��\�'),('19991','Brandt','History',80,_binary '�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0�i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0H�\0\0\0\0\0\0\0H\0\0\0\0�\�\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\��ُ\0�\�	�\��B~��\0\0H\0H\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342�\�\0C			\r\r2!!22222222222222222222222222222222222222222222222222�\�\0\0	�\�\0\0\0?\0�s���]�\�CO\"\�c5\�{U\�\rc\�\�q�Y�;��\�\�G\�)3\�zb����ܺI��Jd�\�Ҧ�>��\�\�m\�\�+N8ۻ�p3Ui\�D\\qr�\�3e���_)\�!Y?�\\f��[I\�\�ݙ�k�\�y�\���u�Yم\� b\�9?Z\�tK��Y�X\���\�f�?ƚ���:\�;+�{\�\�\��#}Er�Zͅ�N�p\�!�q����.��;�r\0��?:��\�#8#}j#7\Z5p��.���\�\��\�H�hn��n/t\n\�ɭ�q�ǟJ�Q�%\n\�4�z$;��g�\��;X\�\�\"�u�S����6\�Ó\\\�\r\Zm\�+�jR\�\�kB��S�\�l���R�\�.gо\���`4qN��\0<���\�\'���\�E�X\�|a���\�\Z�0[úQ���\��5\�+�|Cs:�Q��\"KI Q�	\�c�z}*\�S�=��4�F\�\�zN�\ni��\�:���\0<��?]Ei�\nU@\r\'EA�~\�(\�Xi�Jx��bLqF���?:\�\r�H�\�x~\�H\�\�}0j^!.�\�\n\�S���&�o�ʄ��\�\�u���Y\�$�d3H���\�5?X�+\�\�\�Y�\�\�_\��|��\n/�v��\�ύ��\0�[�G�w\�:F\0�z�\�\�s�\�7|5��b)e6/*p�!\\ڮ\�/��B�A���\"Ȓ*\�/�/9���҉S\�sN\�GD~�\�ݛQ��\\˖놨����ʝ�\�A�\�=\�\�W�B}\Zd\�|Лad�CO�\�,|�\�e�x\�WY�\�`�}z~5�\�͜�\�\��� ��=\�M�їu\�f��\�M���VTB 7AUc�\�\�m�s�t��\��\0��Z6:>��\�_%/\�!b�W�\0�L\Zc�12\�;���\�9�\��w-���\\js$.�+���Ug\��k;�\r�p9c�1�(j\�7��5��\�,\"�\�j�t\0\�\�~�?�v\"V\�\�1�\0=�T0����8ϵk�s7aD�d\��\�N�\�PԢ\�]\�V?�\�\�O�\�Me�HY{\�\�X��=�g\0\��+[YX\�p�Ӫ�T�.��%�4X��\�\\f�\�Yo#{x�ʉ��x��ThK�2��\���z\�ն�ݵ�FO\�Y^�m���\�e��l�%��$�\�\�>�\�*E�˧4�#�S�=��*\�Gyn\�\�\�\0`?\Z\�wQ�\��R4pW��n�\�\�g�\�\� ȍH.\��8\�(�L\�\��r\�\�M�n\'�	J7�\"���\�*\�yh����*���X�&��V�x�%�����֭\�;��-����R\�K`\�,\�\'ˊ�[�R\�\�\�R?�ӯ\�-fKl[[LclfGL�g�bx��B�\�\�J�8�\�\�Mi\�J\�,\�s��C@䣟��\�R}\��V\���P\�J�\�J�?\�\�\�bOCoH��uϓj\�o����H\� ���Ǯ{d\�#\"�x3�F�?��F�Z��Q\�� \�.��5�6:\��d]�b=3߾;�Fk�\�?\�\��\0\�\�薮z�ak�¬�Z�Ocp<���\'Q����b�e6ϟ�S���\\^i05�Z\�F\�<�\�\�� v\0\�\�\��\��\0\�=\'���NƎ�\�_=\���\�d^�\0Q\\֙�\0���΢t�kغue{�\��\�\'�s�����\�'),('23121','Chavez','Finance',110,_binary '�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0�i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0�\0\0\0\0\0\0\0H�\0\0\0\0\0\0\0H\0\0\0\0�\�\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\��ُ\0�\�	�\��B~�\��ICC_PROFILE\0\0\0�lcms0\0\0mntrRGB XYZ \�\0\0\0\0\0\'acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\08cprt\0\0@\0\0\0Nwtpt\0\0�\0\0\0chad\0\0�\0\0\0,rXYZ\0\0\�\0\0\0bXYZ\0\0\�\0\0\0gXYZ\0\0�\0\0\0rTRC\0\0\0\0\0 gTRC\0\0,\0\0\0 bTRC\0\0L\0\0\0 chrm\0\0l\0\0\0$mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\0\0\0\0\0s\0R\0G\0B\0 \0b\0u\0i\0l\0t\0-\0i\0n\0\0mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\02\0\0\0\0N\0o\0 \0c\0o\0p\0y\0r\0i\0g\0h\0t\0,\0 \0u\0s\0e\0 \0f\0r\0e\0e\0l\0y\0\0\0\0XYZ \0\0\0\0\0\0�\�\0\0\0\0\0\�-sf32\0\0\0\0\0J\0\0\����*\0\0�\0\0����������\0\0\�\0\0��XYZ \0\0\0\0\0\0o�\0\08\�\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��XYZ \0\0\0\0\0\0b�\0\0��\0\0\�para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[chrm\0\0\0\0\0\0\0\0\0�\�\0\0T{\0\0L\�\0\0��\0\0&f\0\0\\��\0\0H\0H\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0C\0	\Z!\Z\"$\"$�\�\0C�\�\0\0	�\�\0\0\0?\0ކہ\�nEk\�\\&�3c�\�[q\�\0:P2E���G㇍f���m�\�eF�~��gȉx/�\�\0Sڴ�JU�D\�-K\�4�>�\�KU�U�k�\�m2\��_Os\�|\�4�z���73Ous)\�\�+�v����\�\�$W\�\�w^O\�G�\��9�e\��kKx����\�ָ�/\�}�\�Yr�sW\�B;\�9kˣ:�7\�ζ�+��;9�\�\"4(q��\��\0�#\�BT\�3\�\nԿ��ХK�3ܴ[\�-sJ�Q\�\�|RA��}\�y\�­I�3�\�h�!\���+\"\��.8��\�\\�)%�5F����g�Om\�Jٚ\�2n\\FA�\n9[�~�V�ݷ�jB��\����\�j\��0��+\�\�\�ղm\�\\�3��\�>\"\�G\�M�\0�\�޷�\0jM:+���\"\�:���$��E�2���\0\�5ۆ��]\�zԜއ�xr\�m��%�&�\"[�eh�\�U�\�]\�;�DA\�ƢS��:�S�5�\�4\�keV_\��\n\��e\�Y\�u�t\�[M�E;I\��:�\�\Z�Қ\��(W��V\�i�Q�\�\�.��ˢ\�׶zuީ!�[x\0O�O\0{�\�y�����8\�\�K�p\�^�\�-\�_�\�\�\�;W&H��O��՟/�����KD\�ti\�-�X�\���)ʇR˜s��\�E)ʌ\�c��8׃L\��\�&��\�G�V\�\��͜\�\�J\�\�\�J\��S��\0b�7\�,X\�O�	�>��\03~���4\�\�y�RQJD�v�+R\��VeX�\��$\�=*�GXr�\\\�h��W)4\�����=��̢\�\�9G{��}G<�\�w�@\�\�\�ie\�2\�$�u��\�Q��\��֡\�t��H�\�}kNn+\�\��Z��=�\�c�EU\r\��\�(lwB�\'�1�%\�[\r*\�\���\�5�9 �\��?\�5\�xN�\�m�wK��\�\�C����\�ZQwNR3���`�o\��[xCó]\�\�Q47G��pvI��H\�w\�W�&���\�Z|N�\0�nH\���#�#�=+�˖W�\�\�x\�t\�\Zm�\�Զ�C2��m\��\'��\�j�t\��,��$\�\�C\�\�\���\�2��\�\�Eo\Z�H�TP;\0\0���;\�R�<پi6c\�\�׊�p�h�\'�\����T�Yآ��9�Ұ\\\�>.i2j�\0�Kh��8��\�X�͏\�^Y�\�\�փ\�9�)\�;+�\�w\�\�\\�$i!\�cDn#8,X\0x\��6�\n���x֛�ۣ��f08� ޱ�o�Im�\�qd��Y��\�&y#\�\�Di¢\�\�U�R\�v��kK\�\�ḿ6e�;[�.3Ӝg5\��\�3蓪ȭ,!�S<~U�Z-e��J�z3\�6?\��ɨ\�vY\\\�\�qF7Lב�ĭkĖq\�>\�n$���\�\�O�#;G_��q<<\��r\�FOG�\�gQkǵҖ_5\�j�6F\�#q?S��ן|6񎏤�\�Q�{��[I�5�\�a�o)d�\�u��\�\0�\����ø�m\�J����\�3�t\�Ҩ\�3\��N���\��\�|k�w\�D�;�~\rJ�<��i�.&\�\�\�;S\�\�\n�g\�_�W<G���\0\�j	�)�\\��w�u\�%��\�<7`\�\�l\�l=\����Pޯ?v�#J)\\\�Y[Nb�[��\��\�f\�\'9$�\�O9=�j��\0V\�CNɦJ�O��\�\n\��\�Ŭi2��X�R*\�\�\����\0��\0\�\"�:\�Ŷ����⹇\�\�l\��\0[�:\�r�\�q\���M��\0��_\�\�~\�|��\�`�\�\�\�\�+LDM3M���;c�/?�m\��\0�o�k+�n6�]��\�\�Mio��E\�5-=�\Z��\�\�g��Y\"�<���q\�u\�����}7��K�\0�\rz�z��V`\�$\\�\��[�\�x�LMB.�k�9W�\�\�\�\�U �\0�^#�\0-t\�N]ך>\�𿍼1\�ș�-^�TfKv\�M�\0j6\�ʾ��?\�k\��\���\Z��v;)Tr\��\�'),('44553','Peltier','Physics',56,_binary '�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0�i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0�\0\0\0\0\0\0\0H�\0\0\0\0\0\0\0H\0\0\0\0�\�\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\��ُ\0�\�	�\��B~�\��ICC_PROFILE\0\0\0�lcms0\0\0mntrRGB XYZ \�\0\0\0\0\0\'acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\08cprt\0\0@\0\0\0Nwtpt\0\0�\0\0\0chad\0\0�\0\0\0,rXYZ\0\0\�\0\0\0bXYZ\0\0\�\0\0\0gXYZ\0\0�\0\0\0rTRC\0\0\0\0\0 gTRC\0\0,\0\0\0 bTRC\0\0L\0\0\0 chrm\0\0l\0\0\0$mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\0\0\0\0\0s\0R\0G\0B\0 \0b\0u\0i\0l\0t\0-\0i\0n\0\0mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\02\0\0\0\0N\0o\0 \0c\0o\0p\0y\0r\0i\0g\0h\0t\0,\0 \0u\0s\0e\0 \0f\0r\0e\0e\0l\0y\0\0\0\0XYZ \0\0\0\0\0\0�\�\0\0\0\0\0\�-sf32\0\0\0\0\0J\0\0\����*\0\0�\0\0����������\0\0\�\0\0��XYZ \0\0\0\0\0\0o�\0\08\�\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��XYZ \0\0\0\0\0\0b�\0\0��\0\0\�para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[chrm\0\0\0\0\0\0\0\0\0�\�\0\0T{\0\0L\�\0\0��\0\0&f\0\0\\��\0\0H\0H\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0C\0	\Z!\Z\"$\"$�\�\0C�\�\0\0	�\�\0\0\0?\0ކہ\�nEk\�\\&�3c�\�[q\�\0:P2E���G㇍f���m�\�eF�~��gȉx/�\�\0Sڴ�JU�D\�-K\�4�>�\�KU�U�k�\�m2\��_Os\�|\�4�z���73Ous)\�\�+�v����\�\�$W\�\�w^O\�G�\��9�e\��kKx����\�ָ�/\�}�\�Yr�sW\�B;\�9kˣ:�7\�ζ�+��;9�\�\"4(q��\��\0�#\�BT\�3\�\nԿ��ХK�3ܴ[\�-sJ�Q\�\�|RA��}\�y\�­I�3�\�h�!\���+\"\��.8��\�\\�)%�5F����g�Om\�Jٚ\�2n\\FA�\n9[�~�V�ݷ�jB��\����\�j\��0��+\�\�\�ղm\�\\�3��\�>\"\�G\�M�\0�\�޷�\0jM:+���\"\�:���$��E�2���\0\�5ۆ��]\�zԜއ�xr\�m��%�&�\"[�eh�\�U�\�]\�;�DA\�ƢS��:�S�5�\�4\�keV_\��\n\��e\�Y\�u�t\�[M�E;I\��:�\�\Z�Қ\��(W��V\�i�Q�\�\�.��ˢ\�׶zuީ!�[x\0O�O\0{�\�y�����8\�\�K�p\�^�\�-\�_�\�\�\�;W&H��O��՟/�����KD\�ti\�-�X�\���)ʇR˜s��\�E)ʌ\�c��8׃L\��\�&��\�G�V\�\��͜\�\�J\�\�\�J\��S��\0b�7\�,X\�O�	�>��\03~���4\�\�y�RQJD�v�+R\��VeX�\��$\�=*�GXr�\\\�h��W)4\�����=��̢\�\�9G{��}G<�\�w�@\�\�\�ie\�2\�$�u��\�Q��\��֡\�t��H�\�}kNn+\�\��Z��=�\�c�EU\r\��\�(lwB�\'�1�%\�[\r*\�\���\�5�9 �\��?\�5\�xN�\�m�wK��\�\�C����\�ZQwNR3���`�o\��[xCó]\�\�Q47G��pvI��H\�w\�W�&���\�Z|N�\0�nH\���#�#�=+�˖W�\�\�x\�t\�\Zm�\�Զ�C2��m\��\'��\�j�t\��,��$\�\�C\�\�\���\�2��\�\�Eo\Z�H�TP;\0\0���;\�R�<پi6c\�\�׊�p�h�\'�\����T�Yآ��9�Ұ\\\�>.i2j�\0�Kh��8��\�X�͏\�^Y�\�\�փ\�9�)\�;+�\�w\�\�\\�$i!\�cDn#8,X\0x\��6�\n���x֛�ۣ��f08� ޱ�o�Im�\�qd��Y��\�&y#\�\�Di¢\�\�U�R\�v��kK\�\�ḿ6e�;[�.3Ӝg5\��\�3蓪ȭ,!�S<~U�Z-e��J�z3\�6?\��ɨ\�vY\\\�\�qF7Lב�ĭkĖq\�>\�n$���\�\�O�#;G_��q<<\��r\�FOG�\�gQkǵҖ_5\�j�6F\�#q?S��ן|6񎏤�\�Q�{��[I�5�\�a�o)d�\�u��\�\0�\����ø�m\�J����\�3�t\�Ҩ\�3\��N���\��\�|k�w\�D�;�~\rJ�<��i�.&\�\�\�;S\�\�\n�g\�_�W<G���\0\�j	�)�\\��w�u\�%��\�<7`\�\�l\�l=\����Pޯ?v�#J)\\\�Y[Nb�[��\��\�f\�\'9$�\�O9=�j��\0V\�CNɦJ�O��\�\n\��\�Ŭi2��X�R*\�\�\����\0��\0\�\"�:\�Ŷ����⹇\�\�l\��\0[�:\�r�\�q\���M��\0��_\�\�~\�|��\�`�\�\�\�\�+LDM3M���;c�/?�m\��\0�o�k+�n6�]��\�\�Mio��E\�5-=�\Z��\�\�g��Y\"�<���q\�u\�����}7��K�\0�\rz�z��V`\�$\\�\��[�\�x�LMB.�k�9W�\�\�\�\�U �\0�^#�\0-t\�N]ך>\�𿍼1\�ș�-^�TfKv\�M�\0j6\�ʾ��?\�k\��\���\Z��v;)Tr\��\�'),('45678','Levy','Physics',46,_binary '�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0�i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0H�\0\0\0\0\0\0\0H\0\0\0\0�\�\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\��ُ\0�\�	�\��B~��\0\0H\0H\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0C\0	\n\n			\n\n		\r\r\n�\�\0C	�\�\0\0	�\�\0\0\0?\0����\n(\0�VS\�N�@��\�>��@\�W�3\�\���T�ˑ\���4��X\�J#\�$�>��ui\��C���Pt}(\0��\n(�\�����\n(\�~x=�A\�\�`K$�\�@\�=\��rG�\�y�8x\�w6�6�Ȱh���-�2���`�<��0\0E`���\�>^e��\Z����W�\�e8b�E8�7k��{�$xk\�ֶ�[�Ռ�[\"H\� c+�\�l��\�\�χb\�\�w\�Ś�\�t\nޝz\�&�c�M\�NVg\�b2��\�2��\�����\�\��M(�l\�%�v+[.ZS�\���w<\�\�\�\�\��mRk����QS�%]��\�gy�_�7�/�\nyX\�\�Mk\��\0\������\�R�}юIc�\�XpB�߶k\�j\�9tO8\�we$r\�!dI�ȧ�\�\�k\�2|\���jk��\�Q�\�AΖ�;�-H��p��ϱ�M��\�\�>����\�\�P�\����\�j\0J\\P\�w\�}e���\�N�\Zys�3\�w�\�s�\ZX\�*�s��+\�_\�\��|\'�w\��=��wo�k7\�o}f�L7\��Qd\�p�a�\�|�}�T��&��KU\�\��\�5�C�UZ\�G\��Ͽ|m�j�]0���G|�\rj�CS\�yx�\'r��c\�\�\�\�0+\�o�a>��Ze\�\�Y\0�8m\� Kz\�\�\\GS�rq_/K8R�z�Z\�Bu9��\�\�\�\��T���>o\�\\Z�_�7/��휀譞3�{W[�X\�7\�\�\����</%��|ɴ�舉�;�\�;�\�zV\�Mዋ��.�\��Ԝ\�BxI*\r\�\�e�G��G�a\�\�/O\��\�\�o�]\�Z\\�Ɓ-a7�mg�\�\�\�\'�3�\����u�+\����\�\�m\�\�S_��	�ƙĲ0�pv�GL\�bg�\�UN��\�-��e\�T�\�c\�(\��t>4�\r����=��\�5�r\�R�uV =\��#k�\�Tmp�C#q\�#񯯡f���>(N��v���2�\�rz����[\r�*E?�\��\��y�K\�İn<=���Vh\�\�Ԣw��	���8\�E}�e���������\�6Y\�D�Z�T��9�\�O$W$�쟒\�|C\�b*r\�\�1����\�%��67�-#�CK���&�.��_4?b\�\�4qD8Wg#s\�=��ﺴP�N\�!�����~�\�.�z\�P\\L�w[N�\�*\����s\�+��\�p\�l\��D�[Zr\�gݽ]��\�\'��|2�>��v�\�\�4\�\�滑\�w�\n��rv���d�\����\�\�\n\\:�\rq\��;\�wt���.�\�C{��\�9\�\�Cņ/�Ru\�JN��\�\��	�\�q\�ۻ\�Zq\�7\�k��rZ&FH\�!\�28�\�\�x�\�\�Yhu߅�Y���\Z\�y0\\�)o\",\�������\�3�7V\�{ۧ���ES9�,=yެ6���������\�\�\�\�k�\nN\�^�\�\'�=Fk�3+�G��\�8���h\�uΟ�|G�\�4�H��Kf�\�\\ \0c��\�Njc<4\��\�o;�l�\"�ڥ��/\�|�\�O�^4�����9>�s8�u\�ɨ\��<أ���g\0l��k\�<s�+��\�Eu�y���>\�m:��	\0�\�=\�I�8|\�/�b��Zlϕ\�\�	ժ��\�U�>t�ӥ�ؑ\�\�\�9$�\�\'��O�?e\�/Z�g[�\�w�B̩�	�}k\�x��\��\�\rG�\�9?�}\�|�gwy\�\�\�#tn\�\�xU\��-�\�\�z�}0Ez�\��~[j\ZE�[k-\�;�#N\��I�D\�\�\�g �iN��\�<^\"ͱ�\��hZ4\�\��h�\�\��\0>�s\�|m��\0\�>)�N���7�Ŵ��\�\�\� ��\'tJA�\n\�\�P�j\�Ú$\Z�#2�\�\�N�\0\�.$\'2H\��\��\�b��Ȭ�\"�\��\��U�\�ۿ�cu�k\�\��\��f��\�\�n_r\�\�VPx���랔\�_�<��u\�\�\�5.[j�G�\�>)�z�-m�\�s�_\�r\�^\�\�\n4�.�-B)U�Y7\��r1י��?\�o��xO�\0��!(ݟ�\�jx��X��b��۽�w\�l�\\\��}�\��\0g�\��b5]j\�\�\�\��1*Gr�~�v\�����:u�m;�DO�_�0_�\0)�:qN\�04\�\��S�q�vj\�\�K\�\�\��-.��?Þ���\�=\'\�6�m��Kv�\�p�۠\rB\� �X�\�|4�\0��O�j\ZW�řW��\�U�\�\�k�֍5kmcsK���W\���c\�O�\��a�\�w_����rJ� 3gw�Ĝ��ߴ\�����\0���\0\�e�/�\�%9E)%{�\�|5\�L\�4Ŭ.|\�K��۹\�>2�=�p\�^�\�?\�-\�\�l\�R|�8�\�ߍ��Ǟ�z��\�\�\���Η�\0]<;�\0�G\\�6[�tV&J��\����9\�֝|+�\�\�u}�/i=\��MO�/	�B�Ms[���^jN\�k����&#-\�,UrN0��>\��=�\��^\�f�\�\�ɤ\�\�<�9\�\��a;F1Z(�-\�\�,la���ƨ#{-N�\�P�\�S:\�\�F\��T�}\�\n\�2�:g\'V�	=�~\�ޞB\�]��NW�8\��~����x\��?���I�]d\�h\�qt��m)J\�\���?�\�'),('54321','Williams','Comp. Sci.',54,_binary '�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0�i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0�\0\0\0\0\0\0\0H�\0\0\0\0\0\0\0H\0\0\0\0�\�\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\��ُ\0�\�	�\��B~�\��ICC_PROFILE\0\0\0�lcms0\0\0mntrRGB XYZ \�\0\0\0\0\Z\0(acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\08cprt\0\0@\0\0\0Nwtpt\0\0�\0\0\0chad\0\0�\0\0\0,rXYZ\0\0\�\0\0\0bXYZ\0\0\�\0\0\0gXYZ\0\0�\0\0\0rTRC\0\0\0\0\0 gTRC\0\0,\0\0\0 bTRC\0\0L\0\0\0 chrm\0\0l\0\0\0$mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\0\0\0\0\0s\0R\0G\0B\0 \0b\0u\0i\0l\0t\0-\0i\0n\0\0mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\02\0\0\0\0N\0o\0 \0c\0o\0p\0y\0r\0i\0g\0h\0t\0,\0 \0u\0s\0e\0 \0f\0r\0e\0e\0l\0y\0\0\0\0XYZ \0\0\0\0\0\0�\�\0\0\0\0\0\�-sf32\0\0\0\0\0J\0\0\����*\0\0�\0\0����������\0\0\�\0\0��XYZ \0\0\0\0\0\0o�\0\08\�\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��XYZ \0\0\0\0\0\0b�\0\0��\0\0\�para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[chrm\0\0\0\0\0\0\0\0\0�\�\0\0T{\0\0L\�\0\0��\0\0&f\0\0\\��\0\0H\0H\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342�\�\0C			\r\r2!!22222222222222222222222222222222222222222222222222�\�\0\0	�\�\0\0\0?\0\�\'�V�,n�\����\�-..\"�\�6�ݴ+`��\�=�\�[\Z]$�f�\�)d�F{\�����\�/b�x����s\�q\�M\�+�\�\�a�y�l\�pJ*;\�Dy\�>��x�2��}˗!{޵Q|�ZP\��ݪX̒�,֩�\"\�7�+\�]K[�nϗ3��B�\'\��kD\�]�H�\�\�\rO̵��H�8V2�\nr�98\�=F׌4\�\�\�#�9\�b^i�\�;K\��\�\�\��\�p_`럼8��\�#K׮\�\�KK)nmH\�\�\�X{d�\0*\�\����\�U\��%ad\�i�#<�`A�NF>�\�\�G$!���UnG<��8\�;�\�BOx\�v`�3�`\���j�\�<�\�+x\�J�\"e�w�6�$�ޫ\�\�	�@��\�\�V$*\Z5r�w�Ǳ\��\�;P�t�yk\'\�W��\0�ϧOֹT��\�Z��]\��Ƿ��²��\�r��XT;H�\�\�\��\� ��\0���$�\�\�Gnm�\�\�r�yϹ�e�q\�#9M�8\�.\��>\�Dm����$޾�\�]Ŏ�g.�3\�Jv\�\�,#\�X��\0�V�\��\�\�^9+�\'B>�SX`Ү\�&\\l7\n\�q\�\rvzG��][��M\�`%�+\��\�z�Υ\�v��.\Zʹۨ\�\��B\\˥:\�ww\�^y��o,\�	p	Ϩ��Cqg�\�q�ψuO� h�Qp�F\�>\Z\�kXu׻�\�o�\r�E\�\�MJܑ\�\�\�\�:���L���H��\�\Z�jn�)\�;r@<�}+���mNy�\\6qܒ���~�\�\�>�A\�`0\�Oʧ\�\r\��?�\�\�e7�Ur�\0\��~�ҭ\�v\�A0J�S\��}+�6�\�+Dv�m\r�G\�yh�AA\��\09�2K�9*H\�G\�H�(��3l��\�A�K[�\�\�T�ha`\�:c\�\�5\�h\�PA�J�R��y\�bOJ\�8[cX\�/s���MK��\�\�OTP9\�A\�ǥa$��\�$�|�\�n\�2I�x�\�\�N�odkꙻ!�H�%?��ɴ�=��\�_\�zD�\����\'(BU�\�\���\�gj�[�~�\�\�\�cH`[2�\�\�\'\'�\�\\���\���_�\�f����\�*T�e�\0\ZRM+�\�]w���\"�^/3\�\0�5E\�pcn6��Q���\n�m\��Tsz�,K��\r\�� ��6#frY��\�s��\0]JN\�\")�\���.c\�\�����FfF�R\�\'#i�p=�\�F6ܮT�\�ɑ,��t%\n�\�\��\����\�j�����\0\�\�޹��,F!\�+.\�\�MM+_��ʉ�1��rq�\�=�=k���΅\��q�Z�VF�\�N�\0#\'VM�����e�HȡI`\�:�j\�b>V@떭��M/ysz�)���k\�y�6��Br瑓\�\�\�\\��Xr���Eo[-�8���\r(b)]jz&�H1ڹ�\�ȯ;�{\�˷���<��\��<\n\��S4��ܳ�G�Y\\\�\�V)ss2\�\0<�:�s\�^c3\� \�4\�\�@�w�q��!�<��a��\�����H\��a�F`�\�`��\�\�\�fS2{\�\�d�\�,Ⓣ�\�M�����uWIUnWneKF�\'��~&�\�E��\�\���\0���\�,��@bf=~^3�5\�\�޼s9\�\00?�a[\"\�����Wh�\�\�n\��\'�<U+���?\�Wԭ4[g*܂v%���\��\�6O��\�\�I�\�A\� 𝷅��U6s\�Xє��;\�\�=�j\��B��\n\�T���?�욱\�:׌�7{�ꖖPIoq{h,\�al~\�	��1o�\�Z�\�����p�RM\�\��We�\�\�z��ƹks4+\r��Bc�%\"_��m�F\�\�s\�Mp7�\������+%��>h�=|\�\Z�{�z�o�\���݅�A5��m�+\�\�7\��]$@6�\��\��+3D�\0�G��\�\0��6��9E\'���h9٧�\�\�{Ӧ�\0X\�?ν�\�n�%较�I�\�\�P�*%e�\�G\�\�5I>\��\0�b�\�fܨ�\�'),('55739','Sanchez','Music',38,_binary '�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0�i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0H�\0\0\0\0\0\0\0H\0\0\0\0�\�\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\��ُ\0�\�	�\��B~��\0\0H\0H\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0C\0		\n\r	\n\n\r	\r�\�\0C		�\�\0\0	�\�\0\0\0?\0�\�Ҵ��1#�\�\�\r�H�G�>����^0\��V\�\���s~�9�И[���<\�U1\�LD\����+f0�>n�3]\�Y�|8f�K[���h�7�|���[��L\�4\�G����p�\�jY��\�\0�ճ}l�T�8�D�U\�gȾ1��\�o�sx�\�����f�\�f?=\�\�IX�^�\�A�q��\�~\�\�lo��|P�\'��w,�B��#,��y�\�\���`�\\\��ۏ\��>;˲\�k$׫���I\�V;EWħg\�E���/�\�>7������\�����hMKUvm\�6!\\q�\���+\��\0�4�-?\�B-\��\�\�@s=͂�ĝ\n\�\\/�}:\����׏7\�m�k�?G\��a��%l2�\�\�\�\���L��<P/���\�����1}�\�\�-�H9>�\��Z��>!�:�[�*X�]c�\�X<�\��\0�CpA��W\�Z�Q\�_\�\����F�����X��\0��ٴ\�\�<Y�\�F\�m��\ZK\�P\�3n1ɴLuʓ\�w�\�\�:\�V��Moq�ݮxFb���J���\�\�\�N r���\�\�\�q�\r\�Zu0�\\ו�����\0�@q\�^Ϧ\�ɮ|5\���-q\0f��X�2	*H������H\�\'\�\�\�c2\�D�\�z�c\�SF�\�V\��\�&\������1�\�SMY�\�y���\�\���\�\�1�W��?�C\0(\�ڿw\�bdѧ\��={\�~� �\�\��W��n\�\�0|�\'&}F����\0\�q�\�?\��&\�푷\�Z���0E%�\�_\�(��\�^�\�\�< |g\�\nxivygŚ^�9f\�\�o#�lz\�\�\�_�\�\�r�NU%fӶ��>\�\�\�#�\�\�\�1�^0�7\�o]K��\�t}O\�?�,,\�\�;V�.Qv2 \0\�c\�W\�\�\��\0x��\"ťh\�4k���faq�pn<�s\�X��$�\�a�NH͐\����\�u�����\0��\0�>^ڜ#M\'�Nߓ�\�\�\�[M�KY�\�$X\�G~��>!\�*\�b�3G�\��L\�j��J\��\�8�\'�\�U\�{/ie\�\�4\�\�5�\�|@�𑸙?\�&Ү�\�0��ݗ����\�\�_x\�\�\��\�J���\�.c�c+9\rB\��s�r}+\�VE��MT�{�\0\�?\�gv)\�Ҝ5���X����\�.\��\0hՒ�\�\�\�\�\Z7��\�c��ξ����\rk� ��S\�tf�\�0]I�\�ZG\"��$�,\�\�\0b\nNx��Ӹk1\�*S�\�\�\�[��>#\�V���\�zZYk\�v_�uc�x0\��\�\�\�\� VB\nE+�E\��\�\�\�}+ಚ�\�\�\�\�\�\�\�K�]3ų|\�\�ɑ�c\�RA�\� \�\�Ύ\"*Td�Wc�����\�\r�TX\�n��>\�\�!x�@	$˰g��\�i��v\�{�\�}�,O5���9Sg�\���\0̂2zc�q\0֓ʃ-\���*��\�=e��\�*�\�9�\\��5exc�p8���E��\�W�\��=Z\�,m�5v�[@\��\0t�O\�\��f�|4\�\�Ui\� 	\��C\�>��w\�R\�\�}�>(_N\�\�\�r\�w\�\��\0��w\�]\�<\�~,&�wx�N�s}�鶭6�<%\�%a�3�9#\�9\�\�>�\rߌ|9�h�5\��?\�U��i�p�%�S\�\�9$Bk��pc\�\�?�B�\Z�lڋ�\�\�\�\�O\��\�T\�O�p�}V���\�\�R\�\�:֙�\�\�4�&T�̹�\�sF\��y\�OA�\���\�/��V�|m�N��E\�\�\�L�S�Il`�n��t0�l��Y���\�J�X\�\�\��\0�\�t~���^xV{[A�m*\�*\�ӱ\�c�d��݇�u}.\�YԼ[\��I�\�m�\�4�P\nY�n\�\'5�\'��S�\�o�o�P�R�F\��O�\�5�?Ş���\0��k�a�;dQ��2�\�\���I״meot��\�,�,+4d\�p}�\�1\�\�_M�\�1��M�\�?8\�#�����\�E\�]\��=\'F�h�\�Iv�\�3�f\nG�\�\n_nۻ�z\��f��)>~y�޲<�\�\�Xѽ\�s������.m,s��j\�od����\�E\�ʎ�O�_]7;cp;y�Ұ�\��KY��\���� �y�\�־h𿊌M2ο�*a�\��o�\�\�RwH�T�o�\�\�3ǭ|�\�,K��(噛\0}k\�q9m�<xU�FJ6g\����D���ׂ�?Xx�\�ǆ��:��\�\���ɏ˶����h���\�\�\"F��3d�\�XW\�c�a��ʴ\�Q�[�\�q�ҡ&�\�\��>��\�/	x�\�[�M3Lԣ/?	�\��$��w\�\�Jw\�\�?�\�\�Ao�\�k��}U\�\"\�wQ)l��}+�S�\'�W\�\�覢�q\��\�up3\�\'�\�\�\�|7m\�\�\�\�>$��7Qj�x�\�e�\�R2F9\'!\r|S\�/����%�\�\�;��U��\��n\�����\�<-Z7�y�mW��+{5VzG�~\"h���o��js�>�\0�|ax\�}p���\�0�)�\�;��а�\\4[���vg\�u�\0�\�Wd}��P�J�g�\�Y\�C�0	%�?�|����u{Mw-t�	�,��,6��\�b\�}Hݒ\�r\�d�Տ4e���\\g\�T��/�*UU9A\�����G��\�\nY�\\zW�\�\��\��O{����\�!E�9ʏ�\\\\\0��+�\���\�v�A_�e�K�ג��(�D\�\��ƙ���\�\n�4\�¢]Sk�_�\�8�(d�D�c�k\�돎Zn�[\�i��\���̌�\0��#��^�\�j�\�\�c\�\��mF���Z�G�\��h�\�\��\0,Ϻ!3��S�+\�5o�\��*�\�4\�qxz�ƓIw\�|�,�Շ5H\�\�\�<g\�Mo0^j�g�~\����\�A\��\�r�\��?\�\�_[��wRm��{�xJ*�\�\����\0\��eg\�o�W�����[�=�\��t���\�\�%m\�����#�<\�?�G�\0�\n�Q�\0`t�\0э_�g5\�֭\�7�>��8�|\�ks;\����\'\�\�;�&8sk{\�C#\�\"6?\�Q=I�\��K���\0`;?��_�c-R�Z�����\\�f�_��_�.�]G\�sZ+:\�%ϖ�\�~1W\�?\�\\\�V���\�f�aԢ��R�\�\�8\�k�9\�	��yܙ��O\�^�\�\'�5���\Z�M�Üygʙ�\��\0\��Ӽ��+�e\�\�\�6wz%#jpz1�k\�\��=+A�\0�C\�\��Z�\0襢t)oc�vc��VT\�h�����\�\���\��/\�A>\�\�mN\�$��_* }~i��\�^3�l�\0\�f���_�\0GW\�eta\�\����\�Q_Zr�\�'),('70557','Snow','Physics',56,_binary '�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0�i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0H�\0\0\0\0\0\0\0H\0\0\0\0�\�\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\��ُ\0�\�	�\��B~��\0\0H\0H\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0C\0	\n\n			\n\n		\r\r\n�\�\0C	�\�\0\0	�\�\0\0\0?\0��N�8ZӲ��\�|�)�H�k0j\�@��) �Ҹ��|�#\�pk\"\�s{/\�\�,\"�VI��$��5\�\�ݺ\0N]5LC妮�\nk\�g��������\��\n#qu$V�X\�z�0\�=���)�\�|�T0>�����/�E\��-��n&��(��,\�\�M�dgȚ\�(�\����>٣�#-�2\�Q�\����Yay�t��?�=�\��C>k��~�\�-4�U\�2_�����F\� dcp$jq\�jA~�:�<G;��֓\�G��\�	G�\rC�\��iV\�ݖ��\\[^\�\'�X\�Q�dV�*a�\�p�\�ԣuh�<Uk\��t�\�[\�[�\0׽\�\��\0&�w�ofuF�\�ej�3��/�\Z�_k���o�\�~+T,+]J��\��\��\�G4\�\\`W\�\����\�\rieqt���O\"��r�H\�⦋\�\\g\�9�����_�3��\�\�%׼Oh\�e\�\�K-ċP��{��\��[�7�W7�i/x6\��ˏM\�.��]�i�J\0IG\���\�%B�4��ѯ��\�CS\�$��տxs�Fz���\��s�j\��r\�\�+\����\�\�P�Zv\�\�\�\�\�>L�7�`Wؚ?�?\�O\�h�i	o2a�\�~��z&iO�q2^��>L�\�\'�۵\��`{\�\�(�9\�3�\�\\[٭�\�0d\�ޔ3z�\\�sF<\�KC\��\'w\�I|c�<\rMI���ީ6��m\�L�\�=\0�\��\�\�7�	�����\0\�\�3��֬R�8�\�kv �=v:��\\Y���D����?@\� �RB\� \���\��O�b���&��u#)�\�\�y��s�|�\��\�94�K�\�59\��\�RZ?�\��ٺUki�s_6\��\�.1Ua�8\�M��S\���������\�\�j\�sj\�guokn�i\�̷�IX\�-�\�GLq^����\Z�\�-WV�f���V�лyv��3���\r�c\�\�u�VUL<a7�C�O��q�}\�?\��\0~j�,g�\�O�\�\0K�G�\'?\�^a��.�7�}�E����-\rɛ.~R�rpw9\'/jeG\r+Y�Ӌ\�F\�I5��\�=\�\��\0>�j\�[Q\�\"�GBRq\�\�\�\�W�{��#\��xc�W\�c�X�\�n��\�}�G�~\�w<�G�\�z\�:������\r��j*-����\rC\���Ak1O\�P\�M�̰�zr�K9\�M𿀴\rྰ�	$I�C)�I�6vu�PG�G\�&X�B^\�K\�Fu��w�5#������\\�tx{U�+\�«Nd�\"�\�޼�\���O\�[\�Sx_\�\Z�6q�W\Z\\�)L�\��NX������U#\�\�\�&�P�\�\�\�\��\0�>����O�LU[�x:�\\M)�ݐ�~\�U\�\���\�\��\���\�\�0\�5�\�1\�|\��_o7�e\�\\��C���o\���߆�\0�\�CK�n�T�a\"?��+��4���)�t(\�\��R0G\�U$mF��-�\�|��K�;9A�\�\�����;\�[�*1��Z��K��\�>\"�\�&�y�\�\rA)�~T�`�߸ȭ�\��\�c\�0s�t�У��\�\�]j2[\�f\�|��9V��Ce��\�c��*\�H�7fX\�V�T\�\�\��\�ץgV�R\�K\�=�B�!xM�uymm�@\�\�@\�qR��aM*݌\�\����G�=�ϔd�\�qΝϬ��N\�G�>+2���\� �\�\�a��\�\0��xO�~#k��J�L�u��++i\�\"\�\�H۵\�\�ԁ����޻h\�揺x�����jZ-��\�}q5\�f�wt%�\n\�X�\�\� \�,�W�\�\�f��\�\�֥�l|�\�ʜ�%�F�\�C���=B飂F���ⳛ�<�\\�\��\�MV?�yd�\0yH�\���j\�\�\�S���=��l�\�K�#\�y.\�\�\�\��zO�~�\�т�\��2�<enJ����|W�K\�f��P����3��ڧ�䌞��^[\��\�?뤟\�+\�T╏���\�\�iJt���#\�f�-��\�O!��\�\��\�+��\r�I2�\��\0��t�+���{���o��\�\�9]�:F��v�\�\n޴q�r\�<�Zܱ�\0S/���\�\�\�C�-�c\�\�\�\�o\�JI\�#�\0w=s���U�����\0_��\0�Vʔ7j硇��O\�KWr�\0���MCP�jl�i.ɝ��BGa�}z}WM�\0�{�����\0\�ڷ��\�\�U\�\�{\�>!\�i�=��\�~ʀ\�l\�\��ރ�s^m��\0Ǵ�_�V��scr�-y9N:\�sޟY���\Z\�\�]ZER;�\��\�+��\�ܓ��O�5\�\�Vv>;2\�CW���g�\�'),('76543','Brown','Comp. Sci.',58,_binary '�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0�i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0H�\0\0\0\0\0\0\0H\0\0\0\0�\�\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\��ُ\0�\�	�\��B~��\0\0H\0H\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0C\0	\n\n			\n\n		\r\r\n�\�\0C	�\�\0\0	�\�\0\0\0?\0�\Z\�d�6FrSi\�\�ZP����v=k�OS��\���V��\�j<�\�Q�H-\�\�s�;�\�\��G`\�qEۛ(\�6�+`$%\n��-���Z��\�\�e0)o.�\�-��i\�ǩ�^*��}-\�wlҾ&�*\�V�ŕ�\�2\�[Y	$�\�8\�\r\�\�\�=I$\n��h~>ԡK\��EWOBU\�\\NVe9\�8���\�]\\\�b\�\�X,\\\�2�4<I��⿇!7Z\�\��R�ˉ&\�\�b&f�ڻ\��B�q�\�e\�5K=@GY��\�+�q\�D\�\�\�`\�<\nן%������qh�?\r\��\r؁�HY�$�\� /\�U��v�\0~5h�5��\�X�|Oop�5kYP\�$Y�\�\�䎀��\�y�\�����leL,��E���Hն\�8$\�?�u\�u��QUg4�JNO\�\�/\�\�_+�ɾ�$\�\�as^.2ܥ\�\�VK/\r\�c ,��>�<���|Z��H��@��U8韘�\�(�\��Y����*�dt�:�\�\�emm�OO���\�\�\���\��\���\�\�?&VBB��9�ĺ}�i�v�y�Ӛ��b\�\�K_�������\�x�T:N�=\�s\�XT�=�q[:�`�֫�X���/}\�v�!A=\��J�!��\�\�ɍ�\�~\�?#�\�\�\�/m�\�ۼM<̹i$=N\�+ټ5y?��K[��\�\�Q\�_j�P���ב^}Z��ϥ�\���\ri�XV\�2z|����O񎙨iSj�����q��0{\�5��\�\�\�\�c�<\�\�^\�U$MC\�,>�EN\�\�mB\�{�/N�$�����Np\0�ӌg-Q�j�+c\�u�>��$V\����hX�\�8<#^٧xz\�\�6��Gf.�0�\�\�Ȍ}\n��z\�N�Z{2�]g\�}5��~9[-ryg�M�;Ā)�0A�`�\�Ez?\�-᥻��\0�\�e�]UV\�y�=\�\�`7\�k��m�\�\��U��%�\��T�5���\r����G\�\�o�K6v�\�\�j��>�\�O\�\��M\�\�s-\�\�\�X̲Cs�\�<\n�%8�5#N�\ZR�S}\n*��KC�ݳj�n��\���\�ǖ\�B\�1�*kd�Hw�\�c�\�xG�վ\���\�_��m��>�v�����KojU\�e~\�\�(B���\��/�izjJn�D�.\�F\0\�\�l	\�\�\�\�O:V�(�\�گ�Χ\�1�޺h^�$ӵMA��M�}É�F����\�8��?�%[�k\��/�ˎzn\��o\�F�\�_���\�2�4\��\�\�G��jPI�Alցd\\t����W�h?�|[��w�]\��J\�\�dC�9\�7\��\�5*��\"�6�8�̓�\�/\���\�\"�\�[\��7k\�y\�\�\�*��xV��Y�e\�\�\�5���I\�R\�;�\�9=�\��泧VT_/\�m4\�e\��[X>�Ӟ\�K�<(8�\�Ҿ~�/s�i�-\�t�jp[̺r\�m�\�\�!���cԨ\�x��)\�顝<b����\��Кd\��C\�b4��\r\�+\� �\�\�\�S�I\��\0�A\�K�YՁ�c�\��\�cJ��i�0\�\�RJ��G�~\��\�\'R�\Z��]*�l06�{s�\�?\�{K\�~\r\�-Ψ�V&.~\�=O�	8bT\���\�zr�֧ϠԻk\�>~\��\���\�\�d>q�*;LP���\�x7{���\�N{Mn\��9ev��\0C\n\�\0�<\�Ҳ|,��_Im~\�\�d�\�AQ\�Ҽ\�u��Mt�91W揩\��1��\��\��\�u��֝\"A4_\�̋�\��\�\�|�\�//-a��f&8\�\�\���@ݏQ�����]r\�t{S�:PO��߂|a\�-\�Qj�����\�\�* \ne|pd\�\�#8\�\��[�*\�æTԧ�V�1\���5\�%(/t҆5\�&{���W\��m������S���P��;W\�\�<�\�o�\��\Zm�ܲG#V\�F3\�{VN��:j\�ҍ����|J\�o�Q%\�ܻ5�\�\�m�.:W+\�\�\�6\�\�K�r�\�K.X��\��+I\�\�c΃�VwGl���į\�\�\r$��R\\lr˴`�\�\�񯠼��ÿ<)u\�f\�[Kxɒ�T\�\��O<(My����\�諶z԰vj�\"VH���4\�\rM\�\�l�e��`���z\�\�Y?�\'_x�\���\�Р�{l6l$���\�8\�N)�kUY����f\��\0#��\�]\�Y\�Py\�)\�?t\Z�>�.\�̏�\���\�\�\n\�?1�^����7{���\�\�m5�hϙ5�@�\�z�9����P�\0�g�\Z\�\�EK��\�&-�=H�I�]\�\�5��G�Mi4-�O]��\�Vw�\�\ra����˽겿s\�\��5�\r���ơ�\�,p_Ge�ؚ$��U¸9\��2�\��\0b\��+W���\0\�ᯢ\�\�T��Gs���Wl[ҿe]6\�Ğ#\�/��o\r�@\��!�\��+\�-K�B�}�x�uWSޡ��-Z8�\�\��e\�\�u\�����\�<\��\�.\�K��\�Y?�\�����\0_v��0V88}r��V\�k��\�\�9RJ\��m�׫|\\\�\��\�|3�����L��	e\��z/E\�8���\0x:��.\n�8\�G\�ⱕ��I^\�R\��P>^�\�ji{�\0�]6F7\�q�o�\�q�i�\0�\�>�\\�.\��\�'),('76653','Aoi','Elec. Eng.',60,_binary '�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0�i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0�\0\0\0\0\0\0\0H�\0\0\0\0\0\0\0H\0\0\0\0�\�\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\��ُ\0�\�	�\��B~�\��ICC_PROFILE\0\0\0�lcms0\0\0mntrRGB XYZ \�\0\0\0\0\02acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\08cprt\0\0@\0\0\0Nwtpt\0\0�\0\0\0chad\0\0�\0\0\0,rXYZ\0\0\�\0\0\0bXYZ\0\0\�\0\0\0gXYZ\0\0�\0\0\0rTRC\0\0\0\0\0 gTRC\0\0,\0\0\0 bTRC\0\0L\0\0\0 chrm\0\0l\0\0\0$mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\0\0\0\0\0s\0R\0G\0B\0 \0b\0u\0i\0l\0t\0-\0i\0n\0\0mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\02\0\0\0\0N\0o\0 \0c\0o\0p\0y\0r\0i\0g\0h\0t\0,\0 \0u\0s\0e\0 \0f\0r\0e\0e\0l\0y\0\0\0\0XYZ \0\0\0\0\0\0�\�\0\0\0\0\0\�-sf32\0\0\0\0\0J\0\0\����*\0\0�\0\0����������\0\0\�\0\0��XYZ \0\0\0\0\0\0o�\0\08\�\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��XYZ \0\0\0\0\0\0b�\0\0��\0\0\�para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[chrm\0\0\0\0\0\0\0\0\0�\�\0\0T{\0\0L\�\0\0��\0\0&f\0\0\\��\0\0H\0H\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0C\0	\Z!\Z\"$\"$�\�\0C�\�\0\0	�\�\0\0\0?\0�.�[\�\�\\ k{�e\rЫ���`,\�r(\����\�i��\�\�Al�p�G>��\�\�\�kK\�N�e�5�j�Xl��Ԗ\�\�8#t\�zd\�\�\ZƝ\�Ϳ~җ\Z�/��]#L�\�\�V��r\�\�p0q��\0\�_��.]Co��⚹V�>�\�?k\rFXUl����Ode<܍�zc<\Z�K��=	\0\��#�ӷ�Yv?C��v\�<ht\�*�\�Y��H\��U,�;z`w\�|�\�Y�O�^�w,��it� F\��p{\�\�9�\'(��\�L�W+\��#��\�,\�f��\'�r��8\�֪3���Vz�k-�\�5@?iBpEW0X\�\�s�^)�C�#yO�p)]��\�\�c�n;\"e\�$\��Ơ�ᏋQ�U\�\\ck�G��^���\�y߼\�tV~7�4Q�6��̤p0��A4�\0�2ՒG�R֭�\�]�KY\�]��P1�\�r�AtE\�T}Y\����է\���Q\�y�KJ6���=\�w�\0��\'���,�%�\�.���%�Au�I�Q��;�\�\0ן��ՒG���\�}m�-\��\�:��z��o%�|�\��\�4;�\�\�_\�\�5\�\�\�$}I<��W�\�%)4z����ǆ<;\r�tCh�Ȫ:G��?jOm�\�\�!�n׊�\�\�+�b=GºW�-ݭ��\�q�\"��a\����T�6��\�c�-�K���\�3��A\��t9\�+\�z��u)�\���	\\Og��NNW�\�?\0�\�a�B�����\�<�+#���\�\ZX�\�D�\�ї6�<\�;�B�����j�#m�\�,C�Z���\0t\�\��\0x�\�mWQt>d���\"��x\����u%W�>���~\��?�\�\�㶌�̩spU-L�\�\"H��\�\�J�����\�w2�\0y`Qvs�\��7��\"iٚG7(\Zb��\0�8\��漚�}�S(�%>E>q\�\\�	3��w\�/��K]?VV�\�s�\�\�#��m,H\�\n��\�źe�i�\�YZ\�\'�����\�}3ۯZª�՚6�R�	sE���Έ4g[v�[hdh�!\�/r�?�p��K�F\�`� �7�.�Ċ#<\��+�t�\�\�P\�:�|ۛ6> ���U\�(,T��#\"4�<�$q�\�U\�t�4\��22M����}N\�p~��z��\�C2oܝr\�Z\�\�ʜ\���1\��\��2j\�\�^k��\�\�\�YI�w\�s�p���p3]�\�5GȚ\��/|AӛHӴ�x��p�gާ��\�_�\�X1-Ŭm*ʹ\��#ث`�\�WB��\��&\��G�~4[h�\�Ӯm\�\�b���;�NGt\�\�w:e\��\�\�ʡ~��HH��\�V]�\�\�K����\�K�\�D\������3� ^\�z��4b틹m�\�\�C����Җ�\�\��\��\�FF\nT���\�\�ҙik��\�\�2\�բ%	\�x$\����\�N5%�4��K���N�7D�d�\���\rr�1���kgץ5k\���u��ϛ+\�u27[e\�D3�G\��\0^��G�06L��&�*,N�\�)j�\�M\�G�D��\00\0�\�	\�s\�sq^\��I\�ۺ���N\�:s\\�hs\�uR��\�\��\r�3\� ��[9GWF\����\�\�\�\�\�F�?1\'\n¸��8���Z/��V+x\�$�VI��K��Eqz|JL�\�9\nxQ\��t\�f5e\�G+����m��ܟ�$\�RR\�\"�\��^�*8e��r\�\�[U�\0^}\�x�S@Uw1i�W�\r\"��\�\�a\�\�TI��*�\�N���ƣՉ�\���	�V%���X6!XW�4n�\"P�?�ӞK{kt\�Hf@��\�\�u�\�\�ʰZ#�Yh�/\�.V\�U�|����$\�ɬ\�G�>\�?\��\0٫U�,ֶ����k�_���^�\0Z\�Jh:\Z�\�\�%\�ڋG\\\�˞�Ms&He,FힻG�Z�\��LDG\�$c\�\�9�OQT�\�b\r�H��J�\�UɃ\�\�g\'\0\��[�\0���f�9\rX�n�VM��bpm\�?\���\�\�\������[nƍ^\'�\�'),('98765','Bourikas','Elec. Eng.',98,_binary '�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0�i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0�\0\0\0\0\0\0\0H�\0\0\0\0\0\0\0H\0\0\0\0�\�\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\��ُ\0�\�	�\��B~�\��ICC_PROFILE\0\0\0�lcms0\0\0mntrRGB XYZ \�\0\0\0\0#\0 acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\08cprt\0\0@\0\0\0Nwtpt\0\0�\0\0\0chad\0\0�\0\0\0,rXYZ\0\0\�\0\0\0bXYZ\0\0\�\0\0\0gXYZ\0\0�\0\0\0rTRC\0\0\0\0\0 gTRC\0\0,\0\0\0 bTRC\0\0L\0\0\0 chrm\0\0l\0\0\0$mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\0\0\0\0\0s\0R\0G\0B\0 \0b\0u\0i\0l\0t\0-\0i\0n\0\0mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\02\0\0\0\0N\0o\0 \0c\0o\0p\0y\0r\0i\0g\0h\0t\0,\0 \0u\0s\0e\0 \0f\0r\0e\0e\0l\0y\0\0\0\0XYZ \0\0\0\0\0\0�\�\0\0\0\0\0\�-sf32\0\0\0\0\0J\0\0\����*\0\0�\0\0����������\0\0\�\0\0��XYZ \0\0\0\0\0\0o�\0\08\�\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��XYZ \0\0\0\0\0\0b�\0\0��\0\0\�para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[chrm\0\0\0\0\0\0\0\0\0�\�\0\0T{\0\0L\�\0\0��\0\0&f\0\0\\��\0\0H\0H\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0C\0	\Z!\Z\"$\"$�\�\0C�\�\0\0	�\�\0\0\0?\0�\�\�?u�ʲ�\�o=�\��d�\Z;�}v\��\\�Or\�Z�X\�\�ʈUT\�q\�\�⇏l<7b�2]\\ˮ_\��Dv�\�\�G��s1\�\�I\ri��\Z�)h�|D��\��\�-kU/��\r�H\�Ӏz\�v W˞3�y����g0\�\�\�I3�H\�}\�c\�Iɦ����#J\�\��Ԟ[�.x�h��0=�\�\�y�\�\�\�Ηse\"��\�D\�Yz\�\��V����mm�3\�/�|Us������H\��-#z+��\�\�\�V:}��+@�&H\\m\��h�>\�M\�\�����\�^?�0�\�h��\�.\�֡�x\�f\�^$\0Or��c5�H%�Y�\�Y+\�Y1\�v+P�{v�Co\�\'s� �5W^\�t\�9Z�:O|\�Ym\�$�G�KB�?�\��eR�U���\���\�\�\�4\��G\�K\�\�[\��,�aO~Kʺ\�$^<�mÕX���\0���Ϛ\�m�#�\�\r\��\�L>Df0���\�d�\�\��R&�mm��\�\�\�\�\�Z�X�\'��y?��\�\�SYk��d��\"U\�+�k�9�Ϸ�^\�u9z湹\�-=%\no�WÞҬ\�YD�t<s�\�{xJ\�\�\�d\�H�\�1\��`1MB�\�\�ʤ��G5�\�\�ß��\�mw}�\�\�\�&\0avg\�Tc�\�\�]ׄ\�\�\���,�(g�\�q�\�<D��\�=�\r�שNo�\�����?L\�zE\�\�H��h[q+KRӣ���\�\�CE\"�a\�M�\�p�\�\�mSR�}C\�\�,7\����*�� \'�?�zޥ�O�N�\�\�P�\�	 *�>��O1�k\��}O�\�\�\���W}tg�\���E8\n,U�`ҟ�\�CZ;���gM�Fl\�adH�:�\0�U\\�#�I?�\�jv�oq\�6>\�{���nN]S�\�Ul\�\��\�\�\�|Ju�>}Y��\��\�1#fy\�\�3���+ص���\�M\�4�<�Q}=MD���c��Yj֧)\�M\��\Z\�-\�&\�Zټ�]\��\�ֶ� \�Vr\\X���92�\�\�;\��EgYE5b�JRnM=�KÞ\'�\�����\�ƨTFN~x;q�@\�9��R�\�qr\�8 �\�E/l\�ʍ�A?y�>��x\�CH\�[\�\Z\�G\�l@ſJ\�|������fa\�F�\�B����kZt\�i��:�&0���gL\�\�ҝ&1]g�},BqA�\����h�ǽ~}B[\�ocn�lc�ea؞��L\Z\�Xi����}%rg\�[�8��\�\'x\�\��Z_��PY\�A	�q�\�@6\�\�\����PU����C�\��x0,Oe#\�W\��\����5]L\�:\�z�\r�\�޻D�\�ЖL\�\�/\�s\�W.*��J\�s�\�6\�\�\�\'�\�\��\�T��%\�`\n�8�*��e\�/\�\\\�VН�f�\�O�p+Ε\�\�A���#���6� �:��\�XḌ�s�r9�\�^�l�L>17GP�\�q\����\��qC}�\�ӫO�\�/xFMV\�&�Tb�ZD��`=\��T��\�\�oխ�g�\�F�<*���?�e�\�¤��>��j\��H\�<\"FՉ\'�׃�Uּc�\��\Z��|Y{a\r�Y�\�ƎD����a\�\��u���\�н�\�\�\�TW��>���ǟ�)	�=j\�\��3\�+m>�vנ��{3�\�V\��(��WI���Q�j:�|�\�7x\�>��Z�\��\��\rs\�/�v�&V�\�Ƞ\\u㩮6\��B\��\��U\�\�m�S�:\�����iKO+	$s)\�\���\�9�\�-�[�\0�]\�l��>6���\�PvM6�.\�e�\�w\�\�ǡj��\0��\0�7�\0\�\Z�\�R�X5.��f\�%n�\�2\�S���\�\�\\&\�`C#�\�A\�Er^�\0�A�\0���\n��;JǴ�\�s��V��\�Y3ǧڜ\�\�\����\��*Y\���cs�6��Jχ�]a&\r�k��\�i=��͌��\�\Z\��\09	���\�\�?\�t��\0x*��T �7S\�\�+\�6�ٙV��\�Fe�y#eSʶ2I\�\�*�\��{I�ν[��\�3u5+[�\�\�f1,#�}\���ʱ��b}W�U\�lV?�\�'),('98988','Tanaka','Biology',120,_binary '�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0�i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0�\0\0\0\0\0\0\0H�\0\0\0\0\0\0\0H\0\0\0\0�\�\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\��ُ\0�\�	�\��B~�\��ICC_PROFILE\0\0\0�lcms0\0\0mntrRGB XYZ \�\0\0\0\0!\0acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\08cprt\0\0@\0\0\0Nwtpt\0\0�\0\0\0chad\0\0�\0\0\0,rXYZ\0\0\�\0\0\0bXYZ\0\0\�\0\0\0gXYZ\0\0�\0\0\0rTRC\0\0\0\0\0 gTRC\0\0,\0\0\0 bTRC\0\0L\0\0\0 chrm\0\0l\0\0\0$mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\0\0\0\0\0s\0R\0G\0B\0 \0b\0u\0i\0l\0t\0-\0i\0n\0\0mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\02\0\0\0\0N\0o\0 \0c\0o\0p\0y\0r\0i\0g\0h\0t\0,\0 \0u\0s\0e\0 \0f\0r\0e\0e\0l\0y\0\0\0\0XYZ \0\0\0\0\0\0�\�\0\0\0\0\0\�-sf32\0\0\0\0\0J\0\0\����*\0\0�\0\0����������\0\0\�\0\0��XYZ \0\0\0\0\0\0o�\0\08\�\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��XYZ \0\0\0\0\0\0b�\0\0��\0\0\�para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0�\0\0\rY\0\0\�\0\0\n[chrm\0\0\0\0\0\0\0\0\0�\�\0\0T{\0\0L\�\0\0��\0\0&f\0\0\\��\0\0H\0H\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0C\0	\Z!\Z\"$\"$�\�\0C�\�\0\0	�\�\0\0\0?\0���^s�Cx\�xO�&k\�g�\�m�\�O�\Z\�2:�8�aVB\�\�~\"|a��.�\�剖=\�%\�\rŝx+���\�\�ӽ|\�\�\��,\"��\�.8Ryl�\�<���\�B;�UJodkx�Q�\�u��\�Y+\�\�\�,\0GUq�\0׭�ᾣ�\�j��\�+\�$�c \��=�+c(\�\�\�8*\�W8\�&��]�\�\�F�\�I\�p\�8\�W�\��\�\�=��o\�\�21}z�P�\n[\\\��>�9߇��\\\�>�!\�8_>9RF^2˜d��`�1ް<]\�OxM|�\�R{rpd���\�iD\'�1���>$}w�c\�Ɠ�̰�\��3Z�?1\��,�\�^&\�p�A\0��\���A�h\Z垳�L\�]Y\�%�n*	T\��Hʟc[\\\�PV\��#�k#\�׈,�_\�]3]�pc��d\�0T���\��\�Z\�Eқi���M�0�\�\�P\0zsN��8�ƣnr@��Ƒ�\�\�?i�e\��<\�iR;�+al����3J\�@\�\0}v�AZߴE���D\�7R!�n4ȼ��h\�\\�\�r�u5\�Qv4ä\�z\'�4M7EВ\�\�%w\'t�Te�\�!�\0+M��YYZ\�j�\�o	h\���gڼw�Y\�FTֈ�N�\�$��\"�X��x\�\�\�/u�\�_\�\�iҟ\�-���#?ֳ~f\�\'�\�\�RF4��?\�lW�*\�rc\�\�\��Ms,�4�3\���!@\�qG�\�\�\�u�t=/\�\�]���\\Y8S�x=~��\�\r����jØd\�\"{��>��\\�F^���>m��&��\�Y9Đ9\��%^7\�\'�Y%7ͺ\��\�===�\n�\�bc\�v�<�\�I{E�>����u�QAnk-N\�l\�\�\�ep+�����a�j1\�No7	\0�yk�q�ӏ�ҺhWU�\�9q�Ya��w�\�fV>����\�\�\nn\�\�P~$�X�r)��\�\��\0i_ɮh�g�lQ��\0�\�2����q�^\�+w\�O�u�\�\ZF�e5��<K<M���?λ�`kY�S*u���ϟt�kW6p\�ZI$\Zd8X�\0(�c�\�}�9\�]���\�kksg\�~\�#E�@m�ŏq��\�\�WS�\'E�P��|3�\�t\�B&�\�=��\�&\0\�\�9\�5���\\jwvV��ǧ�Įf\�\�\��n���(\�t\�QR�\�cic�\�rPX\�o/V~�뚟QkM*y�֏\�Y\�H\�q��\�?J\�E�-�\�\�V\�hX:7A���}z\����y<M�\���\�3���RK[9���^!���\�&�!��	\�w`nR+������i\�U�\�n-�r�\��\�]�����G)v>��uc{�k7Z{��&�\��Ѳ�\�\Z)��\r�~\�~\�\Zg�W��`_\�k�	�c)&\��RG�\�Х\ZpJ\'���*\�9�{B\nrkc��\�>֓�\�箵״�~\�\�ָm_Q.e��	\�\n�\�VQ\�眩�li�+�/\Z�\�e)c�\'�??\�\�C~#�yM\�\�\�l�\�\�?S_7�\��u�\�\�*ʇ�\�^�\��=P\�jV\�ꑜ�Cq�b\�U�����O5\��4�\�=�\�\�\�#~F\\W�<=Hh\�f�.\�{�\�!>!���\���\�H�c=ON�\0�x\�׏\�-�c�K�K4PD\\n#�N:�5\�,4�\�\�2\�\�Wwl�w0BBş1S8?7_Ǐμ\�\��V��\Z؃ߠ��=�\"������\�G_��)�C�\0^��gbC(+��a\�\�^��\�ãJ\�D���NOˌ�\�U16\\�5�\�g��}O�\�h\�z\�is��n&��^F,\��\�=;We�M<��q��\�?\Z襙����J�lg\'(�䃜`ל\�M{kl�>�u.ӹK\�N�����A���\�_h�\�\��#\�VD��r�q��\�V\�\�ә��sG�\��\r^\��P�#����}��\0v�Z\�{ӊ�\�{��y�Ku�\0�?\�W\'R\�t�V˙b\�M��\�L�!��&y]�\�U��zV\����-\��\0���\0跫�G`�:�����l\�\�z{\�\�\�\n\�5��V�\�d+\�\�3�\'\�^\��C�\0\�I?�\��ׅ��oMO�\�>�\�e�Ȳ����@�Ev��\0�|\��\�M\��c�4��&t]�\09�\��\0^�\��\nǙɖ\��Q�P�?\Z\�V9�&����\�OQa\�\�q�J�E\\{����\�');
/*!40000 ALTER TABLE `student_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_in`
--

DROP TABLE IF EXISTS `tables_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables_in` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fields_` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_in`
--

LOCK TABLES `tables_in` WRITE;
/*!40000 ALTER TABLE `tables_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_out`
--

DROP TABLE IF EXISTS `tables_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables_out` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tables_` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_out`
--

LOCK TABLES `tables_out` WRITE;
/*!40000 ALTER TABLE `tables_out` DISABLE KEYS */;
INSERT INTO `tables_out` VALUES (1,'{\"advisor\": {\"fields\": [{\"field\": \"i_ID\", \"values\": [\"10101\", \"22222\", \"22222\", \"45565\", \"45565\", \"76543\", \"76766\", \"98345\", \"98345\"]}, {\"field\": \"s_ID\", \"values\": [\"00128\", \"12345\", \"23121\", \"44553\", \"45678\", \"76543\", \"76653\", \"98765\", \"98988\"]}], \"table_name\": \"advisor\"}}'),(2,'{\"classroom\": {\"fields\": [{\"field\": \"building\", \"values\": [\"Packard\", \"Painter\", \"Taylor\", \"Watson\", \"Watson\"]}, {\"field\": \"capacity\", \"values\": [500, 10, 70, 30, 50]}, {\"field\": \"room_number\", \"values\": [\"101\", \"514\", \"3128\", \"100\", \"120\"]}], \"table_name\": \"classroom\"}}'),(3,'{\"course\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-301\", \"BIO-399\", \"CS-101\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"credits\", \"values\": [4, 4, 3, 4, 4, 3, 3, 3, 3, 3, 3, 3, 4]}, {\"field\": \"dept_name\", \"values\": [\"Biology\", \"Biology\", \"Biology\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"History\", \"Music\", \"Physics\"]}, {\"field\": \"title\", \"values\": [\"Intro. to Biology\", \"Genetics\", \"Computational Biology\", \"Intro. to Computer Science\", \"Game Design\", \"Robotics\", \"Image Processing\", \"Database System Concepts\", \"Intro. to Digital Systems\", \"Investment Banking\", \"World History\", \"Music Video Production\", \"Physical Principles\"]}], \"table_name\": \"course\"}}'),(4,'{\"department\": {\"fields\": [{\"field\": \"budget\", \"values\": [90000.0, 100000.0, 85000.0, 120000.0, 50000.0, 80000.0, 70000.0]}, {\"field\": \"building\", \"values\": [\"Watson\", \"Taylor\", \"Taylor\", \"Painter\", \"Painter\", \"Packard\", \"Watson\"]}, {\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"History\", \"Music\", \"Physics\"]}], \"table_name\": \"department\"}}'),(5,'{\"instructor\": {\"fields\": [{\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"Finance\", \"History\", \"History\", \"Music\", \"Physics\", \"Physics\"]}, {\"field\": \"ID\", \"values\": [\"10101\", \"12121\", \"15151\", \"22222\", \"32343\", \"33456\", \"45565\", \"58583\", \"76543\", \"76766\", \"83821\", \"98345\"]}, {\"field\": \"name\", \"values\": [\"Srinivasan\", \"Wu\", \"Mozart\", \"Einstein\", \"El Said\", \"Gold\", \"Katz\", \"Califieri\", \"Singh\", \"Crick\", \"Brandt\", \"Kim\"]}, {\"field\": \"salary\", \"values\": [65000.0, 90000.0, 40000.0, 95000.0, 60000.0, 87000.0, 75000.0, 62000.0, 80000.0, 72000.0, 92000.0, 80000.0]}], \"table_name\": \"instructor\"}}'),(6,'{\"mytables\": {\"fields\": [{\"field\": \"id\", \"values\": null}, {\"field\": \"myvalues\", \"values\": null}], \"table_name\": \"mytables\"}}'),(7,'{\"prereq\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-301\", \"BIO-399\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-347\", \"EE-181\"]}, {\"field\": \"prereq_id\", \"values\": [\"BIO-101\", \"BIO-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"PHY-101\"]}], \"table_name\": \"prereq\"}}'),(8,'{\"section\": {\"fields\": [{\"field\": \"building\", \"values\": [null, \"Packard\", \"Packard\", \"Packard\", \"Packard\", \"Painter\", \"Painter\", \"Painter\", \"Taylor\", \"Taylor\", \"Taylor\", \"Taylor\", \"Taylor\", \"Watson\", \"Watson\", \"Watson\"]}, {\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-101\", \"BIO-301\", \"CS-101\", \"CS-101\", \"CS-190\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-319\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"room_number\", \"values\": [null, \"101\", \"101\", \"101\", \"101\", \"514\", \"514\", \"514\", \"3128\", \"3128\", \"3128\", \"3128\", \"3128\", \"100\", \"100\", \"120\"]}, {\"field\": \"sec_id\", \"values\": [\"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"2\", \"1\", \"1\", \"2\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\"]}, {\"field\": \"semester\", \"values\": [\"Summer\", \"Summer\", \"Summer\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\"]}, {\"field\": \"time_slot_id\", \"values\": [\"B\", \"A\", \"H\", \"F\", \"E\", \"A\", \"D\", \"B\", \"C\", \"A\", \"C\", \"B\", \"C\", \"D\", \"A\", null]}, {\"field\": \"year\", \"values\": [2017, 2019, 2018, 2017, 2018, 2017, 2017, 2018, 2018, 2018, 2017, 2017, 2018, 2018, 2018, 2017]}], \"table_name\": \"section\"}}'),(9,'{\"student\": {\"fields\": [{\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp_Sdfghji.\", \"Comp. Sbi.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec_ Eng.\", \"Elec. Eng.\", \"History\", \"Music\", \"Physics\", \"Physics\", \"Physics\", \"Yinance\"]}, {\"field\": \"ID\", \"values\": [\"00128\", \"12345\", \"19991\", \"23121\", \"44553\", \"45678\", \"54321\", \"55739\", \"70557\", \"76543\", \"76653\", \"98765\", \"98988\"]}, {\"field\": \"name\", \"values\": [\"Zhang\", \"Shankar\", \"Brandt\", \"Chavez\", \"Peltier\", \"Levy\", \"Williams\", \"Sanchez\", \"Snow\", \"Brown\", \"Aoi\", \"Bourikas\", \"Tanaka\"]}, {\"field\": \"tot_cred\", \"values\": [102, 32, 80, 110, 56, 46, 54, 38, 56, 58, 60, 98, 120]}], \"table_name\": \"student\"}}'),(10,'{\"tables_in\": {\"fields\": [{\"field\": \"fields_\", \"values\": null}, {\"field\": \"id\", \"values\": [1]}], \"table_name\": \"tables_in\"}}'),(11,'{\"tables_out\": {\"fields\": [{\"field\": \"id\", \"values\": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}, {\"field\": \"tables_\", \"values\": [{\"advisor\": {\"fields\": [{\"field\": \"i_ID\", \"values\": [\"10101\", \"22222\", \"22222\", \"45565\", \"45565\", \"76543\", \"76766\", \"98345\", \"98345\"]}, {\"field\": \"s_ID\", \"values\": [\"00128\", \"12345\", \"23121\", \"44553\", \"45678\", \"76543\", \"76653\", \"98765\", \"98988\"]}], \"table_name\": \"advisor\"}}, {\"classroom\": {\"fields\": [{\"field\": \"building\", \"values\": [\"Packard\", \"Painter\", \"Taylor\", \"Watson\", \"Watson\"]}, {\"field\": \"capacity\", \"values\": [500, 10, 70, 30, 50]}, {\"field\": \"room_number\", \"values\": [\"101\", \"514\", \"3128\", \"100\", \"120\"]}], \"table_name\": \"classroom\"}}, {\"course\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-301\", \"BIO-399\", \"CS-101\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"credits\", \"values\": [4, 4, 3, 4, 4, 3, 3, 3, 3, 3, 3, 3, 4]}, {\"field\": \"dept_name\", \"values\": [\"Biology\", \"Biology\", \"Biology\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"History\", \"Music\", \"Physics\"]}, {\"field\": \"title\", \"values\": [\"Intro. to Biology\", \"Genetics\", \"Computational Biology\", \"Intro. to Computer Science\", \"Game Design\", \"Robotics\", \"Image Processing\", \"Database System Concepts\", \"Intro. to Digital Systems\", \"Investment Banking\", \"World History\", \"Music Video Production\", \"Physical Principles\"]}], \"table_name\": \"course\"}}, {\"department\": {\"fields\": [{\"field\": \"budget\", \"values\": [90000.0, 100000.0, 85000.0, 120000.0, 50000.0, 80000.0, 70000.0]}, {\"field\": \"building\", \"values\": [\"Watson\", \"Taylor\", \"Taylor\", \"Painter\", \"Painter\", \"Packard\", \"Watson\"]}, {\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"History\", \"Music\", \"Physics\"]}], \"table_name\": \"department\"}}, {\"instructor\": {\"fields\": [{\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"Finance\", \"History\", \"History\", \"Music\", \"Physics\", \"Physics\"]}, {\"field\": \"ID\", \"values\": [\"10101\", \"12121\", \"15151\", \"22222\", \"32343\", \"33456\", \"45565\", \"58583\", \"76543\", \"76766\", \"83821\", \"98345\"]}, {\"field\": \"name\", \"values\": [\"Srinivasan\", \"Wu\", \"Mozart\", \"Einstein\", \"El Said\", \"Gold\", \"Katz\", \"Califieri\", \"Singh\", \"Crick\", \"Brandt\", \"Kim\"]}, {\"field\": \"salary\", \"values\": [65000.0, 90000.0, 40000.0, 95000.0, 60000.0, 87000.0, 75000.0, 62000.0, 80000.0, 72000.0, 92000.0, 80000.0]}], \"table_name\": \"instructor\"}}, {\"mytables\": {\"fields\": [{\"field\": \"id\", \"values\": null}, {\"field\": \"myvalues\", \"values\": null}], \"table_name\": \"mytables\"}}, {\"prereq\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-301\", \"BIO-399\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-347\", \"EE-181\"]}, {\"field\": \"prereq_id\", \"values\": [\"BIO-101\", \"BIO-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"PHY-101\"]}], \"table_name\": \"prereq\"}}, {\"section\": {\"fields\": [{\"field\": \"building\", \"values\": [null, \"Packard\", \"Packard\", \"Packard\", \"Packard\", \"Painter\", \"Painter\", \"Painter\", \"Taylor\", \"Taylor\", \"Taylor\", \"Taylor\", \"Taylor\", \"Watson\", \"Watson\", \"Watson\"]}, {\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-101\", \"BIO-301\", \"CS-101\", \"CS-101\", \"CS-190\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-319\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"room_number\", \"values\": [null, \"101\", \"101\", \"101\", \"101\", \"514\", \"514\", \"514\", \"3128\", \"3128\", \"3128\", \"3128\", \"3128\", \"100\", \"100\", \"120\"]}, {\"field\": \"sec_id\", \"values\": [\"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"2\", \"1\", \"1\", \"2\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\"]}, {\"field\": \"semester\", \"values\": [\"Summer\", \"Summer\", \"Summer\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\"]}, {\"field\": \"time_slot_id\", \"values\": [\"B\", \"A\", \"H\", \"F\", \"E\", \"A\", \"D\", \"B\", \"C\", \"A\", \"C\", \"B\", \"C\", \"D\", \"A\", null]}, {\"field\": \"year\", \"values\": [2017, 2019, 2018, 2017, 2018, 2017, 2017, 2018, 2018, 2018, 2017, 2017, 2018, 2018, 2018, 2017]}], \"table_name\": \"section\"}}, {\"student\": {\"fields\": [{\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp_Sdfghji.\", \"Comp. Sbi.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec_ Eng.\", \"Elec. Eng.\", \"History\", \"Music\", \"Physics\", \"Physics\", \"Physics\", \"Yinance\"]}, {\"field\": \"ID\", \"values\": [\"00128\", \"12345\", \"19991\", \"23121\", \"44553\", \"45678\", \"54321\", \"55739\", \"70557\", \"76543\", \"76653\", \"98765\", \"98988\"]}, {\"field\": \"name\", \"values\": [\"Zhang\", \"Shankar\", \"Brandt\", \"Chavez\", \"Peltier\", \"Levy\", \"Williams\", \"Sanchez\", \"Snow\", \"Brown\", \"Aoi\", \"Bourikas\", \"Tanaka\"]}, {\"field\": \"tot_cred\", \"values\": [102, 32, 80, 110, 56, 46, 54, 38, 56, 58, 60, 98, 120]}], \"table_name\": \"student\"}}, {\"tables_in\": {\"fields\": [{\"field\": \"fields_\", \"values\": null}, {\"field\": \"id\", \"values\": [1]}], \"table_name\": \"tables_in\"}}]}], \"table_name\": \"tables_out\"}}'),(12,'{\"takes\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-301\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-190\", \"CS-190\", \"CS-315\", \"CS-315\", \"CS-319\", \"CS-319\", \"CS-347\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"grade\", \"values\": [\"A\", \"A-\", \"C\", \"A\", \"A\", \"A\", \"B\", \"C+\", \"B-\", \"F\", \"B+\", \"B\", \"A-\", \"B+\", \"A-\", \"A\", \"A\", \"C\", \"C-\", \"B\", \"A\", null]}, {\"field\": \"ID\", \"values\": [\"00128\", \"00128\", \"12345\", \"12345\", \"12345\", \"12345\", \"19991\", \"23121\", \"44553\", \"45678\", \"45678\", \"45678\", \"54321\", \"54321\", \"55739\", \"76543\", \"76543\", \"76653\", \"98765\", \"98765\", \"98988\", \"98988\"]}, {\"field\": \"sec_id\", \"values\": [\"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"2\", \"2\", \"1\", \"1\", \"1\", \"2\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\"]}, {\"field\": \"semester\", \"values\": [\"Summer\", \"Summer\", \"Fall\", \"Fall\", \"Fall\", \"Fall\", \"Fall\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\"]}, {\"field\": \"year\", \"values\": [2017, 2018, 2017, 2017, 2017, 2017, 2017, 2017, 2018, 2017, 2017, 2018, 2018, 2018, 2018, 2017, 2017, 2017, 2018, 2018, 2018, 2017]}], \"table_name\": \"takes\"}}'),(13,'{\"teaches\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-301\", \"CS_101\", \"CS-101\", \"CS-190\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-319\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"ID\", \"values\": [\"76766\", \"76766\", \"10101\", \"45565\", \"83821\", \"83821\", \"10101\", \"45565\", \"83821\", \"10101\", \"98345\", \"12121\", \"32343\", \"15151\", \"22222\"]}, {\"field\": \"sec_id\", \"values\": [\"1\", \"1\", \"1\", \"1\", \"1\", \"2\", \"1\", \"1\", \"2\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\"]}, {\"field\": \"semester\", \"values\": [\"Summer\", \"Summer\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\"]}, {\"field\": \"year\", \"values\": [2017, 2018, 2017, 2018, 2017, 2017, 2018, 2018, 2018, 2017, 2017, 2018, 2018, 2018, 2017]}], \"table_name\": \"teaches\"}}'),(14,'{\"time_slot\": {\"fields\": [{\"field\": \"day\", \"values\": [\"F\", \"M\", \"W\", \"F\", \"M\", \"W\", \"F\", \"M\", \"W\", \"F\", \"M\", \"W\", \"R\", \"T\", \"R\", \"T\", \"F\", \"M\", \"W\", \"W\"]}, {\"field\": \"end_hr\", \"values\": [8, 8, 8, 9, 9, 9, 11, 11, 11, 13, 13, 13, 11, 11, 15, 15, 16, 16, 16, 12]}, {\"field\": \"end_min\", \"values\": [50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 45, 45, 45, 45, 50, 50, 50, 30]}, {\"field\": \"start_hr\", \"values\": [8, 8, 8, 9, 9, 9, 11, 11, 11, 13, 13, 13, 10, 10, 14, 14, 16, 16, 16, 10]}, {\"field\": \"start_min\", \"values\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 30, 30, 30, 0, 0, 0, 0]}, {\"field\": \"time_slot_id\", \"values\": [\"A\", \"A\", \"A\", \"B\", \"B\", \"B\", \"C\", \"C\", \"C\", \"D\", \"D\", \"D\", \"E\", \"E\", \"F\", \"F\", \"G\", \"G\", \"G\", \"H\"]}], \"table_name\": \"time_slot\"}}');
/*!40000 ALTER TABLE `tables_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takes`
--

DROP TABLE IF EXISTS `takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `takes` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `grade` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update` date NOT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takes`
--

LOCK TABLES `takes` WRITE;
/*!40000 ALTER TABLE `takes` DISABLE KEYS */;
INSERT INTO `takes` VALUES ('00128','CS-101','1','Fall',2017,'A','2023-03-22'),('00128','CS-347','1','Fall',2017,'A-','2023-03-22'),('12345','CS-101','1','Fall',2017,'C','2023-03-22'),('12345','CS-190','2','Spring',2017,'A','2023-03-22'),('12345','CS-315','1','Spring',2018,'A','2023-03-22'),('12345','CS-347','1','Fall',2017,'A','2023-03-22'),('19991','HIS-351','1','Spring',2018,'B','2023-03-22'),('23121','FIN-201','1','Spring',2018,'C+','2023-03-22'),('44553','PHY-101','1','Fall',2017,'B-','2023-03-22'),('45678','CS-101','1','Fall',2017,'F','2023-03-22'),('45678','CS-101','1','Spring',2018,'B+','2023-03-22'),('45678','CS-319','1','Spring',2018,'B','2023-03-22'),('54321','CS-101','1','Fall',2017,'A-','2023-03-22'),('54321','CS-190','2','Spring',2017,'B+','2023-03-22'),('55739','MU-199','1','Spring',2018,'A-','2023-03-22'),('76543','CS-101','1','Fall',2017,'A','2023-03-22'),('76543','CS-319','2','Spring',2018,'A','2023-03-22'),('76653','EE-181','1','Spring',2017,'C','2023-03-22'),('98765','CS-101','1','Fall',2017,'C-','2023-03-22'),('98765','CS-315','1','Spring',2018,'B','2023-03-22'),('98988','BIO-101','1','Summer',2017,'A','2023-03-22'),('98988','BIO-301','1','Summer',2018,NULL,'2023-03-22');
/*!40000 ALTER TABLE `takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaches` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `update` date NOT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `instructor` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `teaches_ibfk_3` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
INSERT INTO `teaches` VALUES ('10101','CS-101','1','Fall',2017,'2023-03-22'),('10101','CS-315','1','Spring',2018,'2023-03-22'),('10101','CS-347','1','Fall',2017,'2023-03-22'),('12121','FIN-201','1','Spring',2018,'2023-03-22'),('15151','MU-199','1','Spring',2018,'2023-03-22'),('22222','PHY-101','1','Fall',2017,'2023-03-22'),('32343','HIS-351','1','Spring',2018,'2023-03-22'),('45565','CS-101','1','Spring',2018,'2023-03-22'),('45565','CS-319','1','Spring',2018,'2023-03-22'),('76766','BIO-101','1','Summer',2017,'2023-03-22'),('76766','BIO-301','1','Summer',2018,'2023-03-22'),('83821','CS-190','1','Spring',2017,'2023-03-22'),('83821','CS-190','2','Spring',2017,'2023-03-22'),('83821','CS-319','2','Spring',2018,'2023-03-22'),('98345','EE-181','1','Spring',2017,'2023-03-22');
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_slot` (
  `time_slot_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_hr` decimal(2,0) NOT NULL,
  `start_min` decimal(2,0) NOT NULL,
  `end_hr` decimal(2,0) DEFAULT NULL,
  `end_min` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`time_slot_id`,`day`,`start_hr`,`start_min`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slot`
--

LOCK TABLES `time_slot` WRITE;
/*!40000 ALTER TABLE `time_slot` DISABLE KEYS */;
INSERT INTO `time_slot` VALUES ('A','F',8,0,8,50),('A','M',8,0,8,50),('A','W',8,0,8,50),('B','F',9,0,9,50),('B','M',9,0,9,50),('B','W',9,0,9,50),('C','F',11,0,11,50),('C','M',11,0,11,50),('C','W',11,0,11,50),('D','F',13,0,13,50),('D','M',13,0,13,50),('D','W',13,0,13,50),('E','R',10,30,11,45),('E','T',10,30,11,45),('F','R',14,30,15,45),('F','T',14,30,15,45),('G','F',16,0,16,50),('G','M',16,0,16,50),('G','W',16,0,16,50),('H','W',10,0,12,30);
/*!40000 ALTER TABLE `time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'university_2023_caso_mongodb'
--

--
-- Dumping routines for database 'university_2023_caso_mongodb'
--
/*!50003 DROP FUNCTION IF EXISTS `build_tables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `build_tables`(`name_schema` VARCHAR(64), `name_table` VARCHAR(64)) RETURNS json
    NO SQL
BEGIN                       
SET @fields = JSON_OBJECT( 'fields',(SELECT JSON_ARRAYAGG(JSON_OBJECT('column_name', `COLUMN_NAME`, 'is_null', `IS_NULLABLE`, 'data_type',`DATA_TYPE`, 'character_max_lenght',`CHARACTER_MAXIMUM_LENGTH`,'character_octet_lenght', `CHARACTER_OCTET_LENGTH`, 'column_key',`COLUMN_KEY`, 'privileges',`PRIVILEGES`)) FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = name_schema AND TABLE_NAME = name_table));
/*SELECT @fields;*/
RETURN @fields;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_advisor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_advisor`()
    NO SQL
BEGIN
SET @i_ID=JSON_OBJECT("i_ID",(SELECT JSON_ARRAYAGG(i_ID) FROM `advisor`));
SELECT @i_ID;
SET @s_ID=JSON_OBJECT("s_ID",(SELECT JSON_ARRAYAGG(s_ID) FROM `advisor`));
SELECT @s_ID;
SET @advisor=JSON_OBJECT("advisor",JSON_MERGE(@i_ID,@s_ID));
SELECT @advisor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_advisor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_advisor`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ( 's_ID', d.s_ID, 'i_ID', d.i_ID)  "mongo_objects" FROM advisor d;
(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/advisor.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_classroom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_classroom`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ( 'building',`building`,'room_number', `room_number`,'capacity',`capacity`)  "mongo_objects" FROM classroom d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/classroom.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_course` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_course`()
    NO SQL
BEGIN
/*TRUNCATE mongodb_objects;*/
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ( 'course_id',`course_id`,'title', `title`,'dept_name', `dept_name`,'credits', `credits`)  "mongo_objects" FROM course d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/course.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_department` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_department`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ('dept_name', `dept_name`,'building', `building`, 'budget',`budget`)  "mongo_objects" FROM department d;
(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/department.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_instructor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_instructor`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ('ID',`ID`, 'name',`name`,'dept_name',`dept_name`,'salary', `salary`)  "mongo_objects" FROM instructor d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/instructor.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_prereq` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_prereq`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ( 'course_id',`course_id`, 'prereq_id',`prereq_id`)  "mongo_objects" FROM prereq d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/prereq.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_section` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_section`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ('course_id', `course_id`, 'sec_id', `sec_id`,'semester',  `semester`,'year',  `year`,'building',  `building`,'room_number',  `room_number`,'time_slot_id',  `time_slot_id`)  "mongo_objects" FROM section d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/section.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_student`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ('ID', `ID`, 'name',`name`, 'dept_name',`dept_name`, 'tot_cred',`tot_cred`)  "mongo_objects" FROM student d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/student.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_takes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_takes`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ('ID',`ID`,'course_id', `course_id`,'sec_id', `sec_id`,'semester', `semester`, 'year',`year`,'grade', `grade`)  "mongo_objects" FROM takes d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/takes.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_teaches` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_teaches`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ('ID', `ID`, 'course_id',`course_id`,'sec_id', `sec_id`, 'semester',`semester`,'year', `year`)  "mongo_objects" FROM teaches d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/teaches.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_time_slot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_time_slot`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ('time_slot_id',`time_slot_id`,'day', `day`,'start_hr', `start_hr`, 'start_min',`start_min`,'end_hr', `end_hr`,'end_min', `end_min`)  "mongo_objects" FROM time_slot d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/time_slot.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_values` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_values`(IN `name_schema` VARCHAR(50), IN `name_table` VARCHAR(50), IN `name_column` VARCHAR(50))
    NO SQL
BEGIN
 CREATE TABLE IF NOT EXISTS `mytables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `myvalues` json NOT NULL,
  PRIMARY KEY (`id`)
);
SET @mybuild = CONCAT('INSERT INTO mytables(myvalues) SELECT JSON_ARRAYAGG(',name_column,') FROM',' ',name_table,'');
PREPARE stmt FROM @mybuild;
EXECUTE stmt; 
DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_excel_file_by_table_for_neo4j` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_excel_file_by_table_for_neo4j`()
    NO SQL
BEGIN
(SELECT 's_ID', 'i_ID') UNION ALL
(SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/advisor.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM advisor);

(SELECT 'building', 'room_number', 'capacity') UNION ALL 
(SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/classroom.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `classroom`);

(SELECT 'course_id', 'title', 'dept_name', 'credits')
UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/course.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `course`);

(SELECT 'dept_name', 'building', 'budget') UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/department.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `department`);

(SELECT 'ID', 'name', 'dept_name', 'salary') UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/instructor.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `instructor`);

(SELECT 'course_id', 'prereq_id') UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/prereq.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `prereq`);

(SELECT 'course_id', 'sec_id', 'semester', 'year', 'building', 'room_number', 'time_slot_id') UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/section.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `section`);

(SELECT 'ID', 'name', 'dept_name', 'tot_cred') UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/student.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `student`);

(SELECT 'ID', 'course_id', 'sec_id', 'semester', 'year', 'grade') UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/takes.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `takes`);

(SELECT 'ID', 'course_id', 'sec_id', 'semester', 'year') UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/teaches.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM  `teaches` );

(SELECT 'time_slot_id', 'day', 'start_hr', 'start_min', 'end_hr', 'end_min') UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/time_slot.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `time_slot`);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_excel_file_by_table_for_neo4j_cast_text` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_excel_file_by_table_for_neo4j_cast_text`()
    NO SQL
BEGIN
(SELECT 's_ID', 'i_ID') UNION ALL
(SELECT CAST(s_ID AS CHAR),CAST(i_ID AS CHAR ) INTO OUTFILE 'c:/wamp64/tmp/neo4j/advisor.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM advisor);

(SELECT 'building', 'room_number', 'capacity') UNION ALL 
(SELECT CAST(building AS CHAR),CAST( room_number AS CHAR),CAST(capacity AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/classroom.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `classroom`);

(SELECT 'course_id', 'title', 'dept_name', 'credits')
UNION ALL (SELECT CAST( course_id AS CHAR), CAST(title AS CHAR), CAST(dept_name AS CHAR), CAST(credits AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/course.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `course`);

(SELECT 'dept_name', 'building', 'budget') UNION ALL (SELECT CAST(dept_name AS CHAR), CAST(building AS CHAR),CAST(budget AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/department.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `department`);

(SELECT 'ID', 'name', 'dept_name', 'salary') UNION ALL (SELECT CAST(ID AS CHAR), CAST(name AS CHAR), CAST(dept_name AS CHAR), CAST(salary AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/instructor.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `instructor`);

(SELECT 'course_id', 'prereq_id') UNION ALL (SELECT CAST(course_id AS CHAR), CAST(prereq_id AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/prereq.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `prereq`);

(SELECT 'course_id', 'sec_id', 'semester', 'year', 'building', 'room_number', 'time_slot_id') UNION ALL (SELECT CAST(course_id AS CHAR), CAST(sec_id AS CHAR), CAST(semester AS CHAR), CAST(year AS CHAR), CAST(building AS CHAR), CAST(room_number AS CHAR), CAST(time_slot_id AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/section.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `section`);

(SELECT 'ID', 'name', 'dept_name', 'tot_cred') UNION ALL (SELECT CAST(ID AS CHAR), CAST(name AS CHAR), CAST(dept_name AS CHAR), CAST(tot_cred AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/student.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `student`);

(SELECT 'ID', 'course_id', 'sec_id', 'semester', 'year', 'grade') UNION ALL (SELECT CAST(ID AS CHAR), CAST(course_id AS CHAR), CAST(sec_id AS CHAR), CAST(semester AS CHAR), CAST( year AS CHAR), CAST(grade AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/takes.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `takes`);

(SELECT 'ID', 'course_id', 'sec_id', 'semester', 'year') UNION ALL (SELECT CAST(ID AS CHAR), CAST(course_id AS CHAR), CAST(sec_id AS CHAR), CAST(semester AS CHAR), CAST(year AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/teaches.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM  `teaches` );

(SELECT 'time_slot_id', 'day', 'start_hr', 'start_min', 'end_hr', 'end_min') UNION ALL (SELECT CAST(time_slot_id AS CHAR), CAST(day AS CHAR), CAST(start_hr AS CHAR), CAST(start_min AS CHAR), CAST(end_hr AS CHAR), CAST(end_min AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/time_slot.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `time_slot`);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_mongodb_dbref` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_mongodb_dbref`()
    NO SQL
BEGIN
/* Algoritmo:
verificar que una tabla mysql está relacionada.
verificar qué campos están relacionados. 
generar el json con el patrón dbref
*/

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_txt_for_mongo_collection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_txt_for_mongo_collection`()
    NO SQL
BEGIN
call build_mongo_db_object_advisor;
call build_mongo_db_object_classroom;
call build_mongo_db_object_course;
call build_mongo_db_object_department;
call build_mongo_db_object_instructor;
call build_mongo_db_object_prereq;
call build_mongo_db_object_section;
call build_mongo_db_object_student;
call build_mongo_db_object_teaches;
call build_mongo_db_object_takes;
call build_mongo_db_object_time_slot;
TRUNCATE mongodb_objects;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `jugando_con relaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `jugando_con relaciones`()
    NO SQL
BEGIN
-- relaciones course, department and 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mongo_tables_cursor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mongo_tables_cursor`(IN `schema_in` VARCHAR(100))
    NO SQL
BEGIN
  DECLARE name_schema varchar(64) ;
  DECLARE name_table varchar(64) ; 
 /* DECLARE name_column varchar(64) ; */
  DECLARE fin INTEGER DEFAULT 0;
  DECLARE sch_cursor CURSOR FOR SELECT DISTINCT TABLE_SCHEMA, TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA=schema_in;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;
  
  OPEN sch_cursor;
  get_cursor: LOOP
  FETCH sch_cursor INTO name_schema,name_table;

 IF fin = TRUE 
    THEN
    	LEAVE get_cursor;
    END IF;
call uni_fields_cursor(name_schema,name_table);
Select name_schema,name_table;
  END LOOP get_cursor;
  CLOSE sch_cursor; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `playing_with_joins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `playing_with_joins`()
    NO SQL
BEGIN
-- Demostramos que Snow no ha matriculado ninguna asignatura.
-- SELECT * FROM `takes` WHERE `ID`=70557;

-- Querys

 -- SELECT * FROM student NATURAL JOIN course;
-- Create Table t_join SELECT student.ID, student.name,student.dept_name,student.tot_cred,course.course_id,course.title,course.dept_name as dpt, course.credits FROM student JOIN course;
-- Create Table cross_join SELECT student.ID, student.name,student.dept_name,student.tot_cred,course.course_id,course.title,course.dept_name as dpt, course.credits FROM student CROSS JOIN course;
-- Create Table left_join SELECT student.ID, student.name,student.dept_name,student.tot_cred,course.course_id,course.title,course.dept_name as dpt, course.credits FROM student CROSS JOIN course;
-- Create Table right_join SELECT student.ID, student.name,student.dept_name,student.tot_cred,course.course_id,course.title,course.dept_name as dpt, course.credits FROM student CROSS JOIN course;
--  SELECT * FROM takes UNION SELECT * from student;
 -- SELECT * FROM student NATURAL LEFT OUTER JOIN course;
-- SELECT * FROM student NATURAL JOIN takes;
 SELECT * FROM student NATURAL LEFT OUTER JOIN takes;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reunion_natural` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reunion_natural`()
    NO SQL
BEGIN
SELECT * FROM student JOIN instructor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `searchs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchs`()
    NO SQL
BEGIN
-- Patrones LIKE. wildcard %
-- las que terminan
 -- SELECT * FROM `student` WHERE `dept_name` LIKE '%y';
 -- las que empiezan
 -- SELECT * FROM `student` WHERE `dept_name` LIKE 'y%';
 -- las que están en el medio
 -- SELECT * FROM `student` WHERE `dept_name` LIKE '%y%';
-- wilcard 


-- NOT LIKE
-- true
-- SELECT * FROM `student` WHERE `dept_name` NOT LIKE '%y%';
-- SELECT * FROM `student` WHERE `dept_name` NOT LIKE 'y%';
-- SELECT * FROM `student` WHERE `dept_name` NOT LIKE '%y';
-- no devuelve nada
-- SELECT * FROM `student` WHERE `dept_name` NOT LIKE 'y';

-- Guión bajo
-- SELECT * FROM `student` WHERE `dept_name` LIKE '';
-- Escape

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `trabajo_partial_cursor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `trabajo_partial_cursor`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
  CAll build_mongo_db_object_advisor;
  CALL build_mongo_db_object_classroom;
  CALL build_mongo_db_object_course;
  CALL build_mongo_db_object_department;
  CALL build_mongo_db_object_instructor;
  CALL build_mongo_db_object_prereq;
  CALL build_mongo_db_object_section;
  CALL build_mongo_db_object_student;
  CALL build_mongo_db_object_takes;
  CALL build_mongo_db_object_teaches;
  CALL build_mongo_db_object_time_slot;


/*SET @uni_partial_json=JSON_OBJECT('uni_partial_json',(SELECT JSON_ARRAYAGG(`object_mongodb`) FROM mongodb_objects));
SELECT @uni_partial_json;
                                  
SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'c:/wamp64/tmp/mongodb/uni.txt' FROM mongodb_objects;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `union` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `union`()
    NO SQL
BEGIN
-- Caso 1: Cardinalidad diferente. Se ha agregado la columna sexo en la tabla instructor
-- SELECT * FROM student UNION SELECT * FROM instructor;
-- Se elimina la columna sexo de la tabla instructor.
-- Caso 2.a: Atributos diferentes con student primero
-- SELECT * FROM student UNION SELECT * FROM instructor;
-- SELECT * FROM instructor UNION SELECT * FROM student;
-- SELECT * FROM student UNION SELECT * FROM student as s;
SELECT * FROM student as s WHERE s.dept_name= 'Music' UNION SELECT * FROM instructor as i  WHERE i.dept_name = 'Music';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uni_department_test_cursor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uni_department_test_cursor`()
    NO SQL
BEGIN
  DECLARE department_json json;
  DECLARE building varchar (50);
  DECLARE fin INTEGER DEFAULT 0;
  
  DECLARE json_cursor CURSOR FOR SELECT DISTINCT JSON_OBJECT('department',JSON_OBJECT('course', JSON_OBJECT('course_id',c.course_id,'title',c.title,'credits',c.credits),'instructor',JSON_OBJECT('i_ID',i.ID, 'i_name',i.name,'i_salary',i.salary),'dept_name',d.dept_name,'building', d.building, 'budget',d.budget,'student', JSON_OBJECT('s-ID',s.ID,'s_name', s.name, 's_tot_cred',s.tot_cred))) FROM `department` d INNER JOIN course c INNER JOIN instructor i  INNER JOIN student s WHERE d.dept_name = c.dept_name AND d.dept_name= i.dept_name AND d.dept_name = s.dept_name;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;
  OPEN json_cursor;
  get_cursor: LOOP
  FETCH json_cursor INTO department_json;
 IF fin = TRUE 
    THEN
    	LEAVE get_cursor;
    END IF;
   
    INSERT INTO `mongodb_objects`(`object_mongodb`) VALUES (department_json);
   SELECT department_json;
  END LOOP get_cursor;
  CLOSE json_cursor; 
   
   (SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'c:/wamp64/tmp/mongodb/mongo_collection.txt' FROM mongodb_objects);
   TRUNCATE `mongodb_objects`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uni_fields_cursor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uni_fields_cursor`(IN `schema_in` VARCHAR(64), IN `table_in` VARCHAR(64))
    NO SQL
BEGIN
  DECLARE name_schema varchar(64) ; 
  DECLARE name_table varchar(64) ; 
  DECLARE name_column varchar(64) ; 
  DECLARE fin INTEGER DEFAULT 0;
  DECLARE tab_cursor CURSOR FOR SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA =schema_in AND TABLE_NAME =table_in;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;
  OPEN tab_cursor;
  get_cursor: LOOP
  FETCH tab_cursor INTO name_schema,name_table,name_column;
  SELECT name_schema;
 IF fin = TRUE 
    THEN
    	LEAVE get_cursor;
   END IF;
   TRUNCATE mytables;
/*call build_values(name_schema,name_table,name_column);*/
-- Paso necesario para tomar los valores desde una tabla y convertirlos en json.

SET @mybuild = CONCAT('INSERT INTO mytables(myvalues) SELECT JSON_ARRAYAGG(',name_column,') FROM',' ',name_table,'');
PREPARE stmt FROM @mybuild;
EXECUTE stmt; 
DEALLOCATE PREPARE stmt;
SET @values=JSON_OBJECT("field",name_column
,"values",(SELECT myvalues FROM mytables));
SELECT @values;
TRUNCATE `mytables`;
INSERT INTO `tables_in`(`fields_`) VALUES (@values);

  END LOOP get_cursor;
  CLOSE tab_cursor; 
 -- tomar los valores de la tabla
SET @fields=JSON_OBJECT('fields',(SELECT JSON_ARRAYAGG(fields_) FROM tables_in));
SET @table=JSON_OBJECT("table_name",name_table);
SET @tables=JSON_OBJECT(name_table,JSON_MERGE(@table,@fields));
/*SELECT @tables;*/
TRUNCATE tables_in;
INSERT INTO `tables_out`(`tables_`) VALUES (@tables);
/*  DROP TABLE `mytables`;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uni_json_final` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uni_json_final`()
    NO SQL
BEGIN
SET @dictionary =JSON_OBJECT('dictionary',(SELECT JSON_ARRAYAGG(JSON_OBJECT('tables',json)) FROM tables));
SELECT @dictionary;
TRUNCATE `dictionary`;
INSERT INTO `dictionary`(`dictionary`) VALUES (@dictionary);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uni_partial_json_relations_view` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uni_partial_json_relations_view`(IN `schema_in` VARCHAR(70))
    NO SQL
BEGIN
SET @test=CONCAT('%',schema_in,'%');
SELECT @test;
CREATE VIEW relations AS SELECT DISTINCT ifb.`ID`, ifb.`FOR_NAME`, ifb.`REF_NAME`, ifb.`N_COLS`, ifb.`TYPE`, ifc.`FOR_COL_NAME`, ifc.`REF_COL_NAME`, ifc.`POS` FROM information_schema.INNODB_FOREIGN ifb  join information_schema.INNODB_FOREIGN_COLS ifc WHERE ifb.ID LIKE "%uni_partial_json%" AND ifb.ID = ifc.ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uni_tables_cursor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uni_tables_cursor`(IN `schema_in` VARCHAR(100))
    NO SQL
BEGIN
  DECLARE name_schema varchar(64) ;
  DECLARE name_table varchar(64) ; 
 /* DECLARE name_column varchar(64) ; */
  DECLARE fin INTEGER DEFAULT 0;
  DECLARE sch_cursor CURSOR FOR SELECT DISTINCT TABLE_SCHEMA, TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA=schema_in;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;
  
  OPEN sch_cursor;
  get_cursor: LOOP
  FETCH sch_cursor INTO name_schema,name_table;

 IF fin = TRUE 
    THEN
    	LEAVE get_cursor;
    END IF;
call uni_fields_cursor(name_schema,name_table);
Select name_schema,name_table;
  END LOOP get_cursor;
  CLOSE sch_cursor; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `relations`
--

/*!50001 DROP VIEW IF EXISTS `relations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `relations` AS select distinct `information_schema`.`ifb`.`ID` AS `ID`,`information_schema`.`ifb`.`FOR_NAME` AS `FOR_NAME`,`information_schema`.`ifb`.`REF_NAME` AS `REF_NAME`,`information_schema`.`ifb`.`N_COLS` AS `N_COLS`,`information_schema`.`ifb`.`TYPE` AS `TYPE`,`information_schema`.`ifc`.`FOR_COL_NAME` AS `FOR_COL_NAME`,`information_schema`.`ifc`.`REF_COL_NAME` AS `REF_COL_NAME`,`information_schema`.`ifc`.`POS` AS `POS` from (`information_schema`.`INNODB_FOREIGN` `ifb` join `information_schema`.`INNODB_FOREIGN_COLS` `ifc`) where ((`information_schema`.`ifb`.`ID` like '%uni_partial_json%') and (`information_schema`.`ifb`.`ID` = `information_schema`.`ifc`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-15 18:06:58
