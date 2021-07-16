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
  `password` varchar(60) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active',
  `gender` varchar(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `certificate_number` varchar(45) NOT NULL,
  `image_src` varchar(200) NOT NULL,
  `nif` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `certificate_number_UNIQUE` (`certificate_number`),
  UNIQUE KEY `nif_UNIQUE` (`nif`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'1960-08-01','Rua Luis','4430','cassilda@gmail.com','929133131','123456','active','female','Cassilda Carolino','2150','https://www.hsmporto.pt/wp-content/uploads/2015/12/placeholder_homem.png','242430409'),(2,'1958-08-01','Rua Marte','4440','rui@gmail.com','924433131','123456','active','Male','Rui Carolino','2170','https://www.hsmporto.pt/wp-content/uploads/2015/12/placeholder_homem.png','272750904'),(4,'1955-08-01','Rua Marte2','4440','vitor@gmail.com','934433131','123456','active','Male','Vitor Carolino','2185','https://www.hsmporto.pt/wp-content/uploads/2015/12/placeholder_homem.png','398013242'),(6,'1955-08-01','Rua Marte2','4440','Luis@gmail.com','934433131','123456','active','Male','Luis Carolino','218542','https://www.hsmporto.pt/wp-content/uploads/2015/12/placeholder_homem.png','25256733324'),(7,'1955-08-01','Rua Marte2','4440','dasss@gmail.com','934433131','123456','active','Male','Luis Carolino','20333','https://www.hsmporto.pt/wp-content/uploads/2015/12/placeholder_homem.png','25244733324'),(8,'1991-12-12','ra','123','filsss@gmail.com','919191991','123456','active','Male','Filipe','2203331','https://www.hsmporto.pt/wp-content/uploads/2015/12/placeholder_homem.png','254245211');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
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
