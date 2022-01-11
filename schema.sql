-- MySQL dump 10.16  Distrib 10.1.34-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: adise
-- ------------------------------------------------------
-- Server version	10.1.34-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cardgroup` varchar(255) NOT NULL,
  `holder` enum('player1','player2','NULL') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (1,'ace','clubs',NULL),(2,'two','clubs',NULL),(3,'three','clubs',NULL),(4,'four','clubs',NULL),(5,'five','clubs',NULL),(6,'six','clubs',NULL),(7,'seven','clubs',NULL),(8,'eight','clubs',NULL),(9,'nine','clubs',NULL),(10,'ten','clubs',NULL),(11,'ace','diamonds',NULL),(12,'two','diamonds',NULL),(13,'three','diamonds',NULL),(14,'four','diamonds',NULL),(15,'five','diamonds',NULL),(16,'six','diamonds',NULL),(17,'seven','diamonds',NULL),(18,'eight','diamonds',NULL),(19,'nine','diamonds',NULL),(20,'ten','diamonds',NULL),(21,'ace','hearts',NULL),(22,'two','hearts',NULL),(23,'three','hearts',NULL),(24,'four','hearts',NULL),(25,'five','hearts',NULL),(26,'six','hearts',NULL),(27,'seven','hearts',NULL),(28,'eight','hearts',NULL),(29,'nine','hearts',NULL),(30,'ten','hearts',NULL),(31,'ace','spades',NULL),(32,'two','spades',NULL),(33,'three','spades',NULL),(34,'four','spades',NULL),(35,'five','spades',NULL),(36,'six','spades',NULL),(37,'seven','spades',NULL),(38,'eight','spades',NULL),(39,'nine','spades',NULL),(40,'ten','spades',NULL),(41,'king','clubs',NULL);
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `current_cards`
--

DROP TABLE IF EXISTS `current_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `current_cards` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cardgroup` varchar(255) NOT NULL,
  `holder` enum('player1','player2','NULL') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_cards`
--

LOCK TABLES `current_cards` WRITE;
/*!40000 ALTER TABLE `current_cards` DISABLE KEYS */;
INSERT INTO `current_cards` VALUES (31,'ace','spades','player2'),(32,'two','spades','player1'),(33,'three','spades','player1'),(34,'four','spades','player1'),(35,'five','spades','player1'),(36,'six','spades','player1'),(37,'seven','spades','player1'),(38,'eight','spades','player2'),(39,'nine','spades','player2'),(40,'ten','spades','player1'),(41,'king','clubs','player2');
/*!40000 ALTER TABLE `current_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_status`
--

DROP TABLE IF EXISTS `game_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborted') NOT NULL DEFAULT 'not active',
  `p_turn` enum('player1','player2') DEFAULT NULL,
  `result` enum('player1','player2','draw') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_status`
--

LOCK TABLES `game_status` WRITE;
/*!40000 ALTER TABLE `game_status` DISABLE KEYS */;
INSERT INTO `game_status` VALUES ('started','player1','draw','2022-01-11 21:06:11'),('started','player1','draw','2022-01-11 21:06:19'),('started','player2','draw','2022-01-11 21:06:20'),('started','player2','draw','2022-01-11 21:11:00'),('started','player1','draw','2022-01-11 21:40:12'),('started','player1','draw','2022-01-11 21:42:09'),('started','player1','draw','2022-01-11 21:43:30'),('started','player1','draw','2022-01-11 21:43:49'),('started','player2','draw','2022-01-11 21:44:04');
/*!40000 ALTER TABLE `game_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `logged_in` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'voula','abc',0),(2,'ganosi','abc',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'adise'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-11 23:57:41
