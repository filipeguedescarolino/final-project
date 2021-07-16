CREATE DATABASE  IF NOT EXISTS `projecto_refactor` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projecto_refactor`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: projecto_refactor
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_patient` int NOT NULL,
  `day` date NOT NULL,
  `hour` time NOT NULL,
  `id_insurance` int NOT NULL,
  `id_specialization` int NOT NULL,
  `id_time_slot` int NOT NULL,
  `id_status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_doctor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_from_appointments_to_patients_idx` (`id_patient`),
  KEY `fk_from_appointments_to_insurance_idx` (`id_insurance`),
  KEY `fk_from:appointments_to_specializations_idx` (`id_specialization`),
  KEY `fk_from_appointments_to_doctors_idx` (`id_doctor`),
  KEY `fk_from_appointments_to_time_slots_idx` (`id_time_slot`),
  KEY `fk_from_appointments_to_status_idx` (`id_status`),
  CONSTRAINT `fk_from:appointments_to_specializations` FOREIGN KEY (`id_specialization`) REFERENCES `specializations` (`id`),
  CONSTRAINT `fk_from_appointments_to_doctors` FOREIGN KEY (`id_doctor`) REFERENCES `doctors` (`id`),
  CONSTRAINT `fk_from_appointments_to_insurance` FOREIGN KEY (`id_insurance`) REFERENCES `insurance` (`id`),
  CONSTRAINT `fk_from_appointments_to_patients` FOREIGN KEY (`id_patient`) REFERENCES `patients` (`id`),
  CONSTRAINT `fk_from_appointments_to_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_from_appointments_to_time_slots` FOREIGN KEY (`id_time_slot`) REFERENCES `time_slots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (33,11,'2021-07-22','09:00:00',4,1,2058,1,'2021-07-13 23:26:32','2021-07-13 23:26:32',24),(34,11,'2021-07-21','10:30:00',4,2,2319,1,'2021-07-13 23:26:52','2021-07-13 23:26:52',23),(35,11,'2021-07-20','14:00:00',4,3,2220,1,'2021-07-13 23:27:10','2021-07-14 19:39:31',25),(36,11,'2021-07-28','10:00:00',4,2,2360,1,'2021-07-13 23:29:31','2021-07-13 23:29:31',23),(37,11,'2021-07-26','10:30:00',4,1,2085,1,'2021-07-13 23:32:08','2021-07-14 19:37:26',24),(38,11,'2021-07-18','17:00:00',4,3,2210,1,'2021-07-13 23:38:53','2021-07-13 23:38:53',25),(39,11,'2021-07-19','11:30:00',4,1,2045,2,'2021-07-13 23:45:34','2021-07-15 09:18:40',24),(40,11,'2021-07-28','11:30:00',4,2,2363,1,'2021-07-14 00:01:13','2021-07-14 00:01:13',23),(41,11,'2021-07-17','09:30:00',3,1,2029,1,'2021-07-14 00:04:18','2021-07-14 00:04:18',24),(42,11,'2021-07-17','10:00:00',3,1,2030,1,'2021-07-14 19:31:06','2021-07-14 19:31:06',24),(43,11,'2021-07-22','09:30:00',3,1,2059,1,'2021-07-14 19:48:51','2021-07-14 19:48:51',24),(44,11,'2021-07-22','10:00:00',3,1,2060,1,'2021-07-14 19:49:51','2021-07-14 19:49:51',24),(45,11,'2021-07-20','09:00:00',3,1,2046,1,'2021-07-15 09:09:35','2021-07-15 09:09:35',24),(46,12,'2021-07-20','09:00:00',2,2,2310,2,'2021-07-15 09:52:37','2021-07-15 09:53:11',23);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinical_office`
--

DROP TABLE IF EXISTS `clinical_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinical_office` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `max_capacity` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description_UNIQUE` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinical_office`
--

