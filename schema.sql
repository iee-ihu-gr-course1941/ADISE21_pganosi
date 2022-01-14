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
  `holder` enum('player1','player2','NULL') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_cards`
--

LOCK TABLES `current_cards` WRITE;
/*!40000 ALTER TABLE `current_cards` DISABLE KEYS */;
INSERT INTO `current_cards` VALUES (11,'ace','diamonds','player2'),(12,'two','diamonds','player2'),(17,'seven','diamonds','player2'),(28,'eight','hearts','player2'),(29,'nine','hearts','player1'),(31,'ace','spades','player1'),(32,'two','spades','player1'),(37,'seven','spades','player1'),(38,'eight','spades','player1'),(39,'nine','spades','player2'),(41,'king','clubs','player1');
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
INSERT INTO `game_status` VALUES ('aborted','player1','draw','2022-01-11 21:06:11'),('started','player1','draw','2022-01-11 21:06:19'),('started','player2','draw','2022-01-11 21:06:20'),('started','player2','draw','2022-01-11 21:11:00'),('started','player1','draw','2022-01-11 21:40:12'),('started','player1','draw','2022-01-11 21:42:09'),('started','player1','draw','2022-01-11 21:43:30'),('started','player1','draw','2022-01-11 21:43:49'),('started','player2','draw','2022-01-11 21:44:04'),('started','player2','draw','2022-01-12 18:00:21'),('started','player2','draw','2022-01-12 18:53:54'),('started','player2','draw','2022-01-12 19:37:13'),('started','player1','draw','2022-01-12 19:39:09'),('started','player2','draw','2022-01-12 19:46:03'),('started','player1','draw','2022-01-12 19:46:12'),('started','player2','draw','2022-01-12 19:46:27'),('started','player1','draw','2022-01-12 19:46:29'),('started','player2','draw','2022-01-12 19:46:32'),('started','player1','draw','2022-01-12 19:46:34'),('started','player2','draw','2022-01-12 19:46:46'),('started','player1','draw','2022-01-12 19:47:00'),('started','player2','draw','2022-01-12 19:47:03'),('started','player1','draw','2022-01-12 19:47:08'),('started','player2','draw','2022-01-12 19:47:10'),('started','player1','draw','2022-01-12 19:47:12'),('started','player2','draw','2022-01-12 19:47:15'),('started','player1','draw','2022-01-12 19:47:17'),('started','player2','draw','2022-01-12 19:47:19'),('started','player2','draw','2022-01-12 19:47:53'),('started','player1','draw','2022-01-12 19:48:52'),('started','player2','draw','2022-01-12 19:49:17'),('started','player1','draw','2022-01-12 19:52:16'),('started','player2','draw','2022-01-12 19:52:19'),('started','player1','draw','2022-01-12 19:52:22'),('started','player2','draw','2022-01-12 19:52:25'),('started','player2','draw','2022-01-12 19:55:45'),('started','player1','draw','2022-01-12 19:56:15'),('started','player2','draw','2022-01-12 19:57:56'),('started','player1','draw','2022-01-12 19:58:39'),('started','player2','draw','2022-01-12 19:58:42'),('started','player1','draw','2022-01-12 19:59:44'),('started','player1','draw','2022-01-12 20:03:58'),('started','player1','draw','2022-01-12 20:06:07'),('started','player2','draw','2022-01-12 20:06:41'),('started','player1','draw','2022-01-12 20:06:55'),('started','player1','draw','2022-01-12 20:09:30'),('started','player2','draw','2022-01-12 20:09:46'),('started','player1','draw','2022-01-12 20:10:31'),('started','player2','draw','2022-01-12 20:11:13'),('started','player1','draw','2022-01-12 20:12:45'),('started','player2','draw','2022-01-12 20:14:52'),('started','player1','draw','2022-01-12 20:15:44'),('started','player1','draw','2022-01-12 20:24:16'),('started','player2','draw','2022-01-12 20:24:30'),('started','player1','draw','2022-01-12 20:24:42'),('started','player2','draw','2022-01-12 20:25:47'),('started','player1','draw','2022-01-12 20:28:50'),('started','player1','draw','2022-01-12 20:34:42'),('started','player1','draw','2022-01-12 20:55:42'),('started','player2','draw','2022-01-12 20:55:44'),('started','player1','draw','2022-01-12 20:57:59'),('started','player1','draw','2022-01-12 20:58:31'),('started','player2','draw','2022-01-12 20:59:19'),('started','player2','draw','2022-01-14 10:15:35'),('started','player1','draw','2022-01-14 10:16:57'),('started','player2','draw','2022-01-14 10:17:47'),('started','player2','draw','2022-01-14 10:18:04'),('started','player1','draw','2022-01-14 10:18:47'),('started','player1','draw','2022-01-14 10:19:35'),('started','player2','draw','2022-01-14 10:19:38'),('started','player1','draw','2022-01-14 10:21:45'),('started','player1','draw','2022-01-14 10:23:23'),('started','player1','draw','2022-01-14 10:38:28'),('started','player1','draw','2022-01-14 10:43:15'),('started','player1','draw','2022-01-14 10:48:59'),('started','player2','draw','2022-01-14 14:11:16'),('started','player1','draw','2022-01-14 14:12:45'),('started','player2','draw','2022-01-14 14:13:07'),('started','player1','draw','2022-01-14 14:13:30'),('started','player2','draw','2022-01-14 14:14:39'),('started','player2','draw','2022-01-14 14:18:27'),('started','player1','draw','2022-01-14 14:19:30'),('started','player2','draw','2022-01-14 14:22:37'),('started','player1','draw','2022-01-14 14:24:39'),('started','player2','draw','2022-01-14 14:30:00'),('started','player1','draw','2022-01-14 14:30:09'),('started','player2','draw','2022-01-14 14:30:13'),('started','player1','draw','2022-01-14 14:30:14'),('started','player2','draw','2022-01-14 14:30:20'),('started','player2','draw','2022-01-14 14:31:11'),('started','player1','draw','2022-01-14 14:31:13'),('started','player2','draw','2022-01-14 14:31:18'),('started','player1','draw','2022-01-14 14:31:24'),('started','player1','draw','2022-01-14 14:34:21'),('started','player2','draw','2022-01-14 14:35:25'),('started','player1','draw','2022-01-14 14:35:28'),('started','player2','draw','2022-01-14 14:35:30'),('started','player1','draw','2022-01-14 14:35:36'),('started','player2','draw','2022-01-14 14:35:39'),('started','player1','draw','2022-01-14 14:39:11'),('started','player2','draw','2022-01-14 14:39:14'),('started','player1','draw','2022-01-14 14:39:17'),('started','player2','draw','2022-01-14 14:39:18'),('started','player2','draw','2022-01-14 14:41:22'),('started','player1','draw','2022-01-14 14:41:46'),('started','player1','draw','2022-01-14 14:42:23'),('started','player1','draw','2022-01-14 14:42:50'),('started','player1','draw','2022-01-14 14:43:29'),('started','player2','draw','2022-01-14 14:43:33'),('started','player1','draw','2022-01-14 14:43:34'),('started','player2','draw','2022-01-14 15:01:59'),('started','player2','draw','2022-01-14 15:04:21'),('started','player1','draw','2022-01-14 15:04:23'),('started','player2','draw','2022-01-14 15:05:04'),('started','player1','draw','2022-01-14 15:05:16'),('started','player2','draw','2022-01-14 15:07:33'),('started','player1','draw','2022-01-14 15:07:59'),('started','player2','draw','2022-01-14 15:08:02'),('started','player2','draw','2022-01-14 15:08:20'),('started','player2','draw','2022-01-14 15:09:32'),('started','player1','draw','2022-01-14 15:09:37'),('started','player2','draw','2022-01-14 15:09:52'),('started','player1','draw','2022-01-14 15:12:47'),('started','player1','draw','2022-01-14 15:13:04'),('started','player2','draw','2022-01-14 15:13:08'),('started','player1','draw','2022-01-14 15:13:20'),('started','player2','draw','2022-01-14 15:13:22'),('started','player1','draw','2022-01-14 15:13:23'),('started','player2','draw','2022-01-14 15:13:24'),('started','player1','draw','2022-01-14 15:22:13'),('started','player2','draw','2022-01-14 15:26:00'),('started','player1','draw','2022-01-14 15:26:05'),('started','player2','draw','2022-01-14 15:26:27'),('started','player1','draw','2022-01-14 15:26:31'),('started','player2','draw','2022-01-14 15:27:36'),('started','player1','draw','2022-01-14 15:27:40'),('started','player2','draw','2022-01-14 15:27:50'),('started','player1','draw','2022-01-14 15:28:09'),('started','player2','draw','2022-01-14 15:30:31'),('started','player2','draw','2022-01-14 15:31:18'),('started','player1','draw','2022-01-14 15:31:21'),('started','player1','draw','2022-01-14 18:18:09'),('aborted','player2','draw','2022-01-14 18:18:12'),('started','player2','draw','2022-01-14 18:23:34'),('aborted','player1','draw','2022-01-14 19:00:28'),('aborted','player1','draw','2022-01-14 19:07:25'),('aborted','player2','draw','2022-01-14 19:14:34'),('aborted','player1','draw','2022-01-14 19:15:38'),('aborted','player2','draw','2022-01-14 19:18:08'),('aborted','player2','draw','2022-01-14 19:24:19'),('aborted','player1','draw','2022-01-14 19:26:36'),('aborted','player1','draw','2022-01-14 19:34:44'),('aborted','player1','draw','2022-01-14 19:37:45'),('aborted','player1','draw','2022-01-14 19:42:55'),('aborted','player2','draw','2022-01-14 19:49:59'),('aborted','player1','draw','2022-01-14 19:54:43'),('aborted','player1','draw','2022-01-14 20:03:05'),('aborted','player1','draw','2022-01-14 20:07:39'),('aborted','player1','draw','2022-01-14 20:13:33'),('aborted','player2','draw','2022-01-14 20:28:33'),('aborted','player1','draw','2022-01-14 20:30:47'),('aborted','player2','draw','2022-01-14 20:31:26'),('aborted','player1','draw','2022-01-14 20:32:21'),('aborted','player1','draw','2022-01-14 20:36:07');
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
INSERT INTO `users` VALUES (1,'voula','abc',1),(2,'ganosi','abc',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'adise'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `callStoredProcedure` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `callStoredProcedure` ON SCHEDULE EVERY 1 MINUTE STARTS '2022-01-14 22:36:02' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
        CALL FindIfGameAborted();
      END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'adise'
--
/*!50003 DROP PROCEDURE IF EXISTS `FindIfGameAborted` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FindIfGameAborted`()
BEGIN
    DECLARE endTime timestamp DEFAULT now();
    
    REPEAT
        SET SQL_SAFE_UPDATES = 0;
      update game_status set status = 'aborted'
		where exists (
		SELECT ROUND((UNIX_TIMESTAMP() - UNIX_TIMESTAMP(last_change)) / 60) > 1
		from (select * from game_status ) as gs
		order by last_change desc limit 1
		) and last_change = ( select last_change from (select * from game_status) as tbl order by last_change desc limit 1 )
		;
    UNTIL endTime < now() + INTERVAL 1 MONTH
    END REPEAT;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RepeatDemo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RepeatDemo`()
BEGIN
    DECLARE endTime timestamp DEFAULT now();
    
    REPEAT
        SET SQL_SAFE_UPDATES = 0;
      update game_status set status = 'aborted'
		where exists (
		SELECT ROUND((UNIX_TIMESTAMP() - UNIX_TIMESTAMP(last_change)) / 60) > 1
		from (select * from game_status ) as gs
		order by last_change desc limit 1
		) and last_change = ( select last_change from (select * from game_status) as tbl order by last_change desc limit 1 )
		;
    UNTIL endTime < now() + INTERVAL 1 MONTH
    END REPEAT;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-14 22:43:59
