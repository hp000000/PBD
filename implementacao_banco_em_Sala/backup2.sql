-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: unicornio
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Contem`
--

DROP TABLE IF EXISTS `Contem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contem` (
  `id_Materiais_Utilizados` int DEFAULT NULL,
  `id_Materiais` int DEFAULT NULL,
  KEY `id_Materiais_Utilizados` (`id_Materiais_Utilizados`),
  KEY `id_Materiais` (`id_Materiais`),
  CONSTRAINT `Contem_ibfk_1` FOREIGN KEY (`id_Materiais_Utilizados`) REFERENCES `Materiais_Utilizados` (`id_Utilizados`),
  CONSTRAINT `Contem_ibfk_2` FOREIGN KEY (`id_Materiais`) REFERENCES `Materiais` (`id_Material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contem`
--

LOCK TABLES `Contem` WRITE;
/*!40000 ALTER TABLE `Contem` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Materiais`
--

DROP TABLE IF EXISTS `Materiais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Materiais` (
  `id_Material` int NOT NULL,
  `Descricao` varchar(300) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `local` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_Material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Materiais`
--

LOCK TABLES `Materiais` WRITE;
/*!40000 ALTER TABLE `Materiais` DISABLE KEYS */;
/*!40000 ALTER TABLE `Materiais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Materiais_Utilizados`
--

DROP TABLE IF EXISTS `Materiais_Utilizados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Materiais_Utilizados` (
  `Quantidade` int DEFAULT NULL,
  `id_Utilizados` int NOT NULL,
  `id_OS_Servico` int DEFAULT NULL,
  PRIMARY KEY (`id_Utilizados`),
  KEY `id_OS_Servico` (`id_OS_Servico`),
  CONSTRAINT `Materiais_Utilizados_ibfk_1` FOREIGN KEY (`id_OS_Servico`) REFERENCES `OS_Servico` (`id_OS_Servico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Materiais_Utilizados`
--

LOCK TABLES `Materiais_Utilizados` WRITE;
/*!40000 ALTER TABLE `Materiais_Utilizados` DISABLE KEYS */;
/*!40000 ALTER TABLE `Materiais_Utilizados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OS_Servico`
--

DROP TABLE IF EXISTS `OS_Servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OS_Servico` (
  `id_OS_Servico` int NOT NULL,
  `Data` date DEFAULT NULL,
  `Descricao_OS` varchar(50) DEFAULT NULL,
  `id_Servico` int DEFAULT NULL,
  PRIMARY KEY (`id_OS_Servico`),
  KEY `id_Servico` (`id_Servico`),
  CONSTRAINT `OS_Servico_ibfk_1` FOREIGN KEY (`id_Servico`) REFERENCES `Servico` (`id_servico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OS_Servico`
--

LOCK TABLES `OS_Servico` WRITE;
/*!40000 ALTER TABLE `OS_Servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `OS_Servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Servico`
--

DROP TABLE IF EXISTS `Servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Servico` (
  `id_servico` int NOT NULL,
  PRIMARY KEY (`id_servico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Servico`
--

LOCK TABLES `Servico` WRITE;
/*!40000 ALTER TABLE `Servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `Servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sub_Servico`
--

DROP TABLE IF EXISTS `Sub_Servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sub_Servico` (
  `valor` float DEFAULT NULL,
  `id_Sub_Servico` int NOT NULL,
  `horas` int DEFAULT NULL,
  `id_OS_Servico` int DEFAULT NULL,
  PRIMARY KEY (`id_Sub_Servico`),
  KEY `id_OS_Servico` (`id_OS_Servico`),
  CONSTRAINT `Sub_Servico_ibfk_1` FOREIGN KEY (`id_OS_Servico`) REFERENCES `OS_Servico` (`id_OS_Servico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sub_Servico`
--

LOCK TABLES `Sub_Servico` WRITE;
/*!40000 ALTER TABLE `Sub_Servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sub_Servico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-13 14:58:41
