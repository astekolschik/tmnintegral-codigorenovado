-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.13-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para tmnintegral
DROP DATABASE IF EXISTS `tmnintegral`;
CREATE DATABASE IF NOT EXISTS `tmnintegral` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tmnintegral`;


-- Volcando estructura para tabla tmnintegral.alarms
DROP TABLE IF EXISTS `alarms`;
CREATE TABLE IF NOT EXISTS `alarms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idVariable` int(11) DEFAULT NULL,
  `idDevice` int(11) DEFAULT NULL,
  `idInterface` bigint(20) unsigned DEFAULT NULL,
  `destination` varchar(200) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `elementName` varchar(255) DEFAULT NULL,
  `umbral` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_alarms_variable` (`idVariable`),
  KEY `FK_alarms_device` (`idDevice`),
  KEY `FK_alarms_interface` (`idInterface`),
  KEY `FK_alarms_client` (`client_id`),
  CONSTRAINT `FK_alarms_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_alarms_device` FOREIGN KEY (`idDevice`) REFERENCES `device` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_alarms_interface` FOREIGN KEY (`idInterface`) REFERENCES `interface` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_alarms_variable` FOREIGN KEY (`idVariable`) REFERENCES `variable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.alarms: ~1 rows (aproximadamente)
DELETE FROM `alarms`;
/*!40000 ALTER TABLE `alarms` DISABLE KEYS */;
INSERT INTO `alarms` (`id`, `idVariable`, `idDevice`, `idInterface`, `destination`, `client_id`, `elementName`, `umbral`) VALUES
	(7, 2, NULL, 15, 'agussteko@gmail.com', 1, '172.31.103.20_DIA_TAPIALES_FastEthernet1/0', NULL);
/*!40000 ALTER TABLE `alarms` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.alarms_sent
DROP TABLE IF EXISTS `alarms_sent`;
CREATE TABLE IF NOT EXISTS `alarms_sent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alarmid` int(11) NOT NULL,
  `datesent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK__alarms` (`alarmid`),
  CONSTRAINT `FK__alarms` FOREIGN KEY (`alarmid`) REFERENCES `alarms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.alarms_sent: ~0 rows (aproximadamente)
DELETE FROM `alarms_sent`;
/*!40000 ALTER TABLE `alarms_sent` DISABLE KEYS */;
INSERT INTO `alarms_sent` (`id`, `alarmid`, `datesent`) VALUES
	(1, 7, '2016-11-01 23:14:03'),
	(2, 7, '2016-11-01 22:04:10'),
	(3, 7, '2016-11-01 23:04:30');
