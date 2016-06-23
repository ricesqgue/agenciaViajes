-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: agenciadeviajes
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitacion` (
  `idHabitacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precioNoche` float DEFAULT NULL,
  `numPersonas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idHabitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion`
--

LOCK TABLES `habitacion` WRITE;
/*!40000 ALTER TABLE `habitacion` DISABLE KEYS */;
INSERT INTO `habitacion` VALUES (1,'Doble',25,700,2),(2,'Triple',25,1200,3),(3,'Cuadruple',25,1800,4),(4,'Suit',25,2400,6);
/*!40000 ALTER TABLE `habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `idHotel` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `categoria` int(11) DEFAULT NULL,
  `idCiudad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idHotel`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'Pedra',2,1),(3,'Asfexias',4,1),(4,'Fiesta Americana',5,1),(5,'One',3,1),(6,'Quinta Real',5,1),(7,'Marriot',5,1),(8,'Marriot',5,2),(9,'Marriot',5,3),(10,'Marriot',5,4),(11,'Marriot',5,5),(12,'Marriot',5,6),(13,'Marriot',5,7),(14,'Marriot',5,8),(15,'Marriot',5,9),(16,'Marriot',5,10),(17,'Holiday inn Express',5,2),(18,'Holiday inn',5,2),(19,'Mr C Beverly Hills',5,2),(20,'Sofitel',4,2),(21,'Le Parc',4,2),(22,'Azul Inn',2,2),(23,'Wingate',3,2),(24,'The Moment',3,2),(25,'Travelodge',3,2),(26,'Studio City Courtyard',3,2),(27,'Hyatt Ziva',5,3),(28,'Hotel 522',1,3),(29,'Las Palmas',4,3),(30,'Fiesta Americana',5,3),(31,'San Marino',4,3),(32,'Villa del Mar',4,3),(33,'Velas',4,3),(34,'Azteca',2,3),(35,'Mercurio',3,3),(36,'Conchas Chinas',4,3),(37,'Vacances Calanque',3,4),(38,'Radisson Blu',4,4),(39,'Bastide Le Jas',5,4),(40,'Mas Malou',3,4),(41,'Chonita',3,5),(42,'Gato Azul',1,5),(43,'Gato Azul Kone',1,5),(44,'Nh Hotel',5,5),(45,'Novit',4,5),(46,'Fiesta Inn',4,5),(47,'Fiesta Inn',4,6),(48,'Hyatt',3,6),(49,'Le Soleil',4,6),(50,'Crowne Plaza',4,6),(51,'Knickerbocker',5,6),(52,'Portofino 207',3,7),(53,'The Palms',3,7),(54,'Casa Rosita',3,8),(55,'Quijote Inn',4,8),(56,'Crowne Plaza Resort',5,8),(57,'Fraser Suites',5,9),(58,'Novotel',4,9),(59,'Le Tourville',4,9),(60,'Marine & Clara',5,9),(61,'Marine & Clara',5,4),(62,'The Cape',4,10),(63,'Pueblo Bueno',5,10),(64,'Quinta del Sol',3,10),(65,'Cabo Inn',2,10),(66,'Casa Dorada',5,10),(67,'Melida',3,10),(68,'Maria Elena',3,10),(69,'Mar de Cortez',3,10);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservacionhotel`
--

DROP TABLE IF EXISTS `reservacionhotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservacionhotel` (
  `idReservacionHotel` int(11) NOT NULL AUTO_INCREMENT,
  `idHotel` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idHabitacion` int(11) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `precioTotal` float DEFAULT NULL,
  PRIMARY KEY (`idReservacionHotel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservacionhotel`
--

LOCK TABLES `reservacionhotel` WRITE;
/*!40000 ALTER TABLE `reservacionhotel` DISABLE KEYS */;
INSERT INTO `reservacionhotel` VALUES (1,13,1,4,'2016-06-01','2016-06-02',2400),(2,13,1,3,'2016-06-23','2016-06-30',12600),(3,53,1,4,'2016-06-23','2016-06-30',16800);
/*!40000 ALTER TABLE `reservacionhotel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-23 13:07:43
