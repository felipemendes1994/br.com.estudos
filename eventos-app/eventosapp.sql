-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: eventosapp
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `convidado`
--

DROP TABLE IF EXISTS `convidado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `convidado` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `rg` varchar(255) NOT NULL,
  `evento_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK4tlkcowf3oxi1u8wmjd9bhes4` (`evento_codigo`),
  CONSTRAINT `FK4tlkcowf3oxi1u8wmjd9bhes4` FOREIGN KEY (`evento_codigo`) REFERENCES `evento` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convidado`
--

LOCK TABLES `convidado` WRITE;
/*!40000 ALTER TABLE `convidado` DISABLE KEYS */;
/*!40000 ALTER TABLE `convidado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `evento` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(255) NOT NULL,
  `horario` varchar(255) NOT NULL,
  `local` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_convidados`
--

DROP TABLE IF EXISTS `evento_convidados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `evento_convidados` (
  `evento_codigo` int(11) NOT NULL,
  `convidados_codigo` int(11) NOT NULL,
  UNIQUE KEY `UK_fdqk431ueda98g26ifyeu99e1` (`convidados_codigo`),
  KEY `FKswhoyqcqepjsh6xjfhrqpclsl` (`evento_codigo`),
  CONSTRAINT `FKmvil3i2u1u7ccuq0hq42d8ry8` FOREIGN KEY (`convidados_codigo`) REFERENCES `convidado` (`codigo`),
  CONSTRAINT `FKswhoyqcqepjsh6xjfhrqpclsl` FOREIGN KEY (`evento_codigo`) REFERENCES `evento` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_convidados`
--

LOCK TABLES `evento_convidados` WRITE;
/*!40000 ALTER TABLE `evento_convidados` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento_convidados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-17 23:30:49
