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
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slots`
--

LOCK TABLES `time_slots` WRITE;
/*!40000 ALTER TABLE `time_slots` DISABLE KEYS */;
INSERT INTO `time_slots` VALUES (1,1,'12:30:00','13:00:00','2021-07-16','2021-06-28 14:37:28'),(2,1,'12:00:00','12:30:00','2021-07-16','2021-06-28 14:37:28'),(3,1,'14:30:00','15:00:00','2021-07-16','2021-06-28 14:37:28'),(4,1,'15:00:00','15:30:00','2021-07-16','2021-06-28 14:37:28'),(5,1,'15:30:00','16:00:00','2021-07-16','2021-06-28 14:37:28'),(6,1,'16:00:00','16:30:00','2021-07-16','2021-06-28 14:37:28'),(7,1,'13:00:00','13:30:00','2021-07-16','2021-06-28 14:37:28'),(8,1,'16:30:00','17:00:00','2021-07-16','2021-06-28 14:37:28'),(9,1,'14:00:00','14:30:00','2021-07-16','2021-06-28 14:37:28'),(10,1,'13:30:00','14:00:00','2021-07-16','2021-06-28 14:37:28'),(11,1,'12:00:00','12:30:00','2021-07-16','2021-06-28 16:51:40'),(12,1,'12:30:00','13:00:00','2021-07-16','2021-06-28 16:51:40'),(13,1,'13:00:00','13:30:00','2021-07-16','2021-06-28 16:51:40'),(14,1,'13:30:00','14:00:00','2021-07-16','2021-06-28 16:51:40'),(15,1,'14:00:00','14:30:00','2021-07-16','2021-06-28 16:51:40'),(16,1,'14:30:00','15:00:00','2021-07-16','2021-06-28 16:51:40'),(17,1,'15:00:00','15:30:00','2021-07-16','2021-06-28 16:51:40'),(18,1,'15:30:00','16:00:00','2021-07-16','2021-06-28 16:51:40'),(19,1,'16:00:00','16:30:00','2021-07-16','2021-06-28 16:51:40'),(20,1,'16:30:00','17:00:00','2021-07-16','2021-06-28 16:51:40'),(21,2,'10:00:00','10:30:00','2021-06-26','2021-06-29 11:14:05'),(22,2,'11:30:00','12:00:00','2021-06-26','2021-06-29 11:14:05'),(23,2,'10:30:00','11:00:00','2021-06-26','2021-06-29 11:14:05'),(24,2,'11:00:00','11:30:00','2021-06-26','2021-06-29 11:14:05'),(25,2,'12:00:00','12:30:00','2021-06-26','2021-06-29 11:14:05'),(26,1,'10:30:00','11:00:00','2021-07-30','2021-06-29 22:42:25'),(27,1,'11:00:00','11:30:00','2021-07-30','2021-06-29 22:42:25'),(28,1,'11:30:00','12:00:00','2021-07-30','2021-06-29 22:42:25'),(29,1,'12:00:00','12:30:00','2021-07-30','2021-06-29 22:42:25'),(30,1,'12:30:00','13:00:00','2021-07-30','2021-06-29 22:42:25'),(31,1,'13:00:00','13:30:00','2021-07-30','2021-06-29 22:42:25'),(32,1,'13:30:00','14:00:00','2021-07-30','2021-06-29 22:42:25'),(33,1,'14:00:00','14:30:00','2021-07-30','2021-06-29 22:42:25'),(34,1,'14:30:00','15:00:00','2021-07-30','2021-06-29 22:42:25'),(35,1,'15:00:00','15:30:00','2021-07-30','2021-06-29 22:42:25'),(36,1,'15:30:00','16:00:00','2021-07-30','2021-06-29 22:42:25'),(37,1,'16:00:00','16:30:00','2021-07-30','2021-06-29 22:42:25'),(38,1,'16:30:00','17:00:00','2021-07-30','2021-06-29 22:42:25'),(39,1,'17:00:00','17:30:00','2021-07-30','2021-06-29 22:42:25'),(40,4,'09:30:00','10:00:00','2021-07-30','2021-06-30 09:37:18'),(41,4,'10:30:00','11:00:00','2021-07-30','2021-06-30 09:37:18'),(42,4,'11:00:00','11:30:00','2021-07-30','2021-06-30 09:37:18'),(43,4,'11:30:00','12:00:00','2021-07-30','2021-06-30 09:37:18'),(44,4,'12:00:00','12:30:00','2021-07-30','2021-06-30 09:37:18'),(45,4,'10:00:00','10:30:00','2021-07-30','2021-06-30 09:37:18'),(46,2,'09:00:00','09:30:00','2021-07-06','2021-06-30 10:57:38'),(47,2,'10:00:00','10:30:00','2021-07-06','2021-06-30 10:57:38'),(48,2,'10:30:00','11:00:00','2021-07-06','2021-06-30 10:57:38'),(49,2,'11:00:00','11:30:00','2021-07-06','2021-06-30 10:57:38'),(50,2,'11:30:00','12:00:00','2021-07-06','2021-06-30 10:57:38'),(51,2,'12:00:00','12:30:00','2021-07-06','2021-06-30 10:57:38'),(52,2,'12:30:00','13:00:00','2021-07-06','2021-06-30 10:57:38'),(53,2,'13:00:00','13:30:00','2021-07-06','2021-06-30 10:57:38'),(54,2,'09:30:00','10:00:00','2021-07-06','2021-06-30 10:57:38'),(55,2,'13:30:00','14:00:00','2021-07-06','2021-06-30 10:57:38'),(56,2,'14:00:00','14:30:00','2021-07-06','2021-06-30 10:57:38'),(57,2,'14:30:00','15:00:00','2021-07-06','2021-06-30 10:57:38'),(58,2,'15:00:00','15:30:00','2021-07-06','2021-06-30 10:57:38'),(59,2,'15:30:00','16:00:00','2021-07-06','2021-06-30 10:57:38'),(60,2,'16:00:00','16:30:00','2021-07-06','2021-06-30 10:57:38'),(61,2,'16:30:00','17:00:00','2021-07-06','2021-06-30 10:57:38'),(62,2,'17:00:00','17:30:00','2021-07-06','2021-06-30 10:57:38'),(63,2,'17:30:00','18:00:00','2021-07-06','2021-06-30 10:57:38'),(64,2,'18:00:00','18:30:00','2021-07-06','2021-06-30 10:57:38'),(65,2,'18:30:00','19:00:00','2021-07-06','2021-06-30 10:57:38'),(66,2,'09:00:00','09:30:00','2021-07-05','2021-06-30 14:28:21'),(67,2,'10:00:00','10:30:00','2021-07-05','2021-06-30 14:28:21'),(68,2,'10:30:00','11:00:00','2021-07-05','2021-06-30 14:28:21'),(69,2,'11:00:00','11:30:00','2021-07-05','2021-06-30 14:28:21'),(70,2,'11:30:00','12:00:00','2021-07-05','2021-06-30 14:28:21'),(71,2,'12:00:00','12:30:00','2021-07-05','2021-06-30 14:28:21'),(72,2,'09:30:00','10:00:00','2021-07-05','2021-06-30 14:28:21'),(73,2,'13:00:00','13:30:00','2021-10-12','2021-06-30 14:51:50'),(74,2,'13:30:00','14:00:00','2021-10-12','2021-06-30 14:51:50'),(75,2,'14:00:00','14:30:00','2021-10-12','2021-06-30 14:51:50'),(76,2,'14:30:00','15:00:00','2021-10-12','2021-06-30 14:51:50'),(77,2,'15:00:00','15:30:00','2021-10-12','2021-06-30 14:51:50'),(78,2,'15:30:00','16:00:00','2021-10-12','2021-06-30 14:51:50'),(79,2,'16:00:00','16:30:00','2021-10-12','2021-06-30 14:51:50'),(80,2,'16:30:00','17:00:00','2021-10-12','2021-06-30 14:51:50'),(81,2,'17:00:00','17:30:00','2021-10-12','2021-06-30 14:51:50'),(82,2,'17:30:00','18:00:00','2021-10-12','2021-06-30 14:51:50'),(83,2,'18:00:00','18:30:00','2021-10-12','2021-06-30 14:51:50'),(84,2,'18:30:00','19:00:00','2021-10-12','2021-06-30 14:51:50'),(85,2,'12:00:00','12:30:00','1991-02-20','2021-06-30 17:43:46'),(86,2,'12:30:00','13:00:00','1991-02-20','2021-06-30 17:43:46'),(87,2,'13:00:00','13:30:00','1991-02-20','2021-06-30 17:43:46'),(88,2,'13:30:00','14:00:00','1991-02-20','2021-06-30 17:43:46'),(89,2,'14:00:00','14:30:00','1991-02-20','2021-06-30 17:43:46'),(90,2,'14:30:00','15:00:00','1991-02-20','2021-06-30 17:43:46'),(91,2,'15:00:00','15:30:00','1991-02-20','2021-06-30 17:43:46'),(92,2,'15:30:00','16:00:00','1991-02-20','2021-06-30 17:43:46'),(93,2,'12:00:00','12:30:00','1991-02-20','2021-06-30 18:20:48'),(94,2,'12:30:00','13:00:00','1991-02-20','2021-06-30 18:20:48'),(95,2,'13:00:00','13:30:00','1991-02-20','2021-06-30 18:20:48'),(96,2,'13:30:00','14:00:00','1991-02-20','2021-06-30 18:20:48'),(97,2,'14:00:00','14:30:00','1991-02-20','2021-06-30 18:20:48'),(98,2,'14:30:00','15:00:00','1991-02-20','2021-06-30 18:20:48'),(99,2,'15:00:00','15:30:00','1991-02-20','2021-06-30 18:20:48'),(100,2,'15:30:00','16:00:00','1991-02-20','2021-06-30 18:20:48'),(101,2,'12:00:00','12:30:00','1991-02-20','2021-06-30 18:30:40'),(102,2,'12:30:00','13:00:00','1991-02-20','2021-06-30 18:30:40'),(103,2,'13:00:00','13:30:00','1991-02-20','2021-06-30 18:30:40'),(104,2,'13:30:00','14:00:00','1991-02-20','2021-06-30 18:30:40'),(105,2,'14:00:00','14:30:00','1991-02-20','2021-06-30 18:30:40'),(106,2,'14:30:00','15:00:00','1991-02-20','2021-06-30 18:30:40'),(107,2,'15:00:00','15:30:00','1991-02-20','2021-06-30 18:30:40'),(108,2,'15:30:00','16:00:00','1991-02-20','2021-06-30 18:30:40'),(109,2,'12:00:00','12:30:00','1991-02-20','2021-06-30 18:31:13'),(110,2,'12:30:00','13:00:00','1991-02-20','2021-06-30 18:31:13'),(111,2,'13:00:00','13:30:00','1991-02-20','2021-06-30 18:31:13'),(112,2,'13:30:00','14:00:00','1991-02-20','2021-06-30 18:31:13'),(113,2,'14:00:00','14:30:00','1991-02-20','2021-06-30 18:31:13'),(114,2,'14:30:00','15:00:00','1991-02-20','2021-06-30 18:31:13'),(115,2,'15:00:00','15:30:00','1991-02-20','2021-06-30 18:31:13'),(116,2,'15:30:00','16:00:00','1991-02-20','2021-06-30 18:31:13'),(117,2,'12:00:00','12:30:00','1991-02-20','2021-06-30 18:32:34'),(118,2,'12:30:00','13:00:00','1991-02-20','2021-06-30 18:32:34'),(119,2,'13:00:00','13:30:00','1991-02-20','2021-06-30 18:32:34'),(120,2,'13:30:00','14:00:00','1991-02-20','2021-06-30 18:32:34'),(121,2,'14:00:00','14:30:00','1991-02-20','2021-06-30 18:32:34'),(122,2,'14:30:00','15:00:00','1991-02-20','2021-06-30 18:32:34'),(123,2,'15:00:00','15:30:00','1991-02-20','2021-06-30 18:32:34'),(124,2,'15:30:00','16:00:00','1991-02-20','2021-06-30 18:32:34'),(125,2,'12:00:00','12:30:00','1991-02-20','2021-06-30 18:35:13'),(126,2,'12:30:00','13:00:00','1991-02-20','2021-06-30 18:35:13'),(127,2,'13:00:00','13:30:00','1991-02-20','2021-06-30 18:35:13'),(128,2,'13:30:00','14:00:00','1991-02-20','2021-06-30 18:35:13'),(129,2,'14:00:00','14:30:00','1991-02-20','2021-06-30 18:35:13'),(130,2,'14:30:00','15:00:00','1991-02-20','2021-06-30 18:35:13'),(131,2,'15:00:00','15:30:00','1991-02-20','2021-06-30 18:35:13'),(132,2,'15:30:00','16:00:00','1991-02-20','2021-06-30 18:35:13'),(133,2,'12:00:00','12:30:00','1991-02-20','2021-06-30 18:36:02'),(134,2,'12:30:00','13:00:00','1991-02-20','2021-06-30 18:36:02'),(135,2,'13:00:00','13:30:00','1991-02-20','2021-06-30 18:36:02'),(136,2,'13:30:00','14:00:00','1991-02-20','2021-06-30 18:36:02'),(137,2,'14:00:00','14:30:00','1991-02-20','2021-06-30 18:36:02'),(138,2,'14:30:00','15:00:00','1991-02-20','2021-06-30 18:36:02'),(139,2,'15:00:00','15:30:00','1991-02-20','2021-06-30 18:36:02'),(140,2,'15:30:00','16:00:00','1991-02-20','2021-06-30 18:36:02'),(141,2,'12:00:00','12:30:00','1991-02-20','2021-06-30 19:02:37'),(142,2,'12:30:00','13:00:00','1991-02-20','2021-06-30 19:02:37'),(143,2,'13:00:00','13:30:00','1991-02-20','2021-06-30 19:02:37'),(144,2,'13:30:00','14:00:00','1991-02-20','2021-06-30 19:02:37'),(145,2,'14:00:00','14:30:00','1991-02-20','2021-06-30 19:02:37'),(146,2,'14:30:00','15:00:00','1991-02-20','2021-06-30 19:02:37'),(147,2,'15:00:00','15:30:00','1991-02-20','2021-06-30 19:02:37'),(148,2,'15:30:00','16:00:00','1991-02-20','2021-06-30 19:02:37'),(149,2,'12:00:00','12:30:00','1991-02-20','2021-06-30 19:03:37'),(150,2,'12:30:00','13:00:00','1991-02-20','2021-06-30 19:03:37'),(151,2,'13:00:00','13:30:00','1991-02-20','2021-06-30 19:03:37'),(152,2,'13:30:00','14:00:00','1991-02-20','2021-06-30 19:03:37'),(153,2,'14:00:00','14:30:00','1991-02-20','2021-06-30 19:03:37'),(154,2,'14:30:00','15:00:00','1991-02-20','2021-06-30 19:03:37'),(155,2,'15:00:00','15:30:00','1991-02-20','2021-06-30 19:03:37'),(156,2,'15:30:00','16:00:00','1991-02-20','2021-06-30 19:03:37'),(157,2,'12:00:00','12:30:00','1991-02-20','2021-06-30 19:03:47'),(158,2,'12:30:00','13:00:00','1991-02-20','2021-06-30 19:03:47'),(159,2,'13:00:00','13:30:00','1991-02-20','2021-06-30 19:03:47'),(160,2,'13:30:00','14:00:00','1991-02-20','2021-06-30 19:03:47'),(161,2,'14:00:00','14:30:00','1991-02-20','2021-06-30 19:03:47'),(162,2,'14:30:00','15:00:00','1991-02-20','2021-06-30 19:03:47'),(163,2,'15:00:00','15:30:00','1991-02-20','2021-06-30 19:03:47'),(164,2,'15:30:00','16:00:00','1991-02-20','2021-06-30 19:03:47'),(165,2,'12:00:00','12:30:00','1991-02-20','2021-06-30 19:04:59'),(166,2,'12:30:00','13:00:00','1991-02-20','2021-06-30 19:04:59'),(167,2,'13:00:00','13:30:00','1991-02-20','2021-06-30 19:04:59'),(168,2,'13:30:00','14:00:00','1991-02-20','2021-06-30 19:04:59'),(169,2,'14:00:00','14:30:00','1991-02-20','2021-06-30 19:04:59'),(170,2,'14:30:00','15:00:00','1991-02-20','2021-06-30 19:04:59'),(171,2,'15:00:00','15:30:00','1991-02-20','2021-06-30 19:04:59'),(172,2,'15:30:00','16:00:00','1991-02-20','2021-06-30 19:04:59'),(173,2,'12:00:00','12:30:00','1991-03-20','2021-06-30 20:12:46'),(174,2,'12:30:00','13:00:00','1991-03-20','2021-06-30 20:12:46'),(175,2,'13:00:00','13:30:00','1991-03-20','2021-06-30 20:12:46'),(176,2,'13:30:00','14:00:00','1991-03-20','2021-06-30 20:12:46'),(177,2,'14:00:00','14:30:00','1991-03-20','2021-06-30 20:12:46'),(178,2,'14:30:00','15:00:00','1991-03-20','2021-06-30 20:12:46'),(179,2,'15:00:00','15:30:00','1991-03-20','2021-06-30 20:12:46'),(180,2,'15:30:00','16:00:00','1991-03-20','2021-06-30 20:12:46');
/*!40000 ALTER TABLE `time_slots` ENABLE KEYS */;
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