LOCK TABLES `clinical_office` WRITE;
/*!40000 ALTER TABLE `clinical_office` DISABLE KEYS */;
INSERT INTO `clinical_office` VALUES (1,'consultorioPrincipal',1),(2,'consultorio2',1),(3,'consultorio3',1);
/*!40000 ALTER TABLE `clinical_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinical_process`
--

DROP TABLE IF EXISTS `clinical_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinical_process` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_patient` int NOT NULL,
  `patient_file` blob,
  `observations` varchar(2000) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_patient_UNIQUE` (`id_patient`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_from_clinical_process_to_patients_idx` (`id_patient`),
  CONSTRAINT `fk_from_clinical_process_to_patients` FOREIGN KEY (`id_patient`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinical_process`
--

LOCK TABLES `clinical_process` WRITE;
/*!40000 ALTER TABLE `clinical_process` DISABLE KEYS */;
INSERT INTO `clinical_process` VALUES (4,11,NULL,'Just did some analisys','2021-07-15 09:14:05','2021-07-15 09:14:05');
/*!40000 ALTER TABLE `clinical_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `birthdate` date NOT NULL,
  `address` varchar(125) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile_phone` varchar(45) NOT NULL,
  `password` varchar(120) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active',
  `gender` varchar(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `certificate_number` int NOT NULL,
  `image_src` varchar(400) NOT NULL DEFAULT '"https://www.hsmporto.pt/wp-content/uploads/2015/12/placeholder_homem.png"',
  `nif` varchar(20) NOT NULL,
  `rating` int NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `certificate_number_UNIQUE` (`certificate_number`),
  UNIQUE KEY `nif_UNIQUE` (`nif`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (23,'1960-07-31','Rua dos olivais','4430','Carlos@gmail.com','929133131','$2b$10$p7tYvYLMbTNEJxH6arIxHOrRRp6n5dn8uCJrGRCzJTthpDjGJOWIy','active','male','Carlos antonio',229910,'https://media.istockphoto.com/vectors/default-placeholder-businessman-halflength-portr-vector-id986668942?b=1&amp;amp;amp;k=6&amp;amp;amp;m=986668942&amp;amp;amp;s=612x612&amp;amp;amp;w=0&amp;amp;amp;h=FLv30GnAePWQgxxUZuiGhp4JdPLs_Rmgb5n62Pyx90I=','242439456',5),(24,'1960-07-31','Rua dos olivais da Serra','4430','Rui@gmail.com','929133130','$2b$10$2zglUyUwWo7To2gd5ERoqefEWEbBX0Yo3cLjvoDGf9gRwIYzJ1wPS','active','male','Rui',229912,'https://media.istockphoto.com/vectors/default-placeholder-businessman-halflength-portr-vector-id986668942?b=1&k=6&m=986668942&s=612x612&w=0&h=FLv30GnAePWQgxxUZuiGhp4JdPLs_Rmgb5n62Pyx90I=','242439457',5),(25,'1960-07-31','Rua dos olivais da Serra do Corvo','4430','Vitor@gmail.com','929133136','$2b$10$TQjtl2YXXqBTlu.EcP4cV.t.PQKHK0gKu2FoJLD0Z/h6IRwu4qB9O','active','male','Vitor',229914,'https://media.istockphoto.com/vectors/default-placeholder-businessman-halflength-portr-vector-id986668942?b=1&k=6&m=986668942&s=612x612&w=0&h=FLv30GnAePWQgxxUZuiGhp4JdPLs_Rmgb5n62Pyx90I=','242439459',5);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `reimbursed_value` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1,'Médis',45),(2,'Multicare',30),(3,'Allianz',50),(4,'none',0),(5,'Generaliz',20),(6,'Montepio',25);
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `observations` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES (1,'Ibuprofeno','Take with  minimum interval of 8 hours'),(2,'Clavamox','Take with a minimum interval of 12 hour'),(3,'Benuron','Take with a minimum interval of 6 hour'),(4,'Xanax','SOS only, 12 hours minimum and dont drive'),(5,'Corticoides','Take it 2 times a day'),(6,'Sulcrato','To reduce the muscular pain');
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(125) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile_phone` varchar(30) NOT NULL,
  `sns` varchar(45) NOT NULL,
  `nif` varchar(45) NOT NULL,
  `password` varchar(120) NOT NULL,
  `gender` varchar(6) NOT NULL DEFAULT 'male',
  `status` varchar(10) NOT NULL DEFAULT 'active',
  `birthdate` date NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `image` varchar(80) DEFAULT NULL,
  `id_insurance` int NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `sns_UNIQUE` (`sns`),
  UNIQUE KEY `nif_UNIQUE` (`nif`),
  KEY `fk_from_patients_to_insurance_idx` (`id_insurance`),
  CONSTRAINT `fk_from_patients_to_insurance` FOREIGN KEY (`id_insurance`) REFERENCES `insurance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (11,'Luis Antonio','Rua dos Carvalhos ','4451','luis@gmail.com','919391925','2511952566','311037201','$2b$10$kXuyLZ/RYXlg2S3pzjA4tO.V7kEMiVLXIXHgjzkjZK.vBdO8GiJ4m','male','active','1990-09-01',NULL,'https://avatars0.githubusercontent.com/u/9064066?v=4&amp;s=460',3),(12,'Joao','Rua dos Carvalhos','4451','Joao@gmail.com','919391925','2500952566','311037202','$2b$10$1Ksu5G59Svn66DEicWnotuOFp7qYN4S7GN01BbdkqRAHBy7N.vvXC','male','active','1990-09-01',NULL,'https://avatars0.githubusercontent.com/u/9064066?v=4&amp;s=460',2),(14,'Maria','Rua dos Carvalhos','4451','Maria@gmail.com','919391925','2500952567','311037203','$2b$10$3HnP6hgW1mKwCK2z84VrVuGppZPEwCnNMTiGOg4tYIw8liisdWCRC','male','active','1990-09-01',NULL,'https://avatars0.githubusercontent.com/u/9064066?v=4&amp;s=460',5),(16,'Filipe','Rua random','4460','filipe@gmail.com','919191915','252560607','989898443','$2b$10$7JjhzpNgjJArMNKQJ7Io0OmFuwSUCY3C59NSnpKbJvdnYuEJp.pi6','Male','active','1990-12-12','919193333',NULL,4);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pivot_doctor_specialization`
--

DROP TABLE IF EXISTS `pivot_doctor_specialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pivot_doctor_specialization` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_doctor` int NOT NULL,
  `id_specialization` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `from_pivot_doctor_specialization_to_doctors_idx` (`id_doctor`),
  KEY `from_pivot_doctor_specialization_to_specializatopm_idx` (`id_specialization`),
  CONSTRAINT `from_pivot_doctor_specialization_to_doctors` FOREIGN KEY (`id_doctor`) REFERENCES `doctors` (`id`),
  CONSTRAINT `from_pivot_doctor_specialization_to_specializatopm` FOREIGN KEY (`id_specialization`) REFERENCES `specializations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pivot_doctor_specialization`
--

LOCK TABLES `pivot_doctor_specialization` WRITE;
/*!40000 ALTER TABLE `pivot_doctor_specialization` DISABLE KEYS */;
INSERT INTO `pivot_doctor_specialization` VALUES (11,23,2),(12,24,1),(13,25,3);
/*!40000 ALTER TABLE `pivot_doctor_specialization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_doctor` int NOT NULL,
  `id_patient` int NOT NULL,
  `id_medication` int NOT NULL,
  `observation` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_appointment` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_from_prescriptions_to_medication_idx` (`id_medication`),
  KEY `fk_from_prescription_to_appointment_idx` (`id_appointment`),
  KEY `fk_from_prescriptions_to_doctors_idx` (`id_doctor`),
  KEY `fk_from_prescriptions_to_patients_idx` (`id_patient`),
  CONSTRAINT `fk_from_prescription_to_appointment` FOREIGN KEY (`id_appointment`) REFERENCES `appointments` (`id`),
  CONSTRAINT `fk_from_prescriptions_to_doctors` FOREIGN KEY (`id_doctor`) REFERENCES `doctors` (`id`),
  CONSTRAINT `fk_from_prescriptions_to_medication` FOREIGN KEY (`id_medication`) REFERENCES `medication` (`id`),
  CONSTRAINT `fk_from_prescriptions_to_patients` FOREIGN KEY (`id_patient`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (2,24,11,6,'To calm the nerves','2021-07-14 12:16:44',41),(6,24,11,1,'Para aliviar as dores','2021-07-14 19:56:28',41);
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specializations`
--

DROP TABLE IF EXISTS `specializations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specializations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `base_price` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description_UNIQUE` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specializations`
--

LOCK TABLES `specializations` WRITE;
/*!40000 ALTER TABLE `specializations` DISABLE KEYS */;
INSERT INTO `specializations` VALUES (1,'Pediatria',65),(2,'NeuroCirurgia',80),(3,'Fisioterapia',70);
/*!40000 ALTER TABLE `specializations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description_UNIQUE` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (2,'completed'),(1,'scheduled');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slots`
--

DROP TABLE IF EXISTS `time_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_slots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_doctor` int NOT NULL,
  `start_at` time NOT NULL,
  `end_at` time NOT NULL,
  `day` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_from_time_slots_to_doctor_idx` (`id_doctor`),
  CONSTRAINT `fk_from_time_slots_to_doctor` FOREIGN KEY (`id_doctor`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2530 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slots`
--

LOCK TABLES `time_slots` WRITE;
/*!40000 ALTER TABLE `time_slots` DISABLE KEYS */;
INSERT INTO `time_slots` VALUES (2028,24,'09:00:00','09:30:00','2021-07-17','2021-07-13 23:19:19'),(2029,24,'09:30:00','10:00:00','2021-07-17','2021-07-13 23:19:19'),(2030,24,'10:00:00','10:30:00','2021-07-17','2021-07-13 23:19:19'),(2031,24,'10:30:00','11:00:00','2021-07-17','2021-07-13 23:19:19'),(2032,24,'11:00:00','11:30:00','2021-07-17','2021-07-13 23:19:19'),(2033,24,'11:30:00','12:00:00','2021-07-17','2021-07-13 23:19:19'),(2034,24,'09:00:00','09:30:00','2021-07-18','2021-07-13 23:19:19'),(2035,24,'09:30:00','10:00:00','2021-07-18','2021-07-13 23:19:19'),(2036,24,'10:00:00','10:30:00','2021-07-18','2021-07-13 23:19:19'),(2037,24,'10:30:00','11:00:00','2021-07-18','2021-07-13 23:19:19'),(2038,24,'11:00:00','11:30:00','2021-07-18','2021-07-13 23:19:19'),(2039,24,'11:30:00','12:00:00','2021-07-18','2021-07-13 23:19:19'),(2040,24,'09:00:00','09:30:00','2021-07-19','2021-07-13 23:19:19'),(2041,24,'09:30:00','10:00:00','2021-07-19','2021-07-13 23:19:19'),(2042,24,'10:00:00','10:30:00','2021-07-19','2021-07-13 23:19:19'),(2043,24,'10:30:00','11:00:00','2021-07-19','2021-07-13 23:19:19'),(2044,24,'11:00:00','11:30:00','2021-07-19','2021-07-13 23:19:19'),(2045,24,'11:30:00','12:00:00','2021-07-19','2021-07-13 23:19:19'),(2046,24,'09:00:00','09:30:00','2021-07-20','2021-07-13 23:19:19'),(2047,24,'09:30:00','10:00:00','2021-07-20','2021-07-13 23:19:19'),(2048,24,'10:00:00','10:30:00','2021-07-20','2021-07-13 23:19:19'),(2049,24,'10:30:00','11:00:00','2021-07-20','2021-07-13 23:19:19'),(2050,24,'11:00:00','11:30:00','2021-07-20','2021-07-13 23:19:19'),(2051,24,'11:30:00','12:00:00','2021-07-20','2021-07-13 23:19:19'),(2052,24,'09:00:00','09:30:00','2021-07-21','2021-07-13 23:19:19'),(2053,24,'09:30:00','10:00:00','2021-07-21','2021-07-13 23:19:19'),(2054,24,'10:00:00','10:30:00','2021-07-21','2021-07-13 23:19:19'),(2055,24,'10:30:00','11:00:00','2021-07-21','2021-07-13 23:19:19'),(2056,24,'11:00:00','11:30:00','2021-07-21','2021-07-13 23:19:19'),(2057,24,'11:30:00','12:00:00','2021-07-21','2021-07-13 23:19:19'),(2058,24,'09:00:00','09:30:00','2021-07-22','2021-07-13 23:19:19'),(2059,24,'09:30:00','10:00:00','2021-07-22','2021-07-13 23:19:19'),(2060,24,'10:00:00','10:30:00','2021-07-22','2021-07-13 23:19:19'),(2061,24,'10:30:00','11:00:00','2021-07-22','2021-07-13 23:19:19'),(2062,24,'11:00:00','11:30:00','2021-07-22','2021-07-13 23:19:19'),(2063,24,'11:30:00','12:00:00','2021-07-22','2021-07-13 23:19:19'),(2064,24,'09:00:00','09:30:00','2021-07-23','2021-07-13 23:19:19'),(2065,24,'09:30:00','10:00:00','2021-07-23','2021-07-13 23:19:19'),(2066,24,'10:00:00','10:30:00','2021-07-23','2021-07-13 23:19:19'),(2067,24,'10:30:00','11:00:00','2021-07-23','2021-07-13 23:19:19'),(2068,24,'11:00:00','11:30:00','2021-07-23','2021-07-13 23:19:19'),(2069,24,'11:30:00','12:00:00','2021-07-23','2021-07-13 23:19:19'),(2070,24,'09:00:00','09:30:00','2021-07-24','2021-07-13 23:19:19'),(2071,24,'09:30:00','10:00:00','2021-07-24','2021-07-13 23:19:19'),(2072,24,'10:00:00','10:30:00','2021-07-24','2021-07-13 23:19:19'),(2073,24,'10:30:00','11:00:00','2021-07-24','2021-07-13 23:19:19'),(2074,24,'11:00:00','11:30:00','2021-07-24','2021-07-13 23:19:19'),(2075,24,'11:30:00','12:00:00','2021-07-24','2021-07-13 23:19:19'),(2076,24,'09:00:00','09:30:00','2021-07-25','2021-07-13 23:19:19'),(2077,24,'09:30:00','10:00:00','2021-07-25','2021-07-13 23:19:19'),(2078,24,'10:00:00','10:30:00','2021-07-25','2021-07-13 23:19:19'),(2079,24,'10:30:00','11:00:00','2021-07-25','2021-07-13 23:19:19'),(2080,24,'11:00:00','11:30:00','2021-07-25','2021-07-13 23:19:19'),(2081,24,'11:30:00','12:00:00','2021-07-25','2021-07-13 23:19:19'),(2082,24,'09:00:00','09:30:00','2021-07-26','2021-07-13 23:19:19'),(2083,24,'09:30:00','10:00:00','2021-07-26','2021-07-13 23:19:19'),(2084,24,'10:00:00','10:30:00','2021-07-26','2021-07-13 23:19:19'),(2085,24,'10:30:00','11:00:00','2021-07-26','2021-07-13 23:19:19'),(2086,24,'11:00:00','11:30:00','2021-07-26','2021-07-13 23:19:19'),(2087,24,'11:30:00','12:00:00','2021-07-26','2021-07-13 23:19:19'),(2088,24,'09:00:00','09:30:00','2021-07-27','2021-07-13 23:19:19'),(2089,24,'09:30:00','10:00:00','2021-07-27','2021-07-13 23:19:19'),(2090,24,'10:00:00','10:30:00','2021-07-27','2021-07-13 23:19:19'),(2091,24,'10:30:00','11:00:00','2021-07-27','2021-07-13 23:19:19'),(2092,24,'11:00:00','11:30:00','2021-07-27','2021-07-13 23:19:19'),(2093,24,'11:30:00','12:00:00','2021-07-27','2021-07-13 23:19:19'),(2094,24,'09:00:00','09:30:00','2021-07-28','2021-07-13 23:19:19'),(2095,24,'09:30:00','10:00:00','2021-07-28','2021-07-13 23:19:19'),(2096,24,'10:00:00','10:30:00','2021-07-28','2021-07-13 23:19:19'),(2097,24,'10:30:00','11:00:00','2021-07-28','2021-07-13 23:19:19'),(2098,24,'11:00:00','11:30:00','2021-07-28','2021-07-13 23:19:19'),(2099,24,'11:30:00','12:00:00','2021-07-28','2021-07-13 23:19:19'),(2100,24,'14:00:00','14:30:00','2021-07-17','2021-07-13 23:22:38'),(2101,24,'14:30:00','15:00:00','2021-07-17','2021-07-13 23:22:38'),(2102,24,'15:00:00','15:30:00','2021-07-17','2021-07-13 23:22:38'),(2103,24,'15:30:00','16:00:00','2021-07-17','2021-07-13 23:22:38'),(2104,24,'16:00:00','16:30:00','2021-07-17','2021-07-13 23:22:38'),(2105,24,'16:30:00','17:00:00','2021-07-17','2021-07-13 23:22:38'),(2106,24,'17:00:00','17:30:00','2021-07-17','2021-07-13 23:22:38'),(2107,24,'17:30:00','18:00:00','2021-07-17','2021-07-13 23:22:38'),(2108,24,'14:00:00','14:30:00','2021-07-18','2021-07-13 23:22:38'),(2109,24,'14:30:00','15:00:00','2021-07-18','2021-07-13 23:22:38'),(2110,24,'15:00:00','15:30:00','2021-07-18','2021-07-13 23:22:38'),(2111,24,'15:30:00','16:00:00','2021-07-18','2021-07-13 23:22:38'),(2112,24,'16:00:00','16:30:00','2021-07-18','2021-07-13 23:22:38'),(2113,24,'16:30:00','17:00:00','2021-07-18','2021-07-13 23:22:38'),(2114,24,'17:00:00','17:30:00','2021-07-18','2021-07-13 23:22:38'),(2115,24,'17:30:00','18:00:00','2021-07-18','2021-07-13 23:22:38'),(2116,24,'14:00:00','14:30:00','2021-07-19','2021-07-13 23:22:38'),(2117,24,'14:30:00','15:00:00','2021-07-19','2021-07-13 23:22:38'),(2118,24,'15:00:00','15:30:00','2021-07-19','2021-07-13 23:22:38'),(2119,24,'15:30:00','16:00:00','2021-07-19','2021-07-13 23:22:38'),(2120,24,'16:00:00','16:30:00','2021-07-19','2021-07-13 23:22:38'),(2121,24,'16:30:00','17:00:00','2021-07-19','2021-07-13 23:22:38'),(2122,24,'17:00:00','17:30:00','2021-07-19','2021-07-13 23:22:38'),(2123,24,'17:30:00','18:00:00','2021-07-19','2021-07-13 23:22:38'),(2124,24,'14:00:00','14:30:00','2021-07-20','2021-07-13 23:22:38'),(2125,24,'14:30:00','15:00:00','2021-07-20','2021-07-13 23:22:38'),(2126,24,'15:00:00','15:30:00','2021-07-20','2021-07-13 23:22:38'),(2127,24,'15:30:00','16:00:00','2021-07-20','2021-07-13 23:22:38'),(2128,24,'16:00:00','16:30:00','2021-07-20','2021-07-13 23:22:38'),(2129,24,'16:30:00','17:00:00','2021-07-20','2021-07-13 23:22:38'),(2130,24,'17:00:00','17:30:00','2021-07-20','2021-07-13 23:22:38'),(2131,24,'17:30:00','18:00:00','2021-07-20','2021-07-13 23:22:38'),(2132,24,'14:00:00','14:30:00','2021-07-21','2021-07-13 23:22:38'),(2133,24,'14:30:00','15:00:00','2021-07-21','2021-07-13 23:22:38'),(2134,24,'15:00:00','15:30:00','2021-07-21','2021-07-13 23:22:38'),(2135,24,'15:30:00','16:00:00','2021-07-21','2021-07-13 23:22:38'),(2136,24,'16:00:00','16:30:00','2021-07-21','2021-07-13 23:22:38'),(2137,24,'16:30:00','17:00:00','2021-07-21','2021-07-13 23:22:38'),(2138,24,'17:00:00','17:30:00','2021-07-21','2021-07-13 23:22:38'),(2139,24,'17:30:00','18:00:00','2021-07-21','2021-07-13 23:22:38'),(2140,24,'14:00:00','14:30:00','2021-07-22','2021-07-13 23:22:38'),(2141,24,'14:30:00','15:00:00','2021-07-22','2021-07-13 23:22:38'),(2142,24,'15:00:00','15:30:00','2021-07-22','2021-07-13 23:22:38'),(2143,24,'15:30:00','16:00:00','2021-07-22','2021-07-13 23:22:38'),(2144,24,'16:00:00','16:30:00','2021-07-22','2021-07-13 23:22:38'),(2145,24,'16:30:00','17:00:00','2021-07-22','2021-07-13 23:22:38'),(2146,24,'17:00:00','17:30:00','2021-07-22','2021-07-13 23:22:38'),(2147,24,'17:30:00','18:00:00','2021-07-22','2021-07-13 23:22:38'),(2148,24,'14:00:00','14:30:00','2021-07-23','2021-07-13 23:22:38'),(2149,24,'14:30:00','15:00:00','2021-07-23','2021-07-13 23:22:38'),(2150,24,'15:00:00','15:30:00','2021-07-23','2021-07-13 23:22:38'),(2151,24,'15:30:00','16:00:00','2021-07-23','2021-07-13 23:22:38'),(2152,24,'16:00:00','16:30:00','2021-07-23','2021-07-13 23:22:38'),(2153,24,'16:30:00','17:00:00','2021-07-23','2021-07-13 23:22:38'),(2154,24,'17:00:00','17:30:00','2021-07-23','2021-07-13 23:22:38'),(2155,24,'17:30:00','18:00:00','2021-07-23','2021-07-13 23:22:38'),(2156,24,'14:00:00','14:30:00','2021-07-24','2021-07-13 23:22:38'),(2157,24,'14:30:00','15:00:00','2021-07-24','2021-07-13 23:22:38'),(2158,24,'15:00:00','15:30:00','2021-07-24','2021-07-13 23:22:38'),(2159,24,'15:30:00','16:00:00','2021-07-24','2021-07-13 23:22:38'),(2160,24,'16:00:00','16:30:00','2021-07-24','2021-07-13 23:22:38'),(2161,24,'16:30:00','17:00:00','2021-07-24','2021-07-13 23:22:38'),(2162,24,'17:00:00','17:30:00','2021-07-24','2021-07-13 23:22:38'),(2163,24,'17:30:00','18:00:00','2021-07-24','2021-07-13 23:22:38'),(2164,24,'14:00:00','14:30:00','2021-07-25','2021-07-13 23:22:38'),(2165,24,'14:30:00','15:00:00','2021-07-25','2021-07-13 23:22:38'),(2166,24,'15:00:00','15:30:00','2021-07-25','2021-07-13 23:22:38'),(2167,24,'15:30:00','16:00:00','2021-07-25','2021-07-13 23:22:38'),(2168,24,'16:00:00','16:30:00','2021-07-25','2021-07-13 23:22:38'),(2169,24,'16:30:00','17:00:00','2021-07-25','2021-07-13 23:22:38'),(2170,24,'17:00:00','17:30:00','2021-07-25','2021-07-13 23:22:38'),(2171,24,'17:30:00','18:00:00','2021-07-25','2021-07-13 23:22:38'),(2172,24,'14:00:00','14:30:00','2021-07-26','2021-07-13 23:22:38'),(2173,24,'14:30:00','15:00:00','2021-07-26','2021-07-13 23:22:38'),(2174,24,'15:00:00','15:30:00','2021-07-26','2021-07-13 23:22:38'),(2175,24,'15:30:00','16:00:00','2021-07-26','2021-07-13 23:22:38'),(2176,24,'16:00:00','16:30:00','2021-07-26','2021-07-13 23:22:38'),(2177,24,'16:30:00','17:00:00','2021-07-26','2021-07-13 23:22:38'),(2178,24,'17:00:00','17:30:00','2021-07-26','2021-07-13 23:22:38'),(2179,24,'17:30:00','18:00:00','2021-07-26','2021-07-13 23:22:38'),(2180,24,'14:00:00','14:30:00','2021-07-27','2021-07-13 23:22:38'),(2181,24,'14:30:00','15:00:00','2021-07-27','2021-07-13 23:22:38'),(2182,24,'15:00:00','15:30:00','2021-07-27','2021-07-13 23:22:38'),(2183,24,'15:30:00','16:00:00','2021-07-27','2021-07-13 23:22:38'),(2184,24,'16:00:00','16:30:00','2021-07-27','2021-07-13 23:22:38'),(2185,24,'16:30:00','17:00:00','2021-07-27','2021-07-13 23:22:38'),(2186,24,'17:00:00','17:30:00','2021-07-27','2021-07-13 23:22:38'),(2187,24,'17:30:00','18:00:00','2021-07-27','2021-07-13 23:22:38'),(2188,24,'14:00:00','14:30:00','2021-07-28','2021-07-13 23:22:38'),(2189,24,'14:30:00','15:00:00','2021-07-28','2021-07-13 23:22:38'),(2190,24,'15:00:00','15:30:00','2021-07-28','2021-07-13 23:22:38'),(2191,24,'15:30:00','16:00:00','2021-07-28','2021-07-13 23:22:38'),(2192,24,'16:00:00','16:30:00','2021-07-28','2021-07-13 23:22:38'),(2193,24,'16:30:00','17:00:00','2021-07-28','2021-07-13 23:22:38'),(2194,24,'17:00:00','17:30:00','2021-07-28','2021-07-13 23:22:38'),(2195,24,'17:30:00','18:00:00','2021-07-28','2021-07-13 23:22:38'),(2196,25,'14:00:00','14:30:00','2021-07-17','2021-07-13 23:22:46'),(2197,25,'14:30:00','15:00:00','2021-07-17','2021-07-13 23:22:46'),(2198,25,'15:00:00','15:30:00','2021-07-17','2021-07-13 23:22:46'),(2199,25,'15:30:00','16:00:00','2021-07-17','2021-07-13 23:22:46'),(2200,25,'16:00:00','16:30:00','2021-07-17','2021-07-13 23:22:46'),(2201,25,'16:30:00','17:00:00','2021-07-17','2021-07-13 23:22:46'),(2202,25,'17:00:00','17:30:00','2021-07-17','2021-07-13 23:22:46'),(2203,25,'17:30:00','18:00:00','2021-07-17','2021-07-13 23:22:46'),(2204,25,'14:00:00','14:30:00','2021-07-18','2021-07-13 23:22:46'),(2205,25,'14:30:00','15:00:00','2021-07-18','2021-07-13 23:22:46'),(2206,25,'15:00:00','15:30:00','2021-07-18','2021-07-13 23:22:46'),(2207,25,'15:30:00','16:00:00','2021-07-18','2021-07-13 23:22:46'),(2208,25,'16:00:00','16:30:00','2021-07-18','2021-07-13 23:22:46'),(2209,25,'16:30:00','17:00:00','2021-07-18','2021-07-13 23:22:46'),(2210,25,'17:00:00','17:30:00','2021-07-18','2021-07-13 23:22:46'),(2211,25,'17:30:00','18:00:00','2021-07-18','2021-07-13 23:22:46'),(2212,25,'14:00:00','14:30:00','2021-07-19','2021-07-13 23:22:46'),(2213,25,'14:30:00','15:00:00','2021-07-19','2021-07-13 23:22:46'),(2214,25,'15:00:00','15:30:00','2021-07-19','2021-07-13 23:22:46'),(2215,25,'15:30:00','16:00:00','2021-07-19','2021-07-13 23:22:46'),(2216,25,'16:00:00','16:30:00','2021-07-19','2021-07-13 23:22:46'),(2217,25,'16:30:00','17:00:00','2021-07-19','2021-07-13 23:22:46'),(2218,25,'17:00:00','17:30:00','2021-07-19','2021-07-13 23:22:46'),(2219,25,'17:30:00','18:00:00','2021-07-19','2021-07-13 23:22:46'),(2220,25,'14:00:00','14:30:00','2021-07-20','2021-07-13 23:22:46'),(2221,25,'14:30:00','15:00:00','2021-07-20','2021-07-13 23:22:46'),(2222,25,'15:00:00','15:30:00','2021-07-20','2021-07-13 23:22:46'),(2223,25,'15:30:00','16:00:00','2021-07-20','2021-07-13 23:22:46'),(2224,25,'16:00:00','16:30:00','2021-07-20','2021-07-13 23:22:46'),(2225,25,'16:30:00','17:00:00','2021-07-20','2021-07-13 23:22:46'),(2226,25,'17:00:00','17:30:00','2021-07-20','2021-07-13 23:22:46'),(2227,25,'17:30:00','18:00:00','2021-07-20','2021-07-13 23:22:46'),(2228,25,'14:00:00','14:30:00','2021-07-21','2021-07-13 23:22:46'),(2229,25,'14:30:00','15:00:00','2021-07-21','2021-07-13 23:22:46'),(2230,25,'15:00:00','15:30:00','2021-07-21','2021-07-13 23:22:46'),(2231,25,'15:30:00','16:00:00','2021-07-21','2021-07-13 23:22:46'),(2232,25,'16:00:00','16:30:00','2021-07-21','2021-07-13 23:22:46'),(2233,25,'16:30:00','17:00:00','2021-07-21','2021-07-13 23:22:46'),(2234,25,'17:00:00','17:30:00','2021-07-21','2021-07-13 23:22:46'),(2235,25,'17:30:00','18:00:00','2021-07-21','2021-07-13 23:22:46'),(2236,25,'14:00:00','14:30:00','2021-07-22','2021-07-13 23:22:46'),(2237,25,'14:30:00','15:00:00','2021-07-22','2021-07-13 23:22:46'),(2238,25,'15:00:00','15:30:00','2021-07-22','2021-07-13 23:22:46'),(2239,25,'15:30:00','16:00:00','2021-07-22','2021-07-13 23:22:46'),(2240,25,'16:00:00','16:30:00','2021-07-22','2021-07-13 23:22:46'),(2241,25,'16:30:00','17:00:00','2021-07-22','2021-07-13 23:22:46'),(2242,25,'17:00:00','17:30:00','2021-07-22','2021-07-13 23:22:46'),(2243,25,'17:30:00','18:00:00','2021-07-22','2021-07-13 23:22:46'),(2244,25,'14:00:00','14:30:00','2021-07-23','2021-07-13 23:22:46'),(2245,25,'14:30:00','15:00:00','2021-07-23','2021-07-13 23:22:46'),(2246,25,'15:00:00','15:30:00','2021-07-23','2021-07-13 23:22:46'),(2247,25,'15:30:00','16:00:00','2021-07-23','2021-07-13 23:22:46'),(2248,25,'16:00:00','16:30:00','2021-07-23','2021-07-13 23:22:46'),(2249,25,'16:30:00','17:00:00','2021-07-23','2021-07-13 23:22:46'),(2250,25,'17:00:00','17:30:00','2021-07-23','2021-07-13 23:22:46'),(2251,25,'17:30:00','18:00:00','2021-07-23','2021-07-13 23:22:46'),(2252,25,'14:00:00','14:30:00','2021-07-24','2021-07-13 23:22:46'),(2253,25,'14:30:00','15:00:00','2021-07-24','2021-07-13 23:22:46'),(2254,25,'15:00:00','15:30:00','2021-07-24','2021-07-13 23:22:46'),(2255,25,'15:30:00','16:00:00','2021-07-24','2021-07-13 23:22:46'),(2256,25,'16:00:00','16:30:00','2021-07-24','2021-07-13 23:22:46'),(2257,25,'16:30:00','17:00:00','2021-07-24','2021-07-13 23:22:46'),(2258,25,'17:00:00','17:30:00','2021-07-24','2021-07-13 23:22:46'),(2259,25,'17:30:00','18:00:00','2021-07-24','2021-07-13 23:22:46'),(2260,25,'14:00:00','14:30:00','2021-07-25','2021-07-13 23:22:46'),(2261,25,'14:30:00','15:00:00','2021-07-25','2021-07-13 23:22:46'),(2262,25,'15:00:00','15:30:00','2021-07-25','2021-07-13 23:22:46'),(2263,25,'15:30:00','16:00:00','2021-07-25','2021-07-13 23:22:46'),(2264,25,'16:00:00','16:30:00','2021-07-25','2021-07-13 23:22:46'),(2265,25,'16:30:00','17:00:00','2021-07-25','2021-07-13 23:22:46'),(2266,25,'17:00:00','17:30:00','2021-07-25','2021-07-13 23:22:46'),(2267,25,'17:30:00','18:00:00','2021-07-25','2021-07-13 23:22:46'),(2268,25,'14:00:00','14:30:00','2021-07-26','2021-07-13 23:22:46'),(2269,25,'14:30:00','15:00:00','2021-07-26','2021-07-13 23:22:46'),(2270,25,'15:00:00','15:30:00','2021-07-26','2021-07-13 23:22:46'),(2271,25,'15:30:00','16:00:00','2021-07-26','2021-07-13 23:22:46'),(2272,25,'16:00:00','16:30:00','2021-07-26','2021-07-13 23:22:46'),(2273,25,'16:30:00','17:00:00','2021-07-26','2021-07-13 23:22:46'),(2274,25,'17:00:00','17:30:00','2021-07-26','2021-07-13 23:22:46'),(2275,25,'17:30:00','18:00:00','2021-07-26','2021-07-13 23:22:46'),(2276,25,'14:00:00','14:30:00','2021-07-27','2021-07-13 23:22:46'),(2277,25,'14:30:00','15:00:00','2021-07-27','2021-07-13 23:22:46'),(2278,25,'15:00:00','15:30:00','2021-07-27','2021-07-13 23:22:46'),(2279,25,'15:30:00','16:00:00','2021-07-27','2021-07-13 23:22:46'),(2280,25,'16:00:00','16:30:00','2021-07-27','2021-07-13 23:22:46'),(2281,25,'16:30:00','17:00:00','2021-07-27','2021-07-13 23:22:46'),(2282,25,'17:00:00','17:30:00','2021-07-27','2021-07-13 23:22:46'),(2283,25,'17:30:00','18:00:00','2021-07-27','2021-07-13 23:22:46'),(2284,25,'14:00:00','14:30:00','2021-07-28','2021-07-13 23:22:46'),(2285,25,'14:30:00','15:00:00','2021-07-28','2021-07-13 23:22:46'),(2286,25,'15:00:00','15:30:00','2021-07-28','2021-07-13 23:22:46'),(2287,25,'15:30:00','16:00:00','2021-07-28','2021-07-13 23:22:46'),(2288,25,'16:00:00','16:30:00','2021-07-28','2021-07-13 23:22:46'),(2289,25,'16:30:00','17:00:00','2021-07-28','2021-07-13 23:22:46'),(2290,25,'17:00:00','17:30:00','2021-07-28','2021-07-13 23:22:46'),(2291,25,'17:30:00','18:00:00','2021-07-28','2021-07-13 23:22:46'),(2292,23,'09:00:00','09:30:00','2021-07-17','2021-07-13 23:23:20'),(2293,23,'09:30:00','10:00:00','2021-07-17','2021-07-13 23:23:20'),(2294,23,'10:00:00','10:30:00','2021-07-17','2021-07-13 23:23:20'),(2295,23,'10:30:00','11:00:00','2021-07-17','2021-07-13 23:23:20'),(2296,23,'11:00:00','11:30:00','2021-07-17','2021-07-13 23:23:20'),(2297,23,'11:30:00','12:00:00','2021-07-17','2021-07-13 23:23:20'),(2298,23,'09:00:00','09:30:00','2021-07-18','2021-07-13 23:23:20'),(2299,23,'09:30:00','10:00:00','2021-07-18','2021-07-13 23:23:20'),(2300,23,'10:00:00','10:30:00','2021-07-18','2021-07-13 23:23:20'),(2301,23,'10:30:00','11:00:00','2021-07-18','2021-07-13 23:23:20'),(2302,23,'11:00:00','11:30:00','2021-07-18','2021-07-13 23:23:20'),(2303,23,'11:30:00','12:00:00','2021-07-18','2021-07-13 23:23:20'),(2304,23,'09:00:00','09:30:00','2021-07-19','2021-07-13 23:23:20'),(2305,23,'09:30:00','10:00:00','2021-07-19','2021-07-13 23:23:20'),(2306,23,'10:00:00','10:30:00','2021-07-19','2021-07-13 23:23:20'),(2307,23,'10:30:00','11:00:00','2021-07-19','2021-07-13 23:23:20'),(2308,23,'11:00:00','11:30:00','2021-07-19','2021-07-13 23:23:20'),(2309,23,'11:30:00','12:00:00','2021-07-19','2021-07-13 23:23:20'),(2310,23,'09:00:00','09:30:00','2021-07-20','2021-07-13 23:23:20'),(2311,23,'09:30:00','10:00:00','2021-07-20','2021-07-13 23:23:20'),(2312,23,'10:00:00','10:30:00','2021-07-20','2021-07-13 23:23:20'),(2313,23,'10:30:00','11:00:00','2021-07-20','2021-07-13 23:23:20'),(2314,23,'11:00:00','11:30:00','2021-07-20','2021-07-13 23:23:20'),(2315,23,'11:30:00','12:00:00','2021-07-20','2021-07-13 23:23:20'),(2316,23,'09:00:00','09:30:00','2021-07-21','2021-07-13 23:23:20'),(2317,23,'09:30:00','10:00:00','2021-07-21','2021-07-13 23:23:20'),(2318,23,'10:00:00','10:30:00','2021-07-21','2021-07-13 23:23:20'),(2319,23,'10:30:00','11:00:00','2021-07-21','2021-07-13 23:23:20'),(2320,23,'11:00:00','11:30:00','2021-07-21','2021-07-13 23:23:20'),(2321,23,'11:30:00','12:00:00','2021-07-21','2021-07-13 23:23:20'),(2322,23,'09:00:00','09:30:00','2021-07-22','2021-07-13 23:23:20'),(2323,23,'09:30:00','10:00:00','2021-07-22','2021-07-13 23:23:20'),(2324,23,'10:00:00','10:30:00','2021-07-22','2021-07-13 23:23:20'),(2325,23,'10:30:00','11:00:00','2021-07-22','2021-07-13 23:23:20'),(2326,23,'11:00:00','11:30:00','2021-07-22','2021-07-13 23:23:20'),(2327,23,'11:30:00','12:00:00','2021-07-22','2021-07-13 23:23:20'),(2328,23,'09:00:00','09:30:00','2021-07-23','2021-07-13 23:23:20'),(2329,23,'09:30:00','10:00:00','2021-07-23','2021-07-13 23:23:20'),(2330,23,'10:00:00','10:30:00','2021-07-23','2021-07-13 23:23:20'),(2331,23,'10:30:00','11:00:00','2021-07-23','2021-07-13 23:23:20'),(2332,23,'11:00:00','11:30:00','2021-07-23','2021-07-13 23:23:20'),(2333,23,'11:30:00','12:00:00','2021-07-23','2021-07-13 23:23:20'),(2334,23,'09:00:00','09:30:00','2021-07-24','2021-07-13 23:23:20'),(2335,23,'09:30:00','10:00:00','2021-07-24','2021-07-13 23:23:20'),(2336,23,'10:00:00','10:30:00','2021-07-24','2021-07-13 23:23:20'),(2337,23,'10:30:00','11:00:00','2021-07-24','2021-07-13 23:23:20'),(2338,23,'11:00:00','11:30:00','2021-07-24','2021-07-13 23:23:20'),(2339,23,'11:30:00','12:00:00','2021-07-24','2021-07-13 23:23:20'),(2340,23,'09:00:00','09:30:00','2021-07-25','2021-07-13 23:23:20'),(2341,23,'09:30:00','10:00:00','2021-07-25','2021-07-13 23:23:20'),(2342,23,'10:00:00','10:30:00','2021-07-25','2021-07-13 23:23:20'),(2343,23,'10:30:00','11:00:00','2021-07-25','2021-07-13 23:23:20'),(2344,23,'11:00:00','11:30:00','2021-07-25','2021-07-13 23:23:20'),(2345,23,'11:30:00','12:00:00','2021-07-25','2021-07-13 23:23:20'),(2346,23,'09:00:00','09:30:00','2021-07-26','2021-07-13 23:23:20'),(2347,23,'09:30:00','10:00:00','2021-07-26','2021-07-13 23:23:20'),(2348,23,'10:00:00','10:30:00','2021-07-26','2021-07-13 23:23:20'),(2349,23,'10:30:00','11:00:00','2021-07-26','2021-07-13 23:23:20'),(2350,23,'11:00:00','11:30:00','2021-07-26','2021-07-13 23:23:20'),(2351,23,'11:30:00','12:00:00','2021-07-26','2021-07-13 23:23:20'),(2352,23,'09:00:00','09:30:00','2021-07-27','2021-07-13 23:23:20'),(2353,23,'09:30:00','10:00:00','2021-07-27','2021-07-13 23:23:20'),(2354,23,'10:00:00','10:30:00','2021-07-27','2021-07-13 23:23:20'),(2355,23,'10:30:00','11:00:00','2021-07-27','2021-07-13 23:23:20'),(2356,23,'11:00:00','11:30:00','2021-07-27','2021-07-13 23:23:20'),(2357,23,'11:30:00','12:00:00','2021-07-27','2021-07-13 23:23:20'),(2358,23,'09:00:00','09:30:00','2021-07-28','2021-07-13 23:23:20'),(2359,23,'09:30:00','10:00:00','2021-07-28','2021-07-13 23:23:20'),(2360,23,'10:00:00','10:30:00','2021-07-28','2021-07-13 23:23:20'),(2361,23,'10:30:00','11:00:00','2021-07-28','2021-07-13 23:23:20'),(2362,23,'11:00:00','11:30:00','2021-07-28','2021-07-13 23:23:20'),(2363,23,'11:30:00','12:00:00','2021-07-28','2021-07-13 23:23:20'),(2364,23,'14:00:00','14:30:00','2021-07-17','2021-07-13 23:24:53'),(2365,23,'14:30:00','15:00:00','2021-07-17','2021-07-13 23:24:53'),(2366,23,'15:00:00','15:30:00','2021-07-17','2021-07-13 23:24:53'),(2367,23,'15:30:00','16:00:00','2021-07-17','2021-07-13 23:24:53'),(2368,23,'16:00:00','16:30:00','2021-07-17','2021-07-13 23:24:53'),(2369,23,'16:30:00','17:00:00','2021-07-17','2021-07-13 23:24:53'),(2370,23,'17:00:00','17:30:00','2021-07-17','2021-07-13 23:24:53'),(2371,23,'17:30:00','18:00:00','2021-07-17','2021-07-13 23:24:53'),(2372,23,'14:00:00','14:30:00','2021-07-18','2021-07-13 23:24:53'),(2373,23,'14:30:00','15:00:00','2021-07-18','2021-07-13 23:24:53'),(2374,23,'15:00:00','15:30:00','2021-07-18','2021-07-13 23:24:53'),(2375,23,'15:30:00','16:00:00','2021-07-18','2021-07-13 23:24:53'),(2376,23,'16:00:00','16:30:00','2021-07-18','2021-07-13 23:24:53'),(2377,23,'16:30:00','17:00:00','2021-07-18','2021-07-13 23:24:53'),(2378,23,'17:00:00','17:30:00','2021-07-18','2021-07-13 23:24:53'),(2379,23,'17:30:00','18:00:00','2021-07-18','2021-07-13 23:24:53'),(2380,23,'14:00:00','14:30:00','2021-07-19','2021-07-13 23:24:53'),(2381,23,'14:30:00','15:00:00','2021-07-19','2021-07-13 23:24:53'),(2382,23,'15:00:00','15:30:00','2021-07-19','2021-07-13 23:24:53'),(2383,23,'15:30:00','16:00:00','2021-07-19','2021-07-13 23:24:53'),(2384,23,'16:00:00','16:30:00','2021-07-19','2021-07-13 23:24:53'),(2385,23,'16:30:00','17:00:00','2021-07-19','2021-07-13 23:24:53'),(2386,23,'17:00:00','17:30:00','2021-07-19','2021-07-13 23:24:53'),(2387,23,'17:30:00','18:00:00','2021-07-19','2021-07-13 23:24:53'),(2388,23,'14:00:00','14:30:00','2021-07-20','2021-07-13 23:24:53'),(2389,23,'14:30:00','15:00:00','2021-07-20','2021-07-13 23:24:53'),(2390,23,'15:00:00','15:30:00','2021-07-20','2021-07-13 23:24:53'),(2391,23,'15:30:00','16:00:00','2021-07-20','2021-07-13 23:24:53'),(2392,23,'16:00:00','16:30:00','2021-07-20','2021-07-13 23:24:53'),(2393,23,'16:30:00','17:00:00','2021-07-20','2021-07-13 23:24:53'),(2394,23,'17:00:00','17:30:00','2021-07-20','2021-07-13 23:24:53'),(2395,23,'17:30:00','18:00:00','2021-07-20','2021-07-13 23:24:53'),(2396,23,'14:00:00','14:30:00','2021-07-21','2021-07-13 23:24:53'),(2397,23,'14:30:00','15:00:00','2021-07-21','2021-07-13 23:24:53'),(2398,23,'15:00:00','15:30:00','2021-07-21','2021-07-13 23:24:53'),(2399,23,'15:30:00','16:00:00','2021-07-21','2021-07-13 23:24:53'),(2400,23,'16:00:00','16:30:00','2021-07-21','2021-07-13 23:24:53'),(2401,23,'16:30:00','17:00:00','2021-07-21','2021-07-13 23:24:53'),(2402,23,'17:00:00','17:30:00','2021-07-21','2021-07-13 23:24:53'),(2403,23,'17:30:00','18:00:00','2021-07-21','2021-07-13 23:24:53'),(2404,23,'14:00:00','14:30:00','2021-07-22','2021-07-13 23:24:53'),(2405,23,'14:30:00','15:00:00','2021-07-22','2021-07-13 23:24:53'),(2406,23,'15:00:00','15:30:00','2021-07-22','2021-07-13 23:24:53'),(2407,23,'15:30:00','16:00:00','2021-07-22','2021-07-13 23:24:53'),(2408,23,'16:00:00','16:30:00','2021-07-22','2021-07-13 23:24:53'),(2409,23,'16:30:00','17:00:00','2021-07-22','2021-07-13 23:24:53'),(2410,23,'17:00:00','17:30:00','2021-07-22','2021-07-13 23:24:53'),(2411,23,'17:30:00','18:00:00','2021-07-22','2021-07-13 23:24:53'),(2412,23,'14:00:00','14:30:00','2021-07-23','2021-07-13 23:24:53'),(2413,23,'14:30:00','15:00:00','2021-07-23','2021-07-13 23:24:53'),(2414,23,'15:00:00','15:30:00','2021-07-23','2021-07-13 23:24:53'),(2415,23,'15:30:00','16:00:00','2021-07-23','2021-07-13 23:24:53'),(2416,23,'16:00:00','16:30:00','2021-07-23','2021-07-13 23:24:53'),(2417,23,'16:30:00','17:00:00','2021-07-23','2021-07-13 23:24:53'),(2418,23,'17:00:00','17:30:00','2021-07-23','2021-07-13 23:24:53'),(2419,23,'17:30:00','18:00:00','2021-07-23','2021-07-13 23:24:53'),(2420,23,'14:00:00','14:30:00','2021-07-24','2021-07-13 23:24:53'),(2421,23,'14:30:00','15:00:00','2021-07-24','2021-07-13 23:24:53'),(2422,23,'15:00:00','15:30:00','2021-07-24','2021-07-13 23:24:53'),(2423,23,'15:30:00','16:00:00','2021-07-24','2021-07-13 23:24:53'),(2424,23,'16:00:00','16:30:00','2021-07-24','2021-07-13 23:24:53'),(2425,23,'16:30:00','17:00:00','2021-07-24','2021-07-13 23:24:53'),(2426,23,'17:00:00','17:30:00','2021-07-24','2021-07-13 23:24:53'),(2427,23,'17:30:00','18:00:00','2021-07-24','2021-07-13 23:24:53'),(2428,23,'14:00:00','14:30:00','2021-07-25','2021-07-13 23:24:53'),(2429,23,'14:30:00','15:00:00','2021-07-25','2021-07-13 23:24:53'),(2430,23,'15:00:00','15:30:00','2021-07-25','2021-07-13 23:24:53'),(2431,23,'15:30:00','16:00:00','2021-07-25','2021-07-13 23:24:53'),(2432,23,'16:00:00','16:30:00','2021-07-25','2021-07-13 23:24:53'),(2433,23,'16:30:00','17:00:00','2021-07-25','2021-07-13 23:24:53'),(2434,23,'17:00:00','17:30:00','2021-07-25','2021-07-13 23:24:53'),(2435,23,'17:30:00','18:00:00','2021-07-25','2021-07-13 23:24:53'),(2436,23,'14:00:00','14:30:00','2021-07-26','2021-07-13 23:24:53'),(2437,23,'14:30:00','15:00:00','2021-07-26','2021-07-13 23:24:53'),(2438,23,'15:00:00','15:30:00','2021-07-26','2021-07-13 23:24:53'),(2439,23,'15:30:00','16:00:00','2021-07-26','2021-07-13 23:24:53'),(2440,23,'16:00:00','16:30:00','2021-07-26','2021-07-13 23:24:53'),(2441,23,'16:30:00','17:00:00','2021-07-26','2021-07-13 23:24:53'),(2442,23,'17:00:00','17:30:00','2021-07-26','2021-07-13 23:24:53'),(2443,23,'17:30:00','18:00:00','2021-07-26','2021-07-13 23:24:53'),(2444,23,'14:00:00','14:30:00','2021-07-27','2021-07-13 23:24:53'),(2445,23,'14:30:00','15:00:00','2021-07-27','2021-07-13 23:24:53'),(2446,23,'15:00:00','15:30:00','2021-07-27','2021-07-13 23:24:53'),(2447,23,'15:30:00','16:00:00','2021-07-27','2021-07-13 23:24:53'),(2448,23,'16:00:00','16:30:00','2021-07-27','2021-07-13 23:24:53'),(2449,23,'16:30:00','17:00:00','2021-07-27','2021-07-13 23:24:53'),(2450,23,'17:00:00','17:30:00','2021-07-27','2021-07-13 23:24:53'),(2451,23,'17:30:00','18:00:00','2021-07-27','2021-07-13 23:24:53'),(2452,23,'14:00:00','14:30:00','2021-07-28','2021-07-13 23:24:53'),(2453,23,'14:30:00','15:00:00','2021-07-28','2021-07-13 23:24:53'),(2454,23,'15:00:00','15:30:00','2021-07-28','2021-07-13 23:24:53'),(2455,23,'15:30:00','16:00:00','2021-07-28','2021-07-13 23:24:53'),(2456,23,'16:00:00','16:30:00','2021-07-28','2021-07-13 23:24:53'),(2457,23,'16:30:00','17:00:00','2021-07-28','2021-07-13 23:24:53'),(2458,23,'17:00:00','17:30:00','2021-07-28','2021-07-13 23:24:53'),(2459,23,'17:30:00','18:00:00','2021-07-28','2021-07-13 23:24:53'),(2460,25,'09:00:00','09:30:00','2021-09-13','2021-07-14 19:53:58'),(2461,25,'09:30:00','10:00:00','2021-09-13','2021-07-14 19:53:58'),(2462,25,'10:00:00','10:30:00','2021-09-13','2021-07-14 19:53:58'),(2463,25,'10:30:00','11:00:00','2021-09-13','2021-07-14 19:53:58'),(2464,25,'11:00:00','11:30:00','2021-09-13','2021-07-14 19:53:58'),(2465,25,'11:30:00','12:00:00','2021-09-13','2021-07-14 19:53:58'),(2466,25,'12:00:00','12:30:00','2021-09-13','2021-07-14 19:53:58'),(2467,25,'09:00:00','09:30:00','2021-09-14','2021-07-14 19:53:58'),(2468,25,'09:30:00','10:00:00','2021-09-14','2021-07-14 19:53:58'),(2469,25,'10:00:00','10:30:00','2021-09-14','2021-07-14 19:53:58'),(2470,25,'10:30:00','11:00:00','2021-09-14','2021-07-14 19:53:58'),(2471,25,'11:00:00','11:30:00','2021-09-14','2021-07-14 19:53:58'),(2472,25,'11:30:00','12:00:00','2021-09-14','2021-07-14 19:53:58'),(2473,25,'12:00:00','12:30:00','2021-09-14','2021-07-14 19:53:58'),(2474,25,'09:00:00','09:30:00','2021-09-15','2021-07-14 19:53:58'),(2475,25,'09:30:00','10:00:00','2021-09-15','2021-07-14 19:53:58'),(2476,25,'10:00:00','10:30:00','2021-09-15','2021-07-14 19:53:58'),(2477,25,'10:30:00','11:00:00','2021-09-15','2021-07-14 19:53:58'),(2478,25,'11:00:00','11:30:00','2021-09-15','2021-07-14 19:53:58'),(2479,25,'11:30:00','12:00:00','2021-09-15','2021-07-14 19:53:58'),(2480,25,'12:00:00','12:30:00','2021-09-15','2021-07-14 19:53:58'),(2481,25,'09:00:00','09:30:00','2021-09-16','2021-07-14 19:53:58'),(2482,25,'09:30:00','10:00:00','2021-09-16','2021-07-14 19:53:58'),(2483,25,'10:00:00','10:30:00','2021-09-16','2021-07-14 19:53:58'),(2484,25,'10:30:00','11:00:00','2021-09-16','2021-07-14 19:53:58'),(2485,25,'11:00:00','11:30:00','2021-09-16','2021-07-14 19:53:58'),(2486,25,'11:30:00','12:00:00','2021-09-16','2021-07-14 19:53:58'),(2487,25,'12:00:00','12:30:00','2021-09-16','2021-07-14 19:53:58'),(2488,25,'09:00:00','09:30:00','2021-09-17','2021-07-14 19:53:58'),(2489,25,'09:30:00','10:00:00','2021-09-17','2021-07-14 19:53:58'),(2490,25,'10:00:00','10:30:00','2021-09-17','2021-07-14 19:53:58'),(2491,25,'10:30:00','11:00:00','2021-09-17','2021-07-14 19:53:58'),(2492,25,'11:00:00','11:30:00','2021-09-17','2021-07-14 19:53:58'),(2493,25,'11:30:00','12:00:00','2021-09-17','2021-07-14 19:53:58'),(2494,25,'12:00:00','12:30:00','2021-09-17','2021-07-14 19:53:58'),(2495,24,'09:00:00','09:30:00','2021-11-08','2021-07-15 09:17:15'),(2496,24,'09:30:00','10:00:00','2021-11-08','2021-07-15 09:17:15'),(2497,24,'10:00:00','10:30:00','2021-11-08','2021-07-15 09:17:15'),(2498,24,'10:30:00','11:00:00','2021-11-08','2021-07-15 09:17:15'),(2499,24,'11:00:00','11:30:00','2021-11-08','2021-07-15 09:17:15'),(2500,24,'11:30:00','12:00:00','2021-11-08','2021-07-15 09:17:15'),(2501,24,'12:00:00','12:30:00','2021-11-08','2021-07-15 09:17:15'),(2502,24,'09:00:00','09:30:00','2021-11-09','2021-07-15 09:17:15'),(2503,24,'09:30:00','10:00:00','2021-11-09','2021-07-15 09:17:15'),(2504,24,'10:00:00','10:30:00','2021-11-09','2021-07-15 09:17:15'),(2505,24,'10:30:00','11:00:00','2021-11-09','2021-07-15 09:17:15'),(2506,24,'11:00:00','11:30:00','2021-11-09','2021-07-15 09:17:15'),(2507,24,'11:30:00','12:00:00','2021-11-09','2021-07-15 09:17:15'),(2508,24,'12:00:00','12:30:00','2021-11-09','2021-07-15 09:17:15'),(2509,24,'09:00:00','09:30:00','2021-11-10','2021-07-15 09:17:15'),(2510,24,'09:30:00','10:00:00','2021-11-10','2021-07-15 09:17:15'),(2511,24,'10:00:00','10:30:00','2021-11-10','2021-07-15 09:17:15'),(2512,24,'10:30:00','11:00:00','2021-11-10','2021-07-15 09:17:15'),(2513,24,'11:00:00','11:30:00','2021-11-10','2021-07-15 09:17:15'),(2514,24,'11:30:00','12:00:00','2021-11-10','2021-07-15 09:17:15'),(2515,24,'12:00:00','12:30:00','2021-11-10','2021-07-15 09:17:15'),(2516,24,'09:00:00','09:30:00','2021-11-11','2021-07-15 09:17:15'),(2517,24,'09:30:00','10:00:00','2021-11-11','2021-07-15 09:17:15'),(2518,24,'10:00:00','10:30:00','2021-11-11','2021-07-15 09:17:15'),(2519,24,'10:30:00','11:00:00','2021-11-11','2021-07-15 09:17:15'),(2520,24,'11:00:00','11:30:00','2021-11-11','2021-07-15 09:17:15'),(2521,24,'11:30:00','12:00:00','2021-11-11','2021-07-15 09:17:15'),(2522,24,'12:00:00','12:30:00','2021-11-11','2021-07-15 09:17:15'),(2523,24,'09:00:00','09:30:00','2021-11-12','2021-07-15 09:17:15'),(2524,24,'09:30:00','10:00:00','2021-11-12','2021-07-15 09:17:15'),(2525,24,'10:00:00','10:30:00','2021-11-12','2021-07-15 09:17:15'),(2526,24,'10:30:00','11:00:00','2021-11-12','2021-07-15 09:17:15'),(2527,24,'11:00:00','11:30:00','2021-11-12','2021-07-15 09:17:15'),(2528,24,'11:30:00','12:00:00','2021-11-12','2021-07-15 09:17:15'),(2529,24,'12:00:00','12:30:00','2021-11-12','2021-07-15 09:17:15');
/*!40000 ALTER TABLE `time_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `working_hour_periods`
--

DROP TABLE IF EXISTS `working_hour_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `working_hour_periods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_doctor` int NOT NULL,
  `begin_hour` time NOT NULL,
  `day` date NOT NULL,
  `end_hour` time NOT NULL,
  `id_clinical_office` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `day2` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_from_working_hour_period_to_doctors_idx` (`id_doctor`),
  KEY `fk_from_working_hour_period_to_clinical_office_idx` (`id_clinical_office`),
  CONSTRAINT `fk_from_working_hour_period_to_clinical_office` FOREIGN KEY (`id_clinical_office`) REFERENCES `clinical_office` (`id`),
  CONSTRAINT `fk_from_working_hour_period_to_doctors` FOREIGN KEY (`id_doctor`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `working_hour_periods`
--

LOCK TABLES `working_hour_periods` WRITE;
/*!40000 ALTER TABLE `working_hour_periods` DISABLE KEYS */;
INSERT INTO `working_hour_periods` VALUES (179,24,'09:00:00','2021-07-17','12:00:00',1,'2021-07-13 23:19:19','2021-07-13 23:19:19','2021-07-28'),(180,24,'14:00:00','2021-07-17','18:00:00',1,'2021-07-13 23:22:38','2021-07-13 23:22:38','2021-07-28'),(181,25,'14:00:00','2021-07-17','18:00:00',1,'2021-07-13 23:22:46','2021-07-13 23:22:46','2021-07-28'),(182,23,'09:00:00','2021-07-17','12:00:00',3,'2021-07-13 23:23:20','2021-07-13 23:23:20','2021-07-28'),(183,23,'14:00:00','2021-07-17','18:00:00',2,'2021-07-13 23:24:53','2021-07-13 23:24:53','2021-07-28'),(184,25,'09:00:00','2021-09-13','12:30:00',2,'2021-07-14 19:53:58','2021-07-14 19:53:58','2021-09-17'),(185,24,'09:00:00','2021-11-08','12:30:00',1,'2021-07-15 09:17:15','2021-07-15 09:17:15','2021-11-12');
/*!40000 ALTER TABLE `working_hour_periods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-16 17:15:37
