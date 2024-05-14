-- MariaDB dump 10.19  Distrib 10.5.23-MariaDB, for debian-linux-gnueabihf (armv8l)
--
-- Host: localhost    Database: meshtastic
-- ------------------------------------------------------
-- Server version       10.5.23-MariaDB-0+deb11u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `neighborinfo`
--

DROP TABLE IF EXISTS `neighborinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neighborinfo` (
  `channel` int(1) DEFAULT NULL,
  `from` bigint(10) DEFAULT NULL,
  `hops_away` int(2) DEFAULT NULL,
  `id` bigint(10) DEFAULT NULL,
  `payload_last_sent_by_id` bigint(10) DEFAULT NULL,
  `payload_neighbors` varchar(512) DEFAULT NULL,
  `payload_neighbors_count` int(3) DEFAULT NULL,
  `payload_node_broadcast_interval_secs` int(6) DEFAULT NULL,
  `payload_node_id` bigint(10) DEFAULT NULL,
  `rssi` int(6) DEFAULT NULL,
  `sender` varchar(15) DEFAULT NULL,
  `snr` float DEFAULT NULL,
  `timestamp` bigint(10) DEFAULT NULL,
  `to` bigint(10) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neighborinfo`
--

LOCK TABLES `neighborinfo` WRITE;
/*!40000 ALTER TABLE `neighborinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `neighborinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodeinfo`
--

DROP TABLE IF EXISTS `nodeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodeinfo` (
  `channel` int(1) DEFAULT NULL,
  `from` bigint(10) DEFAULT NULL,
  `hops_away` int(2) DEFAULT NULL,
  `id` bigint(10) DEFAULT NULL,
  `payload_hardware` int(10) DEFAULT NULL,
  `payload_id` varchar(20) DEFAULT NULL,
  `payload_longname` varchar(255) DEFAULT NULL,
  `payload_shortname` varchar(4) DEFAULT NULL,
  `rssi` int(6) DEFAULT NULL,
  `sender` varchar(15) DEFAULT NULL,
  `snr` float DEFAULT NULL,
  `timestamp` bigint(10) DEFAULT NULL,
  `to` bigint(10) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodeinfo`
--

LOCK TABLES `nodeinfo` WRITE;
/*!40000 ALTER TABLE `nodeinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `nodeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `channel` int(1) DEFAULT NULL,
  `from` bigint(10) DEFAULT NULL,
  `hops_away` int(2) DEFAULT NULL,
  `id` bigint(10) DEFAULT NULL,
  `payload_altitude` int(6) DEFAULT NULL,
  `payload_latitude_i` bigint(10) DEFAULT NULL,
  `payload_longitude_i` bigint(10) DEFAULT NULL,
  `payload_precision_bits` int(4) DEFAULT NULL,
  `payload_time` bigint(10) DEFAULT NULL,
  `payload_PDOP` varchar(255) DEFAULT NULL,
  `payload_ground_speed` bigint(10) DEFAULT NULL,
  `payload_ground_track` bigint(10) DEFAULT NULL,
  `payload_sats_in_view` int(10) DEFAULT NULL,
  `rssi` int(6) DEFAULT NULL,
  `sender` varchar(15) DEFAULT NULL,
  `snr` float DEFAULT NULL,
  `timestamp` bigint(10) DEFAULT NULL,
  `to` bigint(10) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telemetry`
--

DROP TABLE IF EXISTS `telemetry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telemetry` (
  `channel` int(1) DEFAULT NULL,
  `from` bigint(10) DEFAULT NULL,
  `hops_away` int(2) DEFAULT NULL,
  `id` bigint(10) DEFAULT NULL,
  `payload_air_util_tx` float DEFAULT NULL,
  `payload_battery_level` float DEFAULT NULL,
  `payload_channel_utilization` float DEFAULT NULL,
  `payload_uptime_seconds` bigint(10) DEFAULT NULL,
  `payload_voltage` float DEFAULT NULL,
  `payload_barometric_pressure` float DEFAULT NULL,
  `payload_current` float DEFAULT NULL,
  `payload_gas_resistance` float DEFAULT NULL,
  `payload_relative_humidity` float DEFAULT NULL,
  `payload_temperature` float DEFAULT NULL,
  `rssi` int(6) DEFAULT NULL,
  `sender` varchar(15) DEFAULT NULL,
  `snr` float DEFAULT NULL,
  `timestamp` bigint(10) DEFAULT NULL,
  `to` bigint(10) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telemetry`
--

LOCK TABLES `telemetry` WRITE;
/*!40000 ALTER TABLE `telemetry` DISABLE KEYS */;
/*!40000 ALTER TABLE `telemetry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text` (
  `channel` int(1) DEFAULT NULL,
  `from` bigint(10) DEFAULT NULL,
  `hops_away` int(2) DEFAULT NULL,
  `id` bigint(10) DEFAULT NULL,
  `payload_text` varchar(512) DEFAULT NULL,
  `rssi` int(6) DEFAULT NULL,
  `sender` varchar(15) DEFAULT NULL,
  `snr` float DEFAULT NULL,
  `timestamp` bigint(10) DEFAULT NULL,
  `to` bigint(10) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traceroute`
--

DROP TABLE IF EXISTS `traceroute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traceroute` (
  `channel` int(1) DEFAULT NULL,
  `from` bigint(10) DEFAULT NULL,
  `hops_away` int(2) DEFAULT NULL,
  `id` bigint(10) DEFAULT NULL,
  `payload_route` varchar(512) DEFAULT NULL,
  `rssi` int(6) DEFAULT NULL,
  `sender` varchar(15) DEFAULT NULL,
  `snr` float DEFAULT NULL,
  `timestamp` bigint(10) DEFAULT NULL,
  `to` bigint(10) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traceroute`
--

LOCK TABLES `traceroute` WRITE;
/*!40000 ALTER TABLE `traceroute` DISABLE KEYS */;
/*!40000 ALTER TABLE `traceroute` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-07 13:16:22
