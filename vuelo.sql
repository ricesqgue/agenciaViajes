CREATE DATABASE  IF NOT EXISTS `vuelos` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vuelos`;
-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: vuelos
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1-log

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
-- Table structure for table `aerolinea`
--

DROP TABLE IF EXISTS `aerolinea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aerolinea` (
  `idAerolinea` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAerolinea`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8
/*!50100 PARTITION BY HASH (idAerolinea) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aerolinea`
--

LOCK TABLES `aerolinea` WRITE;
/*!40000 ALTER TABLE `aerolinea` DISABLE KEYS */;
INSERT INTO `aerolinea` VALUES (1,'Aeromexico'),(2,'Volaris'),(3,'American Airlines'),(4,'Delta'),(5,'South West');
/*!40000 ALTER TABLE `aerolinea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `idciudad` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=FEDERATED DEFAULT CHARSET=latin1 CONNECTION='mysql://root:root@148.211.87.113/agenciadeviajes/ciudad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reservacionvuelo`
--

DROP TABLE IF EXISTS `reservacionvuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservacionvuelo` (
  `idReservacionVuelo` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `idVueloIda` int(11) DEFAULT NULL,
  `idVueloRegreso` int(11) DEFAULT NULL,
  `precioTotal` float DEFAULT NULL,
  PRIMARY KEY (`idReservacionVuelo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservacionvuelo`
--

LOCK TABLES `reservacionvuelo` WRITE;
/*!40000 ALTER TABLE `reservacionvuelo` DISABLE KEYS */;
INSERT INTO `reservacionvuelo` VALUES (1,1,3,4,4000),(2,1,16,15,6500),(3,1,3,4,4000),(4,1,37,38,14500),(5,1,3,1,6000);
/*!40000 ALTER TABLE `reservacionvuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vistaVuelos`
--

DROP TABLE IF EXISTS `vistaVuelos`;
/*!50001 DROP VIEW IF EXISTS `vistaVuelos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vistaVuelos` (
  `idAerolinea` tinyint NOT NULL,
  `aerolinea` tinyint NOT NULL,
  `idVueloIda` tinyint NOT NULL,
  `precioIda` tinyint NOT NULL,
  `idVueloRegreso` tinyint NOT NULL,
  `precioVuelta` tinyint NOT NULL,
  `ciudad1` tinyint NOT NULL,
  `ciudad2` tinyint NOT NULL,
  `idCiudad1` tinyint NOT NULL,
  `idCiudad2` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vuelo` (
  `idVuelo` int(11) NOT NULL AUTO_INCREMENT,
  `idAerolinea` int(11) DEFAULT NULL,
  `idCiudadOrigen` int(11) DEFAULT NULL,
  `idCiudadDestino` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVuelo`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
INSERT INTO `vuelo` VALUES (1,1,1,2,4000,250),(2,1,2,1,4500,150),(3,1,1,7,2000,150),(4,1,7,1,2000,200),(5,1,3,5,2500,300),(6,1,5,3,3000,300),(7,1,8,10,4000,200),(8,1,10,8,4500,350),(9,2,1,2,5000,350),(10,2,2,1,4500,200),(11,2,2,3,4500,200),(12,2,3,2,6000,450),(13,2,5,6,8000,250),(14,2,6,5,7000,250),(15,2,7,8,3500,150),(16,2,8,7,3000,150),(17,3,2,4,15000,250),(18,3,4,2,14000,150),(19,3,2,6,7000,450),(20,3,6,2,8000,450),(21,3,6,9,23000,350),(22,3,9,6,22000,150),(23,3,2,8,5000,250),(24,3,8,2,6000,250),(25,4,2,1,4500,250),(26,4,1,2,4000,250),(27,4,4,5,17000,350),(28,4,5,4,15000,450),(29,4,6,10,8500,250),(30,4,10,6,9000,200),(31,4,1,9,12000,100),(32,4,9,1,14000,100),(33,4,7,6,4000,150),(34,4,6,7,3800,350),(35,5,3,2,5300,350),(36,5,2,3,5500,300),(37,5,1,6,8500,50),(38,5,6,1,6000,100),(39,5,2,9,11000,200),(40,5,9,2,12000,200);
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `vistaVuelos`
--

/*!50001 DROP TABLE IF EXISTS `vistaVuelos`*/;
/*!50001 DROP VIEW IF EXISTS `vistaVuelos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaVuelos` AS (select `ida`.`idAerolinea` AS `idAerolinea`,`aerolinea`.`nombre` AS `aerolinea`,`ida`.`idVuelo` AS `idVueloIda`,`ida`.`precio` AS `precioIda`,`regreso`.`idVuelo` AS `idVueloRegreso`,`regreso`.`precio` AS `precioVuelta`,(select `ciudad`.`nombre` from `ciudad` where (`ciudad`.`idciudad` = `ida`.`idCiudadOrigen`)) AS `ciudad1`,(select `ciudad`.`nombre` from `ciudad` where (`ciudad`.`idciudad` = `ida`.`idCiudadDestino`)) AS `ciudad2`,`ida`.`idCiudadOrigen` AS `idCiudad1`,`ida`.`idCiudadDestino` AS `idCiudad2` from ((`vuelo` `ida` join `vuelo` `regreso`) join `aerolinea` on(((`ida`.`idAerolinea` = `regreso`.`idAerolinea`) and (`ida`.`idAerolinea` = `aerolinea`.`idAerolinea`))))) */;
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

-- Dump completed on 2016-06-23 15:53:09
