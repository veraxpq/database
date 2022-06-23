-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: localhost    Database: practicum
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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `acid` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `amid` int DEFAULT NULL,
  `number_of_engines` varchar(10) DEFAULT NULL,
  `is_large` tinyint DEFAULT NULL,
  `atid` int DEFAULT NULL,
  PRIMARY KEY (`acid`),
  KEY `amid_idx` (`amid`),
  KEY `atid_idx` (`atid`),
  CONSTRAINT `amid` FOREIGN KEY (`amid`) REFERENCES `aircraft_model` (`amid`),
  CONSTRAINT `atid` FOREIGN KEY (`atid`) REFERENCES `aircraft_type` (`atid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aircraft_model`
--

DROP TABLE IF EXISTS `aircraft_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft_model` (
  `amid` int NOT NULL AUTO_INCREMENT,
  `model` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`amid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aircraft_type`
--

DROP TABLE IF EXISTS `aircraft_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft_type` (
  `atid` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`atid`),
  UNIQUE KEY `type_UNIQUE` (`type`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `alid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`alid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `apid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`apid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `condition`
--

DROP TABLE IF EXISTS `condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condition` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `sky_condition` varchar(45) DEFAULT NULL,
  `explanation` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`cid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident`
--

DROP TABLE IF EXISTS `incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident` (
  `iid` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `origin` varchar(45) DEFAULT NULL,
  `alid` int DEFAULT NULL,
  `acid` int DEFAULT NULL,
  `impact` tinyint DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `apid` int DEFAULT NULL,
  `phase` enum('Approach','Climb','Descent','Landing Roll','Parked','Take-off run','Taxi') DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `alid_idx` (`alid`),
  KEY `acid_idx` (`acid`),
  KEY `cid_idx` (`cid`),
  KEY `apid_idx` (`apid`),
  CONSTRAINT `acid` FOREIGN KEY (`acid`) REFERENCES `aircraft` (`acid`),
  CONSTRAINT `alid` FOREIGN KEY (`alid`) REFERENCES `airline` (`alid`),
  CONSTRAINT `apid` FOREIGN KEY (`apid`) REFERENCES `airport` (`apid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `condition` (`cid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-05 23:21:17
