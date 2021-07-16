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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,'1999-12-12','12:00:00',4,2,1,1,'2021-06-29 23:16:38','2021-06-29 23:16:38',1),(2,1,'1999-12-12','12:00:00',4,2,1,1,'2021-06-30 11:03:15','2021-06-30 11:03:15',1),(3,1,'2021-07-30','11:00:00',4,3,42,1,'2021-06-30 11:15:05','2021-06-30 11:15:05',4);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-01  0:37:20
