CREATE DATABASE  IF NOT EXISTS `actividad` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `actividad`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: actividad
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actividad` (
  `idActividad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `idCiudad` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  PRIMARY KEY (`idActividad`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (1,'Cristo Roto',1,499),(2,'Tour zona centro',1,199),(3,'Paseo en Hollywood',2,699),(4,'Long beach',2,799),(5,'Barco pirata',3,650),(6,'Islas marietas',3,1200),(7,'Dewildes house',4,299),(8,'Fishing at the sea',4,800),(9,'Teotihuacan',5,599),(10,'Castillo de Chapultepec',5,399),(11,'Estatua de la libertad',6,599),(12,'Central park',6,599),(13,'Sport fishing',7,799),(14,'Surfing',7,499),(15,'Los portales',8,699),(16,'Casa museo de Agustin Lara',8,299),(17,'Museo del Louvre',9,899),(18,'Buceo',10,645),(19,'Acuario',10,369);
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `idCiudad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCiudad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Aguascalientes'),(2,'Los Angeles'),(3,'Puerto Vallarta'),(4,'Marsella'),(5,'Ciudad de Mexico'),(6,'New York'),(7,'Mazatlan'),(8,'Veracruz'),(9,'Paris'),(10,'Los Cabos');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservacionactividad`
--

DROP TABLE IF EXISTS `reservacionactividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservacionactividad` (
  `idReservacionActividad` int(11) NOT NULL AUTO_INCREMENT,
  `idActividad` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `precioTotal` float DEFAULT NULL,
  PRIMARY KEY (`idReservacionActividad`,`idActividad`,`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservacionactividad`
--

LOCK TABLES `reservacionactividad` WRITE;
/*!40000 ALTER TABLE `reservacionactividad` DISABLE KEYS */;
INSERT INTO `reservacionactividad` VALUES (1,13,1,4794),(2,13,1,3196),(3,14,1,2994),(4,14,1,499);
/*!40000 ALTER TABLE `reservacionactividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidoPat` varchar(45) DEFAULT NULL,
  `apellidomat` varchar(45) DEFAULT NULL
) ENGINE=FEDERATED DEFAULT CHARSET=latin1 CONNECTION='mysql://root:root@148.211.87.113:3306/agenciadeviajes/usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'actividad'
--

--
-- Dumping routines for database 'actividad'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-23 15:45:01
