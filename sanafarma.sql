CREATE DATABASE  IF NOT EXISTS `sanafarma` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sanafarma`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: sanafarma
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `idAsistencia` int NOT NULL AUTO_INCREMENT,
  `idEmpleado` int DEFAULT NULL,
  `fecha` date NOT NULL,
  `horaEntrada` time DEFAULT NULL,
  `estadoEntrada` varchar(50) DEFAULT NULL,
  `horaSalida` time DEFAULT NULL,
  `estadoSalida` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idAsistencia`),
  KEY `idEmpleado` (`idEmpleado`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
INSERT INTO `asistencia` VALUES (1,3,'2025-05-25','16:31:03','Retardo','16:31:20','No cumplió jornada laboral');
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nombreCliente` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Ana Lopez Garcia','9514698736','anagarcia@gmail.com'),(2,'Carlos Mnedez Ruiz','9512987232','cmendez@gmail.com'),(3,'Sofia Ramirez Torres','9511457008','sramirezt@gmail.com'),(4,'Juan Perez Gonzalez','9510261126','juanpg@gmail.com'),(5,'Maria Fernandez Castro','9511780011','mariafc2023@gmail.com'),(6,'Miguel Angel Soto','9512367184','miguelitosoto99@gmail.com'),(7,'Maria Jose Gonzalez','9519025332','mjgonzalez@gmail.com'),(8,'Laura Diaz Fernandez','9511145890','ldiazfer@gmail.com'),(9,'Ricardo Silva Perez','9512789540','rsilvap89@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idEmpleado` int NOT NULL AUTO_INCREMENT,
  `nombreEmpleado` varchar(100) NOT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  `horario` varchar(100) DEFAULT NULL,
  `idUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  UNIQUE KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (2,'Lorena Martinez Vera','Cajero','08:00-16:00',NULL),(3,'Luis Morales Santiago','Cajero','08:00-16:00',NULL),(4,'Carlos Manuel Leon Allende','Cobrador','09:00-15:00',NULL),(5,'Irinetzy Garcia Vargas','Cobrador','08:00-16:00',NULL),(6,'Katia Gonzalez Cabrera','Cajero','16:00-23:00',NULL),(7,'Fernanda Perez Caballero','Cobrador','12:00-20:00',NULL),(8,'Roberto Suarez Cruz','Cobrador','12:00-20:00',NULL),(11,'Maria Cruz Cruz','Checador','12:00-20:00',NULL),(12,'Manuel Anaya Valdez','Cobrador','12:00-20:00',NULL),(13,'Maria Pineda Rueda','Cajero','10:00-18:00',NULL),(14,'Alba Cuevas','Cajero','11:00-19:00',NULL),(17,'Gema Lopez','Cajero','12:00-20:00',NULL);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamento` (
  `idMedicamento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `presentacion` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `fechaCaducidad` date DEFAULT NULL,
  `idProveedor` int DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMedicamento`),
  KEY `idProveedor` (`idProveedor`),
  CONSTRAINT `medicamento_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
INSERT INTO `medicamento` VALUES (1,'Paracetamol 500 gm','Utilizado para el tratamiento del \ndolor leve a moderado y la fiebre.','Tableta',50.00,'2025-05-30',1,55),(2,'Ibuprofeno 400 mg','Antiinflamatorio no esteroideo (AINE).\nReduce inflamación, fiebre y dolor.','Tableta',80.00,'2026-05-30',2,23),(3,'Amoxicilina','Antibiótico de amplio espectro. \nTrata diversas infecciones bacterianas.','Cápsula',100.00,'2026-05-21',4,16),(4,'Omeprazol 40 mg','Para gastritis y úlceras gástricas \nen pacientes hospitalizados','Inyección',150.00,'2026-05-13',5,36),(5,'Cloruro de Sodio 500 ml','Reposición de líquidos, diluyente\n para medicamentos','Líquido',60.00,'2027-05-03',4,23);
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idProveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Tempra','9511234564','Calle Morelos, Col Centro Oaxaca','tempra@gmail.com'),(2,'Pfizer','9512304028','Av. Industrial Electrica #6, CDMX','pfizer342@gmail.com'),(3,'PROFARM','9515493029','Privada del Km 540, Núm. 102, Colonia Sauces, Oaxaca de Juárez, Oaxaca','contacto@cmmantequera.com'),(4,'Farmater','2224046256','Privada Benito Juárez 1505, San Bernardino Tlaxcalancingo, San Andrés Cholula, Puebla','servicioaclientes@farmater.com.mx'),(5,'COMECA','9515493029','Privada del Km 540, Núm. 102, Colonia Sauces, Oaxaca de Juárez, Oaxaca','contacto@cmmantequera.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(50) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `rol` varchar(20) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-28 19:35:14
