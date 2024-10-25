-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_reto
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Create DataBase
--


CREATE DATABASE `bd_reto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;


--
-- Table structure for table `tb_usu`
--

DROP TABLE IF EXISTS `tb_usu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usu` (
  `id_usu` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `grupo` varchar(45) DEFAULT NULL,
  `sueldo` int DEFAULT NULL,
  `vivienda` varchar(45) DEFAULT NULL,
  `coche` tinyint(1) DEFAULT NULL,
  `hijos` int DEFAULT NULL,
  PRIMARY KEY (`id_usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `tb_auth`
--

DROP TABLE IF EXISTS `tb_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_auth` (
  `dni` varchar(20) NOT NULL,
  `id_usu` int DEFAULT NULL,
  `contraseña_encriptada` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `rol` enum('cliente','admin') NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `id_usu` (`id_usu`),
  CONSTRAINT `tb_auth_ibfk_1` FOREIGN KEY (`id_usu`) REFERENCES `tb_usu` (`id_usu`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_cta`
--

DROP TABLE IF EXISTS `tb_cta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cta` (
  `id_usu` int NOT NULL,
  `iban` varchar(45) NOT NULL,
  `tipo_cta` varchar(45) NOT NULL,
  `saldo_cta` int NOT NULL,
  `estatus_cta` int NOT NULL,
  PRIMARY KEY (`id_usu`,`iban`),
  CONSTRAINT `fk_tb_ctas_tb_usu` FOREIGN KEY (`id_usu`) REFERENCES `tb_usu` (`id_usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_cta_hucha`
--

DROP TABLE IF EXISTS `tb_cta_hucha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cta_hucha` (
  `id_usu` int NOT NULL,
  `iban` varchar(45) NOT NULL,
  `saldo_cta_hucha` int NOT NULL,
  `recurrencia` varchar(45) NOT NULL,
  `cuota_hucha` int NOT NULL,
  `razon_hucha` varchar(45) NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`id_usu`,`iban`),
  CONSTRAINT `fk_tb_cta_hucha_tb_usu` FOREIGN KEY (`id_usu`) REFERENCES `tb_usu` (`id_usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_trans_banc_ahor`
--

DROP TABLE IF EXISTS `tb_trans_banc_ahor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_trans_banc_ahor` (
  `id_tran_banc` int NOT NULL,
  `id_usu` int NOT NULL,
  `iban` varchar(45) NOT NULL,
  `importe` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_tran_banc`),
  KEY `fk_tb_trans_banc_ahor_tb_usu` (`id_usu`),
  CONSTRAINT `fk_tb_trans_banc_ahor_tb_usu` FOREIGN KEY (`id_usu`) REFERENCES `tb_usu` (`id_usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de transacciones bancarias de ahorro';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_trans_banc_cte`
--

DROP TABLE IF EXISTS `tb_trans_banc_cte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_trans_banc_cte` (
  `id_tran_banc` int NOT NULL,
  `id_usu` int NOT NULL,
  `iban` varchar(45) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `detalle` varchar(45) DEFAULT NULL,
  `importe` int DEFAULT NULL,
  `balance` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_tran_banc`),
  KEY `fk_tb_trans_banc_cte_tb_usu` (`id_usu`),
  CONSTRAINT `fk_tb_trans_banc_cte_tb_usu` FOREIGN KEY (`id_usu`) REFERENCES `tb_usu` (`id_usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de transacciones bancarias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'bd_reto'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-17 19:59:04
