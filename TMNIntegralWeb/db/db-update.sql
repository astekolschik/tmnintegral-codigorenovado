-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.26 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla tmnintegral.commands
CREATE TABLE IF NOT EXISTS tmnintegral.`commands` (
  `id_command` int(11) NOT NULL,
  `command_name` varchar(20) NOT NULL,
  `command` varchar(120) NOT NULL,
  `command_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id_command`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.commands: ~4 rows (aproximadamente)
DELETE FROM  tmnintegral.`commands`;
/*!40000 ALTER TABLE `commands` DISABLE KEYS */;
INSERT INTO tmnintegral. `commands` (`id_command`, `command_name`, `command`, `command_type`) VALUES
	(1, 'COM1', 'ping 1', 'test'),
	(2, 'COM2', 'ping 2', 'lect'),
	(3, 'COM3', 'pepe', 'pepe'),
	(4, 'comando 3', 'comando', 'comando');
/*!40000 ALTER TABLE `commands` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.command_devicetype
CREATE TABLE IF NOT EXISTS tmnintegral.`command_devicetype` (
  `id_command` int(11) NOT NULL,
  `id_device_type` int(11) NOT NULL,
  PRIMARY KEY (`id_command`,`id_device_type`),
  KEY `FK_COMMAND` (`id_command`),
  KEY `FK_DEVICETYPE` (`id_device_type`),
  CONSTRAINT `COMMAND_DEVICETYPE_ibfk_1` FOREIGN KEY (`id_command`) REFERENCES `commands` (`id_command`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `COMMAND_DEVICETYPE_ibfk_2` FOREIGN KEY (`id_device_type`) REFERENCES `device_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.command_devicetype: ~0 rows (aproximadamente)
DELETE FROM  tmnintegral.`command_devicetype`;
/*!40000 ALTER TABLE `command_devicetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `command_devicetype` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.configuration
CREATE TABLE IF NOT EXISTS tmnintegral.`configuration` (
  `id_configuration` int(11) NOT NULL,
  `file_name` varchar(80) NOT NULL,
  `content` varchar(80) NOT NULL,
  `id_version` int(11) NOT NULL,
  PRIMARY KEY (`id_configuration`),
  KEY `FK_VERSION` (`id_version`),
  CONSTRAINT `CONFIGURATION_ibfk_1` FOREIGN KEY (`id_version`) REFERENCES `version` (`id_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.configuration: ~0 rows (aproximadamente)
DELETE FROM  tmnintegral.`configuration`;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.device
CREATE TABLE IF NOT EXISTS tmnintegral.`device` (
  `device_id` int(11) NOT NULL AUTO_INCREMENT,
  `communityRead` varchar(10) NOT NULL,
  `hostName` varchar(50) DEFAULT NULL,
  `iosType` varchar(50) DEFAULT NULL,
  `iosVersion` varchar(50) DEFAULT NULL,
  `ip` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `serialNumber` varchar(50) DEFAULT NULL,
  `softwareRelease` varchar(50) DEFAULT NULL,
  `id_device_type` int(11) NOT NULL,
  `id_network` int(11) NOT NULL DEFAULT '0',
  `id_configuration` int(11) DEFAULT NULL,
  `id_equipment_info` int(11) DEFAULT NULL,
  `enable` char(1) DEFAULT NULL,
  `last_update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`device_id`),
  UNIQUE KEY `ip` (`ip`),
  KEY `FK_EQINFO` (`id_equipment_info`),
  KEY `FK_DEVICE_TYPE` (`id_device_type`),
  KEY `PK_NETWORK` (`id_network`),
  CONSTRAINT `DEVICE_ibfk_1` FOREIGN KEY (`id_device_type`) REFERENCES `device_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `DEVICE_ibfk_3` FOREIGN KEY (`id_network`) REFERENCES `network` (`id_network`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.device: ~9 rows (aproximadamente)
DELETE FROM  tmnintegral.`device`;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO tmnintegral. `device` (`device_id`, `communityRead`, `hostName`, `iosType`, `iosVersion`, `ip`, `model`, `serialNumber`, `softwareRelease`, `id_device_type`, `id_network`, `id_configuration`, `id_equipment_info`, `enable`, `last_update_date`) VALUES
	(1, 'public', 'HOLA SOY EL CAMBIO', 'ADVSECURITYK9-M', '12.4(3)', '1.0.0.1', 'C3725', 'FTX0945W0MY', 'fc2', 0, 0, 0, 0, 'Y', '2015-11-18 19:53:39'),
	(2, 'public', 'DIA_CASA_CENTRAL', 'ADVENTERPRISEK9_SNA-M', '12.4(13b)', '172.27.10.2', 'C2691', 'XXXXXXXXXXX', 'fc3', 0, 0, NULL, NULL, 'Y', '2015-10-12 19:40:27'),
	(3, 'public', 'R2', 'ADVSECURITYK9-M', '12.4(3)', '172.28.9.2', 'C3725', 'FTX0945W0MY', 'fc2', 0, 0, NULL, NULL, 'Y', '2015-10-12 19:40:27'),
	(4, 'public', 'DIA_TAPIALES', 'ADVENTERPRISEK9_SNA-M', '12.4(13b)', '172.31.103.20', 'C2691', 'XXXXXXXXXXX', 'fc3', 0, 0, NULL, NULL, 'Y', '2015-10-12 19:40:27'),
	(5, 'public', 'CARREFOUR_CASA_CENTRAL', 'ADVENTERPRISEK9_SNA-M', '12.4(13b)', '172.29.132.10', 'C2691', 'XXXXXXXXXXX', 'fc3', 0, 0, NULL, NULL, 'Y', '2015-10-12 19:40:27'),
	(6, 'public', 'DIA_TAPIALES_SUC_A', 'ADVENTERPRISEK9_SNA-M', '12.4(13b)', '172.22.107.2', 'C2691', 'XXXXXXXXXXX', 'fc3', 0, 0, NULL, NULL, 'Y', '2015-10-12 19:40:27'),
	(7, 'public', 'DIA_CIUDAD_MADERO', 'ADVSECURITYK9-M', '12.4(3)', '172.26.19.3', 'C3725', 'FTX0945W0MY', 'fc2', 0, 0, NULL, NULL, 'Y', '2015-10-12 19:40:27'),
	(8, 'public', 'CARREFOR_PUERTO_MADERO', 'ADVENTERPRISEK9_SNA-M', '12.4(13b)', '172.23.101.2', 'C2691', 'XXXXXXXXXXX', 'fc3', 0, 0, NULL, NULL, 'Y', '2015-10-12 19:40:27'),
	(9, 'PEPE', 'asdasd', 'asdasd', 'asdasd', 'asdasd', 'asdas', 'asdasd', 'asdasd', 1, 1, 1, 1, 'Y', '2015-11-18 16:45:35');
/*!40000 ALTER TABLE `device` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.device_type
CREATE TABLE IF NOT EXISTS tmnintegral.`device_type` (
  `id` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `default_comm_read` varchar(50) NOT NULL,
  `default_snmp_version` varchar(50) NOT NULL,
  `driver` varchar(50) NOT NULL,
  `technology` varchar(50) NOT NULL,
  `vendor` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.device_type: ~2 rows (aproximadamente)
DELETE FROM  tmnintegral.`device_type`;
/*!40000 ALTER TABLE `device_type` DISABLE KEYS */;
INSERT INTO tmnintegral. `device_type` (`id`, `description`, `default_comm_read`, `default_snmp_version`, `driver`, `technology`, `vendor`) VALUES
	(0, 'RouterCisco', 'public', '2c', 'discover.device.router.Cisco', 'Ethernet', 'Cisco'),
	(1, 'Test 1', 'ping', '1', '1', '1', 'ciscoeee'),
	(2, 'Test 2', 'agus', 'agus', 'agus', 'agus', 'agus');
/*!40000 ALTER TABLE `device_type` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.element
CREATE TABLE IF NOT EXISTS tmnintegral.`element` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `elementName` varchar(255) DEFAULT NULL,
  `elementAlias` varchar(255) DEFAULT NULL,
  `elementType` varchar(255) DEFAULT NULL,
  `elementClass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.element: ~45 rows (aproximadamente)
DELETE FROM  tmnintegral.`element`;
/*!40000 ALTER TABLE `element` DISABLE KEYS */;
INSERT INTO tmnintegral. `element` (`id`, `elementName`, `elementAlias`, `elementType`, `elementClass`) VALUES
	(1, 'R3', 'R3_1.0.0.1', 'RouterCisco', 'Device'),
	(2, 'R3_FastEthernet0/0', 'R3_1.0.0.1_FastEthernet0/0', 'FastEthernet', 'Interface'),
	(3, 'R3_FastEthernet1/0', 'R3_1.0.0.1_FastEthernet1/0', 'FastEthernet', 'Interface'),
	(4, 'R3_FastEthernet0/1', 'R3_1.0.0.1_FastEthernet0/1', 'FastEthernet', 'Interface'),
	(5, 'R3_FastEthernet2/0', 'R3_1.0.0.1_FastEthernet2/0', 'FastEthernet', 'Interface'),
	(6, 'DIA_CASA_CENTRAL', 'DIA_CASA_CENTRAL_172.27.10.2', 'RouterCisco', 'Device'),
	(7, 'DIA_CASA_CENTRAL_FastEthernet1/0', 'DIA_CASA_CENTRAL_172.27.10.2_FastEthernet1/0', 'FastEthernet', 'Interface'),
	(8, 'DIA_CASA_CENTRAL_Serial0/0', 'DIA_CASA_CENTRAL_172.27.10.2_Serial0/0', 'Serial', 'Interface'),
	(9, 'DIA_CASA_CENTRAL_FastEthernet0/0', 'DIA_CASA_CENTRAL_172.27.10.2_FastEthernet0/0', 'FastEthernet', 'Interface'),
	(10, 'DIA_CASA_CENTRAL_Serial0/1', 'DIA_CASA_CENTRAL_172.27.10.2_Serial0/1', 'Serial', 'Interface'),
	(11, 'DIA_CASA_CENTRAL_FastEthernet0/1', 'DIA_CASA_CENTRAL_172.27.10.2_FastEthernet0/1', 'FastEthernet', 'Interface'),
	(12, 'R2', 'R2_172.28.9.2', 'RouterCisco', 'Device'),
	(13, 'R2_FastEthernet0/0', 'R2_172.28.9.2_FastEthernet0/0', 'FastEthernet', 'Interface'),
	(14, 'R2_FastEthernet1/0', 'R2_172.28.9.2_FastEthernet1/0', 'FastEthernet', 'Interface'),
	(15, 'R2_FastEthernet0/1', 'R2_172.28.9.2_FastEthernet0/1', 'FastEthernet', 'Interface'),
	(16, 'R2_FastEthernet2/0', 'R2_172.28.9.2_FastEthernet2/0', 'FastEthernet', 'Interface'),
	(17, 'DIA_TAPIALES', 'DIA_TAPIALES_172.31.103.20', 'RouterCisco', 'Device'),
	(18, 'DIA_TAPIALES_FastEthernet1/0', 'DIA_TAPIALES_172.31.103.20_FastEthernet1/0', 'FastEthernet', 'Interface'),
	(19, 'DIA_TAPIALES_Serial0/0', 'DIA_TAPIALES_172.31.103.20_Serial0/0', 'Serial', 'Interface'),
	(20, 'DIA_TAPIALES_FastEthernet0/0', 'DIA_TAPIALES_172.31.103.20_FastEthernet0/0', 'FastEthernet', 'Interface'),
	(21, 'DIA_TAPIALES_Serial0/1', 'DIA_TAPIALES_172.31.103.20_Serial0/1', 'Serial', 'Interface'),
	(22, 'DIA_TAPIALES_FastEthernet0/1', 'DIA_TAPIALES_172.31.103.20_FastEthernet0/1', 'FastEthernet', 'Interface'),
	(23, 'CARREFOUR_CASA_CENTRAL', 'CARREFOUR_CASA_CENTRAL_172.29.132.10', 'RouterCisco', 'Device'),
	(24, 'CARREFOUR_CASA_CENTRAL_FastEthernet1/0', 'CARREFOUR_CASA_CENTRAL_172.29.132.10_FastEthernet1/0', 'FastEthernet', 'Interface'),
	(25, 'CARREFOUR_CASA_CENTRAL_Serial0/0', 'CARREFOUR_CASA_CENTRAL_172.29.132.10_Serial0/0', 'Serial', 'Interface'),
	(26, 'CARREFOUR_CASA_CENTRAL_FastEthernet0/0', 'CARREFOUR_CASA_CENTRAL_172.29.132.10_FastEthernet0/0', 'FastEthernet', 'Interface'),
	(27, 'CARREFOUR_CASA_CENTRAL_Serial0/1', 'CARREFOUR_CASA_CENTRAL_172.29.132.10_Serial0/1', 'Serial', 'Interface'),
	(28, 'CARREFOUR_CASA_CENTRAL_FastEthernet0/1', 'CARREFOUR_CASA_CENTRAL_172.29.132.10_FastEthernet0/1', 'FastEthernet', 'Interface'),
	(29, 'DIA_TAPIALES_SUC_A', 'DIA_TAPIALES_SUC_A_172.22.107.2', 'RouterCisco', 'Device'),
	(30, 'DIA_TAPIALES_SUC_A_FastEthernet1/0', 'DIA_TAPIALES_SUC_A_172.22.107.2_FastEthernet1/0', 'FastEthernet', 'Interface'),
	(31, 'DIA_TAPIALES_SUC_A_Serial0/0', 'DIA_TAPIALES_SUC_A_172.22.107.2_Serial0/0', 'Serial', 'Interface'),
	(32, 'DIA_TAPIALES_SUC_A_FastEthernet0/0', 'DIA_TAPIALES_SUC_A_172.22.107.2_FastEthernet0/0', 'FastEthernet', 'Interface'),
	(33, 'DIA_TAPIALES_SUC_A_Serial0/1', 'DIA_TAPIALES_SUC_A_172.22.107.2_Serial0/1', 'Serial', 'Interface'),
	(34, 'DIA_TAPIALES_SUC_A_FastEthernet0/1', 'DIA_TAPIALES_SUC_A_172.22.107.2_FastEthernet0/1', 'FastEthernet', 'Interface'),
	(35, 'DIA_CIUDAD_MADERO', 'DIA_CIUDAD_MADERO_172.26.19.3', 'RouterCisco', 'Device'),
	(36, 'DIA_CIUDAD_MADERO_FastEthernet0/0', 'DIA_CIUDAD_MADERO_172.26.19.3_FastEthernet0/0', 'FastEthernet', 'Interface'),
	(37, 'DIA_CIUDAD_MADERO_FastEthernet1/0', 'DIA_CIUDAD_MADERO_172.26.19.3_FastEthernet1/0', 'FastEthernet', 'Interface'),
	(38, 'DIA_CIUDAD_MADERO_FastEthernet0/1', 'DIA_CIUDAD_MADERO_172.26.19.3_FastEthernet0/1', 'FastEthernet', 'Interface'),
	(39, 'DIA_CIUDAD_MADERO_FastEthernet2/0', 'DIA_CIUDAD_MADERO_172.26.19.3_FastEthernet2/0', 'FastEthernet', 'Interface'),
	(40, 'CARREFOR_PUERTO_MADERO', 'CARREFOR_PUERTO_MADERO_172.23.101.2', 'RouterCisco', 'Device'),
	(41, 'CARREFOR_PUERTO_MADERO_FastEthernet1/0', 'CARREFOR_PUERTO_MADERO_172.23.101.2_FastEthernet1/0', 'FastEthernet', 'Interface'),
	(42, 'CARREFOR_PUERTO_MADERO_Serial0/0', 'CARREFOR_PUERTO_MADERO_172.23.101.2_Serial0/0', 'Serial', 'Interface'),
	(43, 'CARREFOR_PUERTO_MADERO_FastEthernet0/0', 'CARREFOR_PUERTO_MADERO_172.23.101.2_FastEthernet0/0', 'FastEthernet', 'Interface'),
	(44, 'CARREFOR_PUERTO_MADERO_Serial0/1', 'CARREFOR_PUERTO_MADERO_172.23.101.2_Serial0/1', 'Serial', 'Interface'),
	(45, 'CARREFOR_PUERTO_MADERO_FastEthernet0/1', 'CARREFOR_PUERTO_MADERO_172.23.101.2_FastEthernet0/1', 'FastEthernet', 'Interface');
/*!40000 ALTER TABLE `element` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.elementrelationship
CREATE TABLE IF NOT EXISTS tmnintegral.`elementrelationship` (
  `AEnd` bigint(20) NOT NULL,
  `ZEnd` bigint(20) NOT NULL,
  `relationClass` varchar(50) NOT NULL,
  PRIMARY KEY (`AEnd`,`ZEnd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.elementrelationship: ~81 rows (aproximadamente)
DELETE FROM  tmnintegral.`elementrelationship`;
/*!40000 ALTER TABLE `elementrelationship` DISABLE KEYS */;
INSERT INTO tmnintegral. `elementrelationship` (`AEnd`, `ZEnd`, `relationClass`) VALUES
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
	(7, 6, 'Device-Interf'),
	(8, 6, 'Device-Interf'),
	(9, 6, 'Device-Interf'),
	(10, 6, 'Device-Interf'),
	(11, 3, 'Interf-Interf'),
	(11, 6, 'Device-Interf'),
	(12, 13, 'Device-Interf'),
	(12, 14, 'Device-Interf'),
	(12, 15, 'Device-Interf'),
	(12, 16, 'Device-Interf'),
	(13, 12, 'Device-Interf'),
	(14, 12, 'Device-Interf'),
	(15, 5, 'Interf-Interf'),
	(15, 12, 'Device-Interf'),
	(16, 12, 'Device-Interf'),
	(17, 18, 'Device-Interf'),
	(17, 19, 'Device-Interf'),
	(17, 20, 'Device-Interf'),
	(17, 21, 'Device-Interf'),
	(17, 22, 'Device-Interf'),
	(18, 17, 'Device-Interf'),
	(19, 17, 'Device-Interf'),
	(20, 9, 'Interf-Interf'),
	(20, 17, 'Device-Interf'),
	(21, 17, 'Device-Interf'),
	(22, 17, 'Device-Interf'),
	(23, 24, 'Device-Interf'),
	(23, 25, 'Device-Interf'),
	(23, 26, 'Device-Interf'),
	(23, 27, 'Device-Interf'),
	(23, 28, 'Device-Interf'),
	(24, 23, 'Device-Interf'),
	(25, 23, 'Device-Interf'),
	(26, 13, 'Interf-Interf'),
	(26, 23, 'Device-Interf'),
	(27, 23, 'Device-Interf'),
	(28, 23, 'Device-Interf'),
	(29, 30, 'Device-Interf'),
	(29, 31, 'Device-Interf'),
	(29, 32, 'Device-Interf'),
	(29, 33, 'Device-Interf'),
	(29, 34, 'Device-Interf'),
	(30, 29, 'Device-Interf'),
	(31, 29, 'Device-Interf'),
	(32, 22, 'Interf-Interf'),
	(32, 29, 'Device-Interf'),
	(33, 29, 'Device-Interf'),
	(34, 29, 'Device-Interf'),
	(35, 36, 'Device-Interf'),
	(35, 37, 'Device-Interf'),
	(35, 38, 'Device-Interf'),
	(35, 39, 'Device-Interf'),
	(36, 7, 'Interf-Interf'),
	(36, 35, 'Device-Interf'),
	(37, 35, 'Device-Interf'),
	(38, 35, 'Device-Interf'),
	(39, 35, 'Device-Interf'),
	(40, 41, 'Device-Interf'),
	(40, 42, 'Device-Interf'),
	(40, 43, 'Device-Interf'),
	(40, 44, 'Device-Interf'),
	(40, 45, 'Device-Interf'),
	(41, 40, 'Device-Interf'),
	(42, 40, 'Device-Interf'),
	(43, 14, 'Interf-Interf'),
	(43, 40, 'Device-Interf'),
	(44, 40, 'Device-Interf'),
	(45, 40, 'Device-Interf');
/*!40000 ALTER TABLE `elementrelationship` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.elementvsdatasources
CREATE TABLE IF NOT EXISTS tmnintegral.`elementvsdatasources` (
  `id_ele` bigint(20) NOT NULL,
  `id_device` int(11) DEFAULT NULL,
  `id_interface` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_ele`),
  KEY `FK_elementvsdatasources_device` (`id_device`),
  CONSTRAINT `device` FOREIGN KEY (`id_device`) REFERENCES `device` (`device_id`),
  CONSTRAINT `element` FOREIGN KEY (`id_ele`) REFERENCES `element` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.elementvsdatasources: ~45 rows (aproximadamente)
DELETE FROM  tmnintegral.`elementvsdatasources`;
/*!40000 ALTER TABLE `elementvsdatasources` DISABLE KEYS */;
INSERT INTO tmnintegral. `elementvsdatasources` (`id_ele`, `id_device`, `id_interface`) VALUES
	(1, 1, NULL),
	(2, NULL, 1),
	(3, NULL, 2),
	(4, NULL, 3),
	(5, NULL, 4),
	(6, 2, NULL),
	(7, NULL, 5),
	(8, NULL, 6),
	(9, NULL, 7),
	(10, NULL, 8),
	(11, NULL, 9),
	(12, 3, NULL),
	(13, NULL, 10),
	(14, NULL, 11),
	(15, NULL, 12),
	(16, NULL, 13),
	(17, 4, NULL),
	(18, NULL, 14),
	(19, NULL, 15),
	(20, NULL, 16),
	(21, NULL, 17),
	(22, NULL, 18),
	(23, 5, NULL),
	(24, NULL, 19),
	(25, NULL, 20),
	(26, NULL, 21),
	(27, NULL, 22),
	(28, NULL, 23),
	(29, 6, NULL),
	(30, NULL, 24),
	(31, NULL, 25),
	(32, NULL, 26),
	(33, NULL, 27),
	(34, NULL, 28),
	(35, 7, NULL),
	(36, NULL, 29),
	(37, NULL, 30),
	(38, NULL, 31),
	(39, NULL, 32),
	(40, 8, NULL),
	(41, NULL, 33),
	(42, NULL, 34),
	(43, NULL, 35),
	(44, NULL, 36),
	(45, NULL, 37);
/*!40000 ALTER TABLE `elementvsdatasources` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.equipment_information
CREATE TABLE IF NOT EXISTS tmnintegral.`equipment_information` (
  `equipment_id` int(11) NOT NULL,
  `memoria_disponible` double NOT NULL,
  `memoria_utilizada` double NOT NULL,
  `timestamp` datetime NOT NULL,
  `trafico_entrante` double NOT NULL,
  `trafico_saliente` double NOT NULL,
  `utilizacion_cpu` double NOT NULL,
  PRIMARY KEY (`equipment_id`,`timestamp`),
  CONSTRAINT `FK_eq_id` FOREIGN KEY (`equipment_id`) REFERENCES `device` (`device_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.equipment_information: ~245 rows (aproximadamente)
DELETE FROM  tmnintegral.`equipment_information`;
/*!40000 ALTER TABLE `equipment_information` DISABLE KEYS */;
INSERT INTO tmnintegral. `equipment_information` (`equipment_id`, `memoria_disponible`, `memoria_utilizada`, `timestamp`, `trafico_entrante`, `trafico_saliente`, `utilizacion_cpu`) VALUES
	(1, 111, 3434, '2015-10-31 00:00:00', 1212, 12121, 10),
	(1, 300, 788, '2015-10-31 12:05:31', 3234, 555, 40),
	(1, 100, 9999, '2015-10-31 16:05:16', 0, 6232, 70),
	(1, 343, 760, '2015-10-31 20:04:03', 323, 22, 45),
	(1, 259, 522, '2015-10-31 20:04:21', 1212, 2222, 80),
	(1, 579, 1289, '2015-11-01 00:00:00', 470, 1525, 1565),
	(1, 1047, 747, '2015-11-02 00:00:00', 372, 1633, 941),
	(1, 630, 1474, '2015-11-03 00:00:00', 741, 1370, 661),
	(1, 561, 2368, '2015-11-04 00:00:00', 330, 1779, 2179),
	(1, 2372, 943, '2015-11-05 00:00:00', 1679, 258, 1834),
	(1, 1490, 803, '2015-11-06 00:00:00', 2209, 1381, 2171),
	(1, 1070, 162, '2015-11-07 00:00:00', 1374, 1065, 754),
	(1, 472, 1530, '2015-11-08 00:00:00', 481, 2316, 1091),
	(1, 806, 773, '2015-11-09 00:00:00', 690, 382, 131),
	(1, 575, 867, '2015-11-10 00:00:00', 713, 2222, 760),
	(1, 1188, 1553, '2015-11-11 00:00:00', 1339, 1755, 1323),
	(1, 562, 1706, '2015-11-12 00:00:00', 67, 1151, 84),
	(1, 1451, 1200, '2015-11-13 00:00:00', 587, 1809, 1603),
	(1, 1954, 108, '2015-11-14 00:00:00', 1506, 1317, 167),
	(1, 471, 1041, '2015-11-15 00:00:00', 267, 32, 84),
	(1, 640, 66, '2015-11-16 00:00:00', 1412, 1464, 2157),
	(1, 264, 2438, '2015-11-17 00:00:00', 1383, 2425, 623),
	(1, 828, 2442, '2015-11-18 00:00:00', 1970, 1372, 2345),
	(1, 2253, 1941, '2015-11-19 00:00:00', 1315, 123, 757),
	(1, 2242, 91, '2015-11-20 00:00:00', 309, 894, 437),
	(1, 1902, 1069, '2015-11-21 00:00:00', 1116, 1977, 2194),
	(1, 606, 2005, '2015-11-22 00:00:00', 2110, 1035, 834),
	(1, 1272, 2079, '2015-11-23 00:00:00', 2485, 1651, 1810),
	(1, 1115, 1259, '2015-11-24 00:00:00', 452, 1821, 343),
	(1, 1958, 1119, '2015-11-25 00:00:00', 2050, 317, 1576),
	(1, 1973, 79, '2015-11-26 00:00:00', 499, 1308, 2318),
	(1, 2042, 214, '2015-11-27 00:00:00', 1334, 1247, 1494),
	(1, 151, 0, '2015-11-28 00:00:00', 2286, 696, 277),
	(1, 680, 1405, '2015-11-29 00:00:00', 1727, 825, 1435),
	(1, 92, 1744, '2015-11-30 00:00:00', 1534, 100, 2049),
	(2, 12312, 222, '2015-10-31 00:00:00', 3543, 354, 50),
	(2, 22, 3312, '2015-10-31 12:05:31', 454, 447, 70),
	(2, 333, 2123, '2015-10-31 16:05:16', 5435, 444, 35),
	(2, 333, 2312, '2015-10-31 20:04:03', 555, 444, 25),
	(2, 456, 3132, '2015-10-31 20:04:21', 55, 343, 64),
	(2, 336, 1655, '2015-11-01 00:00:00', 497, 2397, 1611),
	(2, 2244, 858, '2015-11-02 00:00:00', 1218, 2147, 198),
	(2, 959, 395, '2015-11-03 00:00:00', 152, 2268, 388),
	(2, 545, 1538, '2015-11-04 00:00:00', 1907, 338, 52),
	(2, 1941, 2293, '2015-11-05 00:00:00', 977, 1869, 1680),
	(2, 1885, 1721, '2015-11-06 00:00:00', 2084, 1182, 23),
	(2, 949, 1540, '2015-11-07 00:00:00', 1014, 344, 2018),
	(2, 1624, 1161, '2015-11-08 00:00:00', 2429, 2490, 2290),
	(2, 1847, 846, '2015-11-09 00:00:00', 1528, 1235, 1358),
	(2, 29, 993, '2015-11-10 00:00:00', 1810, 244, 89),
	(2, 602, 777, '2015-11-11 00:00:00', 225, 665, 77),
	(2, 842, 2480, '2015-11-12 00:00:00', 1081, 2154, 271),
	(2, 1966, 2477, '2015-11-13 00:00:00', 2491, 2070, 1889),
	(2, 1005, 2175, '2015-11-14 00:00:00', 440, 1808, 1085),
	(2, 936, 1001, '2015-11-15 00:00:00', 1740, 611, 47),
	(2, 1207, 294, '2015-11-16 00:00:00', 1942, 1413, 2412),
	(2, 2216, 1425, '2015-11-17 00:00:00', 2481, 1376, 2039),
	(2, 1485, 881, '2015-11-18 00:00:00', 196, 1379, 604),
	(2, 60, 774, '2015-11-19 00:00:00', 1594, 1129, 981),
	(2, 925, 539, '2015-11-20 00:00:00', 1906, 2173, 799),
	(2, 938, 576, '2015-11-21 00:00:00', 743, 338, 1194),
	(2, 1829, 625, '2015-11-22 00:00:00', 721, 135, 1590),
	(2, 755, 2286, '2015-11-23 00:00:00', 998, 744, 464),
	(2, 1177, 1195, '2015-11-24 00:00:00', 427, 2169, 1158),
	(2, 1241, 1843, '2015-11-25 00:00:00', 462, 1268, 1314),
	(2, 711, 140, '2015-11-26 00:00:00', 1530, 521, 503),
	(2, 705, 1392, '2015-11-27 00:00:00', 1297, 1025, 1591),
	(2, 2263, 564, '2015-11-28 00:00:00', 592, 2432, 729),
	(2, 1710, 1770, '2015-11-29 00:00:00', 1796, 263, 1017),
	(2, 681, 905, '2015-11-30 00:00:00', 201, 1433, 649),
	(3, 8765, 522, '2015-10-31 00:00:00', 987, 2321, 20),
	(3, 2653, 2342, '2015-10-31 12:05:31', 789, 132, 20),
	(3, 755, 433, '2015-10-31 16:05:16', 777, 444, 15),
	(3, 675, 433, '2015-10-31 20:04:03', 987, 123, 25),
	(3, 567, 768, '2015-10-31 20:04:21', 677, 333, 60),
	(3, 2483, 974, '2015-11-01 00:00:00', 1001, 1792, 2104),
	(3, 1978, 1696, '2015-11-02 00:00:00', 2306, 399, 1185),
	(3, 227, 972, '2015-11-03 00:00:00', 2029, 1540, 1152),
	(3, 969, 2081, '2015-11-04 00:00:00', 234, 356, 837),
	(3, 1177, 1297, '2015-11-05 00:00:00', 990, 2238, 423),
	(3, 1041, 1318, '2015-11-06 00:00:00', 1203, 1746, 1451),
	(3, 1850, 32, '2015-11-07 00:00:00', 354, 2431, 1484),
	(3, 341, 237, '2015-11-08 00:00:00', 1071, 6, 1664),
	(3, 1295, 562, '2015-11-09 00:00:00', 1944, 1449, 1891),
	(3, 2277, 107, '2015-11-10 00:00:00', 1968, 1841, 37),
	(3, 296, 1566, '2015-11-11 00:00:00', 757, 1724, 2199),
	(3, 177, 284, '2015-11-12 00:00:00', 706, 201, 2257),
	(3, 413, 2156, '2015-11-13 00:00:00', 1101, 2335, 172),
	(3, 2112, 1842, '2015-11-14 00:00:00', 1268, 1447, 2099),
	(3, 1595, 1138, '2015-11-15 00:00:00', 1199, 172, 1794),
	(3, 2267, 1665, '2015-11-16 00:00:00', 235, 803, 353),
	(3, 1430, 1666, '2015-11-17 00:00:00', 1633, 669, 1910),
	(3, 1559, 2137, '2015-11-18 00:00:00', 772, 1225, 1147),
	(3, 910, 1016, '2015-11-19 00:00:00', 2376, 2335, 2002),
	(3, 871, 965, '2015-11-20 00:00:00', 1518, 867, 547),
	(3, 241, 1175, '2015-11-21 00:00:00', 2484, 79, 452),
	(3, 1017, 1011, '2015-11-22 00:00:00', 121, 2029, 1612),
	(3, 1999, 233, '2015-11-23 00:00:00', 437, 202, 1642),
	(3, 1665, 853, '2015-11-24 00:00:00', 2032, 2288, 831),
	(3, 1571, 1260, '2015-11-25 00:00:00', 1673, 249, 1197),
	(3, 2317, 977, '2015-11-26 00:00:00', 288, 1978, 837),
	(3, 1503, 245, '2015-11-27 00:00:00', 1531, 42, 227),
	(3, 1213, 558, '2015-11-28 00:00:00', 519, 1756, 1271),
	(3, 1285, 727, '2015-11-29 00:00:00', 1679, 2152, 2349),
	(3, 170, 821, '2015-11-30 00:00:00', 1714, 2007, 1495),
	(4, 111, 522, '2015-10-31 00:00:00', 987, 132, 20),
	(4, 111, 522, '2015-10-31 12:05:31', 987, 132, 20),
	(4, 111, 522, '2015-10-31 16:05:16', 987, 132, 20),
	(4, 111, 522, '2015-10-31 20:04:03', 987, 132, 20),
	(4, 111, 522, '2015-10-31 20:04:21', 987, 132, 100),
	(4, 2349, 218, '2015-11-01 00:00:00', 1101, 557, 1585),
	(4, 1952, 1870, '2015-11-02 00:00:00', 1969, 2163, 1402),
	(4, 327, 510, '2015-11-03 00:00:00', 2117, 878, 2177),
	(4, 237, 2322, '2015-11-04 00:00:00', 1420, 632, 348),
	(4, 2380, 2025, '2015-11-05 00:00:00', 2195, 853, 1591),
	(4, 429, 2415, '2015-11-06 00:00:00', 2120, 1880, 1536),
	(4, 1718, 982, '2015-11-07 00:00:00', 1463, 392, 556),
	(4, 110, 2403, '2015-11-08 00:00:00', 2090, 113, 1583),
	(4, 2175, 1920, '2015-11-09 00:00:00', 1891, 647, 2326),
	(4, 2274, 511, '2015-11-10 00:00:00', 439, 1137, 1954),
	(4, 1598, 1206, '2015-11-11 00:00:00', 1405, 2311, 1166),
	(4, 544, 1348, '2015-11-12 00:00:00', 825, 1538, 1837),
	(4, 2168, 444, '2015-11-13 00:00:00', 1008, 1380, 2103),
	(4, 349, 2459, '2015-11-14 00:00:00', 1839, 1179, 1094),
	(4, 2452, 88, '2015-11-15 00:00:00', 2366, 138, 1910),
	(4, 1153, 2134, '2015-11-16 00:00:00', 1126, 1, 1672),
	(4, 1378, 2097, '2015-11-17 00:00:00', 2305, 123, 1157),
	(4, 2273, 1, '2015-11-18 00:00:00', 404, 645, 2087),
	(4, 2423, 745, '2015-11-19 00:00:00', 61, 2008, 2420),
	(4, 694, 2395, '2015-11-20 00:00:00', 2375, 2447, 1564),
	(4, 156, 1540, '2015-11-21 00:00:00', 906, 1595, 1538),
	(4, 2438, 1725, '2015-11-22 00:00:00', 1995, 13, 2461),
	(4, 819, 2381, '2015-11-23 00:00:00', 2407, 921, 277),
	(4, 1597, 2085, '2015-11-24 00:00:00', 1420, 1162, 1151),
	(4, 2190, 248, '2015-11-25 00:00:00', 1677, 1231, 926),
	(4, 506, 357, '2015-11-26 00:00:00', 974, 1505, 2488),
	(4, 435, 120, '2015-11-27 00:00:00', 752, 1380, 754),
	(4, 2184, 1969, '2015-11-28 00:00:00', 2066, 1572, 1679),
	(4, 1262, 98, '2015-11-29 00:00:00', 957, 1021, 2471),
	(4, 1336, 941, '2015-11-30 00:00:00', 173, 2269, 1127),
	(5, 1320, 2148, '2015-11-01 00:00:00', 864, 1880, 1537),
	(5, 141, 1041, '2015-11-02 00:00:00', 1925, 1397, 132),
	(5, 349, 168, '2015-11-03 00:00:00', 1681, 2297, 2497),
	(5, 574, 418, '2015-11-04 00:00:00', 228, 682, 90),
	(5, 1614, 2016, '2015-11-05 00:00:00', 847, 2379, 656),
	(5, 1769, 1027, '2015-11-06 00:00:00', 2228, 2438, 1183),
	(5, 1252, 1453, '2015-11-07 00:00:00', 1538, 1944, 1213),
	(5, 1987, 2143, '2015-11-08 00:00:00', 422, 540, 1489),
	(5, 2214, 1187, '2015-11-09 00:00:00', 1917, 1553, 2473),
	(5, 2353, 1680, '2015-11-10 00:00:00', 1111, 965, 1135),
	(5, 714, 1568, '2015-11-11 00:00:00', 2144, 2449, 566),
	(5, 523, 766, '2015-11-12 00:00:00', 984, 557, 1141),
	(5, 459, 1435, '2015-11-13 00:00:00', 1984, 1928, 2306),
	(5, 1873, 1056, '2015-11-14 00:00:00', 1468, 730, 737),
	(5, 1492, 1690, '2015-11-15 00:00:00', 730, 935, 2143),
	(5, 425, 604, '2015-11-16 00:00:00', 2286, 1633, 1777),
	(5, 1587, 299, '2015-11-17 00:00:00', 412, 2118, 53),
	(5, 2236, 1111, '2015-11-18 00:00:00', 1115, 1188, 718),
	(5, 1403, 2013, '2015-11-19 00:00:00', 2317, 37, 2075),
	(5, 1568, 2411, '2015-11-20 00:00:00', 975, 2058, 700),
	(5, 634, 608, '2015-11-21 00:00:00', 2021, 2448, 1144),
	(5, 1649, 2462, '2015-11-22 00:00:00', 1328, 170, 1138),
	(5, 1975, 1526, '2015-11-23 00:00:00', 444, 70, 1092),
	(5, 660, 1234, '2015-11-24 00:00:00', 1359, 2108, 1217),
	(5, 1482, 404, '2015-11-25 00:00:00', 1496, 2086, 2395),
	(5, 32, 1818, '2015-11-26 00:00:00', 31, 1801, 1537),
	(5, 409, 1742, '2015-11-27 00:00:00', 1600, 1141, 14),
	(5, 1372, 1727, '2015-11-28 00:00:00', 924, 827, 2159),
	(5, 1982, 2058, '2015-11-29 00:00:00', 1600, 2385, 327),
	(5, 2420, 1250, '2015-11-30 00:00:00', 2024, 602, 323),
	(6, 1959, 1059, '2015-11-01 00:00:00', 812, 2142, 329),
	(6, 980, 274, '2015-11-02 00:00:00', 990, 2465, 310),
	(6, 584, 2327, '2015-11-03 00:00:00', 1636, 1739, 512),
	(6, 1293, 2348, '2015-11-04 00:00:00', 2496, 1637, 760),
	(6, 360, 2194, '2015-11-05 00:00:00', 64, 402, 1962),
	(6, 1574, 102, '2015-11-06 00:00:00', 832, 278, 2396),
	(6, 1494, 161, '2015-11-07 00:00:00', 222, 2255, 2159),
	(6, 926, 789, '2015-11-08 00:00:00', 292, 1589, 2069),
	(6, 1671, 258, '2015-11-09 00:00:00', 584, 66, 919),
	(6, 407, 521, '2015-11-10 00:00:00', 332, 379, 1274),
	(6, 73, 1830, '2015-11-11 00:00:00', 519, 2301, 1389),
	(6, 322, 1078, '2015-11-12 00:00:00', 2353, 760, 2286),
	(6, 1977, 1408, '2015-11-13 00:00:00', 925, 779, 2206),
	(6, 159, 121, '2015-11-14 00:00:00', 1718, 2192, 1902),
	(6, 1973, 1911, '2015-11-15 00:00:00', 1705, 1182, 2373),
	(6, 961, 922, '2015-11-16 00:00:00', 1086, 1747, 830),
	(6, 747, 2097, '2015-11-17 00:00:00', 1627, 1774, 79),
	(6, 919, 1365, '2015-11-18 00:00:00', 310, 1807, 426),
	(6, 697, 1775, '2015-11-19 00:00:00', 683, 918, 1800),
	(6, 2434, 1314, '2015-11-20 00:00:00', 726, 2379, 1858),
	(6, 1462, 462, '2015-11-21 00:00:00', 821, 2114, 763),
	(6, 1098, 2487, '2015-11-22 00:00:00', 280, 1750, 1083),
	(6, 2340, 2451, '2015-11-23 00:00:00', 560, 513, 2423),
	(6, 1718, 1353, '2015-11-24 00:00:00', 1077, 599, 134),
	(6, 1251, 1986, '2015-11-25 00:00:00', 809, 1710, 430),
	(6, 1156, 2462, '2015-11-26 00:00:00', 58, 357, 1712),
	(6, 1098, 2209, '2015-11-27 00:00:00', 2116, 331, 438),
	(6, 1799, 2457, '2015-11-28 00:00:00', 1198, 1526, 1172),
	(6, 310, 1119, '2015-11-29 00:00:00', 1641, 1267, 1741),
	(6, 682, 1093, '2015-11-30 00:00:00', 476, 2176, 2103),
	(7, 324, 914, '2015-11-01 00:00:00', 784, 1368, 1920),
	(7, 1696, 2348, '2015-11-02 00:00:00', 1690, 1844, 1194),
	(7, 2294, 2318, '2015-11-03 00:00:00', 1096, 411, 653),
	(7, 1566, 620, '2015-11-04 00:00:00', 555, 95, 2102),
	(7, 1086, 2336, '2015-11-05 00:00:00', 43, 2173, 1960),
	(7, 1018, 295, '2015-11-06 00:00:00', 969, 1489, 1836),
	(7, 400, 2092, '2015-11-07 00:00:00', 651, 849, 2207),
	(7, 1624, 2362, '2015-11-08 00:00:00', 2324, 620, 293),
	(7, 478, 1384, '2015-11-09 00:00:00', 2334, 1674, 59),
	(7, 1305, 1977, '2015-11-10 00:00:00', 1427, 2058, 500),
	(7, 560, 1514, '2015-11-11 00:00:00', 2315, 149, 1075),
	(7, 822, 837, '2015-11-12 00:00:00', 919, 550, 2476),
	(7, 2195, 805, '2015-11-13 00:00:00', 1233, 2165, 1673),
	(7, 33, 476, '2015-11-14 00:00:00', 725, 1535, 1758),
	(7, 734, 2433, '2015-11-15 00:00:00', 2435, 2339, 1869),
	(7, 246, 1045, '2015-11-16 00:00:00', 74, 2352, 2309),
	(7, 1128, 2351, '2015-11-17 00:00:00', 409, 439, 2433),
	(7, 1322, 2428, '2015-11-18 00:00:00', 1238, 1963, 544),
	(7, 1002, 2481, '2015-11-19 00:00:00', 1015, 2415, 732),
	(7, 1221, 1857, '2015-11-20 00:00:00', 1320, 1806, 890),
	(7, 2344, 1547, '2015-11-21 00:00:00', 1507, 562, 1779),
	(7, 142, 739, '2015-11-22 00:00:00', 1425, 968, 1951),
	(7, 1387, 1141, '2015-11-23 00:00:00', 463, 2360, 418),
	(7, 188, 632, '2015-11-24 00:00:00', 220, 257, 2232),
	(7, 1475, 1044, '2015-11-25 00:00:00', 1695, 935, 2409),
	(7, 2183, 1528, '2015-11-26 00:00:00', 1797, 1380, 1435),
	(7, 1807, 2308, '2015-11-27 00:00:00', 887, 1038, 1889),
	(7, 175, 2115, '2015-11-28 00:00:00', 1371, 387, 1983),
	(7, 350, 583, '2015-11-29 00:00:00', 813, 2294, 91),
	(7, 882, 2219, '2015-11-30 00:00:00', 1877, 2220, 970),
	(8, 979, 1093, '2015-11-01 00:00:00', 805, 1022, 1516),
	(8, 182, 1869, '2015-11-02 00:00:00', 1552, 1265, 2033),
	(8, 457, 2319, '2015-11-03 00:00:00', 2221, 2168, 845),
	(8, 1560, 943, '2015-11-04 00:00:00', 1689, 1183, 384),
	(8, 1290, 424, '2015-11-05 00:00:00', 1757, 1482, 1887),
	(8, 73, 2267, '2015-11-06 00:00:00', 879, 1220, 1306),
	(8, 2349, 1528, '2015-11-07 00:00:00', 305, 577, 31),
	(8, 231, 1750, '2015-11-08 00:00:00', 246, 2427, 479),
	(8, 1179, 833, '2015-11-09 00:00:00', 1261, 1838, 1629),
	(8, 1935, 1802, '2015-11-10 00:00:00', 1296, 702, 160),
	(8, 846, 1170, '2015-11-11 00:00:00', 2016, 1488, 1059),
	(8, 2377, 2287, '2015-11-12 00:00:00', 458, 2284, 1358),
	(8, 260, 1863, '2015-11-13 00:00:00', 1152, 1927, 399),
	(8, 803, 372, '2015-11-14 00:00:00', 1971, 1917, 368),
	(8, 2159, 127, '2015-11-15 00:00:00', 219, 1304, 39),
	(8, 1761, 1774, '2015-11-16 00:00:00', 1064, 578, 946),
	(8, 2416, 691, '2015-11-17 00:00:00', 649, 2377, 669),
	(8, 723, 614, '2015-11-18 00:00:00', 1679, 1639, 333),
	(8, 2357, 1490, '2015-11-19 00:00:00', 2052, 924, 1851),
	(8, 1846, 2333, '2015-11-20 00:00:00', 788, 738, 406),
	(8, 721, 1186, '2015-11-21 00:00:00', 1525, 612, 864),
	(8, 1779, 1060, '2015-11-22 00:00:00', 1316, 1574, 1811),
	(8, 2242, 2379, '2015-11-23 00:00:00', 2360, 2223, 743),
	(8, 2305, 1612, '2015-11-24 00:00:00', 874, 2037, 80),
	(8, 382, 1913, '2015-11-25 00:00:00', 138, 1152, 1080),
	(8, 1778, 615, '2015-11-26 00:00:00', 2497, 1536, 2048),
	(8, 1009, 1048, '2015-11-27 00:00:00', 1913, 394, 149),
	(8, 2303, 1710, '2015-11-28 00:00:00', 853, 1576, 103),
	(8, 399, 552, '2015-11-29 00:00:00', 1628, 695, 78),
	(8, 1471, 885, '2015-11-30 00:00:00', 1142, 727, 1116);
/*!40000 ALTER TABLE `equipment_information` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.flt_interface_status
CREATE TABLE IF NOT EXISTS tmnintegral.`flt_interface_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idVariable` int(11) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `elementName` varchar(255) DEFAULT NULL,
  `last_update_state` bigint(20) DEFAULT NULL,
  `retry_enable` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.flt_interface_status: ~37 rows (aproximadamente)
DELETE FROM  tmnintegral.`flt_interface_status`;
/*!40000 ALTER TABLE `flt_interface_status` DISABLE KEYS */;
INSERT INTO tmnintegral. `flt_interface_status` (`id`, `idVariable`, `valor`, `elementName`, `last_update_state`, `retry_enable`) VALUES
	(1, 8, 'up', 'R3_1.0.0.1_FastEthernet0/0', 20151014235216, 3),
	(2, 8, 'up', 'R3_1.0.0.1_FastEthernet1/0', 20151014235216, 3),
	(3, 8, 'up', 'R3_1.0.0.1_FastEthernet0/1', 20151014235216, 3),
	(4, 8, 'up', 'R3_1.0.0.1_FastEthernet2/0', 20151014235216, 3),
	(5, 8, 'up', 'DIA_CASA_CENTRAL_172.27.10.2_FastEthernet1/0', 20151014235025, 3),
	(6, 8, 'down', 'DIA_CASA_CENTRAL_172.27.10.2_Serial0/0', 20151014235025, 3),
	(7, 8, 'up', 'DIA_CASA_CENTRAL_172.27.10.2_FastEthernet0/0', 20151014235025, 3),
	(8, 8, 'down', 'DIA_CASA_CENTRAL_172.27.10.2_Serial0/1', 20151014235025, 3),
	(9, 8, 'up', 'DIA_CASA_CENTRAL_172.27.10.2_FastEthernet0/1', 20151014235025, 3),
	(10, 8, 'up', 'R2_172.28.9.2_FastEthernet0/0', 20151014235216, 3),
	(11, 8, 'up', 'R2_172.28.9.2_FastEthernet1/0', 20151014235216, 3),
	(12, 8, 'up', 'R2_172.28.9.2_FastEthernet0/1', 20151014235216, 3),
	(13, 8, 'down', 'R2_172.28.9.2_FastEthernet2/0', 20151014235216, 3),
	(14, 8, 'down', 'DIA_TAPIALES_172.31.103.20_FastEthernet1/0', 20151014235025, 3),
	(15, 8, 'down', 'DIA_TAPIALES_172.31.103.20_Serial0/0', 20151014235025, 3),
	(16, 8, 'up', 'DIA_TAPIALES_172.31.103.20_FastEthernet0/0', 20151014235025, 3),
	(17, 8, 'down', 'DIA_TAPIALES_172.31.103.20_Serial0/1', 20151014235025, 3),
	(18, 8, 'up', 'DIA_TAPIALES_172.31.103.20_FastEthernet0/1', 20151014235025, 3),
	(19, 8, 'up', 'CARREFOUR_CASA_CENTRAL_172.29.132.10_FastEthernet1/0', 20151014235216, 3),
	(20, 8, 'down', 'CARREFOUR_CASA_CENTRAL_172.29.132.10_Serial0/0', 20151014235216, 3),
	(21, 8, 'up', 'CARREFOUR_CASA_CENTRAL_172.29.132.10_FastEthernet0/0', 20151014235216, 3),
	(22, 8, 'down', 'CARREFOUR_CASA_CENTRAL_172.29.132.10_Serial0/1', 20151014235216, 3),
	(23, 8, 'down', 'CARREFOUR_CASA_CENTRAL_172.29.132.10_FastEthernet0/1', 20151014235216, 3),
	(24, 8, 'down', 'DIA_TAPIALES_SUC_A_172.22.107.2_FastEthernet1/0', 20151014235025, 3),
	(25, 8, 'down', 'DIA_TAPIALES_SUC_A_172.22.107.2_Serial0/0', 20151014235025, 3),
	(26, 8, 'up', 'DIA_TAPIALES_SUC_A_172.22.107.2_FastEthernet0/0', 20151014235025, 3),
	(27, 8, 'down', 'DIA_TAPIALES_SUC_A_172.22.107.2_Serial0/1', 20151014235025, 3),
	(28, 8, 'down', 'DIA_TAPIALES_SUC_A_172.22.107.2_FastEthernet0/1', 20151014235025, 3),
	(29, 8, 'up', 'DIA_CIUDAD_MADERO_172.26.19.3_FastEthernet0/0', 20151014235025, 3),
	(30, 8, 'down', 'DIA_CIUDAD_MADERO_172.26.19.3_FastEthernet1/0', 20151014235025, 3),
	(31, 8, 'down', 'DIA_CIUDAD_MADERO_172.26.19.3_FastEthernet0/1', 20151014235025, 3),
	(32, 8, 'down', 'DIA_CIUDAD_MADERO_172.26.19.3_FastEthernet2/0', 20151014235025, 3),
	(33, 8, 'down', 'CARREFOR_PUERTO_MADERO_172.23.101.2_FastEthernet1/0', 20151014235216, 3),
	(34, 8, 'down', 'CARREFOR_PUERTO_MADERO_172.23.101.2_Serial0/0', 20151014235216, 3),
	(35, 8, 'up', 'CARREFOR_PUERTO_MADERO_172.23.101.2_FastEthernet0/0', 20151014235216, 3),
	(36, 8, 'down', 'CARREFOR_PUERTO_MADERO_172.23.101.2_Serial0/1', 20151014235216, 3),
	(37, 8, 'down', 'CARREFOR_PUERTO_MADERO_172.23.101.2_FastEthernet0/1', 20151014235216, 3),
	(38, 8, 'down', 'R3_1.0.0.1_FastEthernet0/0', 20151014235216, 3);
/*!40000 ALTER TABLE `flt_interface_status` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.interface
CREATE TABLE IF NOT EXISTS tmnintegral.`interface` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adminStatus` varchar(50) DEFAULT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `shelf` int(11) DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `subport` int(11) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `id_device` int(11) NOT NULL,
  `ifIndex` int(11) DEFAULT NULL,
  `ipAdEntIfIndex` varchar(50) DEFAULT NULL,
  `mac` varchar(50) DEFAULT NULL,
  `ip_next_hop` varchar(50) DEFAULT NULL,
  `mac_next_hop` varchar(50) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_device` (`name`,`id_device`),
  KEY `mac` (`mac`),
  KEY `mac_next_hop` (`mac_next_hop`),
  KEY `FK_interface_device` (`id_device`),
  CONSTRAINT `FK_interface_device` FOREIGN KEY (`id_device`) REFERENCES `device` (`device_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.interface: ~37 rows (aproximadamente)
DELETE FROM  tmnintegral.`interface`;
/*!40000 ALTER TABLE `interface` DISABLE KEYS */;
INSERT INTO tmnintegral. `interface` (`id`, `adminStatus`, `alias`, `name`, `shelf`, `slot`, `port`, `subport`, `type`, `id_device`, `ifIndex`, `ipAdEntIfIndex`, `mac`, `ip_next_hop`, `mac_next_hop`, `last_update_date`) VALUES
	(1, '1', 'agustest', 'FastEthernet0/0', NULL, 0, 0, NULL, 'FastEthernet', 1, 1, NULL, '0xc2040f980000', NULL, NULL, '2015-11-18 13:12:44'),
	(2, '1', '', 'FastEthernet1/0', NULL, 1, 0, NULL, 'FastEthernet', 1, 3, '172.27.10.1', '0xc2040f980010', '172.27.10.2', '0xc00719c00001', '2015-10-12 19:40:27'),
	(3, '1', '', 'FastEthernet0/1', NULL, 0, 1, NULL, 'FastEthernet', 1, 2, '1.0.0.1', '0xc2040f980001', '1.0.0.10', '0x02004c4f4f50', '2015-10-12 19:40:27'),
	(4, '1', '', 'FastEthernet2/0', NULL, 2, 0, NULL, 'FastEthernet', 1, 4, '172.28.9.1', '0xc2040f980020', '172.28.9.2', '0xc20516a40001', '2015-10-12 19:40:27'),
	(5, '1', '', 'FastEthernet1/0', NULL, 1, 0, NULL, 'FastEthernet', 2, 1, '172.26.19.1', '0xc00719c00010', '172.26.19.3', '0xc20213980000', '2015-10-12 19:40:27'),
	(6, '2', '', 'Serial0/0', NULL, 0, 0, NULL, 'Serial', 2, 3, NULL, '', NULL, NULL, '2015-10-12 19:40:27'),
	(7, '1', '', 'FastEthernet0/0', NULL, 0, 0, NULL, 'FastEthernet', 2, 2, '172.31.103.1', '0xc00719c00000', '172.31.103.20', '0xc00117880000', '2015-10-12 19:40:27'),
	(8, '2', '', 'Serial0/1', NULL, 0, 1, NULL, 'Serial', 2, 5, NULL, '', NULL, NULL, '2015-10-12 19:40:27'),
	(9, '1', '', 'FastEthernet0/1', NULL, 0, 1, NULL, 'FastEthernet', 2, 4, '172.27.10.2', '0xc00719c00001', '172.27.10.1', '0xc2040f980010', '2015-10-12 19:40:27'),
	(10, '1', '', 'FastEthernet0/0', NULL, 0, 0, NULL, 'FastEthernet', 3, 1, '172.29.132.1', '0xc20516a40000', '172.29.132.10', '0xc00618140000', '2015-10-12 19:40:27'),
	(11, '1', '', 'FastEthernet1/0', NULL, 1, 0, NULL, 'FastEthernet', 3, 3, '172.23.101.1', '0xc20516a40010', '172.23.101.2', '0xc00917dc0000', '2015-10-12 19:40:27'),
	(12, '1', '', 'FastEthernet0/1', NULL, 0, 1, NULL, 'FastEthernet', 3, 2, '172.28.9.2', '0xc20516a40001', '172.28.9.1', '0xc2040f980020', '2015-10-12 19:40:27'),
	(13, '2', '', 'FastEthernet2/0', NULL, 2, 0, NULL, 'FastEthernet', 3, 4, NULL, '0xc20516a40020', NULL, NULL, '2015-10-12 19:40:27'),
	(14, '2', '', 'FastEthernet1/0', NULL, 1, 0, NULL, 'FastEthernet', 4, 1, NULL, '0xc00117880010', NULL, NULL, '2015-10-12 19:40:27'),
	(15, '2', '', 'Serial0/0', NULL, 0, 0, NULL, 'Serial', 4, 3, NULL, '', NULL, NULL, '2015-10-12 19:40:27'),
	(16, '1', '', 'FastEthernet0/0', NULL, 0, 0, NULL, 'FastEthernet', 4, 2, '172.31.103.20', '0xc00117880000', '172.31.103.1', '0xc00719c00000', '2015-10-12 19:40:27'),
	(17, '2', '', 'Serial0/1', NULL, 0, 1, NULL, 'Serial', 4, 5, NULL, '', NULL, NULL, '2015-10-12 19:40:27'),
	(18, '1', '', 'FastEthernet0/1', NULL, 0, 1, NULL, 'FastEthernet', 4, 4, '172.22.107.1', '0xc00117880001', '172.22.107.2', '0xc00313fc0000', '2015-10-12 19:40:27'),
	(19, '1', '', 'FastEthernet1/0', NULL, 1, 0, NULL, 'FastEthernet', 5, 1, '172.31.106.20', '0xc00618140010', NULL, NULL, '2015-10-12 19:40:27'),
	(20, '2', '', 'Serial0/0', NULL, 0, 0, NULL, 'Serial', 5, 3, NULL, '', NULL, NULL, '2015-10-12 19:40:27'),
	(21, '1', '', 'FastEthernet0/0', NULL, 0, 0, NULL, 'FastEthernet', 5, 2, '172.29.132.10', '0xc00618140000', '172.29.132.1', '0xc20516a40000', '2015-10-12 19:40:27'),
	(22, '2', '', 'Serial0/1', NULL, 0, 1, NULL, 'Serial', 5, 5, NULL, '', NULL, NULL, '2015-10-12 19:40:27'),
	(23, '2', '', 'FastEthernet0/1', NULL, 0, 1, NULL, 'FastEthernet', 5, 4, NULL, '0xc00618140001', NULL, NULL, '2015-10-12 19:40:27'),
	(24, '2', '', 'FastEthernet1/0', NULL, 1, 0, NULL, 'FastEthernet', 6, 1, NULL, '0xc00313fc0010', NULL, NULL, '2015-10-12 19:40:27'),
	(25, '2', '', 'Serial0/0', NULL, 0, 0, NULL, 'Serial', 6, 3, NULL, '', NULL, NULL, '2015-10-12 19:40:27'),
	(26, '1', '', 'FastEthernet0/0', NULL, 0, 0, NULL, 'FastEthernet', 6, 2, '172.22.107.2', '0xc00313fc0000', '172.22.107.1', '0xc00117880001', '2015-10-12 19:40:27'),
	(27, '2', '', 'Serial0/1', NULL, 0, 1, NULL, 'Serial', 6, 5, NULL, '', NULL, NULL, '2015-10-12 19:40:27'),
	(28, '2', '', 'FastEthernet0/1', NULL, 0, 1, NULL, 'FastEthernet', 6, 4, NULL, '0xc00313fc0001', NULL, NULL, '2015-10-12 19:40:27'),
	(29, '1', '', 'FastEthernet0/0', NULL, 0, 0, NULL, 'FastEthernet', 7, 1, '172.26.19.3', '0xc20213980000', '172.26.19.1', '0xc00719c00010', '2015-10-12 19:40:27'),
	(30, '2', '', 'FastEthernet1/0', NULL, 1, 0, NULL, 'FastEthernet', 7, 3, NULL, '0xc20213980010', NULL, NULL, '2015-10-12 19:40:27'),
	(31, '2', '', 'FastEthernet0/1', NULL, 0, 1, NULL, 'FastEthernet', 7, 2, NULL, '0xc20213980001', NULL, NULL, '2015-10-12 19:40:27'),
	(32, '2', '', 'FastEthernet2/0', NULL, 2, 0, NULL, 'FastEthernet', 7, 4, NULL, '0xc20213980020', NULL, NULL, '2015-10-12 19:40:27'),
	(33, '2', '', 'FastEthernet1/0', NULL, 1, 0, NULL, 'FastEthernet', 8, 1, NULL, '0xc00917dc0010', NULL, NULL, '2015-10-12 19:40:27'),
	(34, '2', '', 'Serial0/0', NULL, 0, 0, NULL, 'Serial', 8, 3, NULL, '', NULL, NULL, '2015-10-12 19:40:27'),
	(35, '1', '', 'FastEthernet0/0', NULL, 0, 0, NULL, 'FastEthernet', 8, 2, '172.23.101.2', '0xc00917dc0000', '172.23.101.1', '0xc20516a40010', '2015-10-12 19:40:27'),
	(36, '2', '', 'Serial0/1', NULL, 0, 1, NULL, 'Serial', 8, 5, NULL, '', NULL, NULL, '2015-10-12 19:40:27'),
	(37, '2', '', 'FastEthernet0/1', NULL, 0, 1, NULL, 'FastEthernet', 8, 4, NULL, '0xc00917dc0001', NULL, NULL, '2015-10-12 19:40:27'),
	(38, '1', 'AGUS PRUEBA', 'AGUS', 1, 1, 11, 12, '1', 2, 1, '1', '0x0asdas', '1111', '11111xsss', '2015-11-18 13:14:05');
/*!40000 ALTER TABLE `interface` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.network
CREATE TABLE IF NOT EXISTS tmnintegral.`network` (
  `id_network` int(11) NOT NULL,
  `network` varchar(100) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id_network`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.network: ~3 rows (aproximadamente)
DELETE FROM  tmnintegral.`network`;
/*!40000 ALTER TABLE `network` DISABLE KEYS */;
INSERT INTO tmnintegral. `network` (`id_network`, `network`, `enabled`, `description`) VALUES
	(0, '1.0.0.0/16', 0, ''),
	(1, 'PEPE', 0, 'asdasd'),
	(2, '2222', 1, '2222');
/*!40000 ALTER TABLE `network` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.role
CREATE TABLE IF NOT EXISTS tmnintegral.`role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(15) NOT NULL,
  `allow_create` tinyint(1) NOT NULL,
  `allow_delete` tinyint(1) NOT NULL,
  `allow_update` tinyint(1) NOT NULL,
  `allow_reports` int(11) NOT NULL,
  PRIMARY KEY (`role_id`) COMMENT 'Role primary key'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.role: ~2 rows (aproximadamente)
DELETE FROM  tmnintegral.`role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO tmnintegral. `role` (`role_id`, `role_name`, `allow_create`, `allow_delete`, `allow_update`, `allow_reports`) VALUES
	(1, 'ADMIN', 1, 1, 1, 1),
	(2, 'USER', 1, 1, 1, 1),
	(3, 'REPORTE', 0, 0, 0, 1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.routetable
CREATE TABLE IF NOT EXISTS tmnintegral.`routetable` (
  `id_equipo` bigint(20) DEFAULT NULL,
  `id_interface` bigint(20) DEFAULT NULL,
  `mac_destino` varchar(50) DEFAULT NULL,
  `ip_destino` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.routetable: ~0 rows (aproximadamente)
DELETE FROM  tmnintegral.`routetable`;
/*!40000 ALTER TABLE `routetable` DISABLE KEYS */;
/*!40000 ALTER TABLE `routetable` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.user
CREATE TABLE IF NOT EXISTS tmnintegral.`user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(15) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `role_id` int(11),
  PRIMARY KEY (`user_id`) COMMENT 'Primary Key for user table',
  KEY `FK_UserRole` (`role_id`) COMMENT 'Foreing key for user role',
  CONSTRAINT `USER_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.user: ~5 rows (aproximadamente)
DELETE FROM  tmnintegral.`user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO tmnintegral. `user` (`user_id`, `user_name`, `password`, `email`, `name`, `last_name`, `role_id`) VALUES
	(1, 'ADMIN', '66614cb39b5b09b39c78ab4543daabda', 'admin@tmnintegral.com', 'ADMIN', 'Admin', 1),
	(2, 'agussteko', 'ae2db700f6d1f94fccc584ebb506e585', 'agussteko@gmail.com', 'Agustina', 'Stekolschik', 1),
	(3, 'mriccardi', '30c80c2c0091eb9ed449cfd5a3bbe651', 'martinriccardi8@gmail.com', 'Martin', 'Riccardi', 1),
	(5, 'reporte', 'f1ab26a6c615f56e083b4ce7b6232f29', 'reporte@gmamama.com', 'test ', 'reporte', 3),
	(6, 'adas', 'c36217c6022b0669f225028191fe8286', 'adas@3434.com', '34234234', '234234', 3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.user_log
CREATE TABLE IF NOT EXISTS tmnintegral.`user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `log_desc` varchar(80) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.user_log: ~99 rows (aproximadamente)
DELETE FROM  tmnintegral.`user_log`;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
INSERT INTO tmnintegral. `user_log` (`id`, `user`, `date`, `log_desc`) VALUES
	(4, 1, '2015-10-03 16:48:56', 'test log'),
	(5, 2, '2015-10-03 16:54:12', 'El usuario ingreso a la plataforma'),
	(6, NULL, '2015-10-03 17:03:36', 'El usuario asas pidió un reset de contraseña'),
	(7, 2, '2015-10-03 17:04:07', 'El usuario ingreso a la plataforma'),
	(8, 2, '2015-10-03 17:04:16', 'El usuario salió de la plataforma'),
	(9, 2, '2015-10-03 17:04:28', 'El usuario ingreso a la plataforma'),
	(10, 2, '2015-10-06 23:27:18', 'El usuario ingreso a la plataforma'),
	(11, 2, '2015-10-06 23:27:25', 'El usuario salió de la plataforma'),
	(12, 2, '2015-10-07 19:37:20', 'El usuario ingreso a la plataforma'),
	(13, 2, '2015-10-07 19:44:32', 'El usuario salió de la plataforma'),
	(14, 2, '2015-10-07 19:45:57', 'El usuario ingreso a la plataforma'),
	(15, 2, '2015-10-28 21:41:10', 'El usuario ingreso a la plataforma'),
	(16, 2, '2015-10-29 17:31:59', 'El usuario ingreso a la plataforma'),
	(17, 2, '2015-10-29 17:35:56', 'El usuario ingreso a la plataforma'),
	(18, 2, '2015-10-29 17:36:03', 'El usuario ingreso a la plataforma'),
	(19, 2, '2015-10-29 17:41:07', 'El usuario ingreso a la plataforma'),
	(20, 2, '2015-10-29 18:17:06', 'El usuario ingreso a la plataforma'),
	(21, 2, '2015-10-29 18:32:18', 'El usuario salió de la plataforma'),
	(22, 2, '2015-10-29 19:16:45', 'El usuario ingreso a la plataforma'),
	(23, 2, '2015-10-29 19:22:51', 'El usuario ingreso a la plataforma'),
	(24, 2, '2015-10-29 19:23:53', 'El usuario ingreso a la plataforma'),
	(25, 2, '2015-10-29 19:34:06', 'El usuario ingreso a la plataforma'),
	(26, 2, '2015-10-29 20:14:56', 'El usuario ingreso a la plataforma'),
	(27, 2, '2015-10-31 12:05:26', 'El usuario ingreso a la plataforma'),
	(28, 2, '2015-10-31 20:14:14', 'El usuario ingreso a la plataforma'),
	(29, 2, '2015-10-31 20:19:37', 'El usuario ingreso a la plataforma'),
	(30, 2, '2015-10-31 20:36:33', 'El usuario ingreso a la plataforma'),
	(31, 2, '2015-11-01 21:47:06', 'El usuario ingreso a la plataforma'),
	(32, 2, '2015-11-01 22:20:41', 'El usuario ingreso a la plataforma'),
	(33, 2, '2015-11-01 22:47:14', 'El usuario ingreso a la plataforma'),
	(34, 2, '2015-11-02 19:52:34', 'El usuario ingreso a la plataforma'),
	(35, 2, '2015-11-02 20:34:11', 'El usuario ingreso a la plataforma'),
	(36, 2, '2015-11-02 21:06:10', 'El usuario ingreso a la plataforma'),
	(37, 2, '2015-11-12 00:27:40', 'El usuario ingreso a la plataforma'),
	(38, 2, '2015-11-13 17:47:39', 'El usuario ingreso a la plataforma'),
	(39, 2, '2015-11-13 20:05:26', 'El usuario ingreso a la plataforma'),
	(40, 2, '2015-11-18 10:35:51', 'El usuario ingreso a la plataforma'),
	(41, 2, '2015-11-18 10:48:46', 'El usuario ingreso a la plataforma'),
	(42, 2, '2015-11-18 11:11:23', 'El usuario ingreso a la plataforma'),
	(43, 2, '2015-11-18 11:26:27', 'El usuario ingreso a la plataforma'),
	(44, 2, '2015-11-18 12:13:07', 'El usuario ingreso a la plataforma'),
	(45, 2, '2015-11-18 12:50:11', 'El usuario ingreso a la plataforma'),
	(46, 2, '2015-11-18 12:52:15', 'El usuario ingreso a la plataforma'),
	(47, 2, '2015-11-18 13:05:56', 'El usuario ingreso a la plataforma'),
	(48, 2, '2015-11-18 13:26:27', 'El usuario ingreso a la plataforma'),
	(49, 2, '2015-11-18 13:43:24', 'El usuario ingreso a la plataforma'),
	(50, 2, '2015-11-18 15:06:52', 'El usuario ingreso a la plataforma'),
	(51, 2, '2015-11-18 15:17:24', 'El usuario ingreso a la plataforma'),
	(52, 2, '2015-11-18 15:19:16', 'El usuario ingreso a la plataforma'),
	(53, 2, '2015-11-18 15:35:45', 'El usuario ingreso a la plataforma'),
	(54, 2, '2015-11-18 15:40:51', 'El usuario ingreso a la plataforma'),
	(55, 2, '2015-11-18 16:12:07', 'El usuario ingreso a la plataforma'),
	(56, 2, '2015-11-18 16:23:32', 'El usuario ingreso a la plataforma'),
	(57, 2, '2015-11-18 16:28:23', 'El usuario ingreso a la plataforma'),
	(58, 2, '2015-11-18 19:27:59', 'El usuario ingreso a la plataforma'),
	(59, 2, '2015-11-18 19:29:20', 'El usuario salió de la plataforma'),
	(60, 2, '2015-11-18 19:34:52', 'El usuario ingreso a la plataforma'),
	(61, 2, '2015-11-21 15:38:04', 'El usuario ingreso a la plataforma'),
	(62, 2, '2015-11-21 15:59:54', 'El usuario ingreso a la plataforma'),
	(63, 2, '2015-11-21 16:35:47', 'El usuario salió de la plataforma'),
	(64, 2, '2015-11-21 16:36:27', 'El usuario ingreso a la plataforma'),
	(65, 2, '2015-11-21 17:10:45', 'El usuario ingreso a la plataforma'),
	(66, 2, '2015-11-21 17:21:49', 'El usuario ingreso a la plataforma'),
	(67, 2, '2015-11-21 17:28:24', 'El usuario salió de la plataforma'),
	(68, 2, '2015-11-21 17:28:40', 'El usuario ingreso a la plataforma'),
	(69, 2, '2015-11-21 17:28:49', 'El usuario salió de la plataforma'),
	(70, 5, '2015-11-21 17:28:55', 'El usuario ingreso a la plataforma'),
	(71, 5, '2015-11-21 17:29:02', 'El usuario salió de la plataforma'),
	(72, 2, '2015-11-21 17:53:22', 'El usuario ingreso a la plataforma'),
	(73, 2, '2015-11-21 18:31:49', 'El usuario ingreso a la plataforma'),
	(74, 2, '2015-11-21 19:10:39', 'El usuario ingreso a la plataforma'),
	(75, 2, '2015-11-23 22:00:29', 'El usuario ingreso a la plataforma'),
	(76, 2, '2015-11-25 09:22:08', 'El usuario ingreso a la plataforma'),
	(77, 2, '2015-11-25 12:18:53', 'El usuario ingreso a la plataforma'),
	(78, 2, '2015-11-25 19:42:57', 'El usuario ingreso a la plataforma'),
	(79, 2, '2016-02-10 17:06:50', 'El usuario ingreso a la plataforma'),
	(80, 2, '2016-02-10 17:12:18', 'El usuario salió de la plataforma'),
	(81, 2, '2016-02-10 18:16:03', 'El usuario ingreso a la plataforma'),
	(82, 2, '2016-05-04 19:48:55', 'El usuario ingreso a la plataforma'),
	(83, NULL, '2016-05-04 20:07:22', 'El usuario agussteko pidió un reset de contraseña'),
	(84, NULL, '2016-05-04 20:18:43', 'El usuario agussteko pidió un reset de contraseña'),
	(85, NULL, '2016-05-04 20:22:48', 'El usuario agussteko pidió un reset de contraseña'),
	(86, NULL, '2016-05-04 20:23:16', 'El usuario agussteko pidió un reset de contraseña'),
	(87, NULL, '2016-05-04 20:28:05', 'El usuario agussteko pidió un reset de contraseña'),
	(88, NULL, '2016-05-04 20:28:53', 'El usuario agussteko pidió un reset de contraseña'),
	(89, 2, '2016-05-04 20:30:44', 'El usuario ingreso a la plataforma'),
	(90, 2, '2016-05-04 20:31:39', 'El usuario ingreso a la plataforma'),
	(91, NULL, '2016-05-05 00:23:00', 'El usuario agussteko pidió un reset de contraseña'),
	(92, 2, '2016-05-05 00:23:24', 'El usuario ingreso a la plataforma'),
	(93, 2, '2016-05-05 00:35:48', 'El usuario ingreso a la plataforma'),
	(94, 2, '2016-05-05 00:37:31', 'El usuario ingreso a la plataforma'),
	(95, 2, '2016-05-05 00:37:45', 'El usuario ingreso a la plataforma'),
	(96, 2, '2016-05-05 00:39:32', 'El usuario ingreso a la plataforma'),
	(97, 2, '2016-05-05 00:41:13', 'El usuario ingreso a la plataforma'),
	(98, 2, '2016-05-05 00:45:36', 'El usuario ingreso a la plataforma'),
	(99, 2, '2016-05-05 00:45:49', 'El usuario ingreso a la plataforma'),
	(100, 2, '2016-05-05 00:46:17', 'El usuario ingreso a la plataforma'),
	(101, 2, '2016-05-05 00:46:36', 'El usuario ingreso a la plataforma'),
	(102, NULL, '2016-05-05 00:48:30', 'El usuario admin pidió un reset de contraseña'),
	(103, 1, '2016-05-05 00:48:49', 'El usuario ingreso a la plataforma');
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.variable
CREATE TABLE IF NOT EXISTS tmnintegral.`variable` (
  `variableName` varchar(255) DEFAULT NULL,
  `OID` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.variable: ~12 rows (aproximadamente)
DELETE FROM  tmnintegral.`variable`;
/*!40000 ALTER TABLE `variable` DISABLE KEYS */;
INSERT INTO tmnintegral. `variable` (`variableName`, `OID`, `id`) VALUES
	('ifAdminStatus', '1.3.6.1.2.1.2.2.1.7', 1),
	('sysDescr', '1.3.6.1.2.1.1.1', 2),
	('sysName', '1.3.6.1.2.1.1.5', 3),
	('ifAlias', '1.3.6.1.2.1.31.1.1.1.18', 4),
	('ifDescr', '1.3.6.1.2.1.2.2.1.2', 5),
	('ifName', '1.3.6.1.2.1.31.1.1.1.1', 6),
	('ifType', '1.3.6.1.2.1.2.2.1.3', 7),
	('ifOperStatus', '1.3.6.1.2.1.2.2.1.8', 8),
	('entPhysicalSerialNum', '1.3.6.1.2.1.47.1.1.1.1.11', 9),
	('ipAdEntIfIndex', '1.3.6.1.2.1.4.20.1.2', 10),
	('ifPhysAddress', '1.3.6.1.2.1.2.2.1.6', 11),
	('ipNetToMediaPhysAddress', '1.3.6.1.2.1.4.22.1.2', 12);
/*!40000 ALTER TABLE `variable` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.variable_devicetype
CREATE TABLE IF NOT EXISTS tmnintegral.`variable_devicetype` (
  `idVariable` int(11) DEFAULT NULL,
  `idDeviceType` int(11) DEFAULT NULL,
  `fieldName` varchar(255) DEFAULT NULL,
  `regex` varchar(255) DEFAULT NULL,
  `invertir` char(50) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tmnintegral.variable_devicetype: ~13 rows (aproximadamente)
DELETE FROM  tmnintegral.`variable_devicetype`;
/*!40000 ALTER TABLE `variable_devicetype` DISABLE KEYS */;
INSERT INTO tmnintegral. `variable_devicetype` (`idVariable`, `idDeviceType`, `fieldName`, `regex`, `invertir`) VALUES
	(1, 0, 'adminStatus', NULL, 'N'),
	(3, 0, 'hostname', NULL, 'N'),
	(4, 0, 'alias', NULL, 'N'),
	(5, 0, 'name', NULL, 'N'),
	(2, 0, 'model', 'Software\\s+\\((.+?)\\-', 'N'),
	(2, 0, 'softwareRelease', 'RELEASE\\s+SOFTWARE\\s+\\((.+)\\)', 'N'),
	(9, 0, 'serialNumber', NULL, 'N'),
	(2, 0, 'iosVersion', ',\\s*Version\\s+(.+?)\\,', 'N'),
	(2, 0, 'iosType', 'Software\\s+\\([^-]+\\-(.+?)\\)', 'N'),
	(8, 0, 'operStatus', NULL, 'N'),
	(10, 0, 'ipAdEntIfIndex', '.+\\.(\\d+\\.\\d+\\.\\d+\\.\\d+)', 'Y'),
	(11, 0, 'mac', NULL, 'N'),
	(12, 0, 'ipNetToMediaPhysAddress', '.+\\.(\\d+\\.\\d+\\.\\d+\\.\\d+\\.\\d+)', 'Y');
/*!40000 ALTER TABLE `variable_devicetype` ENABLE KEYS */;


-- Volcando estructura para tabla tmnintegral.version
CREATE TABLE IF NOT EXISTS tmnintegral.`version` (
  `id_version` int(11) NOT NULL,
  `version` bigint(20) NOT NULL,
  PRIMARY KEY (`id_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tmnintegral.version: ~0 rows (aproximadamente)
DELETE FROM  tmnintegral.`version`;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
