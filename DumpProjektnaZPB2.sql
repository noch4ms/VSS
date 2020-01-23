-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ambulanta`
--

DROP TABLE IF EXISTS `ambulanta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ambulanta` (
  `id_ambulanta` int(11) NOT NULL,
  `naziv_ambulanta` varchar(45) DEFAULT NULL,
  `naslov` varchar(45) DEFAULT NULL,
  `idposta` int(11) NOT NULL,
  PRIMARY KEY (`id_ambulanta`),
  KEY `fk_ambulanta_posta1_idx` (`idposta`),
  CONSTRAINT `fk_ambulanta_posta1` FOREIGN KEY (`idposta`) REFERENCES `posta` (`idposta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambulanta`
--

LOCK TABLES `ambulanta` WRITE;
/*!40000 ALTER TABLE `ambulanta` DISABLE KEYS */;
INSERT INTO `ambulanta` VALUES (1,'Prva ambulanta','Juša 20',1),(2,'Druga ambulanta','Pepe 42',2),(3,'Tretja ambulanta','Ononono 11',3);
/*!40000 ALTER TABLE `ambulanta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baze`
--

DROP TABLE IF EXISTS `baze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `baze` (
  `idbaze` int(11) NOT NULL,
  `naziv` varchar(45) DEFAULT NULL,
  `kolicina` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idbaze`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baze`
--

LOCK TABLES `baze` WRITE;
/*!40000 ALTER TABLE `baze` DISABLE KEYS */;
INSERT INTO `baze` VALUES (1,'Olivno olje','9746'),(2,'Belobaza','10000'),(3,'Nutbutter','6549');
/*!40000 ALTER TABLE `baze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doktor`
--

DROP TABLE IF EXISTS `doktor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `doktor` (
  `iddoktor` int(11) NOT NULL,
  `ime` varchar(45) DEFAULT NULL,
  `priimek` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddoktor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doktor`
--

LOCK TABLES `doktor` WRITE;
/*!40000 ALTER TABLE `doktor` DISABLE KEYS */;
INSERT INTO `doktor` VALUES (1,'Doc','Merkur'),(2,'Donny','Baby'),(3,'Rock','Smashing');
/*!40000 ALTER TABLE `doktor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doktor_ambul`
--

DROP TABLE IF EXISTS `doktor_ambul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `doktor_ambul` (
  `iddoktor` int(11) NOT NULL,
  `id_ambulanta` int(11) NOT NULL,
  PRIMARY KEY (`iddoktor`,`id_ambulanta`),
  KEY `fk_doktor_has_ambulanta_ambulanta1_idx` (`id_ambulanta`),
  KEY `fk_doktor_has_ambulanta_doktor1_idx` (`iddoktor`),
  CONSTRAINT `fk_doktor_has_ambulanta_ambulanta1` FOREIGN KEY (`id_ambulanta`) REFERENCES `ambulanta` (`id_ambulanta`),
  CONSTRAINT `fk_doktor_has_ambulanta_doktor1` FOREIGN KEY (`iddoktor`) REFERENCES `doktor` (`iddoktor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doktor_ambul`
--

LOCK TABLES `doktor_ambul` WRITE;
/*!40000 ALTER TABLE `doktor_ambul` DISABLE KEYS */;
INSERT INTO `doktor_ambul` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `doktor_ambul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doktor_has_specializacija`
--

DROP TABLE IF EXISTS `doktor_has_specializacija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `doktor_has_specializacija` (
  `iddoktor` int(11) NOT NULL,
  `idspecializacija` int(11) NOT NULL,
  PRIMARY KEY (`iddoktor`,`idspecializacija`),
  KEY `fk_doktor_has_specializacija_specializacija1_idx` (`idspecializacija`),
  KEY `fk_doktor_has_specializacija_doktor1_idx` (`iddoktor`),
  CONSTRAINT `fk_doktor_has_specializacija_doktor1` FOREIGN KEY (`iddoktor`) REFERENCES `doktor` (`iddoktor`),
  CONSTRAINT `fk_doktor_has_specializacija_specializacija1` FOREIGN KEY (`idspecializacija`) REFERENCES `specializacija` (`idspecializacija`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doktor_has_specializacija`
--

LOCK TABLES `doktor_has_specializacija` WRITE;
/*!40000 ALTER TABLE `doktor_has_specializacija` DISABLE KEYS */;
INSERT INTO `doktor_has_specializacija` VALUES (1,1),(1,2),(2,2),(3,3);
/*!40000 ALTER TABLE `doktor_has_specializacija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kartoteka`
--

DROP TABLE IF EXISTS `kartoteka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `kartoteka` (
  `idkartoteka` int(11) NOT NULL,
  `EMSO` int(11) NOT NULL,
  `id_ambulanta` int(11) NOT NULL,
  PRIMARY KEY (`idkartoteka`),
  KEY `fk_kartoteka_pacienti1_idx` (`EMSO`),
  KEY `fk_kartoteka_ambulanta1_idx` (`id_ambulanta`),
  CONSTRAINT `fk_kartoteka_ambulanta1` FOREIGN KEY (`id_ambulanta`) REFERENCES `ambulanta` (`id_ambulanta`),
  CONSTRAINT `fk_kartoteka_pacienti1` FOREIGN KEY (`EMSO`) REFERENCES `pacienti` (`EMSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kartoteka`
--

LOCK TABLES `kartoteka` WRITE;
/*!40000 ALTER TABLE `kartoteka` DISABLE KEYS */;
INSERT INTO `kartoteka` VALUES (1,1,1),(2,2,2),(3,3,3);
/*!40000 ALTER TABLE `kartoteka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_del_ambul`
--

DROP TABLE IF EXISTS `med_del_ambul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `med_del_ambul` (
  `id_meddel` int(11) NOT NULL,
  `id_ambulanta` int(11) NOT NULL,
  PRIMARY KEY (`id_meddel`,`id_ambulanta`),
  KEY `fk_sestre_brati_has_ambulanta_ambulanta1_idx` (`id_ambulanta`),
  KEY `fk_sestre_brati_has_ambulanta_sestre_brati1_idx` (`id_meddel`),
  CONSTRAINT `fk_sestre_brati_has_ambulanta_ambulanta1` FOREIGN KEY (`id_ambulanta`) REFERENCES `ambulanta` (`id_ambulanta`),
  CONSTRAINT `fk_sestre_brati_has_ambulanta_sestre_brati1` FOREIGN KEY (`id_meddel`) REFERENCES `sestre_brati` (`id_meddel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_del_ambul`
--

LOCK TABLES `med_del_ambul` WRITE;
/*!40000 ALTER TABLE `med_del_ambul` DISABLE KEYS */;
INSERT INTO `med_del_ambul` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `med_del_ambul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `naroceni`
--

DROP TABLE IF EXISTS `naroceni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `naroceni` (
  `idNaroceni` int(11) NOT NULL,
  `datum` date DEFAULT NULL,
  `ura` time DEFAULT NULL,
  PRIMARY KEY (`idNaroceni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `naroceni`
--

LOCK TABLES `naroceni` WRITE;
/*!40000 ALTER TABLE `naroceni` DISABLE KEYS */;
INSERT INTO `naroceni` VALUES (1,'2001-01-20','11:35:00'),(2,'2002-02-20','09:00:00'),(3,'2003-03-20','09:00:00'),(4,'2002-03-20','11:30:00');
/*!40000 ALTER TABLE `naroceni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `naroceni_has_kartoteka`
--

DROP TABLE IF EXISTS `naroceni_has_kartoteka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `naroceni_has_kartoteka` (
  `idNaroceni` int(11) NOT NULL,
  `idkartoteka` int(11) NOT NULL,
  PRIMARY KEY (`idNaroceni`,`idkartoteka`),
  KEY `fk_naroceni_has_kartoteka_kartoteka1_idx` (`idkartoteka`),
  KEY `fk_naroceni_has_kartoteka_naroceni1_idx` (`idNaroceni`),
  CONSTRAINT `fk_naroceni_has_kartoteka_kartoteka1` FOREIGN KEY (`idkartoteka`) REFERENCES `kartoteka` (`idkartoteka`),
  CONSTRAINT `fk_naroceni_has_kartoteka_naroceni1` FOREIGN KEY (`idNaroceni`) REFERENCES `naroceni` (`idNaroceni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `naroceni_has_kartoteka`
--

LOCK TABLES `naroceni_has_kartoteka` WRITE;
/*!40000 ALTER TABLE `naroceni_has_kartoteka` DISABLE KEYS */;
INSERT INTO `naroceni_has_kartoteka` VALUES (1,1),(4,1),(2,2),(3,3);
/*!40000 ALTER TABLE `naroceni_has_kartoteka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nezdravo_stanje`
--

DROP TABLE IF EXISTS `nezdravo_stanje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nezdravo_stanje` (
  `id_stanja` int(11) NOT NULL,
  `mesto` varchar(45) DEFAULT NULL,
  `naziv_stanja` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_stanja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nezdravo_stanje`
--

LOCK TABLES `nezdravo_stanje` WRITE;
/*!40000 ALTER TABLE `nezdravo_stanje` DISABLE KEYS */;
INSERT INTO `nezdravo_stanje` VALUES (1,'Podlaht','Opeklina'),(2,'Čelo','Mozolji'),(3,'Podplat','Kurje Oko');
/*!40000 ALTER TABLE `nezdravo_stanje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nezdravo_stanje_has_pregled`
--

DROP TABLE IF EXISTS `nezdravo_stanje_has_pregled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nezdravo_stanje_has_pregled` (
  `id_stanja` int(11) NOT NULL,
  `idpregled` int(11) NOT NULL,
  PRIMARY KEY (`id_stanja`,`idpregled`),
  KEY `fk_nezdravo_stanje_has_pregled_pregled1_idx` (`idpregled`),
  KEY `fk_nezdravo_stanje_has_pregled_nezdravo_stanje1_idx` (`id_stanja`),
  CONSTRAINT `fk_nezdravo_stanje_has_pregled_nezdravo_stanje1` FOREIGN KEY (`id_stanja`) REFERENCES `nezdravo_stanje` (`id_stanja`),
  CONSTRAINT `fk_nezdravo_stanje_has_pregled_pregled1` FOREIGN KEY (`idpregled`) REFERENCES `pregled` (`idpregled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nezdravo_stanje_has_pregled`
--

LOCK TABLES `nezdravo_stanje_has_pregled` WRITE;
/*!40000 ALTER TABLE `nezdravo_stanje_has_pregled` DISABLE KEYS */;
INSERT INTO `nezdravo_stanje_has_pregled` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `nezdravo_stanje_has_pregled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacienti`
--

DROP TABLE IF EXISTS `pacienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pacienti` (
  `EMSO` int(11) NOT NULL,
  `ime` varchar(45) DEFAULT NULL,
  `priimek` varchar(45) DEFAULT NULL,
  `rojen` varchar(45) DEFAULT NULL,
  `naslov` varchar(45) DEFAULT NULL,
  `idposta` int(11) NOT NULL,
  PRIMARY KEY (`EMSO`),
  KEY `fk_pacienti_posta1_idx` (`idposta`),
  CONSTRAINT `fk_pacienti_posta1` FOREIGN KEY (`idposta`) REFERENCES `posta` (`idposta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacienti`
--

LOCK TABLES `pacienti` WRITE;
/*!40000 ALTER TABLE `pacienti` DISABLE KEYS */;
INSERT INTO `pacienti` VALUES (1,'Nisem','Bolan','1.1.2020','Vseeno C. 19',1),(2,'Boli','Noga','2.2.20202','Ul. Vseeno',2),(3,'Pije','Kavo','3.3.2020','Okr. Opala',3);
/*!40000 ALTER TABLE `pacienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posta`
--

DROP TABLE IF EXISTS `posta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `posta` (
  `idposta` int(11) NOT NULL,
  `nazivposta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idposta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posta`
--

LOCK TABLES `posta` WRITE;
/*!40000 ALTER TABLE `posta` DISABLE KEYS */;
INSERT INTO `posta` VALUES (1,'Murska Sobota'),(2,'Maribor'),(3,'Ljubljana');
/*!40000 ALTER TABLE `posta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregled`
--

DROP TABLE IF EXISTS `pregled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pregled` (
  `idpregled` int(11) NOT NULL,
  `datum` varchar(10) DEFAULT NULL,
  `cas_pregleda` time DEFAULT NULL,
  `anamneza` varchar(45) DEFAULT NULL,
  `diagnoza` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpregled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregled`
--

LOCK TABLES `pregled` WRITE;
/*!40000 ALTER TABLE `pregled` DISABLE KEYS */;
INSERT INTO `pregled` VALUES (1,'1.1.2020','12:30:00','Boli me to pa to','Boli ga to pa to'),(2,'2.2.2020','09:30:00','Spet me boli','Spet ga boli'),(3,'3.3.2020','11:00:00','Ne boli','Ne boli ga');
/*!40000 ALTER TABLE `pregled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregledi_kartoteka`
--

DROP TABLE IF EXISTS `pregledi_kartoteka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pregledi_kartoteka` (
  `idpregled` int(11) NOT NULL,
  `idkartoteka` int(11) NOT NULL,
  PRIMARY KEY (`idpregled`,`idkartoteka`),
  KEY `fk_pregled_has_kartoteka_kartoteka1_idx` (`idkartoteka`),
  KEY `fk_pregled_has_kartoteka_pregled1_idx` (`idpregled`),
  CONSTRAINT `fk_pregled_has_kartoteka_kartoteka1` FOREIGN KEY (`idkartoteka`) REFERENCES `kartoteka` (`idkartoteka`),
  CONSTRAINT `fk_pregled_has_kartoteka_pregled1` FOREIGN KEY (`idpregled`) REFERENCES `pregled` (`idpregled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregledi_kartoteka`
--

LOCK TABLES `pregledi_kartoteka` WRITE;
/*!40000 ALTER TABLE `pregledi_kartoteka` DISABLE KEYS */;
INSERT INTO `pregledi_kartoteka` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `pregledi_kartoteka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pripravniki`
--

DROP TABLE IF EXISTS `pripravniki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pripravniki` (
  `idpripravniki` int(11) NOT NULL,
  `ime` varchar(45) DEFAULT NULL,
  `priimek` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpripravniki`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pripravniki`
--

LOCK TABLES `pripravniki` WRITE;
/*!40000 ALTER TABLE `pripravniki` DISABLE KEYS */;
INSERT INTO `pripravniki` VALUES (1,'Prvi','Pripravnik'),(2,'Drugi','Pripravnik'),(3,'Tretji','Pripravnik');
/*!40000 ALTER TABLE `pripravniki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pripravniki_has_ambulanta`
--

DROP TABLE IF EXISTS `pripravniki_has_ambulanta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pripravniki_has_ambulanta` (
  `idpripravniki` int(11) NOT NULL,
  `id_ambulanta` int(11) NOT NULL,
  PRIMARY KEY (`idpripravniki`,`id_ambulanta`),
  KEY `fk_pripravniki_has_ambulanta_ambulanta1_idx` (`id_ambulanta`),
  KEY `fk_pripravniki_has_ambulanta_pripravniki1_idx` (`idpripravniki`),
  CONSTRAINT `fk_pripravniki_has_ambulanta_ambulanta1` FOREIGN KEY (`id_ambulanta`) REFERENCES `ambulanta` (`id_ambulanta`),
  CONSTRAINT `fk_pripravniki_has_ambulanta_pripravniki1` FOREIGN KEY (`idpripravniki`) REFERENCES `pripravniki` (`idpripravniki`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pripravniki_has_ambulanta`
--

LOCK TABLES `pripravniki_has_ambulanta` WRITE;
/*!40000 ALTER TABLE `pripravniki_has_ambulanta` DISABLE KEYS */;
INSERT INTO `pripravniki_has_ambulanta` VALUES (1,1),(1,2),(2,2),(3,3);
/*!40000 ALTER TABLE `pripravniki_has_ambulanta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepti`
--

DROP TABLE IF EXISTS `recepti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recepti` (
  `idrecepti` int(11) NOT NULL,
  `datum` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`idrecepti`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepti`
--

LOCK TABLES `recepti` WRITE;
/*!40000 ALTER TABLE `recepti` DISABLE KEYS */;
INSERT INTO `recepti` VALUES (1,'2002-02-20 20:00:00.000000'),(2,'2003-02-20 20:00:00.000000'),(3,'2004-02-20 20:00:00.000000'),(4,'2005-02-20 20:00:00.000000'),(5,'2005-02-20 20:00:00.000000'),(6,'2006-02-20 20:00:00.000000'),(7,'2007-02-20 20:00:00.000000'),(8,'2008-02-20 20:00:00.000000'),(9,'2009-02-20 20:00:00.000000'),(10,'2010-02-20 20:00:00.000000');
/*!40000 ALTER TABLE `recepti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepti_has_baze`
--

DROP TABLE IF EXISTS `recepti_has_baze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recepti_has_baze` (
  `idrecepti` int(11) NOT NULL,
  `idbaze` int(11) NOT NULL,
  `kolicina_baze` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrecepti`,`idbaze`),
  KEY `fk_recepti_has_baze_baze1_idx` (`idbaze`),
  KEY `fk_recepti_has_baze_recepti1_idx` (`idrecepti`),
  CONSTRAINT `fk_recepti_has_baze_baze1` FOREIGN KEY (`idbaze`) REFERENCES `baze` (`idbaze`),
  CONSTRAINT `fk_recepti_has_baze_recepti1` FOREIGN KEY (`idrecepti`) REFERENCES `recepti` (`idrecepti`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepti_has_baze`
--

LOCK TABLES `recepti_has_baze` WRITE;
/*!40000 ALTER TABLE `recepti_has_baze` DISABLE KEYS */;
INSERT INTO `recepti_has_baze` VALUES (1,1,'254'),(2,3,'2340'),(3,3,'1111');
/*!40000 ALTER TABLE `recepti_has_baze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepti_has_kartoteka`
--

DROP TABLE IF EXISTS `recepti_has_kartoteka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recepti_has_kartoteka` (
  `idrecepti` int(11) NOT NULL,
  `idkartoteka` int(11) NOT NULL,
  PRIMARY KEY (`idrecepti`,`idkartoteka`),
  KEY `fk_recepti_has_kartoteka_kartoteka1_idx` (`idkartoteka`),
  KEY `fk_recepti_has_kartoteka_recepti1_idx` (`idrecepti`),
  CONSTRAINT `fk_recepti_has_kartoteka_kartoteka1` FOREIGN KEY (`idkartoteka`) REFERENCES `kartoteka` (`idkartoteka`),
  CONSTRAINT `fk_recepti_has_kartoteka_recepti1` FOREIGN KEY (`idrecepti`) REFERENCES `recepti` (`idrecepti`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepti_has_kartoteka`
--

LOCK TABLES `recepti_has_kartoteka` WRITE;
/*!40000 ALTER TABLE `recepti_has_kartoteka` DISABLE KEYS */;
INSERT INTO `recepti_has_kartoteka` VALUES (1,1),(3,1),(5,2),(5,3);
/*!40000 ALTER TABLE `recepti_has_kartoteka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepti_has_ucinkovine`
--

DROP TABLE IF EXISTS `recepti_has_ucinkovine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recepti_has_ucinkovine` (
  `idrecepti` int(11) NOT NULL,
  `iducinkovine` int(11) NOT NULL,
  `kolicina_ucinkovine` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrecepti`,`iducinkovine`),
  KEY `fk_recepti_has_ucinkovine_ucinkovine1_idx` (`iducinkovine`),
  KEY `fk_recepti_has_ucinkovine_recepti1_idx` (`idrecepti`),
  CONSTRAINT `fk_recepti_has_ucinkovine_recepti1` FOREIGN KEY (`idrecepti`) REFERENCES `recepti` (`idrecepti`),
  CONSTRAINT `fk_recepti_has_ucinkovine_ucinkovine1` FOREIGN KEY (`iducinkovine`) REFERENCES `ucinkovine` (`iducinkovine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepti_has_ucinkovine`
--

LOCK TABLES `recepti_has_ucinkovine` WRITE;
/*!40000 ALTER TABLE `recepti_has_ucinkovine` DISABLE KEYS */;
INSERT INTO `recepti_has_ucinkovine` VALUES (1,1,'222'),(3,2,'111');
/*!40000 ALTER TABLE `recepti_has_ucinkovine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepti_has_zdravila`
--

DROP TABLE IF EXISTS `recepti_has_zdravila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recepti_has_zdravila` (
  `idrecepti` int(11) NOT NULL,
  `idzdravila` int(11) NOT NULL,
  `kolicina_zdravila` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrecepti`,`idzdravila`),
  KEY `fk_recepti_has_zdravila_zdravila1_idx` (`idzdravila`),
  KEY `fk_recepti_has_zdravila_recepti1_idx` (`idrecepti`),
  CONSTRAINT `fk_recepti_has_zdravila_recepti1` FOREIGN KEY (`idrecepti`) REFERENCES `recepti` (`idrecepti`),
  CONSTRAINT `fk_recepti_has_zdravila_zdravila1` FOREIGN KEY (`idzdravila`) REFERENCES `zdravila` (`idzdravila`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepti_has_zdravila`
--

LOCK TABLES `recepti_has_zdravila` WRITE;
/*!40000 ALTER TABLE `recepti_has_zdravila` DISABLE KEYS */;
INSERT INTO `recepti_has_zdravila` VALUES (1,1,'21'),(2,2,'1111'),(3,2,'555');
/*!40000 ALTER TABLE `recepti_has_zdravila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sestre_brati`
--

DROP TABLE IF EXISTS `sestre_brati`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sestre_brati` (
  `id_meddel` int(11) NOT NULL,
  `ime` varchar(45) DEFAULT NULL,
  `priimek` varchar(45) DEFAULT NULL,
  `idstudij` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_meddel`),
  KEY `fk_sestre_brati_studij1_idx` (`idstudij`),
  CONSTRAINT `fk_sestre_brati_studij1` FOREIGN KEY (`idstudij`) REFERENCES `studij` (`idstudij`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sestre_brati`
--

LOCK TABLES `sestre_brati` WRITE;
/*!40000 ALTER TABLE `sestre_brati` DISABLE KEYS */;
INSERT INTO `sestre_brati` VALUES (1,'Prvi','Del',1),(2,'Drugi','Del',2),(3,'Tretji','Del',3);
/*!40000 ALTER TABLE `sestre_brati` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specializacija`
--

DROP TABLE IF EXISTS `specializacija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `specializacija` (
  `idspecializacija` int(11) NOT NULL,
  `naziv` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idspecializacija`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specializacija`
--

LOCK TABLES `specializacija` WRITE;
/*!40000 ALTER TABLE `specializacija` DISABLE KEYS */;
INSERT INTO `specializacija` VALUES (1,'Spec Ops'),(2,'Cut Master'),(3,'Pediater');
/*!40000 ALTER TABLE `specializacija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studij`
--

DROP TABLE IF EXISTS `studij`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studij` (
  `idstudij` int(11) NOT NULL,
  `naziv_pd` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idstudij`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studij`
--

LOCK TABLES `studij` WRITE;
/*!40000 ALTER TABLE `studij` DISABLE KEYS */;
INSERT INTO `studij` VALUES (1,'Prvi std'),(2,'Drugi std'),(3,'Tretji std');
/*!40000 ALTER TABLE `studij` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ucinkovine`
--

DROP TABLE IF EXISTS `ucinkovine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ucinkovine` (
  `iducinkovine` int(11) NOT NULL,
  `naziv` varchar(45) DEFAULT NULL,
  `kolicina` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iducinkovine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ucinkovine`
--

LOCK TABLES `ucinkovine` WRITE;
/*!40000 ALTER TABLE `ucinkovine` DISABLE KEYS */;
INSERT INTO `ucinkovine` VALUES (1,'Paracetamol','9778'),(2,'RKO','9889'),(3,'Tylenol','10000');
/*!40000 ALTER TABLE `ucinkovine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zdravila`
--

DROP TABLE IF EXISTS `zdravila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zdravila` (
  `idzdravila` int(11) NOT NULL,
  `naziv` varchar(45) DEFAULT NULL,
  `kolicina` varchar(45) DEFAULT NULL,
  `vsebnost_ucinkovine` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idzdravila`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zdravila`
--

LOCK TABLES `zdravila` WRITE;
/*!40000 ALTER TABLE `zdravila` DISABLE KEYS */;
INSERT INTO `zdravila` VALUES (1,'Perc','9979','20mg'),(2,'Mooly','8334','20mg'),(3,'X','10000','20mg'),(4,'2CB','10000','20mg');
/*!40000 ALTER TABLE `zdravila` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-23 11:56:15
