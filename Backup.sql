-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: Companhia
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
-- Table structure for table `Departamento`
--

DROP TABLE IF EXISTS `Departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departamento` (
  `dnome` varchar(15) NOT NULL,
  `dnumero` int NOT NULL,
  `nssger` char(9) NOT NULL DEFAULT '888665555',
  `datinicget` date DEFAULT NULL,
  PRIMARY KEY (`dnumero`),
  UNIQUE KEY `Departamento_nome` (`dnome`),
  KEY `nssger` (`nssger`),
  CONSTRAINT `Departamento_ibfk_1` FOREIGN KEY (`nssger`) REFERENCES `Empregado` (`nss`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departamento`
--

LOCK TABLES `Departamento` WRITE;
/*!40000 ALTER TABLE `Departamento` DISABLE KEYS */;
INSERT INTO `Departamento` VALUES ('Gerencial',1,'888665555','1971-06-19');
/*!40000 ALTER TABLE `Departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dependente`
--

DROP TABLE IF EXISTS `Dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dependente` (
  `nssemp` char(9) NOT NULL,
  `nomeDependente` varchar(15) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `dataniv` date DEFAULT NULL,
  `relacao` char(8) DEFAULT NULL,
  PRIMARY KEY (`nssemp`,`nomeDependente`),
  CONSTRAINT `Dependente_ibfk_1` FOREIGN KEY (`nssemp`) REFERENCES `Empregado` (`nss`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dependente`
--

LOCK TABLES `Dependente` WRITE;
/*!40000 ALTER TABLE `Dependente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empregado`
--

DROP TABLE IF EXISTS `Empregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empregado` (
  `pnome` varchar(15) NOT NULL,
  `mnome` char(1) DEFAULT NULL,
  `snome` varchar(15) NOT NULL,
  `nss` char(9) NOT NULL,
  `datanasc` date DEFAULT NULL,
  `endereco` varchar(30) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `nssuper` char(9) DEFAULT NULL,
  `ndep` int NOT NULL,
  PRIMARY KEY (`nss`),
  KEY `nssuper` (`nssuper`),
  KEY `ndep` (`ndep`),
  CONSTRAINT `Empregado_ibfk_1` FOREIGN KEY (`nssuper`) REFERENCES `Empregado` (`nss`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Empregado_ibfk_2` FOREIGN KEY (`ndep`) REFERENCES `Departamento` (`dnumero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empregado`
--

LOCK TABLES `Empregado` WRITE;
/*!40000 ALTER TABLE `Empregado` DISABLE KEYS */;
INSERT INTO `Empregado` VALUES ('James','E','Borg','888665555','1927-11-10','Av.H.8','M',5500.00,NULL,1);
/*!40000 ALTER TABLE `Empregado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Projeto`
--

DROP TABLE IF EXISTS `Projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Projeto` (
  `pnome` varchar(15) NOT NULL,
  `pnumero` int NOT NULL,
  `plocalizacao` varchar(15) DEFAULT NULL,
  `dnum` int NOT NULL,
  PRIMARY KEY (`pnumero`),
  KEY `dnum` (`dnum`),
  CONSTRAINT `Projeto_ibfk_1` FOREIGN KEY (`dnum`) REFERENCES `Departamento` (`dnumero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Projeto`
--

LOCK TABLES `Projeto` WRITE;
/*!40000 ALTER TABLE `Projeto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locais_depto`
--

DROP TABLE IF EXISTS `locais_depto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locais_depto` (
  `dnumero` int NOT NULL,
  `dlocalizacao` varchar(15) NOT NULL,
  PRIMARY KEY (`dnumero`,`dlocalizacao`),
  CONSTRAINT `locais_depto_ibfk_1` FOREIGN KEY (`dnumero`) REFERENCES `Departamento` (`dnumero`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locais_depto`
--

LOCK TABLES `locais_depto` WRITE;
/*!40000 ALTER TABLE `locais_depto` DISABLE KEYS */;
/*!40000 ALTER TABLE `locais_depto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabalha_em`
--

DROP TABLE IF EXISTS `trabalha_em`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabalha_em` (
  `nssemp` char(9) NOT NULL,
  `pnro` int NOT NULL,
  `horas` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`nssemp`,`pnro`),
  KEY `pnro` (`pnro`),
  CONSTRAINT `trabalha_em_ibfk_1` FOREIGN KEY (`pnro`) REFERENCES `Projeto` (`pnumero`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabalha_em`
--

LOCK TABLES `trabalha_em` WRITE;
/*!40000 ALTER TABLE `trabalha_em` DISABLE KEYS */;
/*!40000 ALTER TABLE `trabalha_em` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-06 15:04:01