/*!40000 ALTER TABLE `alarms_sent` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.client
DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.client: ~2 rows (aproximadamente)
DELETE FROM `client`;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`id`, `client_id`, `name`) VALUES
	(0, 0, 'dummy'),
	(1, 100, 'Cliente 1'),
	(2, 200, 'Cliente 2');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.commands
DROP TABLE IF EXISTS `commands`;
CREATE TABLE IF NOT EXISTS `commands` (
  `id_command` int(11) NOT NULL,
  `command` varchar(120) NOT NULL,
  `command_type` varchar(50) NOT NULL,
  `command_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_command`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.commands: ~0 rows (aproximadamente)
DELETE FROM `commands`;
/*!40000 ALTER TABLE `commands` DISABLE KEYS */;
/*!40000 ALTER TABLE `commands` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.command_devicetype
DROP TABLE IF EXISTS `command_devicetype`;
CREATE TABLE IF NOT EXISTS `command_devicetype` (
  `id_command` int(11) NOT NULL,
  `id_device_type` int(11) NOT NULL,
  PRIMARY KEY (`id_command`,`id_device_type`),
  KEY `FK_COMMAND` (`id_command`),
  KEY `FK_DEVICETYPE` (`id_device_type`),
  CONSTRAINT `COMMAND_DEVICETYPE_ibfk_1` FOREIGN KEY (`id_command`) REFERENCES `commands` (`id_command`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `COMMAND_DEVICETYPE_ibfk_2` FOREIGN KEY (`id_device_type`) REFERENCES `device_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.command_devicetype: ~0 rows (aproximadamente)
DELETE FROM `command_devicetype`;
/*!40000 ALTER TABLE `command_devicetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `command_devicetype` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.device
DROP TABLE IF EXISTS `device`;
CREATE TABLE IF NOT EXISTS `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `communityRead` varchar(10) NOT NULL,
  `hostname` varchar(50) DEFAULT NULL,
  `iosType` varchar(50) DEFAULT NULL,
  `iosVersion` varchar(50) DEFAULT NULL,
  `ip` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `serialNumber` varchar(50) DEFAULT NULL,
  `softwareRelease` varchar(50) DEFAULT NULL,
  `id_device_type` int(11) NOT NULL,
  `id_network` int(11) NOT NULL DEFAULT '0',
  `enable` char(1) DEFAULT NULL,
  `last_update_date` timestamp NULL DEFAULT NULL,
  `client_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`),
  KEY `FK_DEVICE_TYPE` (`id_device_type`),
  KEY `PK_NETWORK` (`id_network`),
  CONSTRAINT `DEVICE_ibfk_1` FOREIGN KEY (`id_device_type`) REFERENCES `device_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.device: ~6 rows (aproximadamente)
DELETE FROM `device`;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` (`id`, `communityRead`, `hostname`, `iosType`, `iosVersion`, `ip`, `model`, `serialNumber`, `softwareRelease`, `id_device_type`, `id_network`, `enable`, `last_update_date`, `client_id`) VALUES
	(1, 'public', 'R3', 'ADVENTERPRISEK9_SNA-M', '12.4(13b)', '1.0.0.1', 'C2691', 'FTX0945W0MY', 'fc3', 0, 0, 'Y', '2016-10-02 19:50:29', '1'),
	(67, 'public', 'DIA_CASA_CENTRAL', 'ADVENTERPRISEK9_SNA-M', '12.4(13b)', '172.27.10.2', 'C2691', 'XXXXXXXXXXX', 'fc3', 0, 0, '1', '2016-10-31 20:06:00', '1'),
	(68, 'public', 'R2', 'ADVENTERPRISEK9_SNA-M', '12.4(13b)', '172.28.9.2', 'C2691222', 'FTX0945W0MY', 'fc3', 0, 0, '1', '2016-10-31 20:06:21', '1'),
	(69, 'public', 'DIA_TAPIALES', 'ADVENTERPRISEK9_SNA-M', '12.4(13b)', '172.31.103.20', 'C2691', 'XXXXXXXXXXX', 'fc3', 0, 0, 'Y', '2016-10-02 19:50:29', '1'),
	(70, 'public', 'CARREFOUR_CASA_CENTRAL', 'ADVENTERPRISEK9_SNA-M', '12.4(13b)', '172.29.132.10', 'C2691', 'XXXXXXXXXXX', 'fc3', 0, 0, 'Y', '2016-10-02 19:50:29', '1'),
	(71, 'public', 'CARREFOR_PUERTO_MADERO', 'ADVENTERPRISEK9_SNA-M', '12.4(13b)', '172.23.101.2', 'C2691', 'XXXXXXXXXXX', 'fc3', 0, 0, 'Y', '2016-10-02 19:50:29', '1');
/*!40000 ALTER TABLE `device` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.device_type
DROP TABLE IF EXISTS `device_type`;
CREATE TABLE IF NOT EXISTS `device_type` (
  `id` int(11) NOT NULL,
  `typeName` varchar(50) NOT NULL,
  `default_comm_read` varchar(50) NOT NULL,
  `default_snmp_version` varchar(50) NOT NULL,
  `driver` varchar(50) NOT NULL,
  `technology` varchar(50) NOT NULL,
  `vendor` varchar(50) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.device_type: ~2 rows (aproximadamente)
DELETE FROM `device_type`;
/*!40000 ALTER TABLE `device_type` DISABLE KEYS */;
INSERT INTO `device_type` (`id`, `typeName`, `default_comm_read`, `default_snmp_version`, `driver`, `technology`, `vendor`, `description`) VALUES
	(0, 'RouterCisco', 'public', '2c', 'discover.device.router.Cisco', 'Ethernet', 'Cisco', NULL),
	(1, 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', NULL);
/*!40000 ALTER TABLE `device_type` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.element
DROP TABLE IF EXISTS `element`;
CREATE TABLE IF NOT EXISTS `element` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `elementName` varchar(255) DEFAULT NULL,
  `elementAlias` varchar(255) DEFAULT NULL,
  `elementType` varchar(255) DEFAULT NULL,
  `elementClass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.element: ~38 rows (aproximadamente)
DELETE FROM `element`;
/*!40000 ALTER TABLE `element` DISABLE KEYS */;
INSERT INTO `element` (`id`, `elementName`, `elementAlias`, `elementType`, `elementClass`) VALUES
	(1, '1.0.0.1_R3', 'R3', 'RouterCisco', 'Device'),
	(2, '1.0.0.1_R3_FastEthernet1/0', 'R3_FastEthernet1/0', 'FastEthernet', 'Interface'),
	(3, '1.0.0.1_R3_FastEthernet0/1', 'R3_FastEthernet0/1', 'FastEthernet', 'Interface'),
	(4, '1.0.0.1_R3_FastEthernet0/0', 'R3_FastEthernet0/0', 'FastEthernet', 'Interface'),
	(5, '1.0.0.1_R3_Null0', 'R3_Null0', NULL, 'Interface'),
	(6, '172.27.10.2_DIA_CASA_CENTRAL', 'DIA_CASA_CENTRAL', 'RouterCisco', 'Device'),
	(7, '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet1/0', 'DIA_CASA_CENTRAL_FastEthernet1/0', 'FastEthernet', 'Interface'),
	(8, '172.27.10.2_DIA_CASA_CENTRAL_Serial0/0', 'DIA_CASA_CENTRAL_Serial0/0', 'Serial', 'Interface'),
	(9, '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/0', 'DIA_CASA_CENTRAL_FastEthernet0/0', 'FastEthernet', 'Interface'),
	(10, '172.27.10.2_DIA_CASA_CENTRAL_Serial0/1', 'DIA_CASA_CENTRAL_Serial0/1', 'Serial', 'Interface'),
	(11, '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/1', 'DIA_CASA_CENTRAL_FastEthernet0/1', 'FastEthernet', 'Interface'),
	(12, '172.27.10.2_DIA_CASA_CENTRAL_Null0', 'DIA_CASA_CENTRAL_Null0', NULL, 'Interface'),
	(13, '172.28.9.2_R2', 'R2', 'RouterCisco', 'Device'),
	(14, '172.28.9.2_R2_FastEthernet1/0', 'R2_FastEthernet1/0', 'FastEthernet', 'Interface'),
	(15, '172.28.9.2_R2_FastEthernet0/1', 'R2_FastEthernet0/1', 'FastEthernet', 'Interface'),
	(16, '172.28.9.2_R2_FastEthernet0/0', 'R2_FastEthernet0/0', 'FastEthernet', 'Interface'),
	(17, '172.28.9.2_R2_Null0', 'R2_Null0', NULL, 'Interface'),
	(18, '172.31.103.20_DIA_TAPIALES', 'DIA_TAPIALES', 'RouterCisco', 'Device'),
	(19, '172.31.103.20_DIA_TAPIALES_FastEthernet1/0', 'DIA_TAPIALES_FastEthernet1/0', 'FastEthernet', 'Interface'),
	(20, '172.31.103.20_DIA_TAPIALES_Serial0/0', 'DIA_TAPIALES_Serial0/0', 'Serial', 'Interface'),
	(21, '172.31.103.20_DIA_TAPIALES_FastEthernet0/0', 'DIA_TAPIALES_FastEthernet0/0', 'FastEthernet', 'Interface'),
	(22, '172.31.103.20_DIA_TAPIALES_Serial0/1', 'DIA_TAPIALES_Serial0/1', 'Serial', 'Interface'),
	(23, '172.31.103.20_DIA_TAPIALES_FastEthernet0/1', 'DIA_TAPIALES_FastEthernet0/1', 'FastEthernet', 'Interface'),
	(24, '172.31.103.20_DIA_TAPIALES_Null0', 'DIA_TAPIALES_Null0', NULL, 'Interface'),
	(25, '172.29.132.10_CARREFOUR_CASA_CENTRAL', 'CARREFOUR_CASA_CENTRAL', 'RouterCisco', 'Device'),
	(26, '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet1/0', 'CARREFOUR_CASA_CENTRAL_FastEthernet1/0', 'FastEthernet', 'Interface'),
	(27, '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/0', 'CARREFOUR_CASA_CENTRAL_Serial0/0', 'Serial', 'Interface'),
	(28, '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/0', 'CARREFOUR_CASA_CENTRAL_FastEthernet0/0', 'FastEthernet', 'Interface'),
	(29, '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/1', 'CARREFOUR_CASA_CENTRAL_Serial0/1', 'Serial', 'Interface'),
	(30, '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/1', 'CARREFOUR_CASA_CENTRAL_FastEthernet0/1', 'FastEthernet', 'Interface'),
	(31, '172.29.132.10_CARREFOUR_CASA_CENTRAL_Null0', 'CARREFOUR_CASA_CENTRAL_Null0', NULL, 'Interface'),
	(32, '172.23.101.2_CARREFOR_PUERTO_MADERO', 'CARREFOR_PUERTO_MADERO', 'RouterCisco', 'Device'),
	(33, '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet1/0', 'CARREFOR_PUERTO_MADERO_FastEthernet1/0', 'FastEthernet', 'Interface'),
	(34, '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/0', 'CARREFOR_PUERTO_MADERO_Serial0/0', 'Serial', 'Interface'),
	(35, '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/0', 'CARREFOR_PUERTO_MADERO_FastEthernet0/0', 'FastEthernet', 'Interface'),
	(36, '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/1', 'CARREFOR_PUERTO_MADERO_Serial0/1', 'Serial', 'Interface'),
	(37, '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/1', 'CARREFOR_PUERTO_MADERO_FastEthernet0/1', 'FastEthernet', 'Interface'),
	(38, '172.23.101.2_CARREFOR_PUERTO_MADERO_Null0', 'CARREFOR_PUERTO_MADERO_Null0', NULL, 'Interface');
/*!40000 ALTER TABLE `element` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.elementrelationship
DROP TABLE IF EXISTS `elementrelationship`;
CREATE TABLE IF NOT EXISTS `elementrelationship` (
  `AEnd` bigint(20) NOT NULL,
  `ZEnd` bigint(20) NOT NULL,
  `relationClass` varchar(50) NOT NULL,
  PRIMARY KEY (`AEnd`,`ZEnd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.elementrelationship: ~69 rows (aproximadamente)
DELETE FROM `elementrelationship`;
/*!40000 ALTER TABLE `elementrelationship` DISABLE KEYS */;
INSERT INTO `elementrelationship` (`AEnd`, `ZEnd`, `relationClass`) VALUES
	(1, 2, 'Device-Interf'),
	(1, 3, 'Device-Interf'),
	(1, 4, 'Device-Interf'),
	(1, 5, 'Device-Interf'),
	(2, 1, 'Device-Interf'),
	(3, 1, 'Device-Interf'),
	(4, 1, 'Device-Interf'),
	(5, 1, 'Device-Interf'),
	(6, 7, 'Device-Interf'),
	(6, 8, 'Device-Interf'),
	(6, 9, 'Device-Interf'),
	(6, 10, 'Device-Interf'),
	(6, 11, 'Device-Interf'),
	(6, 12, 'Device-Interf'),
	(7, 6, 'Device-Interf'),
	(8, 6, 'Device-Interf'),
	(9, 6, 'Device-Interf'),
	(10, 6, 'Device-Interf'),
	(11, 2, 'Interf-Interf'),
	(11, 6, 'Device-Interf'),
	(12, 6, 'Device-Interf'),
	(13, 14, 'Device-Interf'),
	(13, 15, 'Device-Interf'),
	(13, 16, 'Device-Interf'),
	(13, 17, 'Device-Interf'),
	(14, 13, 'Device-Interf'),
	(15, 4, 'Interf-Interf'),
	(15, 13, 'Device-Interf'),
	(16, 13, 'Device-Interf'),
	(17, 13, 'Device-Interf'),
	(18, 19, 'Device-Interf'),
	(18, 20, 'Device-Interf'),
	(18, 21, 'Device-Interf'),
	(18, 22, 'Device-Interf'),
	(18, 23, 'Device-Interf'),
	(18, 24, 'Device-Interf'),
	(19, 18, 'Device-Interf'),
	(20, 18, 'Device-Interf'),
	(21, 9, 'Interf-Interf'),
	(21, 18, 'Device-Interf'),
	(22, 18, 'Device-Interf'),
	(23, 18, 'Device-Interf'),
	(24, 18, 'Device-Interf'),
	(25, 26, 'Device-Interf'),
	(25, 27, 'Device-Interf'),
	(25, 28, 'Device-Interf'),
	(25, 29, 'Device-Interf'),
	(25, 30, 'Device-Interf'),
	(25, 31, 'Device-Interf'),
	(26, 25, 'Device-Interf'),
	(27, 25, 'Device-Interf'),
	(28, 16, 'Interf-Interf'),
	(28, 25, 'Device-Interf'),
	(29, 25, 'Device-Interf'),
	(30, 25, 'Device-Interf'),
	(31, 25, 'Device-Interf'),
	(32, 33, 'Device-Interf'),
	(32, 34, 'Device-Interf'),
	(32, 35, 'Device-Interf'),
	(32, 36, 'Device-Interf'),
	(32, 37, 'Device-Interf'),
	(32, 38, 'Device-Interf'),
	(33, 32, 'Device-Interf'),
	(34, 32, 'Device-Interf'),
	(35, 14, 'Interf-Interf'),
	(35, 32, 'Device-Interf'),
	(36, 32, 'Device-Interf'),
	(37, 32, 'Device-Interf'),
	(38, 32, 'Device-Interf');
/*!40000 ALTER TABLE `elementrelationship` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.elementvsdatasources
DROP TABLE IF EXISTS `elementvsdatasources`;
CREATE TABLE IF NOT EXISTS `elementvsdatasources` (
  `id_ele` bigint(20) NOT NULL,
  `id_device` int(11) DEFAULT NULL,
  `id_interface` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_ele`),
  KEY `FK_elementvsdatasources_device` (`id_device`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.elementvsdatasources: ~38 rows (aproximadamente)
DELETE FROM `elementvsdatasources`;
/*!40000 ALTER TABLE `elementvsdatasources` DISABLE KEYS */;
INSERT INTO `elementvsdatasources` (`id_ele`, `id_device`, `id_interface`) VALUES
	(1, 1, NULL),
	(2, NULL, 1),
	(3, NULL, 2),
	(4, NULL, 3),
	(5, NULL, 4),
	(6, 67, NULL),
	(7, NULL, 5),
	(8, NULL, 6),
	(9, NULL, 7),
	(10, NULL, 8),
	(11, NULL, 9),
	(12, NULL, 10),
	(13, 68, NULL),
	(14, NULL, 11),
	(15, NULL, 12),
	(16, NULL, 13),
	(17, NULL, 14),
	(18, 69, NULL),
	(19, NULL, 15),
	(20, NULL, 16),
	(21, NULL, 17),
	(22, NULL, 18),
	(23, NULL, 19),
	(24, NULL, 20),
	(25, 70, NULL),
	(26, NULL, 21),
	(27, NULL, 22),
	(28, NULL, 23),
	(29, NULL, 24),
	(30, NULL, 25),
	(31, NULL, 26),
	(32, 71, NULL),
	(33, NULL, 27),
	(34, NULL, 28),
	(35, NULL, 29),
	(36, NULL, 30),
	(37, NULL, 31),
	(38, NULL, 32);
/*!40000 ALTER TABLE `elementvsdatasources` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.equipment_information
DROP TABLE IF EXISTS `equipment_information`;
CREATE TABLE IF NOT EXISTS `equipment_information` (
  `equipment_id` int(11) NOT NULL,
  `memoria_disponible` double NOT NULL,
  `memoria_utilizada` double NOT NULL,
  `timestamp` datetime NOT NULL,
  `trafico_entrante` double NOT NULL,
  `trafico_saliente` double NOT NULL,
  `utilizacion_cpu` double NOT NULL,
  PRIMARY KEY (`equipment_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.equipment_information: ~0 rows (aproximadamente)
DELETE FROM `equipment_information`;
/*!40000 ALTER TABLE `equipment_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment_information` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.flt_interface_status
DROP TABLE IF EXISTS `flt_interface_status`;
CREATE TABLE IF NOT EXISTS `flt_interface_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idVariable` int(11) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `elementName` varchar(255) DEFAULT NULL,
  `last_update_state` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idVariable` (`idVariable`,`elementName`,`last_update_state`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.flt_interface_status: ~392 rows (aproximadamente)
DELETE FROM `flt_interface_status`;
/*!40000 ALTER TABLE `flt_interface_status` DISABLE KEYS */;
INSERT INTO `flt_interface_status` (`id`, `idVariable`, `valor`, `elementName`, `last_update_state`) VALUES
	(1, 20, '1', '1.0.0.1_R3', '2016-10-03 02:41:35'),
	(2, 22, '11.986', '1.0.0.1_R3', '2016-10-03 02:41:35'),
	(3, 23, '11.986', '1.0.0.1_R3', '2016-10-03 02:41:35'),
	(4, 26, 'OK', '1.0.0.1_R3', '2016-10-03 02:41:35'),
	(5, 25, '0.000', '1.0.0.1_R3', '2016-10-03 02:41:35'),
	(6, 24, '11.986', '1.0.0.1_R3', '2016-10-03 02:41:35'),
	(7, 20, '1', '1.0.0.1_R3', '2016-10-03 02:43:39'),
	(8, 22, '8.311', '1.0.0.1_R3', '2016-10-03 02:43:39'),
	(9, 23, '8.311', '1.0.0.1_R3', '2016-10-03 02:43:39'),
	(10, 26, 'OK', '1.0.0.1_R3', '2016-10-03 02:43:39'),
	(11, 25, '0.000', '1.0.0.1_R3', '2016-10-03 02:43:39'),
	(12, 24, '8.311', '1.0.0.1_R3', '2016-10-03 02:43:39'),
	(13, 8, '1', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:43:39'),
	(14, 13, '100000000', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:43:39'),
	(15, 28, '0', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:43:39'),
	(16, 18, '6617', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:43:39'),
	(17, 8, '1', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:43:39'),
	(18, 13, '10000000', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:43:39'),
	(19, 28, '0', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:43:39'),
	(20, 18, '13181', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:43:39'),
	(21, 8, '1', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:43:39'),
	(22, 13, '10000000', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:43:39'),
	(23, 28, '0', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:43:39'),
	(24, 18, '6006', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:43:39'),
	(25, 8, '1', '1.0.0.1_R3_Null0', '2016-10-03 02:43:39'),
	(26, 13, '4294967295', '1.0.0.1_R3_Null0', '2016-10-03 02:43:39'),
	(27, 28, '0', '1.0.0.1_R3_Null0', '2016-10-03 02:43:39'),
	(28, 18, '0', '1.0.0.1_R3_Null0', '2016-10-03 02:43:39'),
	(29, 20, '1', '1.0.0.1_R3', '2016-10-03 02:45:52'),
	(30, 22, '3.741', '1.0.0.1_R3', '2016-10-03 02:45:52'),
	(31, 23, '3.741', '1.0.0.1_R3', '2016-10-03 02:45:52'),
	(32, 26, 'OK', '1.0.0.1_R3', '2016-10-03 02:45:52'),
	(33, 25, '0.000', '1.0.0.1_R3', '2016-10-03 02:45:52'),
	(34, 24, '3.741', '1.0.0.1_R3', '2016-10-03 02:45:52'),
	(35, 8, '1', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:45:52'),
	(36, 13, '100000000', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:45:52'),
	(37, 28, '0', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:45:52'),
	(38, 18, '7197', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:45:52'),
	(39, 8, '1', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:45:52'),
	(40, 13, '10000000', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:45:52'),
	(41, 28, '0', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:45:52'),
	(42, 18, '15637', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:45:52'),
	(43, 8, '1', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:45:52'),
	(44, 13, '10000000', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:45:52'),
	(45, 28, '0', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:45:52'),
	(46, 18, '6532', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:45:52'),
	(47, 8, '1', '1.0.0.1_R3_Null0', '2016-10-03 02:45:52'),
	(48, 13, '4294967295', '1.0.0.1_R3_Null0', '2016-10-03 02:45:52'),
	(49, 28, '0', '1.0.0.1_R3_Null0', '2016-10-03 02:45:52'),
	(50, 18, '0', '1.0.0.1_R3_Null0', '2016-10-03 02:45:52'),
	(51, 19, '0.0000348872180451128', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:45:52'),
	(52, 19, '0.00147729323308271', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:45:52'),
	(53, 19, '0.000316390977443609', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:45:52'),
	(54, 19, '0', '1.0.0.1_R3_Null0', '2016-10-03 02:45:52'),
	(55, 20, '0', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:45:52'),
	(56, 22, '17.043', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:45:52'),
	(57, 23, '17.043', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:45:52'),
	(58, 26, 'OK', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:45:52'),
	(59, 25, '0.000', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:45:52'),
	(60, 24, '17.043', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:45:52'),
	(61, 8, '1', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:45:52'),
	(62, 13, '100000000', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:45:52'),
	(63, 28, '0', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:45:52'),
	(64, 18, '4817', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:45:52'),
	(65, 8, '2', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/0', '2016-10-03 02:45:52'),
	(66, 13, '1544000', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/0', '2016-10-03 02:45:52'),
	(67, 28, '0', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/0', '2016-10-03 02:45:52'),
	(68, 18, '0', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/0', '2016-10-03 02:45:52'),
	(69, 8, '1', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:45:52'),
	(70, 13, '10000000', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:45:52'),
	(71, 28, '0', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:45:52'),
	(72, 18, '6258', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:45:52'),
	(73, 8, '2', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/1', '2016-10-03 02:45:52'),
	(74, 13, '1544000', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/1', '2016-10-03 02:45:52'),
	(75, 28, '0', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/1', '2016-10-03 02:45:52'),
	(76, 18, '0', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/1', '2016-10-03 02:45:52'),
	(77, 8, '1', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:45:52'),
	(78, 13, '10000000', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:45:52'),
	(79, 28, '0', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:45:52'),
	(80, 18, '9741', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:45:52'),
	(81, 8, '1', '172.27.10.2_DIA_CASA_CENTRAL_Null0', '2016-10-03 02:45:52'),
	(82, 13, '4294967295', '172.27.10.2_DIA_CASA_CENTRAL_Null0', '2016-10-03 02:45:52'),
	(83, 28, '0', '172.27.10.2_DIA_CASA_CENTRAL_Null0', '2016-10-03 02:45:52'),
	(84, 18, '0', '172.27.10.2_DIA_CASA_CENTRAL_Null0', '2016-10-03 02:45:52'),
	(85, 20, '0', '172.28.9.2_R2', '2016-10-03 02:45:52'),
	(86, 22, '11.652', '172.28.9.2_R2', '2016-10-03 02:45:52'),
	(87, 23, '11.652', '172.28.9.2_R2', '2016-10-03 02:45:52'),
	(88, 26, 'OK', '172.28.9.2_R2', '2016-10-03 02:45:52'),
	(89, 25, '0.000', '172.28.9.2_R2', '2016-10-03 02:45:52'),
	(90, 24, '11.652', '172.28.9.2_R2', '2016-10-03 02:45:52'),
	(91, 8, '1', '172.28.9.2_R2_FastEthernet1/0', '2016-10-03 02:45:52'),
	(92, 13, '100000000', '172.28.9.2_R2_FastEthernet1/0', '2016-10-03 02:45:52'),
	(93, 28, '0', '172.28.9.2_R2_FastEthernet1/0', '2016-10-03 02:45:52'),
	(94, 18, '4948', '172.28.9.2_R2_FastEthernet1/0', '2016-10-03 02:45:52'),
	(95, 8, '1', '172.28.9.2_R2_FastEthernet0/1', '2016-10-03 02:45:52'),
	(96, 13, '10000000', '172.28.9.2_R2_FastEthernet0/1', '2016-10-03 02:45:52'),
	(97, 28, '0', '172.28.9.2_R2_FastEthernet0/1', '2016-10-03 02:45:52'),
	(98, 18, '10131', '172.28.9.2_R2_FastEthernet0/1', '2016-10-03 02:45:52'),
	(99, 8, '1', '172.28.9.2_R2_FastEthernet0/0', '2016-10-03 02:45:52'),
	(100, 13, '10000000', '172.28.9.2_R2_FastEthernet0/0', '2016-10-03 02:45:52'),
	(101, 28, '0', '172.28.9.2_R2_FastEthernet0/0', '2016-10-03 02:45:52'),
	(102, 18, '4860', '172.28.9.2_R2_FastEthernet0/0', '2016-10-03 02:45:52'),
	(103, 8, '1', '172.28.9.2_R2_Null0', '2016-10-03 02:45:52'),
	(104, 13, '4294967295', '172.28.9.2_R2_Null0', '2016-10-03 02:45:52'),
	(105, 28, '0', '172.28.9.2_R2_Null0', '2016-10-03 02:45:52'),
	(106, 18, '0', '172.28.9.2_R2_Null0', '2016-10-03 02:45:52'),
	(107, 20, '0', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:45:52'),
	(108, 22, '40.501', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:45:52'),
	(109, 23, '40.501', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:45:52'),
	(110, 26, 'OK', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:45:52'),
	(111, 25, '0.000', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:45:52'),
	(112, 24, '40.501', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:45:52'),
	(113, 8, '2', '172.31.103.20_DIA_TAPIALES_FastEthernet1/0', '2016-10-03 02:45:52'),
	(114, 13, '100000000', '172.31.103.20_DIA_TAPIALES_FastEthernet1/0', '2016-10-03 02:45:52'),
	(115, 28, '0', '172.31.103.20_DIA_TAPIALES_FastEthernet1/0', '2016-10-03 02:45:52'),
	(116, 18, '0', '172.31.103.20_DIA_TAPIALES_FastEthernet1/0', '2016-10-03 02:45:52'),
	(117, 8, '2', '172.31.103.20_DIA_TAPIALES_Serial0/0', '2016-10-03 02:45:52'),
	(118, 13, '1544000', '172.31.103.20_DIA_TAPIALES_Serial0/0', '2016-10-03 02:45:52'),
	(119, 28, '0', '172.31.103.20_DIA_TAPIALES_Serial0/0', '2016-10-03 02:45:52'),
	(120, 18, '0', '172.31.103.20_DIA_TAPIALES_Serial0/0', '2016-10-03 02:45:52'),
	(121, 8, '1', '172.31.103.20_DIA_TAPIALES_FastEthernet0/0', '2016-10-03 02:45:52'),
	(122, 13, '10000000', '172.31.103.20_DIA_TAPIALES_FastEthernet0/0', '2016-10-03 02:45:52'),
	(123, 28, '0', '172.31.103.20_DIA_TAPIALES_FastEthernet0/0', '2016-10-03 02:45:52'),
	(124, 18, '10617', '172.31.103.20_DIA_TAPIALES_FastEthernet0/0', '2016-10-03 02:45:52'),
	(125, 8, '2', '172.31.103.20_DIA_TAPIALES_Serial0/1', '2016-10-03 02:45:52'),
	(126, 13, '1544000', '172.31.103.20_DIA_TAPIALES_Serial0/1', '2016-10-03 02:45:52'),
	(127, 28, '0', '172.31.103.20_DIA_TAPIALES_Serial0/1', '2016-10-03 02:45:52'),
	(128, 18, '0', '172.31.103.20_DIA_TAPIALES_Serial0/1', '2016-10-03 02:45:52'),
	(129, 8, '1', '172.31.103.20_DIA_TAPIALES_FastEthernet0/1', '2016-10-03 02:45:52'),
	(130, 13, '10000000', '172.31.103.20_DIA_TAPIALES_FastEthernet0/1', '2016-10-03 02:45:52'),
	(131, 28, '0', '172.31.103.20_DIA_TAPIALES_FastEthernet0/1', '2016-10-03 02:45:52'),
	(132, 18, '4620', '172.31.103.20_DIA_TAPIALES_FastEthernet0/1', '2016-10-03 02:45:52'),
	(133, 8, '1', '172.31.103.20_DIA_TAPIALES_Null0', '2016-10-03 02:45:52'),
	(134, 13, '4294967295', '172.31.103.20_DIA_TAPIALES_Null0', '2016-10-03 02:45:52'),
	(135, 28, '0', '172.31.103.20_DIA_TAPIALES_Null0', '2016-10-03 02:45:52'),
	(136, 18, '0', '172.31.103.20_DIA_TAPIALES_Null0', '2016-10-03 02:45:52'),
	(137, 20, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:45:52'),
	(138, 22, '32.913', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:45:52'),
	(139, 23, '32.913', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:45:52'),
	(140, 26, 'OK', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:45:52'),
	(141, 25, '0.000', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:45:52'),
	(142, 24, '32.913', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:45:52'),
	(143, 8, '1', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:45:52'),
	(144, 13, '100000000', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:45:52'),
	(145, 28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:45:52'),
	(146, 18, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:45:52'),
	(147, 8, '2', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/0', '2016-10-03 02:45:52'),
	(148, 13, '1544000', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/0', '2016-10-03 02:45:52'),
	(149, 28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/0', '2016-10-03 02:45:52'),
	(150, 18, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/0', '2016-10-03 02:45:52'),
	(151, 8, '1', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:45:52'),
	(152, 13, '10000000', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:45:52'),
	(153, 28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:45:52'),
	(154, 18, '11097', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:45:52'),
	(155, 8, '2', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/1', '2016-10-03 02:45:52'),
	(156, 13, '1544000', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/1', '2016-10-03 02:45:52'),
	(157, 28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/1', '2016-10-03 02:45:52'),
	(158, 18, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/1', '2016-10-03 02:45:52'),
	(159, 8, '2', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:45:52'),
	(160, 13, '10000000', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:45:52'),
	(161, 28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:45:52'),
	(162, 18, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:45:52'),
	(163, 8, '1', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Null0', '2016-10-03 02:45:52'),
	(164, 13, '4294967295', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Null0', '2016-10-03 02:45:52'),
	(165, 28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Null0', '2016-10-03 02:45:52'),
	(166, 18, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Null0', '2016-10-03 02:45:52'),
	(167, 20, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:45:52'),
	(168, 22, '22.034', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:45:52'),
	(169, 23, '22.034', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:45:52'),
	(170, 26, 'OK', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:45:52'),
	(171, 25, '0.000', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:45:52'),
	(172, 24, '22.034', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:45:52'),
	(173, 8, '2', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet1/0', '2016-10-03 02:45:52'),
	(174, 13, '100000000', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet1/0', '2016-10-03 02:45:52'),
	(175, 28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet1/0', '2016-10-03 02:45:52'),
	(176, 18, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet1/0', '2016-10-03 02:45:52'),
	(177, 8, '2', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/0', '2016-10-03 02:45:52'),
	(178, 13, '1544000', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/0', '2016-10-03 02:45:52'),
	(179, 28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/0', '2016-10-03 02:45:52'),
	(180, 18, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/0', '2016-10-03 02:45:52'),
	(181, 8, '1', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/0', '2016-10-03 02:45:52'),
	(182, 13, '10000000', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/0', '2016-10-03 02:45:52'),
	(183, 28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/0', '2016-10-03 02:45:52'),
	(184, 18, '11037', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/0', '2016-10-03 02:45:52'),
	(185, 8, '2', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/1', '2016-10-03 02:45:52'),
	(186, 13, '1544000', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/1', '2016-10-03 02:45:52'),
	(187, 28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/1', '2016-10-03 02:45:52'),
	(188, 18, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/1', '2016-10-03 02:45:52'),
	(189, 8, '2', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/1', '2016-10-03 02:45:52'),
	(190, 13, '10000000', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/1', '2016-10-03 02:45:52'),
	(191, 28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/1', '2016-10-03 02:45:52'),
	(192, 18, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/1', '2016-10-03 02:45:52'),
	(193, 8, '1', '172.23.101.2_CARREFOR_PUERTO_MADERO_Null0', '2016-10-03 02:45:52'),
	(194, 13, '4294967295', '172.23.101.2_CARREFOR_PUERTO_MADERO_Null0', '2016-10-03 02:45:52'),
	(195, 28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Null0', '2016-10-03 02:45:52'),
	(196, 18, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Null0', '2016-10-03 02:45:52'),
	(197, 20, '1', '1.0.0.1_R3', '2016-10-03 02:48:20'),
	(198, 22, '2.486', '1.0.0.1_R3', '2016-10-03 02:48:20'),
	(199, 23, '2.486', '1.0.0.1_R3', '2016-10-03 02:48:20'),
	(200, 26, 'OK', '1.0.0.1_R3', '2016-10-03 02:48:20'),
	(201, 25, '0.000', '1.0.0.1_R3', '2016-10-03 02:48:20'),
	(202, 24, '2.486', '1.0.0.1_R3', '2016-10-03 02:48:20'),
	(203, 8, '1', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:48:20'),
	(204, 13, '100000000', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:48:20'),
	(205, 28, '0', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:48:20'),
	(206, 18, '14588', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:48:20'),
	(207, 8, '1', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:48:20'),
	(208, 13, '10000000', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:48:20'),
	(209, 28, '0', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:48:20'),
	(210, 18, '33813', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:48:20'),
	(211, 8, '1', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:48:20'),
	(212, 13, '10000000', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:48:20'),
	(213, 28, '0', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:48:20'),
	(214, 18, '16468', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:48:20'),
	(215, 8, '1', '1.0.0.1_R3_Null0', '2016-10-03 02:48:20'),
	(216, 13, '4294967295', '1.0.0.1_R3_Null0', '2016-10-03 02:48:20'),
	(217, 28, '0', '1.0.0.1_R3_Null0', '2016-10-03 02:48:20'),
	(218, 18, '0', '1.0.0.1_R3_Null0', '2016-10-03 02:48:20'),
	(219, 19, '0.000399513513513513', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:48:20'),
	(220, 19, '0.00982486486486486', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:48:20'),
	(221, 19, '0.00537081081081081', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:48:20'),
	(222, 19, '0', '1.0.0.1_R3_Null0', '2016-10-03 02:48:20'),
	(223, 20, '1', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(224, 22, '17.932', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(225, 23, '17.932', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(226, 26, 'OK', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(227, 25, '0.000', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(228, 24, '17.932', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(229, 8, '1', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(230, 13, '100000000', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(231, 28, '0', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(232, 18, '5263', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(233, 8, '2', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(234, 13, '1544000', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(235, 28, '0', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(236, 18, '0', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(237, 8, '1', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(238, 13, '10000000', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(239, 28, '0', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(240, 18, '10159', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(241, 8, '2', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(242, 13, '1544000', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(243, 28, '0', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(244, 18, '0', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(245, 8, '1', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(246, 13, '10000000', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(247, 28, '0', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(248, 18, '17375', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(249, 8, '1', '172.27.10.2_DIA_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(250, 13, '4294967295', '172.27.10.2_DIA_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(251, 28, '0', '172.27.10.2_DIA_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(252, 18, '0', '172.27.10.2_DIA_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(253, 19, '0.0000241081081081081', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(254, 19, '0', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(255, 19, '0.00210864864864865', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(256, 19, '0', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(257, 19, '0.00412648648648649', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(258, 19, '0', '172.27.10.2_DIA_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(259, 20, '0', '172.28.9.2_R2', '2016-10-03 02:48:20'),
	(260, 22, '12.298', '172.28.9.2_R2', '2016-10-03 02:48:20'),
	(261, 23, '12.298', '172.28.9.2_R2', '2016-10-03 02:48:20'),
	(262, 26, 'OK', '172.28.9.2_R2', '2016-10-03 02:48:20'),
	(263, 25, '0.000', '172.28.9.2_R2', '2016-10-03 02:48:20'),
	(264, 24, '12.298', '172.28.9.2_R2', '2016-10-03 02:48:20'),
	(265, 8, '1', '172.28.9.2_R2_FastEthernet1/0', '2016-10-03 02:48:20'),
	(266, 13, '100000000', '172.28.9.2_R2_FastEthernet1/0', '2016-10-03 02:48:20'),
	(267, 28, '0', '172.28.9.2_R2_FastEthernet1/0', '2016-10-03 02:48:20'),
	(268, 18, '8726', '172.28.9.2_R2_FastEthernet1/0', '2016-10-03 02:48:20'),
	(269, 8, '1', '172.28.9.2_R2_FastEthernet0/1', '2016-10-03 02:48:20'),
	(270, 13, '10000000', '172.28.9.2_R2_FastEthernet0/1', '2016-10-03 02:48:20'),
	(271, 28, '0', '172.28.9.2_R2_FastEthernet0/1', '2016-10-03 02:48:20'),
	(272, 18, '19885', '172.28.9.2_R2_FastEthernet0/1', '2016-10-03 02:48:20'),
	(273, 8, '1', '172.28.9.2_R2_FastEthernet0/0', '2016-10-03 02:48:20'),
	(274, 13, '10000000', '172.28.9.2_R2_FastEthernet0/0', '2016-10-03 02:48:20'),
	(275, 28, '0', '172.28.9.2_R2_FastEthernet0/0', '2016-10-03 02:48:20'),
	(276, 18, '8638', '172.28.9.2_R2_FastEthernet0/0', '2016-10-03 02:48:20'),
	(277, 8, '1', '172.28.9.2_R2_Null0', '2016-10-03 02:48:20'),
	(278, 13, '4294967295', '172.28.9.2_R2_Null0', '2016-10-03 02:48:20'),
	(279, 28, '0', '172.28.9.2_R2_Null0', '2016-10-03 02:48:20'),
	(280, 18, '0', '172.28.9.2_R2_Null0', '2016-10-03 02:48:20'),
	(281, 19, '0.000204216216216216', '172.28.9.2_R2_FastEthernet1/0', '2016-10-03 02:48:20'),
	(282, 19, '0.00527243243243243', '172.28.9.2_R2_FastEthernet0/1', '2016-10-03 02:48:20'),
	(283, 19, '0.00204216216216216', '172.28.9.2_R2_FastEthernet0/0', '2016-10-03 02:48:20'),
	(284, 19, '0', '172.28.9.2_R2_Null0', '2016-10-03 02:48:20'),
	(285, 20, '1', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:48:20'),
	(286, 22, '37.446', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:48:20'),
	(287, 23, '37.446', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:48:20'),
	(288, 26, 'OK', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:48:20'),
	(289, 25, '0.000', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:48:20'),
	(290, 24, '37.446', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:48:20'),
	(291, 8, '2', '172.31.103.20_DIA_TAPIALES_FastEthernet1/0', '2016-10-03 02:48:20'),
	(292, 13, '100000000', '172.31.103.20_DIA_TAPIALES_FastEthernet1/0', '2016-10-03 02:48:20'),
	(293, 28, '0', '172.31.103.20_DIA_TAPIALES_FastEthernet1/0', '2016-10-03 02:48:20'),
	(294, 18, '0', '172.31.103.20_DIA_TAPIALES_FastEthernet1/0', '2016-10-03 02:48:20'),
	(295, 8, '2', '172.31.103.20_DIA_TAPIALES_Serial0/0', '2016-10-03 02:48:20'),
	(296, 13, '1544000', '172.31.103.20_DIA_TAPIALES_Serial0/0', '2016-10-03 02:48:20'),
	(297, 28, '0', '172.31.103.20_DIA_TAPIALES_Serial0/0', '2016-10-03 02:48:20'),
	(298, 18, '0', '172.31.103.20_DIA_TAPIALES_Serial0/0', '2016-10-03 02:48:20'),
	(299, 8, '1', '172.31.103.20_DIA_TAPIALES_FastEthernet0/0', '2016-10-03 02:48:20'),
	(300, 13, '10000000', '172.31.103.20_DIA_TAPIALES_FastEthernet0/0', '2016-10-03 02:48:20'),
	(301, 28, '0', '172.31.103.20_DIA_TAPIALES_FastEthernet0/0', '2016-10-03 02:48:20'),
	(302, 18, '14959', '172.31.103.20_DIA_TAPIALES_FastEthernet0/0', '2016-10-03 02:48:20'),
	(303, 8, '2', '172.31.103.20_DIA_TAPIALES_Serial0/1', '2016-10-03 02:48:20'),
	(304, 13, '1544000', '172.31.103.20_DIA_TAPIALES_Serial0/1', '2016-10-03 02:48:20'),
	(305, 28, '0', '172.31.103.20_DIA_TAPIALES_Serial0/1', '2016-10-03 02:48:20'),
	(306, 18, '0', '172.31.103.20_DIA_TAPIALES_Serial0/1', '2016-10-03 02:48:20'),
	(307, 8, '1', '172.31.103.20_DIA_TAPIALES_FastEthernet0/1', '2016-10-03 02:48:20'),
	(308, 13, '10000000', '172.31.103.20_DIA_TAPIALES_FastEthernet0/1', '2016-10-03 02:48:20'),
	(309, 28, '0', '172.31.103.20_DIA_TAPIALES_FastEthernet0/1', '2016-10-03 02:48:20'),
	(310, 18, '4990', '172.31.103.20_DIA_TAPIALES_FastEthernet0/1', '2016-10-03 02:48:20'),
	(311, 8, '1', '172.31.103.20_DIA_TAPIALES_Null0', '2016-10-03 02:48:20'),
	(312, 13, '4294967295', '172.31.103.20_DIA_TAPIALES_Null0', '2016-10-03 02:48:20'),
	(313, 28, '0', '172.31.103.20_DIA_TAPIALES_Null0', '2016-10-03 02:48:20'),
	(314, 18, '0', '172.31.103.20_DIA_TAPIALES_Null0', '2016-10-03 02:48:20'),
	(315, 19, '0', '172.31.103.20_DIA_TAPIALES_FastEthernet1/0', '2016-10-03 02:48:20'),
	(316, 19, '0', '172.31.103.20_DIA_TAPIALES_Serial0/0', '2016-10-03 02:48:20'),
	(317, 19, '0.00234702702702703', '172.31.103.20_DIA_TAPIALES_FastEthernet0/0', '2016-10-03 02:48:20'),
	(318, 19, '0', '172.31.103.20_DIA_TAPIALES_Serial0/1', '2016-10-03 02:48:20'),
	(319, 19, '0.0002', '172.31.103.20_DIA_TAPIALES_FastEthernet0/1', '2016-10-03 02:48:20'),
	(320, 19, '0', '172.31.103.20_DIA_TAPIALES_Null0', '2016-10-03 02:48:20'),
	(321, 20, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(322, 22, '28.357', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(323, 23, '28.357', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(324, 26, 'OK', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(325, 25, '0.000', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(326, 24, '28.357', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(327, 8, '1', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(328, 13, '100000000', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(329, 28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(330, 18, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(331, 8, '2', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(332, 13, '1544000', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(333, 28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(334, 18, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(335, 8, '1', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(336, 13, '10000000', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(337, 28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(338, 18, '15097', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(339, 8, '2', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(340, 13, '1544000', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(341, 28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(342, 18, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(343, 8, '2', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(344, 13, '10000000', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(345, 28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(346, 18, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(347, 8, '1', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(348, 13, '4294967295', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(349, 28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(350, 18, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(351, 19, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(352, 19, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(353, 19, '0.00216216216216216', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(354, 19, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(355, 19, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(356, 19, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(357, 20, '1', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:48:20'),
	(358, 22, '40.321', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:48:20'),
	(359, 23, '40.321', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:48:20'),
	(360, 26, 'OK', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:48:20'),
	(361, 25, '0.000', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:48:20'),
	(362, 24, '40.321', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:48:20'),
	(363, 8, '2', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet1/0', '2016-10-03 02:48:20'),
	(364, 13, '100000000', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet1/0', '2016-10-03 02:48:20'),
	(365, 28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet1/0', '2016-10-03 02:48:20'),
	(366, 18, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet1/0', '2016-10-03 02:48:20'),
	(367, 8, '2', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/0', '2016-10-03 02:48:20'),
	(368, 13, '1544000', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/0', '2016-10-03 02:48:20'),
	(369, 28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/0', '2016-10-03 02:48:20'),
	(370, 18, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/0', '2016-10-03 02:48:20'),
	(371, 8, '1', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/0', '2016-10-03 02:48:20'),
	(372, 13, '10000000', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/0', '2016-10-03 02:48:20'),
	(373, 28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/0', '2016-10-03 02:48:20'),
	(374, 18, '15223', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/0', '2016-10-03 02:48:20'),
	(375, 8, '2', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/1', '2016-10-03 02:48:20'),
	(376, 13, '1544000', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/1', '2016-10-03 02:48:20'),
	(377, 28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/1', '2016-10-03 02:48:20'),
	(378, 18, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/1', '2016-10-03 02:48:20'),
	(379, 8, '2', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/1', '2016-10-03 02:48:20'),
	(380, 13, '10000000', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/1', '2016-10-03 02:48:20'),
	(381, 28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/1', '2016-10-03 02:48:20'),
	(382, 18, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/1', '2016-10-03 02:48:20'),
	(383, 8, '1', '172.23.101.2_CARREFOR_PUERTO_MADERO_Null0', '2016-10-03 02:48:20'),
	(384, 13, '4294967295', '172.23.101.2_CARREFOR_PUERTO_MADERO_Null0', '2016-10-03 02:48:20'),
	(385, 28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Null0', '2016-10-03 02:48:20'),
	(386, 18, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Null0', '2016-10-03 02:48:20'),
	(387, 19, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet1/0', '2016-10-03 02:48:20'),
	(388, 19, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/0', '2016-10-03 02:48:20'),
	(389, 19, '0.0022627027027027', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/0', '2016-10-03 02:48:20'),
	(390, 19, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/1', '2016-10-03 02:48:20'),
	(391, 19, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/1', '2016-10-03 02:48:20'),
	(392, 19, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Null0', '2016-10-03 02:48:20');
/*!40000 ALTER TABLE `flt_interface_status` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.interface
DROP TABLE IF EXISTS `interface`;
CREATE TABLE IF NOT EXISTS `interface` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `adminStatus` varchar(50) DEFAULT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `shelf` int(11) DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `subport` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `id_device` int(11) NOT NULL,
  `ifIndex` int(11) DEFAULT NULL,
  `ipAdEntIfIndex` varchar(50) DEFAULT NULL,
  `mac` varchar(50) DEFAULT NULL,
  `ip_next_hop` varchar(50) DEFAULT NULL,
  `mac_next_hop` varchar(50) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `ifSpeed` varchar(45) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_device` (`id_device`,`name`),
  KEY `mac` (`mac`),
  KEY `mac_next_hop` (`mac_next_hop`),
  CONSTRAINT `FK_interface_device` FOREIGN KEY (`id_device`) REFERENCES `device` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.interface: ~32 rows (aproximadamente)
DELETE FROM `interface`;
/*!40000 ALTER TABLE `interface` DISABLE KEYS */;
INSERT INTO `interface` (`id`, `adminStatus`, `alias`, `name`, `shelf`, `slot`, `port`, `subport`, `type`, `id_device`, `ifIndex`, `ipAdEntIfIndex`, `mac`, `ip_next_hop`, `mac_next_hop`, `last_update_date`, `ifSpeed`, `client_id`) VALUES
	(1, '1', '', 'FastEthernet1/0', NULL, 1, 0, NULL, 'FastEthernet', 1, 1, '172.27.10.1', '0xc2040f980010', '172.27.10.2', '0xc00719c00001', '2016-10-02 19:50:29', '100000000', 1),
	(2, '1', '', 'FastEthernet0/1', NULL, 0, 1, NULL, 'FastEthernet', 1, 3, '1.0.0.1', '0xc2040f980001', '1.0.0.10', '0x8efab5165c5a', '2016-10-02 19:50:29', '10000000', 1),
	(3, '1', '', 'FastEthernet0/0', NULL, 0, 0, NULL, 'FastEthernet', 1, 2, '172.28.9.1', '0xc2040f980000', '172.28.9.2', '0xc20516a40001', '2016-10-02 19:50:29', '10000000', 1),
	(4, '1', 'null no', 'Null0', NULL, NULL, NULL, NULL, '', 1, 5, '', '', '', '', '2016-10-31 20:52:56', '4294967295', 1),
	(5, '1', '', 'FastEthernet1/0', NULL, 1, 0, NULL, 'FastEthernet', 67, 1, '172.26.19.1', '0xc00719c00010', NULL, NULL, '2016-10-02 19:50:29', '100000000', 1),
	(6, '2', '', 'Serial0/0', NULL, 0, 0, NULL, 'Serial', 67, 3, NULL, '', NULL, NULL, '2016-10-02 19:50:29', '1544000', 1),
	(7, '1', '', 'FastEthernet0/0', NULL, 0, 0, NULL, 'FastEthernet', 67, 2, '172.31.103.1', '0xc00719c00000', '172.31.103.20', '0xc00117880000', '2016-10-02 19:50:29', '10000000', 1),
	(8, '2', '', 'Serial0/1', NULL, 0, 1, NULL, 'Serial', 67, 5, NULL, '', NULL, NULL, '2016-10-02 19:50:29', '1544000', 1),
	(9, '1', '', 'FastEthernet0/1', NULL, 0, 1, NULL, 'FastEthernet', 67, 4, '172.27.10.2', '0xc00719c00001', '172.27.10.1', '0xc2040f980010', '2016-10-02 19:50:29', '10000000', 1),
	(10, '1', '', 'Null0', NULL, NULL, NULL, NULL, NULL, 67, 7, NULL, '', NULL, NULL, '2016-10-02 19:50:29', '4294967295', 1),
	(11, '1', '', 'FastEthernet1/0', NULL, 1, 0, NULL, 'FastEthernet', 68, 1, '172.23.101.1', '0xc20516a40010', '172.23.101.2', '0xc00917dc0000', '2016-10-02 19:50:29', '100000000', 1),
	(12, '1', '', 'FastEthernet0/1', NULL, 0, 1, NULL, 'FastEthernet', 68, 3, '172.28.9.2', '0xc20516a40001', '172.28.9.1', '0xc2040f980000', '2016-10-02 19:50:29', '10000000', 1),
	(13, '1', '', 'FastEthernet0/0', NULL, 0, 0, NULL, 'FastEthernet', 68, 2, '172.29.132.1', '0xc20516a40000', '172.29.132.10', '0xc00618140000', '2016-10-02 19:50:29', '10000000', 1),
	(14, '1', '', 'Null0', NULL, NULL, NULL, NULL, NULL, 68, 5, NULL, '', NULL, NULL, '2016-10-02 19:50:29', '4294967295', 1),
	(15, '2', '', 'FastEthernet1/0', NULL, 1, 0, NULL, 'FastEthernet', 69, 1, NULL, '0xc00117880010', NULL, NULL, '2016-10-02 19:50:29', '100000000', 1),
	(16, '2', '', 'Serial0/0', NULL, 0, 0, NULL, 'Serial', 69, 3, NULL, '', NULL, NULL, '2016-10-02 19:50:29', '1544000', 1),
	(17, '1', '', 'FastEthernet0/0', NULL, 0, 0, NULL, 'FastEthernet', 69, 2, '172.31.103.20', '0xc00117880000', '172.31.103.1', '0xc00719c00000', '2016-10-02 19:50:29', '10000000', 1),
	(18, '2', '', 'Serial0/1', NULL, 0, 1, NULL, 'Serial', 69, 5, NULL, '', NULL, NULL, '2016-10-02 19:50:29', '1544000', 1),
	(19, '1', '', 'FastEthernet0/1', NULL, 0, 1, NULL, 'FastEthernet', 69, 4, '172.22.107.1', '0xc00117880001', NULL, NULL, '2016-10-02 19:50:29', '10000000', 1),
	(20, '1', '', 'Null0', NULL, NULL, NULL, NULL, NULL, 69, 7, NULL, '', NULL, NULL, '2016-10-02 19:50:29', '4294967295', 1),
	(21, '1', '', 'FastEthernet1/0', NULL, 1, 0, NULL, 'FastEthernet', 70, 1, '172.31.106.20', '0xc00618140010', NULL, NULL, '2016-10-02 19:50:29', '100000000', 1),
	(22, '2', '', 'Serial0/0', NULL, 0, 0, NULL, 'Serial', 70, 3, NULL, '', NULL, NULL, '2016-10-02 19:50:29', '1544000', 1),
	(23, '1', '', 'FastEthernet0/0', NULL, 0, 0, NULL, 'FastEthernet', 70, 2, '172.29.132.10', '0xc00618140000', '172.29.132.1', '0xc20516a40000', '2016-10-02 19:50:29', '10000000', 1),
	(24, '2', '', 'Serial0/1', NULL, 0, 1, NULL, 'Serial', 70, 5, NULL, '', NULL, NULL, '2016-10-02 19:50:29', '1544000', 1),
	(25, '2', '', 'FastEthernet0/1', NULL, 0, 1, NULL, 'FastEthernet', 70, 4, NULL, '0xc00618140001', NULL, NULL, '2016-10-02 19:50:29', '10000000', 1),
	(26, '1', '', 'Null0', NULL, NULL, NULL, NULL, NULL, 70, 7, NULL, '', NULL, NULL, '2016-10-02 19:50:29', '4294967295', 1),
	(27, '2', '', 'FastEthernet1/0', NULL, 1, 0, NULL, 'FastEthernet', 71, 1, NULL, '0xc00917dc0010', NULL, NULL, '2016-10-02 19:50:29', '100000000', 1),
	(28, '2', '', 'Serial0/0', NULL, 0, 0, NULL, 'Serial', 71, 3, NULL, '', NULL, NULL, '2016-10-02 19:50:29', '1544000', 1),
	(29, '1', '', 'FastEthernet0/0', NULL, 0, 0, NULL, 'FastEthernet', 71, 2, '172.23.101.2', '0xc00917dc0000', '172.23.101.1', '0xc20516a40010', '2016-10-02 19:50:29', '10000000', 1),
	(30, '2', '', 'Serial0/1', NULL, 0, 1, NULL, 'Serial', 71, 5, NULL, '', NULL, NULL, '2016-10-02 19:50:29', '1544000', 1),
	(31, '2', '', 'FastEthernet0/1', NULL, 0, 1, NULL, 'FastEthernet', 71, 4, NULL, '0xc00917dc0001', NULL, NULL, '2016-10-02 19:50:29', '10000000', 1),
	(32, '1', '', 'Null0', NULL, NULL, NULL, NULL, NULL, 71, 7, NULL, '', NULL, NULL, '2016-10-02 19:50:29', '4294967295', 1);
/*!40000 ALTER TABLE `interface` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.last_element_status
DROP TABLE IF EXISTS `last_element_status`;
CREATE TABLE IF NOT EXISTS `last_element_status` (
  `idVariable` int(11) NOT NULL DEFAULT '0',
  `valor` varchar(255) DEFAULT NULL,
  `elementName` varchar(255) NOT NULL DEFAULT '',
  `last_update_state` datetime DEFAULT NULL,
  PRIMARY KEY (`elementName`,`idVariable`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.last_element_status: ~196 rows (aproximadamente)
DELETE FROM `last_element_status`;
/*!40000 ALTER TABLE `last_element_status` DISABLE KEYS */;
INSERT INTO `last_element_status` (`idVariable`, `valor`, `elementName`, `last_update_state`) VALUES
	(20, '1', '1.0.0.1_R3', '2016-10-03 02:48:20'),
	(22, '2.486', '1.0.0.1_R3', '2016-10-03 02:48:20'),
	(23, '2.486', '1.0.0.1_R3', '2016-10-03 02:48:20'),
	(24, '2.486', '1.0.0.1_R3', '2016-10-03 02:48:20'),
	(25, '0.000', '1.0.0.1_R3', '2016-10-03 02:48:20'),
	(26, 'OK', '1.0.0.1_R3', '2016-10-03 02:48:20'),
	(8, '1', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:48:20'),
	(13, '10000000', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:48:20'),
	(18, '16468', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:48:20'),
	(19, '0.00537081081081081', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:48:20'),
	(28, '0', '1.0.0.1_R3_FastEthernet0/0', '2016-10-03 02:48:20'),
	(8, '1', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:48:20'),
	(13, '10000000', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:48:20'),
	(18, '33813', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:48:20'),
	(19, '0.00982486486486486', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:48:20'),
	(28, '0', '1.0.0.1_R3_FastEthernet0/1', '2016-10-03 02:48:20'),
	(8, '1', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:48:20'),
	(13, '100000000', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:48:20'),
	(18, '14588', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:48:20'),
	(19, '0.000399513513513513', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:48:20'),
	(28, '0', '1.0.0.1_R3_FastEthernet1/0', '2016-10-03 02:48:20'),
	(8, '1', '1.0.0.1_R3_Null0', '2016-10-03 02:48:20'),
	(13, '4294967295', '1.0.0.1_R3_Null0', '2016-10-03 02:48:20'),
	(18, '0', '1.0.0.1_R3_Null0', '2016-10-03 02:48:20'),
	(19, '0', '1.0.0.1_R3_Null0', '2016-10-03 02:48:20'),
	(28, '0', '1.0.0.1_R3_Null0', '2016-10-03 02:48:20'),
	(20, '1', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:48:20'),
	(22, '40.321', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:48:20'),
	(23, '40.321', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:48:20'),
	(24, '40.321', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:48:20'),
	(25, '0.000', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:48:20'),
	(26, 'OK', '172.23.101.2_CARREFOR_PUERTO_MADERO', '2016-10-03 02:48:20'),
	(8, '1', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/0', '2016-10-03 02:48:20'),
	(13, '10000000', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/0', '2016-10-03 02:48:20'),
	(18, '15223', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/0', '2016-10-03 02:48:20'),
	(19, '0.0022627027027027', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/0', '2016-10-03 02:48:20'),
	(28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/0', '2016-10-03 02:48:20'),
	(8, '2', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/1', '2016-10-03 02:48:20'),
	(13, '10000000', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/1', '2016-10-03 02:48:20'),
	(18, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/1', '2016-10-03 02:48:20'),
	(19, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/1', '2016-10-03 02:48:20'),
	(28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet0/1', '2016-10-03 02:48:20'),
	(8, '2', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet1/0', '2016-10-03 02:48:20'),
	(13, '100000000', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet1/0', '2016-10-03 02:48:20'),
	(18, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet1/0', '2016-10-03 02:48:20'),
	(19, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet1/0', '2016-10-03 02:48:20'),
	(28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_FastEthernet1/0', '2016-10-03 02:48:20'),
	(8, '1', '172.23.101.2_CARREFOR_PUERTO_MADERO_Null0', '2016-10-03 02:48:20'),
	(13, '4294967295', '172.23.101.2_CARREFOR_PUERTO_MADERO_Null0', '2016-10-03 02:48:20'),
	(18, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Null0', '2016-10-03 02:48:20'),
	(19, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Null0', '2016-10-03 02:48:20'),
	(28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Null0', '2016-10-03 02:48:20'),
	(8, '2', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/0', '2016-10-03 02:48:20'),
	(13, '1544000', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/0', '2016-10-03 02:48:20'),
	(18, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/0', '2016-10-03 02:48:20'),
	(19, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/0', '2016-10-03 02:48:20'),
	(28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/0', '2016-10-03 02:48:20'),
	(8, '2', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/1', '2016-10-03 02:48:20'),
	(13, '1544000', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/1', '2016-10-03 02:48:20'),
	(18, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/1', '2016-10-03 02:48:20'),
	(19, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/1', '2016-10-03 02:48:20'),
	(28, '0', '172.23.101.2_CARREFOR_PUERTO_MADERO_Serial0/1', '2016-10-03 02:48:20'),
	(20, '1', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(22, '17.932', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(23, '17.932', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(24, '17.932', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(25, '0.000', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(26, 'OK', '172.27.10.2_DIA_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(8, '1', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(13, '10000000', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(18, '10159', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(19, '0.00210864864864865', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(28, '0', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(8, '1', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(13, '10000000', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(18, '17375', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(19, '0.00412648648648649', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(28, '0', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(8, '1', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(13, '100000000', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(18, '5263', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(19, '0.0000241081081081081', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(28, '0', '172.27.10.2_DIA_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(8, '1', '172.27.10.2_DIA_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(13, '4294967295', '172.27.10.2_DIA_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(18, '0', '172.27.10.2_DIA_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(19, '0', '172.27.10.2_DIA_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(28, '0', '172.27.10.2_DIA_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(8, '2', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(13, '1544000', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(18, '0', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(19, '0', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(28, '0', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(8, '2', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(13, '1544000', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(18, '0', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(19, '0', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(28, '0', '172.27.10.2_DIA_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(20, '0', '172.28.9.2_R2', '2016-10-03 02:48:20'),
	(22, '12.298', '172.28.9.2_R2', '2016-10-03 02:48:20'),
	(23, '12.298', '172.28.9.2_R2', '2016-10-03 02:48:20'),
	(24, '12.298', '172.28.9.2_R2', '2016-10-03 02:48:20'),
	(25, '0.000', '172.28.9.2_R2', '2016-10-03 02:48:20'),
	(26, 'OK', '172.28.9.2_R2', '2016-10-03 02:48:20'),
	(8, '1', '172.28.9.2_R2_FastEthernet0/0', '2016-10-03 02:48:20'),
	(13, '10000000', '172.28.9.2_R2_FastEthernet0/0', '2016-10-03 02:48:20'),
	(18, '8638', '172.28.9.2_R2_FastEthernet0/0', '2016-10-03 02:48:20'),
	(19, '0.00204216216216216', '172.28.9.2_R2_FastEthernet0/0', '2016-10-03 02:48:20'),
	(28, '0', '172.28.9.2_R2_FastEthernet0/0', '2016-10-03 02:48:20'),
	(8, '1', '172.28.9.2_R2_FastEthernet0/1', '2016-10-03 02:48:20'),
	(13, '10000000', '172.28.9.2_R2_FastEthernet0/1', '2016-10-03 02:48:20'),
	(18, '19885', '172.28.9.2_R2_FastEthernet0/1', '2016-10-03 02:48:20'),
	(19, '0.00527243243243243', '172.28.9.2_R2_FastEthernet0/1', '2016-10-03 02:48:20'),
	(28, '0', '172.28.9.2_R2_FastEthernet0/1', '2016-10-03 02:48:20'),
	(8, '1', '172.28.9.2_R2_FastEthernet1/0', '2016-10-03 02:48:20'),
	(13, '100000000', '172.28.9.2_R2_FastEthernet1/0', '2016-10-03 02:48:20'),
	(18, '8726', '172.28.9.2_R2_FastEthernet1/0', '2016-10-03 02:48:20'),
	(19, '0.000204216216216216', '172.28.9.2_R2_FastEthernet1/0', '2016-10-03 02:48:20'),
	(28, '0', '172.28.9.2_R2_FastEthernet1/0', '2016-10-03 02:48:20'),
	(8, '1', '172.28.9.2_R2_Null0', '2016-10-03 02:48:20'),
	(13, '4294967295', '172.28.9.2_R2_Null0', '2016-10-03 02:48:20'),
	(18, '0', '172.28.9.2_R2_Null0', '2016-10-03 02:48:20'),
	(19, '0', '172.28.9.2_R2_Null0', '2016-10-03 02:48:20'),
	(28, '0', '172.28.9.2_R2_Null0', '2016-10-03 02:48:20'),
	(20, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(22, '28.357', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(23, '28.357', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(24, '28.357', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(25, '0.000', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(26, 'OK', '172.29.132.10_CARREFOUR_CASA_CENTRAL', '2016-10-03 02:48:20'),
	(8, '1', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(13, '10000000', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(18, '15097', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(19, '0.00216216216216216', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/0', '2016-10-03 02:48:20'),
	(8, '2', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(13, '10000000', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(18, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(19, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet0/1', '2016-10-03 02:48:20'),
	(8, '1', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(13, '100000000', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(18, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(19, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_FastEthernet1/0', '2016-10-03 02:48:20'),
	(8, '1', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(13, '4294967295', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(18, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(19, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Null0', '2016-10-03 02:48:20'),
	(8, '2', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(13, '1544000', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(18, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(19, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/0', '2016-10-03 02:48:20'),
	(8, '2', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(13, '1544000', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(18, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(19, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(28, '0', '172.29.132.10_CARREFOUR_CASA_CENTRAL_Serial0/1', '2016-10-03 02:48:20'),
	(20, '1', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:48:20'),
	(22, '37.446', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:48:20'),
	(23, '37.446', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:48:20'),
	(24, '37.446', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:48:20'),
	(25, '0.000', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:48:20'),
	(26, 'OK', '172.31.103.20_DIA_TAPIALES', '2016-10-03 02:48:20'),
	(8, '1', '172.31.103.20_DIA_TAPIALES_FastEthernet0/0', '2016-10-03 02:48:20'),
	(13, '10000000', '172.31.103.20_DIA_TAPIALES_FastEthernet0/0', '2016-10-03 02:48:20'),
	(18, '14959', '172.31.103.20_DIA_TAPIALES_FastEthernet0/0', '2016-10-03 02:48:20'),
	(19, '0.00234702702702703', '172.31.103.20_DIA_TAPIALES_FastEthernet0/0', '2016-10-03 02:48:20'),
	(28, '0', '172.31.103.20_DIA_TAPIALES_FastEthernet0/0', '2016-10-03 02:48:20'),
	(8, '1', '172.31.103.20_DIA_TAPIALES_FastEthernet0/1', '2016-10-03 02:48:20'),
	(13, '10000000', '172.31.103.20_DIA_TAPIALES_FastEthernet0/1', '2016-10-03 02:48:20'),
	(18, '4990', '172.31.103.20_DIA_TAPIALES_FastEthernet0/1', '2016-10-03 02:48:20'),
	(19, '0.0002', '172.31.103.20_DIA_TAPIALES_FastEthernet0/1', '2016-10-03 02:48:20'),
	(28, '0', '172.31.103.20_DIA_TAPIALES_FastEthernet0/1', '2016-10-03 02:48:20'),
	(8, '2', '172.31.103.20_DIA_TAPIALES_FastEthernet1/0', '2016-10-03 02:48:20'),
	(13, '100000000', '172.31.103.20_DIA_TAPIALES_FastEthernet1/0', '2016-10-03 02:48:20'),
	(18, '0', '172.31.103.20_DIA_TAPIALES_FastEthernet1/0', '2016-10-03 02:48:20'),
	(19, '0', '172.31.103.20_DIA_TAPIALES_FastEthernet1/0', '2016-10-03 02:48:20'),
	(28, '0', '172.31.103.20_DIA_TAPIALES_FastEthernet1/0', '2016-10-03 02:48:20'),
	(8, '1', '172.31.103.20_DIA_TAPIALES_Null0', '2016-10-03 02:48:20'),
	(13, '4294967295', '172.31.103.20_DIA_TAPIALES_Null0', '2016-10-03 02:48:20'),
	(18, '0', '172.31.103.20_DIA_TAPIALES_Null0', '2016-10-03 02:48:20'),
	(19, '0', '172.31.103.20_DIA_TAPIALES_Null0', '2016-10-03 02:48:20'),
	(28, '0', '172.31.103.20_DIA_TAPIALES_Null0', '2016-10-03 02:48:20'),
	(8, '2', '172.31.103.20_DIA_TAPIALES_Serial0/0', '2016-10-03 02:48:20'),
	(13, '1544000', '172.31.103.20_DIA_TAPIALES_Serial0/0', '2016-10-03 02:48:20'),
	(18, '0', '172.31.103.20_DIA_TAPIALES_Serial0/0', '2016-10-03 02:48:20'),
	(19, '0', '172.31.103.20_DIA_TAPIALES_Serial0/0', '2016-10-03 02:48:20'),
	(28, '0', '172.31.103.20_DIA_TAPIALES_Serial0/0', '2016-10-03 02:48:20'),
	(8, '2', '172.31.103.20_DIA_TAPIALES_Serial0/1', '2016-10-03 02:48:20'),
	(13, '1544000', '172.31.103.20_DIA_TAPIALES_Serial0/1', '2016-10-03 02:48:20'),
	(18, '0', '172.31.103.20_DIA_TAPIALES_Serial0/1', '2016-10-03 02:48:20'),
	(19, '0', '172.31.103.20_DIA_TAPIALES_Serial0/1', '2016-10-03 02:48:20'),
	(28, '0', '172.31.103.20_DIA_TAPIALES_Serial0/1', '2016-10-03 02:48:20');
/*!40000 ALTER TABLE `last_element_status` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.network
DROP TABLE IF EXISTS `network`;
CREATE TABLE IF NOT EXISTS `network` (
  `id_network` int(11) NOT NULL,
  `network` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `description` varchar(50) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_network`),
  KEY `FK_network_client` (`client_id`),
  CONSTRAINT `FK_network_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.network: ~1 rows (aproximadamente)
DELETE FROM `network`;
/*!40000 ALTER TABLE `network` DISABLE KEYS */;
INSERT INTO `network` (`id_network`, `network`, `enabled`, `description`, `client_id`) VALUES
	(0, '1.0.0.0/16', 0, 'Test', 1);
/*!40000 ALTER TABLE `network` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.role
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(15) NOT NULL,
  `allow_create` tinyint(1) NOT NULL,
  `allow_delete` tinyint(1) NOT NULL,
  `allow_update` tinyint(1) NOT NULL,
  `allow_reports` int(11) NOT NULL,
  PRIMARY KEY (`role_id`) COMMENT 'Role primary key'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.role: ~5 rows (aproximadamente)
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`role_id`, `role_name`, `allow_create`, `allow_delete`, `allow_update`, `allow_reports`) VALUES
	(0, 'SUPERADMIN', 1, 1, 1, 1),
	(1, 'ADMIN', 1, 1, 1, 1),
	(2, 'USER', 1, 1, 1, 1),
	(3, 'REPORT', 0, 0, 0, 1),
	(4, 'PENDIENTE', 0, 0, 0, 0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.routetable
DROP TABLE IF EXISTS `routetable`;
CREATE TABLE IF NOT EXISTS `routetable` (
  `id_equipo` bigint(20) DEFAULT NULL,
  `id_interface` bigint(20) DEFAULT NULL,
  `mac_destino` varchar(50) DEFAULT NULL,
  `ip_destino` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.routetable: ~0 rows (aproximadamente)
DELETE FROM `routetable`;
/*!40000 ALTER TABLE `routetable` DISABLE KEYS */;
/*!40000 ALTER TABLE `routetable` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` varchar(10) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `notas` varchar(250) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `completePicDir` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`user_id`) COMMENT 'Primary Key for user table',
  KEY `FK_UserRole` (`role_id`) COMMENT 'Foreing key for user role',
  KEY `FK_user_client` (`client_id`),
  CONSTRAINT `FK_user_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `USER_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.user: ~3 rows (aproximadamente)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `password`, `email`, `name`, `last_name`, `role_id`, `user_name`, `address`, `notas`, `client_id`, `completePicDir`) VALUES
	('0', 'd5769e7e2f439a2c1d2f90ae1173d2f1', 'admin@tmnintegral.com', 'admin', 'admin', 0, 'SUPERADMIN', NULL, NULL, 0, NULL),
	('1', '66614cb39b5b09b39c78ab4543daabda', 'admin@tmnintegral.com', 'ADMIN', 'Admin', 1, 'ADMIN', NULL, NULL, 1, NULL),
	('7', 'b772f415482a1210f359c92081c37899', '', 'Agustina', 'Stekolschik', 1, 'agussteko1', '', '', 1, '7-IMG_6718.JPG');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.user_log
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE IF NOT EXISTS `user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `log_desc` varchar(80) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.user_log: ~148 rows (aproximadamente)
DELETE FROM `user_log`;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
INSERT INTO `user_log` (`id`, `user`, `date`, `log_desc`) VALUES
	(1, 2, '2015-11-23 21:17:50', 'El usuario ingreso a la plataforma'),
	(2, 2, '2015-11-23 21:18:05', 'El usuario salió de la plataforma'),
	(3, 2, '2015-11-23 21:18:37', 'El usuario ingreso a la plataforma'),
	(4, 2, '2015-11-23 21:41:56', 'El usuario ingreso a la plataforma'),
	(5, 2, '2015-11-23 21:47:52', 'El usuario ingreso a la plataforma'),
	(6, 2, '2015-11-23 22:21:53', 'El usuario ingreso a la plataforma'),
	(7, 2, '2015-11-25 19:26:06', 'El usuario ingreso a la plataforma'),
	(8, 7, '2016-09-07 21:09:49', 'El usuario ingreso a la plataforma'),
	(9, NULL, '2016-10-15 16:21:47', 'El usuario agussteko1 pidió un reset de contraseña'),
	(10, NULL, '2016-10-15 16:21:47', 'El usuario agussteko1 pidió un reset de contraseña'),
	(11, NULL, '2016-10-15 16:22:23', 'El usuario agussteko1 pidió un reset de contraseña'),
	(12, 7, '2016-10-15 16:22:37', 'El usuario ingreso a la plataforma'),
	(13, 7, '2016-10-15 16:24:15', 'El usuario salió de la plataforma'),
	(14, 7, '2016-10-15 16:24:24', 'El usuario ingreso a la plataforma'),
	(15, 7, '2016-10-16 20:19:38', 'El usuario ingreso a la plataforma'),
	(16, 7, '2016-10-16 20:20:40', 'El usuario ingreso a la plataforma'),
	(17, 7, '2016-10-16 20:21:17', 'El usuario ingreso a la plataforma'),
	(18, 7, '2016-10-16 20:22:32', 'El usuario ingreso a la plataforma'),
	(19, 7, '2016-10-16 20:28:16', 'El usuario ingreso a la plataforma'),
	(20, 7, '2016-10-16 20:29:14', 'El usuario ingreso a la plataforma'),
	(21, 7, '2016-10-16 20:30:40', 'El usuario ingreso a la plataforma'),
	(22, 7, '2016-10-17 20:15:58', 'El usuario ingreso a la plataforma'),
	(23, 7, '2016-10-17 20:38:54', 'El usuario ingreso a la plataforma'),
	(24, 7, '2016-10-17 20:40:41', 'El usuario ingreso a la plataforma'),
	(25, 7, '2016-10-17 20:41:03', 'El usuario ingreso a la plataforma'),
	(26, 7, '2016-10-17 20:41:59', 'El usuario ingreso a la plataforma'),
	(27, 7, '2016-10-17 20:43:16', 'El usuario ingreso a la plataforma'),
	(28, 7, '2016-10-17 21:39:54', 'El usuario ingreso a la plataforma'),
	(29, 7, '2016-10-17 21:47:58', 'El usuario ingreso a la plataforma'),
	(30, 7, '2016-10-17 21:52:52', 'El usuario ingreso a la plataforma'),
	(31, 7, '2016-10-17 21:54:45', 'El usuario ingreso a la plataforma'),
	(32, 7, '2016-10-17 23:00:29', 'El usuario ingreso a la plataforma'),
	(33, 7, '2016-10-17 23:02:32', 'El usuario ingreso a la plataforma'),
	(34, 7, '2016-10-17 23:03:25', 'El usuario ingreso a la plataforma'),
	(35, 7, '2016-10-17 23:05:40', 'El usuario ingreso a la plataforma'),
	(36, 7, '2016-10-17 23:08:38', 'El usuario ingreso a la plataforma'),
	(37, 7, '2016-10-17 23:23:45', 'El usuario ingreso a la plataforma'),
	(38, 7, '2016-10-17 23:28:09', 'El usuario ingreso a la plataforma'),
	(39, 7, '2016-10-17 23:30:30', 'El usuario ingreso a la plataforma'),
	(40, 7, '2016-10-17 23:37:22', 'El usuario ingreso a la plataforma'),
	(41, 7, '2016-10-17 23:38:21', 'El usuario ingreso a la plataforma'),
	(42, 7, '2016-10-17 23:39:32', 'El usuario ingreso a la plataforma'),
	(43, 7, '2016-10-18 00:30:07', 'El usuario ingreso a la plataforma'),
	(44, 7, '2016-10-18 00:49:20', 'El usuario ingreso a la plataforma'),
	(45, 7, '2016-10-18 00:49:57', 'El usuario ingreso a la plataforma'),
	(46, 7, '2016-10-18 00:50:50', 'El usuario ingreso a la plataforma'),
	(47, 7, '2016-10-18 00:52:08', 'El usuario ingreso a la plataforma'),
	(48, 7, '2016-10-18 00:53:03', 'El usuario ingreso a la plataforma'),
	(49, 7, '2016-10-18 13:07:17', 'El usuario ingreso a la plataforma'),
	(50, 7, '2016-10-18 13:56:24', 'El usuario ingreso a la plataforma'),
	(51, 7, '2016-10-18 13:58:44', 'El usuario ingreso a la plataforma'),
	(52, 7, '2016-10-18 13:59:51', 'El usuario ingreso a la plataforma'),
	(53, 7, '2016-10-18 14:01:33', 'El usuario ingreso a la plataforma'),
	(54, 7, '2016-10-18 14:03:33', 'El usuario ingreso a la plataforma'),
	(55, 7, '2016-10-18 14:55:58', 'El usuario ingreso a la plataforma'),
	(56, 7, '2016-10-18 14:56:59', 'El usuario ingreso a la plataforma'),
	(57, 7, '2016-10-18 14:57:09', 'El usuario ingreso a la plataforma'),
	(58, 7, '2016-10-18 15:22:12', 'El usuario ingreso a la plataforma'),
	(59, 7, '2016-10-18 16:04:13', 'El usuario ingreso a la plataforma'),
	(60, 7, '2016-10-18 17:04:50', 'El usuario ingreso a la plataforma'),
	(61, 7, '2016-10-18 17:05:25', 'El usuario ingreso a la plataforma'),
	(62, 7, '2016-10-22 12:57:33', 'El usuario ingreso a la plataforma'),
	(63, 7, '2016-10-22 13:11:23', 'El usuario ingreso a la plataforma'),
	(64, 7, '2016-10-22 13:12:13', 'El usuario ingreso a la plataforma'),
	(65, 7, '2016-10-22 13:17:52', 'El usuario ingreso a la plataforma'),
	(66, 7, '2016-10-25 19:11:01', 'El usuario ingreso a la plataforma'),
	(67, 7, '2016-10-25 19:12:19', 'El usuario salió de la plataforma'),
	(68, 7, '2016-10-25 19:12:27', 'El usuario ingreso a la plataforma'),
	(69, 7, '2016-10-25 19:12:31', 'El usuario salió de la plataforma'),
	(70, 7, '2016-10-25 19:14:49', 'El usuario ingreso a la plataforma'),
	(71, 7, '2016-10-25 19:24:31', 'El usuario ingreso a la plataforma'),
	(72, 7, '2016-10-25 19:25:32', 'El usuario ingreso a la plataforma'),
	(73, 7, '2016-10-25 19:28:48', 'El usuario ingreso a la plataforma'),
	(74, 7, '2016-10-25 19:30:40', 'El usuario ingreso a la plataforma'),
	(75, 7, '2016-10-25 19:35:56', 'El usuario ingreso a la plataforma'),
	(76, 7, '2016-10-25 19:37:05', 'El usuario salió de la plataforma'),
	(77, 7, '2016-10-25 19:37:14', 'El usuario ingreso a la plataforma'),
	(78, 7, '2016-10-25 19:41:46', 'El usuario ingreso a la plataforma'),
	(79, 7, '2016-10-25 19:43:58', 'El usuario ingreso a la plataforma'),
	(80, 7, '2016-10-25 19:49:40', 'El usuario ingreso a la plataforma'),
	(81, 7, '2016-10-25 19:49:47', 'El usuario ingreso a la plataforma'),
	(82, 7, '2016-10-25 19:49:56', 'El usuario ingreso a la plataforma'),
	(83, 7, '2016-10-25 20:10:24', 'El usuario ingreso a la plataforma'),
	(84, 7, '2016-10-25 20:12:43', 'El usuario ingreso a la plataforma'),
	(85, NULL, '2016-10-25 21:31:09', 'El usuario 99 pidió un reset de contraseña'),
	(86, NULL, '2016-10-25 21:33:37', 'El usuario 99 pidió un reset de contraseña'),
	(87, 7, '2016-10-25 21:36:31', 'El usuario ingreso a la plataforma'),
	(88, 7, '2016-10-25 21:36:57', 'El usuario ingreso a la plataforma'),
	(89, 7, '2016-10-26 19:35:50', 'El usuario ingreso a la plataforma'),
	(90, 7, '2016-10-26 19:50:06', 'El usuario ingreso a la plataforma'),
	(91, 7, '2016-10-26 19:52:20', 'El usuario ingreso a la plataforma'),
	(92, 7, '2016-10-26 19:52:26', 'El usuario salió de la plataforma'),
	(93, 7, '2016-10-26 19:52:30', 'El usuario ingreso a la plataforma'),
	(94, 7, '2016-10-26 20:13:09', 'El usuario ingreso a la plataforma'),
	(95, 7, '2016-10-26 20:13:38', 'El usuario salió de la plataforma'),
	(96, 7, '2016-10-26 20:14:01', 'El usuario ingreso a la plataforma'),
	(97, 7, '2016-10-26 20:17:16', 'El usuario ingreso a la plataforma'),
	(98, 7, '2016-10-26 20:19:09', 'El usuario ingreso a la plataforma'),
	(99, 7, '2016-10-26 20:24:02', 'El usuario ingreso a la plataforma'),
	(100, 7, '2016-10-26 20:30:51', 'El usuario ingreso a la plataforma'),
	(101, 7, '2016-10-26 23:35:30', 'El usuario ingreso a la plataforma'),
	(102, 7, '2016-10-26 23:42:28', 'El usuario salió de la plataforma'),
	(103, NULL, '2016-10-27 23:13:31', 'El usuario agussteko1 pidió un reset de contraseña'),
	(104, NULL, '2016-10-27 23:36:59', 'El usuario agussteko1 pidió un reset de contraseña'),
	(105, 7, '2016-10-27 23:37:14', 'El usuario ingreso a la plataforma'),
	(106, 7, '2016-10-27 23:44:29', 'El usuario salió de la plataforma'),
	(107, NULL, '2016-10-27 23:45:07', 'El usuario SUPERADMIN pidió un reset de contraseña'),
	(108, 0, '2016-10-27 23:45:22', 'El usuario ingreso a la plataforma'),
	(109, 0, '2016-10-27 23:45:32', 'El usuario salió de la plataforma'),
	(110, 0, '2016-10-27 23:48:10', 'El usuario ingreso a la plataforma'),
	(111, 0, '2016-10-27 23:48:21', 'El usuario ingreso a la plataforma'),
	(112, 0, '2016-10-27 23:53:25', 'El usuario salió de la plataforma'),
	(113, 7, '2016-10-27 23:57:34', 'El usuario ingreso a la plataforma'),
	(114, 7, '2016-10-27 23:59:13', 'El usuario salió de la plataforma'),
	(115, 100, '2016-10-27 23:59:37', 'El usuario ingreso a la plataforma'),
	(116, 100, '2016-10-28 00:02:18', 'El usuario salió de la plataforma'),
	(117, 100, '2016-10-28 00:06:19', 'El usuario ingreso a la plataforma'),
	(118, 100, '2016-10-28 00:06:25', 'El usuario salió de la plataforma'),
	(119, 100, '2016-10-28 00:06:48', 'El usuario ingreso a la plataforma'),
	(120, 100, '2016-10-28 00:12:29', 'El usuario salió de la plataforma'),
	(121, 100, '2016-10-28 19:26:27', 'El usuario ingreso a la plataforma'),
	(122, 100, '2016-10-28 19:26:35', 'El usuario salió de la plataforma'),
	(123, 7, '2016-10-28 19:26:42', 'El usuario ingreso a la plataforma'),
	(124, 7, '2016-10-28 19:39:38', 'El usuario salió de la plataforma'),
	(125, 7, '2016-10-28 19:40:12', 'El usuario ingreso a la plataforma'),
	(126, 7, '2016-10-28 19:53:58', 'El usuario ingreso a la plataforma'),
	(127, 7, '2016-10-28 20:37:36', 'El usuario salió de la plataforma'),
	(128, 7, '2016-10-28 20:38:29', 'El usuario ingreso a la plataforma'),
	(129, 7, '2016-10-31 19:34:46', 'El usuario ingreso a la plataforma'),
	(130, 7, '2016-10-31 19:48:41', 'El usuario ingreso a la plataforma'),
	(131, 7, '2016-10-31 19:52:57', 'El usuario ingreso a la plataforma'),
	(132, 7, '2016-10-31 19:53:11', 'El usuario ingreso a la plataforma'),
	(133, 7, '2016-10-31 19:54:34', 'El usuario ingreso a la plataforma'),
	(134, 7, '2016-10-31 19:58:14', 'El usuario ingreso a la plataforma'),
	(135, 7, '2016-10-31 20:05:21', 'El usuario ingreso a la plataforma'),
	(136, 7, '2016-10-31 20:08:43', 'El usuario ingreso a la plataforma'),
	(137, 7, '2016-10-31 20:11:20', 'El usuario ingreso a la plataforma'),
	(138, 7, '2016-10-31 20:18:53', 'El usuario ingreso a la plataforma'),
	(139, 7, '2016-10-31 20:21:16', 'El usuario salió de la plataforma'),
	(140, 7, '2016-10-31 20:21:25', 'El usuario ingreso a la plataforma'),
	(141, 7, '2016-10-31 20:21:37', 'El usuario ingreso a la plataforma'),
	(142, 7, '2016-10-31 20:32:23', 'El usuario ingreso a la plataforma'),
	(143, 7, '2016-10-31 20:37:43', 'El usuario ingreso a la plataforma'),
	(144, 7, '2016-10-31 20:40:20', 'El usuario ingreso a la plataforma'),
	(145, 7, '2016-10-31 20:44:27', 'El usuario ingreso a la plataforma'),
	(146, 7, '2016-10-31 20:51:45', 'El usuario ingreso a la plataforma'),
	(147, 7, '2016-10-31 20:59:18', 'El usuario ingreso a la plataforma'),
	(148, 7, '2016-10-31 21:05:19', 'El usuario ingreso a la plataforma'),
	(149, 7, '2016-11-01 23:04:39', 'El usuario ingreso a la plataforma'),
	(150, 7, '2016-11-01 23:07:50', 'El usuario ingreso a la plataforma'),
	(151, 7, '2016-11-01 23:08:08', 'El usuario ingreso a la plataforma'),
	(152, NULL, '2016-11-01 23:08:14', 'El usuario agussteko1 pidió un reset de contraseña'),
	(153, 7, '2016-11-01 23:08:29', 'El usuario ingreso a la plataforma'),
	(154, 7, '2016-11-01 23:10:17', 'El usuario ingreso a la plataforma'),
	(155, NULL, '2016-11-01 23:12:24', 'El usuario agussteko1 pidió un reset de contraseña'),
	(156, 7, '2016-11-01 23:12:37', 'El usuario ingreso a la plataforma'),
	(157, 7, '2016-11-01 23:14:48', 'El usuario ingreso a la plataforma'),
	(158, 7, '2016-11-01 23:17:22', 'El usuario ingreso a la plataforma'),
	(159, 7, '2016-11-01 23:18:13', 'El usuario ingreso a la plataforma'),
	(160, 7, '2016-11-01 23:19:08', 'El usuario ingreso a la plataforma'),
	(161, 7, '2016-11-01 23:20:02', 'El usuario ingreso a la plataforma'),
	(162, 7, '2016-11-01 23:21:49', 'El usuario ingreso a la plataforma');
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.variable
DROP TABLE IF EXISTS `variable`;
CREATE TABLE IF NOT EXISTS `variable` (
  `variableName` varchar(255) DEFAULT NULL,
  `OID` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(45) NOT NULL DEFAULT 'SNMP',
  `ftl_umbral` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.variable: ~28 rows (aproximadamente)
DELETE FROM `variable`;
/*!40000 ALTER TABLE `variable` DISABLE KEYS */;
INSERT INTO `variable` (`variableName`, `OID`, `id`, `protocol`, `ftl_umbral`) VALUES
	('ifAdminStatus', '1.3.6.1.2.1.2.2.1.7', 1, 'SNMP', NULL),
	('sysDescr', '1.3.6.1.2.1.1.1', 2, 'SNMP', NULL),
	('sysName', '1.3.6.1.2.1.1.5', 3, 'SNMP', NULL),
	('ifAlias', '1.3.6.1.2.1.31.1.1.1.18', 4, 'SNMP', NULL),
	('ifDescr', '1.3.6.1.2.1.2.2.1.2', 5, 'SNMP', NULL),
	('ifName', '1.3.6.1.2.1.31.1.1.1.1', 6, 'SNMP', NULL),
	('ifType', '1.3.6.1.2.1.2.2.1.3', 7, 'SNMP', NULL),
	('ifOperStatus', '1.3.6.1.2.1.2.2.1.8', 8, 'SNMP', NULL),
	('entPhysicalSerialNum', '1.3.6.1.2.1.47.1.1.1.1.11', 9, 'SNMP', NULL),
	('ipAdEntIfIndex', '1.3.6.1.2.1.4.20.1.2', 10, 'SNMP', NULL),
	('ifPhysAddress', '1.3.6.1.2.1.2.2.1.6', 11, 'SNMP', NULL),
	('ipNetToMediaPhysAddress', '1.3.6.1.2.1.4.22.1.2', 12, 'SNMP', NULL),
	('ifSpeed', '1.3.6.1.2.1.2.2.1.5', 13, 'SNMP', NULL),
	('ifHighSpeed', '1.3.6.1.2.1.31.1.1.1.15', 14, 'SNMP', NULL),
	('ifHCInOctets', '1.3.6.1.2.1.31.1.1.1.6', 15, 'SNMP', NULL),
	('ifHCOutOctets', '1.3.6.1.2.1.31.1.1.1.10', 16, 'SNMP', NULL),
	('ifOutOctets', '1.3.6.1.2.1.2.2.1.16', 17, 'SNMP', NULL),
	('ifInOctets', '1.3.6.1.2.1.2.2.1.10', 18, 'SNMP', NULL),
	('bandwitdthIn', '1.3.6.1.2.1.2.2.1.10', 19, 'Virtual', NULL),
	('avgBusy5', '1.3.6.1.4.1.9.2.1.58', 20, 'SNMP', NULL),
	('avgBusy1', '1.3.6.1.4.1.9.2.1.57', 21, 'SNMP', NULL),
	('rtt_min', 'rtt_min', 22, 'ICMP', NULL),
	('rtt_avg', 'rtt_avg', 23, 'ICMP', NULL),
	('rtt_max', 'rtt_max', 24, 'ICMP', NULL),
	('rtt_mdev', 'rtt_mdev', 25, 'ICMP', NULL),
	('is_alive', 'is_alive', 26, 'ICMP', NULL),
	('ifOutErrors', '1.3.6.1.2.1.2.2.1.20', 28, 'SNMP', NULL),
	('ifInErrors', '1.3.6.1.2.1.2.2.1.14.1', 29, 'SNMP', NULL);
/*!40000 ALTER TABLE `variable` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.variable_devicetype
DROP TABLE IF EXISTS `variable_devicetype`;
CREATE TABLE IF NOT EXISTS `variable_devicetype` (
  `idVariable` int(11) NOT NULL,
  `idDeviceType` int(11) NOT NULL,
  `fieldName` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `regex` varchar(255) DEFAULT NULL,
  `operation` text,
  `invertir` char(50) DEFAULT 'N',
  `flt_umbral` varchar(255) DEFAULT NULL,
  `is_fault` char(1) DEFAULT 'N',
  `is_performance` char(1) DEFAULT 'N',
  `is_device` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`fieldName`,`idVariable`,`idDeviceType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.variable_devicetype: ~26 rows (aproximadamente)
DELETE FROM `variable_devicetype`;
/*!40000 ALTER TABLE `variable_devicetype` DISABLE KEYS */;
INSERT INTO `variable_devicetype` (`idVariable`, `idDeviceType`, `fieldName`, `type`, `regex`, `operation`, `invertir`, `flt_umbral`, `is_fault`, `is_performance`, `is_device`) VALUES
	(1, 0, 'adminStatus', '', NULL, NULL, 'N', NULL, 'N', 'N', 'N'),
	(4, 0, 'alias', '', NULL, NULL, 'N', NULL, 'N', 'N', 'N'),
	(20, 0, 'avgBusy', '', 'ping', '', 'N', NULL, 'Y', 'N', '0'),
	(19, 0, 'bandwitdthIn', 'Virtual', NULL, 'actStatus[ifIndex][\'bandwitdthIn\'] = (float ( actStatus[ifIndex][\'ifInOctets\']) - float(lastStatus[\'ifInOctets\'][\'valor\'] ))   * 800 /(float( actStatus[ifIndex][\'ifSpeed\']) * diffTimeVariable( timestamp,lastStatus,\'ifInOctets\' ))', 'N', 'interfStatus == 100', 'Y', 'N', 'N'),
	(18, 0, 'ifInOctets', '', NULL, NULL, 'N', NULL, 'Y', 'N', 'N'),
	(29, 0, 'ifIntErrors', '', NULL, NULL, 'N', NULL, 'N', 'N', 'N'),
	(28, 0, 'ifOutErrors', '', NULL, NULL, 'N', NULL, 'Y', 'N', 'N'),
	(17, 0, 'ifOutOctets', '', NULL, NULL, 'N', NULL, 'N', 'N', 'N'),
	(13, 0, 'ifSpeed', '', NULL, NULL, 'N', NULL, 'Y', 'N', 'N'),
	(2, 0, 'iosType', '', 'Software\\s+\\([^-]+\\-(.+?)\\)', NULL, 'N', NULL, 'N', 'N', 'Y'),
	(2, 0, 'iosVersion', '', ',\\s*Version\\s+(.+?)\\,', NULL, 'N', NULL, 'N', 'N', 'Y'),
	(10, 0, 'ipAdEntIfIndex', '', '.+\\.(\\d+\\.\\d+\\.\\d+\\.\\d+)', NULL, 'Y', NULL, 'N', 'N', 'N'),
	(12, 0, 'ipNetToMediaPhysAddress', '', '.+\\.(\\d+\\.\\d+\\.\\d+\\.\\d+\\.\\d+)', NULL, 'Y', NULL, 'N', 'N', 'N'),
	(26, 0, 'is_alive', '', NULL, '', 'N', '', 'Y', 'N', 'Y'),
	(11, 0, 'mac', '', NULL, NULL, 'N', NULL, 'N', 'N', 'N'),
	(2, 0, 'model', '', 'Software\\s+\\((.+?)\\-', NULL, 'N', NULL, 'N', 'N', 'Y'),
	(5, 0, 'name', '', NULL, NULL, 'N', NULL, 'N', 'N', 'N'),
	(8, 0, 'operStatus', '', NULL, 'states = {\'1\' : \'up\', \'2\': \'down\'}; interfStatus[\'operStatus\']=states[ interfStatus[\'operStatus\']]', 'N', 'interfStatus == \'1\'', 'Y', 'N', 'N'),
	(0, 0, 'rtt_avg', '', '', '', '', '', 'Y', 'N', 'Y'),
	(23, 0, 'rtt_avg', '', NULL, '', 'N', '', 'Y', 'N', 'Y'),
	(24, 0, 'rtt_max', '', NULL, '', 'N', '', 'Y', 'N', 'Y'),
	(25, 0, 'rtt_mdev', '', NULL, '', 'N', '', 'Y', 'N', 'Y'),
	(22, 0, 'rtt_min', '', NULL, '', 'N', '', 'Y', 'N', 'Y'),
	(9, 0, 'serialNumber', '', NULL, NULL, 'N', NULL, 'N', 'N', 'Y'),
	(2, 0, 'softwareRelease', '', 'RELEASE\\s+SOFTWARE\\s+\\((.+)\\)', NULL, 'N', NULL, 'N', 'N', 'Y');
/*!40000 ALTER TABLE `variable_devicetype` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.variable_reportname
DROP TABLE IF EXISTS `variable_reportname`;
CREATE TABLE IF NOT EXISTS `variable_reportname` (
  `idVariable` int(11) NOT NULL,
  `reportName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idVariable`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.variable_reportname: ~0 rows (aproximadamente)
DELETE FROM `variable_reportname`;
/*!40000 ALTER TABLE `variable_reportname` DISABLE KEYS */;
/*!40000 ALTER TABLE `variable_reportname` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.version
DROP TABLE IF EXISTS `version`;
CREATE TABLE IF NOT EXISTS `version` (
  `id_version` int(11) NOT NULL,
  `version` bigint(20) NOT NULL,
  PRIMARY KEY (`id_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.version: ~0 rows (aproximadamente)
DELETE FROM `version`;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
