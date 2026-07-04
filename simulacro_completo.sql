CREATE DATABASE  IF NOT EXISTS `riwi_supply` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `riwi_supply`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: riwi_supply
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'eléctrico'),(2,'plomería'),(3,'plásticos'),(4,'metales'),(5,'construcción'),(6,'materiales'),(7,'ferreteria'),(8,'pinturas'),(9,'electrónica e it'),(10,'aluminio');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_sub_category`
--

DROP TABLE IF EXISTS `category_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_sub_category` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `id_category` tinyint NOT NULL,
  `id_sub_category` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_category` (`id_category`),
  KEY `id_sub_category` (`id_sub_category`),
  CONSTRAINT `category_sub_category_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`),
  CONSTRAINT `category_sub_category_ibfk_2` FOREIGN KEY (`id_sub_category`) REFERENCES `sub_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_sub_category`
--

LOCK TABLES `category_sub_category` WRITE;
/*!40000 ALTER TABLE `category_sub_category` DISABLE KEYS */;
INSERT INTO `category_sub_category` VALUES (1,1,1),(2,2,2),(3,1,3),(4,3,4),(5,4,5),(6,5,6),(7,2,4),(8,5,7),(9,6,6),(10,7,8),(11,8,9),(12,2,10),(13,8,11),(14,8,12),(15,9,3),(16,3,13),(17,9,14),(18,9,15),(19,7,16),(20,10,17),(21,10,5),(22,7,10),(23,4,17),(24,6,7);
/*!40000 ALTER TABLE `category_sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_country` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_country` (`id_country`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'bogotá',1),(2,'barranquilla',1),(3,'medellín',1),(4,'bucaramanga',1),(5,'cali',1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'colombia');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_movement`
--

DROP TABLE IF EXISTS `inventory_movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_movement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_purchase_detail` int NOT NULL,
  `id_warehouse` smallint NOT NULL,
  `id_movement_type` tinyint DEFAULT NULL,
  `movements_quantity` int NOT NULL,
  `current_stock` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_purchase_detail` (`id_purchase_detail`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `id_movement_type` (`id_movement_type`),
  CONSTRAINT `inventory_movement_ibfk_1` FOREIGN KEY (`id_purchase_detail`) REFERENCES `purchase_detail` (`id`),
  CONSTRAINT `inventory_movement_ibfk_2` FOREIGN KEY (`id_warehouse`) REFERENCES `warehouse` (`id`),
  CONSTRAINT `inventory_movement_ibfk_3` FOREIGN KEY (`id_movement_type`) REFERENCES `movement_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_movement`
--

LOCK TABLES `inventory_movement` WRITE;
/*!40000 ALTER TABLE `inventory_movement` DISABLE KEYS */;
INSERT INTO `inventory_movement` VALUES (1,1,2,1,170,17),(2,2,2,1,39,487),(3,3,2,2,26,18),(4,4,3,1,42,124),(5,5,2,1,17,361),(6,6,1,1,138,36),(7,7,3,1,85,432),(8,8,4,2,129,353),(9,9,2,1,59,95),(10,10,3,2,61,492),(11,11,1,2,19,299),(12,12,1,2,81,218),(13,13,3,2,5,490),(14,14,1,1,20,483),(15,15,2,2,75,59),(16,16,4,1,30,344),(17,17,4,2,98,453),(18,18,4,2,25,455),(19,19,1,1,143,258),(20,20,1,2,27,322),(21,21,4,1,55,52),(23,23,2,1,9,472),(24,24,3,1,55,384),(25,25,4,2,10,303),(26,26,1,2,68,81),(27,27,4,2,26,249),(28,28,4,2,36,258),(29,29,1,2,175,99),(30,30,1,1,31,409),(31,31,4,2,2,110),(32,32,3,1,53,270),(34,34,3,1,34,22),(35,35,3,2,16,21),(36,36,3,1,60,334),(37,37,4,2,15,93),(38,38,3,2,162,27),(39,39,3,2,44,94),(40,40,1,1,29,371),(42,42,2,2,43,473),(43,43,3,2,5,322),(45,45,1,2,197,129),(46,46,2,1,6,69),(47,47,4,2,84,139),(48,48,2,1,46,43),(49,49,3,1,101,494),(50,50,2,1,6,318),(51,51,2,1,20,189),(52,52,1,1,149,367),(53,53,2,1,7,164),(54,54,3,1,76,92),(55,55,3,2,61,201),(56,56,3,2,42,175),(57,57,2,2,100,22),(58,58,2,2,24,438),(59,59,2,2,26,392),(60,60,2,2,14,333),(61,61,3,2,153,121),(62,62,2,1,27,106),(63,63,2,1,103,187),(64,64,4,2,21,26),(65,65,4,2,34,362),(66,66,1,1,18,42),(67,67,1,1,32,163),(68,68,2,1,7,88),(69,69,3,2,103,399),(70,70,3,1,100,70),(71,71,4,2,121,159),(73,73,1,1,42,338),(75,75,3,1,2,93),(76,76,4,1,46,142),(77,77,3,1,95,55),(78,78,1,2,90,465),(79,79,1,2,117,248),(80,80,2,2,115,236),(81,81,1,1,138,36),(83,83,2,2,26,18),(84,84,4,2,36,258),(86,86,4,2,36,258);
/*!40000 ALTER TABLE `inventory_movement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure`
--

DROP TABLE IF EXISTS `measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measure` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure`
--

LOCK TABLES `measure` WRITE;
/*!40000 ALTER TABLE `measure` DISABLE KEYS */;
INSERT INTO `measure` VALUES (1,'unidad'),(2,'metros'),(3,'bulto'),(4,'galon'),(5,'ml');
/*!40000 ALTER TABLE `measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movement_type`
--

DROP TABLE IF EXISTS `movement_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movement_type` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movement_type`
--

LOCK TABLES `movement_type` WRITE;
/*!40000 ALTER TABLE `movement_type` DISABLE KEYS */;
INSERT INTO `movement_type` VALUES (1,'entrada'),(2,'salida');
/*!40000 ALTER TABLE `movement_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `id_category_sub_category` tinyint NOT NULL,
  `id_measure` smallint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_category_sub_category` (`id_category_sub_category`),
  KEY `id_measure` (`id_measure`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category_sub_category`) REFERENCES `category_sub_category` (`id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`id_measure`) REFERENCES `measure` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (101,'tornillo hexagonal 1/2 pulgada','tornillo metálico para uso estructural',10,1),(102,'cable utp categoría 6','cable de red categoría 6 para datos',18,2),(103,'tubo pvc 4 pulgadas','tubo de pvc sanitario diámetro 4 pulgadas',4,2),(104,'válvula de paso 1/2 pulgada','válvula de paso en bronce 1/2\"\"',12,1),(105,'pintura base agua blanca 1gl','pintura de caucho base agua color blanco',11,4),(106,'perfil aluminio 1 pulgada x 1 pulgada','perfil de aluminio cuadrado 1 pulgada',5,2),(107,'interruptor simple','interruptor eléctrico sencillo 110v',3,1),(108,'cemento gris 50kg','cemento portland 50 kg',6,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `id_supplier` smallint NOT NULL,
  `total_value` decimal(10,0) NOT NULL,
  `observations` text,
  PRIMARY KEY (`id`),
  KEY `id_supplier` (`id_supplier`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,'2023-07-12',5,1564000,''),(2,'2023-08-25',4,990000,'compra ordinaria'),(3,'2023-10-04',1,1156000,''),(4,'2024-04-27',2,720900,'pedido urgente'),(5,'2024-07-06',6,814000,''),(6,'2024-06-17',5,4968000,'n/a'),(7,'2023-06-16',2,1308300,'compra ordinaria'),(8,'2023-07-18',4,1174800,''),(9,'2023-03-03',1,2016000,'reposición de stock'),(10,'2024-04-11',4,3857000,'ninguna'),(11,'2024-04-07',4,30000,''),(12,'2024-08-24',2,6638500,'pedido urgente'),(13,'2023-12-12',5,1665000,'ok'),(14,'2023-11-28',5,1440000,'compra ordinaria'),(15,'2023-11-10',2,884000,'compra ordinaria'),(16,'2023-05-18',5,999000,'revisar calidad'),(17,'2023-09-17',4,4620000,''),(18,'2024-05-06',1,6825000,'n/a'),(19,'2024-08-11',3,1434400,'pedido urgente'),(20,'2023-06-03',3,4366500,'ok'),(21,'2024-05-31',5,799000,'compra ordinaria'),(23,'2023-02-01',5,10800,'n/a'),(24,'2023-05-24',6,5180000,'revisar calidad'),(25,'2023-04-02',1,124600,'ninguna'),(26,'2024-05-19',3,4732000,'compra ordinaria'),(27,'2024-04-30',5,4987500,'compra ordinaria'),(28,'2023-09-12',4,1420000,''),(29,'2023-04-28',4,1610900,'revisar calidad'),(30,'2024-06-20',2,596300,''),(31,'2024-12-02',1,1173000,'devolución parcial'),(32,'2024-10-16',6,328500,'sin observaciones'),(34,'2023-02-28',5,1335000,'ok'),(35,'2023-05-21',5,175500,'ok'),(36,'2024-07-16',1,1953000,'pedido urgente'),(37,'2024-05-13',2,223200,'pedido urgente'),(38,'2024-10-05',6,2505000,'revisar calidad'),(39,'2024-03-06',4,3163500,'reposición de stock'),(40,'2023-03-23',2,1606500,'compra ordinaria'),(42,'2023-07-18',2,1045500,'ok'),(43,'2023-08-12',5,511500,'pedido urgente'),(45,'2023-06-03',4,875600,'revisar calidad'),(46,'2023-11-14',1,357000,'compra ordinaria'),(47,'2023-03-30',4,4176000,'pedido urgente'),(48,'2024-10-28',4,73200,'pedido urgente'),(49,'2024-02-13',5,6887000,'ninguna'),(50,'2023-08-31',6,111600,'reposición de stock'),(51,'2024-02-14',4,1029000,'ok'),(52,'2024-03-26',5,5915000,'ok'),(53,'2024-01-10',2,168000,'pedido urgente'),(54,'2023-01-26',6,3397500,'revisar calidad'),(55,'2023-03-09',5,2765000,''),(56,'2023-03-12',1,374000,'n/a'),(57,'2023-04-27',5,562500,''),(58,'2023-03-04',1,782000,'reposición de stock'),(59,'2023-05-02',1,301500,'pedido urgente'),(60,'2024-03-28',2,240000,'n/a'),(61,'2024-04-08',3,3611000,''),(62,'2023-10-10',1,338800,'n/a'),(63,'2023-11-09',2,165600,''),(64,'2024-12-01',1,672000,'reposición de stock'),(65,'2024-06-27',1,1503500,'reposición de stock'),(66,'2024-03-20',2,27300,'ok'),(67,'2023-01-23',1,4165000,'compra ordinaria'),(68,'2023-06-20',6,308000,'n/a'),(69,'2023-05-25',2,1121400,'pedido urgente'),(70,'2024-01-23',6,3366000,'ok'),(71,'2024-01-15',4,814200,'ninguna'),(73,'2023-06-29',3,1650000,'devolución parcial'),(75,'2024-03-25',6,115700,'pedido urgente'),(76,'2023-08-28',1,1500000,'ninguna'),(77,'2023-05-05',4,1557500,'ok'),(78,'2023-11-24',5,487600,'pedido urgente'),(79,'2023-07-11',2,4252500,'ok'),(80,'2023-12-06',6,4080000,'');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_detail`
--

DROP TABLE IF EXISTS `purchase_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_purchase` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity_purchased` int NOT NULL,
  `unit_price` decimal(10,0) NOT NULL,
  `sub_total` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_purchase` (`id_purchase`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `purchase_detail_ibfk_1` FOREIGN KEY (`id_purchase`) REFERENCES `purchase` (`id`),
  CONSTRAINT `purchase_detail_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_detail`
--

LOCK TABLES `purchase_detail` WRITE;
/*!40000 ALTER TABLE `purchase_detail` DISABLE KEYS */;
INSERT INTO `purchase_detail` VALUES (1,1,107,184,8500,1564000),(2,2,104,66,15000,990000),(3,3,107,136,8500,1156000),(4,4,103,81,8900,720900),(5,5,106,37,22000,814000),(6,6,108,184,27000,4968000),(7,7,103,147,8900,1308300),(8,8,103,132,8900,1174800),(9,9,108,72,28000,2016000),(10,10,108,133,29000,3857000),(11,11,101,24,1250,30000),(12,12,105,187,35500,6638500),(13,13,104,111,15000,1665000),(14,14,106,64,22500,1440000),(15,15,107,104,8500,884000),(16,16,103,111,9000,999000),(17,17,108,165,28000,4620000),(18,18,105,195,35000,6825000),(19,19,103,163,8800,1434400),(20,20,105,123,35500,4366500),(21,21,107,94,8500,799000),(23,23,101,9,1200,10800),(24,24,105,148,35000,5180000),(25,25,103,14,8900,124600),(26,26,108,169,28000,4732000),(27,27,108,175,28500,4987500),(28,28,105,40,35500,1420000),(29,29,103,181,8900,1610900),(30,30,103,67,8900,596300),(31,31,107,138,8500,1173000),(32,32,102,73,4500,328500),(34,34,104,89,15000,1335000),(35,35,102,39,4500,175500),(36,36,104,126,15500,1953000),(37,37,101,186,1200,223200),(38,38,104,167,15000,2505000),(39,39,108,111,28500,3163500),(40,40,107,189,8500,1606500),(42,42,107,123,8500,1045500),(43,43,104,33,15500,511500),(45,45,102,199,4400,875600),(46,46,106,17,21000,357000),(47,47,105,116,36000,4176000),(48,48,101,61,1200,73200),(49,49,105,194,35500,6887000),(50,50,101,93,1200,111600),(51,51,106,49,21000,1029000),(52,52,105,169,35000,5915000),(53,53,106,8,21000,168000),(54,54,106,151,22500,3397500),(55,55,105,79,35000,2765000),(56,56,107,44,8500,374000),(57,57,102,125,4500,562500),(58,58,106,34,23000,782000),(59,59,102,67,4500,301500),(60,60,104,16,15000,240000),(61,61,106,157,23000,3611000),(62,62,102,77,4400,338800),(63,63,101,144,1150,165600),(64,64,108,24,28000,672000),(65,65,104,97,15500,1503500),(66,66,101,21,1300,27300),(67,67,105,119,35000,4165000),(68,68,108,11,28000,308000),(69,69,103,126,8900,1121400),(70,70,106,153,22000,3366000),(71,71,102,177,4600,814200),(73,73,104,110,15000,1650000),(75,75,103,13,8900,115700),(76,76,104,100,15000,1500000),(77,77,103,175,8900,1557500),(78,78,102,106,4600,487600),(79,79,106,189,22500,4252500),(80,80,105,120,34000,4080000),(81,6,108,184,27000,4968000),(83,3,107,136,8500,1156000),(84,28,105,40,35500,1420000),(86,28,105,40,35500,1420000);
/*!40000 ALTER TABLE `purchase_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category`
--

DROP TABLE IF EXISTS `sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_category` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category`
--

LOCK TABLES `sub_category` WRITE;
/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
INSERT INTO `sub_category` VALUES (1,'controles'),(2,'accesorios'),(3,'interruptores'),(4,'tuberías'),(5,'perfiles'),(6,'cementos'),(7,'aglomerantes'),(8,'tornillos'),(9,'pinturas'),(10,'válvulas'),(11,'acabados'),(12,'pinturas base agua'),(13,'tubos'),(14,'redes'),(15,'cables'),(16,'fijaciones'),(17,'estructuras');
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `nit` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_city` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_city` (`id_city`),
  CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'ferreteria torres s.a.s.','900123456-1','3101234567','ferreteria.torres@gmail.com',1),(2,'distribuidora electronica medellin','800987654-2','3209876543','dist_electronica@gmail.com',3),(3,'plastiflex cali ltda','860456789-3','3154567890','plastiflex@cali.com',5),(4,'suministros industriales del norte','901234567-4','3057891234','suministros.norte@empresa.co',2),(5,'tecno partes ltda.','700345678-5','6014567890','tecnopartes@empresa.com',1),(6,'metales y aleaciones s.a','890654321-6','3168765432','metales@industriacol.com',4);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_city` tinyint NOT NULL,
  `address` varchar(255) NOT NULL,
  `id_warehouse_manager` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_city` (`id_city`),
  KEY `id_warehouse_manager` (`id_warehouse_manager`),
  CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`),
  CONSTRAINT `warehouse_ibfk_2` FOREIGN KEY (`id_warehouse_manager`) REFERENCES `warehouse_manager` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'bodega central bogotá',1,'carrera 30 #15-40',3),(2,'bodega norte barranquilla',2,'calle 80 # 43-20',1),(3,'bodega sur-cali',5,'av. americas #5-30',2),(4,'bodega medellín',3,'carrera 50 #45-67',4);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_manager`
--

DROP TABLE IF EXISTS `warehouse_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_manager` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_manager`
--

LOCK TABLES `warehouse_manager` WRITE;
/*!40000 ALTER TABLE `warehouse_manager` DISABLE KEYS */;
INSERT INTO `warehouse_manager` VALUES (1,'maría pérez'),(2,'andrés gómez'),(3,'carlos rodríguez'),(4,'luisa martínez');
/*!40000 ALTER TABLE `warehouse_manager` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-02 15:07:26
