-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: homvac
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `tbl_address`
--

DROP TABLE IF EXISTS `tbl_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `address_desc` varchar(255) DEFAULT NULL,
  `address_latitude` varchar(255) DEFAULT NULL,
  `address_longitude` varchar(255) DEFAULT NULL,
  `address_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tbl_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_address`
--

LOCK TABLES `tbl_address` WRITE;
/*!40000 ALTER TABLE `tbl_address` DISABLE KEYS */;
INSERT INTO `tbl_address` VALUES (1,11,'Obere Str. 57','9.951343','76.555767','Active'),(2,13,'Mataderos 2312','10.091039','76.586529','Active'),(3,14,'Cerrito 333','10.047140','76.585328','Active');
/*!40000 ALTER TABLE `tbl_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_admin`
--

DROP TABLE IF EXISTS `tbl_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(25) DEFAULT NULL,
  `admin_username` varchar(15) DEFAULT NULL,
  `admin_password` varchar(255) DEFAULT NULL,
  `admin_status` varchar(10) DEFAULT NULL,
  `admin_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_admin`
--

LOCK TABLES `tbl_admin` WRITE;
/*!40000 ALTER TABLE `tbl_admin` DISABLE KEYS */;
INSERT INTO `tbl_admin` VALUES (1,'DMO Ernakulam','dmoekm','2bB@2bB@','Active','04802693857');
/*!40000 ALTER TABLE `tbl_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_age`
--

DROP TABLE IF EXISTS `tbl_age`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_age` (
  `age_id` int NOT NULL AUTO_INCREMENT,
  `age_desc` varchar(25) DEFAULT NULL,
  `age_day_no` int DEFAULT NULL,
  `age_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`age_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_age`
--

LOCK TABLES `tbl_age` WRITE;
/*!40000 ALTER TABLE `tbl_age` DISABLE KEYS */;
INSERT INTO `tbl_age` VALUES (1,'6 Weeks',42,'Active'),(2,'10 Weeks',70,'Active'),(3,'Pregnant Mother',7670,'Active'),(4,'14 Weeks',98,'Active'),(5,'9 Months',274,'Active');
/*!40000 ALTER TABLE `tbl_age` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_health_centre`
--

DROP TABLE IF EXISTS `tbl_health_centre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_health_centre` (
  `health_centre_id` int NOT NULL AUTO_INCREMENT,
  `health_centre_name` varchar(25) DEFAULT NULL,
  `health_centre_latitude` varchar(255) DEFAULT NULL,
  `health_centre_longitude` varchar(255) DEFAULT NULL,
  `health_centre_username` varchar(15) DEFAULT NULL,
  `health_centre_password` varchar(255) DEFAULT NULL,
  `health_centre_status` varchar(25) DEFAULT NULL,
  `health_centre_phone` varchar(255) DEFAULT NULL,
  `health_centre_reg_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`health_centre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_health_centre`
--

LOCK TABLES `tbl_health_centre` WRITE;
/*!40000 ALTER TABLE `tbl_health_centre` DISABLE KEYS */;
INSERT INTO `tbl_health_centre` VALUES (1,'PHC Marady','9.951979','76.556671','phcmrdy','4dD$4dD$','Verified','04852837465','MRDY847563'),(2,'PHC Kottappady','10.116782','76.587624','phcktpy','5eE%5eE%','Verified','04847364524','KTPY283746'),(3,'PHC Cheruvatoor','10.045673','76.584090','phccrtr','k3#yd^6b','Verified','04842387645','CRTR937584');
/*!40000 ALTER TABLE `tbl_health_centre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_member`
--

DROP TABLE IF EXISTS `tbl_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `member_name` varchar(25) DEFAULT NULL,
  `member_gender` varchar(6) DEFAULT NULL,
  `member_dob` date DEFAULT NULL,
  `member_aadhaar_no` varchar(12) DEFAULT NULL,
  `member_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tbl_member_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_member`
--

LOCK TABLES `tbl_member` WRITE;
/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
INSERT INTO `tbl_member` VALUES (5,11,'Patricio Simpson','Male','2022-01-03','874857493847','Active'),(6,11,'Ana Trujillo','Female','2022-04-11','746756756567','Active'),(7,13,'Thomas Hardy','Male','2021-07-18','654829476572','Active'),(8,14,'Ann Devon','Female','2022-02-22','673452897346','Active');
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_stock`
--

DROP TABLE IF EXISTS `tbl_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_stock` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `health_centre_id` int DEFAULT NULL,
  `vaccine_id` int DEFAULT NULL,
  `stock_quantity` int DEFAULT NULL,
  `stock_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `health_centre_id` (`health_centre_id`),
  KEY `vaccine_id` (`vaccine_id`),
  CONSTRAINT `tbl_stock_ibfk_1` FOREIGN KEY (`health_centre_id`) REFERENCES `tbl_health_centre` (`health_centre_id`),
  CONSTRAINT `tbl_stock_ibfk_2` FOREIGN KEY (`vaccine_id`) REFERENCES `tbl_vaccine` (`vaccine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_stock`
--

LOCK TABLES `tbl_stock` WRITE;
/*!40000 ALTER TABLE `tbl_stock` DISABLE KEYS */;
INSERT INTO `tbl_stock` VALUES (1,1,1,25,'Active'),(2,1,2,17,'Active'),(3,2,3,29,'Active'),(4,3,3,45,'Active'),(5,3,1,24,'Active');
/*!40000 ALTER TABLE `tbl_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(25) DEFAULT NULL,
  `user_mobile` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (11,'Maria Anders','9876543210','3cC#3cC#','Active'),(13,'Antonio Moreno','8765432109','6fF^6fF^','Active'),(14,'Martin Sommer','9437218563','9iI+9iI+','Active');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vaccination`
--

DROP TABLE IF EXISTS `tbl_vaccination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_vaccination` (
  `vaccination_id` int NOT NULL AUTO_INCREMENT,
  `health_centre_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `vaccine_id` int DEFAULT NULL,
  `vaccinator_id` int DEFAULT NULL,
  `age_id` int DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `vaccination_date` date DEFAULT NULL,
  `vaccination_status` varchar(15) DEFAULT NULL,
  `vaccinated_date` date DEFAULT NULL,
  `vaccinated_time` time DEFAULT NULL,
  `vaccination_time` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`vaccination_id`),
  KEY `user_id` (`user_id`),
  KEY `member_id` (`member_id`),
  KEY `vaccine_id` (`vaccine_id`),
  KEY `vaccinator_id` (`vaccinator_id`),
  KEY `health_centre_id` (`health_centre_id`),
  KEY `age_id` (`age_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `tbl_vaccination_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `tbl_vaccination_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`),
  CONSTRAINT `tbl_vaccination_ibfk_3` FOREIGN KEY (`vaccine_id`) REFERENCES `tbl_vaccine` (`vaccine_id`),
  CONSTRAINT `tbl_vaccination_ibfk_4` FOREIGN KEY (`vaccinator_id`) REFERENCES `tbl_vaccinator` (`vaccinator_id`),
  CONSTRAINT `tbl_vaccination_ibfk_5` FOREIGN KEY (`health_centre_id`) REFERENCES `tbl_health_centre` (`health_centre_id`),
  CONSTRAINT `tbl_vaccination_ibfk_6` FOREIGN KEY (`age_id`) REFERENCES `tbl_age` (`age_id`),
  CONSTRAINT `tbl_vaccination_ibfk_7` FOREIGN KEY (`address_id`) REFERENCES `tbl_address` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vaccination`
--

LOCK TABLES `tbl_vaccination` WRITE;
/*!40000 ALTER TABLE `tbl_vaccination` DISABLE KEYS */;
INSERT INTO `tbl_vaccination` VALUES (11,1,11,5,1,2,1,1,'2022-04-14','Vaccinated','2022-04-15','19:42:06','11:30 AM - 12:30 PM'),(12,1,11,5,2,2,1,1,'2022-04-21','Vaccinated','2022-04-18','18:59:06','11:30 AM - 12:30 PM'),(13,2,13,7,3,3,2,2,'2022-04-18','Vaccinated','2022-04-16','09:55:18','11:30 AM - 12:30 PM'),(21,3,14,8,1,4,1,3,'2022-04-23','Vaccinated','2022-04-20','12:33:20','02:30 PM - 03:30 PM');
/*!40000 ALTER TABLE `tbl_vaccination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vaccinator`
--

DROP TABLE IF EXISTS `tbl_vaccinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_vaccinator` (
  `vaccinator_id` int NOT NULL AUTO_INCREMENT,
  `health_centre_id` int DEFAULT NULL,
  `vaccinator_name` varchar(25) DEFAULT NULL,
  `vaccinator_certificate` varchar(255) DEFAULT NULL,
  `vaccinator_mobile` varchar(255) DEFAULT NULL,
  `vaccinator_password` varchar(255) DEFAULT NULL,
  `vaccinator_status` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`vaccinator_id`),
  KEY `health_centre_id` (`health_centre_id`),
  CONSTRAINT `tbl_vaccinator_ibfk_1` FOREIGN KEY (`health_centre_id`) REFERENCES `tbl_health_centre` (`health_centre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vaccinator`
--

LOCK TABLES `tbl_vaccinator` WRITE;
/*!40000 ALTER TABLE `tbl_vaccinator` DISABLE KEYS */;
INSERT INTO `tbl_vaccinator` VALUES (2,1,'Christina Berglund','HTS846856323','6543210987','7gG&7gG&','Verified by Admin'),(3,2,'Hanna Moos','HTS948571625','7654321098','8hH*8hH*','Verified by Admin'),(4,3,'Peter Franken','HTS914652036','9734256184','uU6_#gSa','Verified by Admin');
/*!40000 ALTER TABLE `tbl_vaccinator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vaccine`
--

DROP TABLE IF EXISTS `tbl_vaccine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_vaccine` (
  `vaccine_id` int NOT NULL AUTO_INCREMENT,
  `age_id` int DEFAULT NULL,
  `vaccine_name` varchar(50) DEFAULT NULL,
  `vaccine_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`vaccine_id`),
  KEY `age_id` (`age_id`),
  CONSTRAINT `tbl_vaccine_ibfk_1` FOREIGN KEY (`age_id`) REFERENCES `tbl_age` (`age_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vaccine`
--

LOCK TABLES `tbl_vaccine` WRITE;
/*!40000 ALTER TABLE `tbl_vaccine` DISABLE KEYS */;
INSERT INTO `tbl_vaccine` VALUES (1,1,'Oral Polio Vaccine-1','Active'),(2,1,'Pentavalent-1','Active'),(3,2,'Oral Polio Vaccine-2','Active'),(4,3,'Tetanus & adult Diphtheria-1','Active'),(5,1,'Rotavirus Vaccine-1','Active'),(6,1,'Fractional dose of Inactivated Polio Vaccine-1','Active'),(7,2,'Pentavalent-2','Active'),(8,4,'Oral Polio Vaccine-3','Active'),(9,4,'Pentavalent-3','Active'),(10,4,'Fractional dose of Inactivated Polio Vaccine-2','Active'),(11,2,'Rotavirus Vaccine-2','Active'),(12,5,'Measles & Rubella (MR)-1','Active');
/*!40000 ALTER TABLE `tbl_vaccine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-02 11:54:30
