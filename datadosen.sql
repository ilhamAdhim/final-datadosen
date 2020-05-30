-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2020 at 07:15 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datadosen`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDPA` (IN `param_code` VARCHAR(5), IN `param_year` VARCHAR(4), IN `param_class` VARCHAR(5))  BEGIN
    SELECT * FROM vu_dpa
    WHERE vu_dpa.code = param_code AND vu_dpa.year = param_year OR vu_dpa.class_name = param_class AND vu_dpa.year = param_year OR vu_dpa.code =param_code AND vu_dpa.year = param_year;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getLecturerField` (IN `param` VARCHAR(15))  NO SQL
BEGIN


SELECT * FROM vu_lecturer_field WHERE CODE = param OR vu_lecturer_field.name = param OR vu_lecturer_field.field_of_study = param;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getLecturerPosition` (IN `param` VARCHAR(20))  NO SQL
BEGIN
    

	SELECT * FROM vu_position_2019 WHERE code = param OR position LIKE concat('%',param,'%') OR vu_position_2019.year = param;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getResearcher` (IN `param` VARCHAR(10))  NO SQL
BEGIN

	SELECT * FROM vu_research WHERE research = param OR vu_research.code = param OR vu_research.priority=param;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getTeachingRules` (IN `param` VARCHAR(15))  NO SQL
BEGIN
 SELECT * FROM vu_teachings WHERE vu_teachings.code = param;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_adminlist`
--

CREATE TABLE `tb_adminlist` (
  `username` varchar(10) CHARACTER SET utf8 NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_adminlist`
--

INSERT INTO `tb_adminlist` (`username`, `password`, `name`) VALUES
('admin', 'admin', 'admin_1'),
('admin_2', 'admin_2', 'admin_2');

-- --------------------------------------------------------

--
-- Table structure for table `tb_class`
--

CREATE TABLE `tb_class` (
  `cl_id` int(11) NOT NULL DEFAULT '0',
  `cl_major` varchar(2) DEFAULT NULL,
  `cl_level` int(1) DEFAULT NULL,
  `cl_name` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_class`
--

INSERT INTO `tb_class` (`cl_id`, `cl_major`, `cl_level`, `cl_name`) VALUES
(0, 'N', 0, 'N'),
(1, 'TI', 1, 'A'),
(2, 'TI', 1, 'B'),
(3, 'TI', 1, 'C'),
(4, 'TI', 1, 'D'),
(5, 'TI', 1, 'E'),
(6, 'TI', 1, 'F'),
(7, 'TI', 1, 'G'),
(8, 'TI', 1, 'H'),
(9, 'MI', 1, 'A'),
(10, 'MI', 1, 'B'),
(11, 'MI', 1, 'C'),
(12, 'MI', 1, 'D'),
(13, 'MI', 1, 'E'),
(14, 'MI', 1, 'F'),
(15, 'TI', 2, 'A'),
(16, 'TI', 2, 'B'),
(17, 'TI', 2, 'C'),
(18, 'TI', 2, 'D'),
(19, 'TI', 2, 'E'),
(20, 'TI', 2, 'F'),
(21, 'TI', 2, 'G'),
(22, 'TI', 2, 'H'),
(23, 'MI', 2, 'A'),
(24, 'MI', 2, 'B'),
(25, 'MI', 2, 'C'),
(26, 'MI', 2, 'D'),
(27, 'MI', 2, 'E'),
(28, 'MI', 2, 'F'),
(29, 'TI', 3, 'A'),
(30, 'TI', 3, 'B'),
(31, 'TI', 3, 'C'),
(32, 'TI', 3, 'D'),
(33, 'TI', 3, 'E'),
(34, 'TI', 3, 'F'),
(35, 'TI', 3, 'G'),
(36, 'TI', 3, 'H'),
(37, 'MI', 3, 'A'),
(38, 'MI', 3, 'B'),
(39, 'MI', 3, 'C'),
(40, 'MI', 3, 'D'),
(41, 'MI', 3, 'E'),
(42, 'MI', 3, 'F'),
(43, 'TI', 4, 'A'),
(44, 'TI', 4, 'B'),
(45, 'TI', 4, 'C'),
(46, 'TI', 4, 'D'),
(47, 'TI', 4, 'E'),
(48, 'TI', 4, 'F'),
(49, 'TI', 4, 'G'),
(50, 'TI', 4, 'H'),
(51, 'TI', 4, 'I');

-- --------------------------------------------------------

--
-- Table structure for table `tb_class_schedule`
--

CREATE TABLE `tb_class_schedule` (
  `lc_code` varchar(3) DEFAULT NULL,
  `cl_id` int(11) DEFAULT NULL,
  `subject_code` varchar(10) DEFAULT NULL,
  `hour` int(2) DEFAULT NULL,
  `semester` int(1) DEFAULT NULL,
  `year` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_class_schedule`
--

INSERT INTO `tb_class_schedule` (`lc_code`, `cl_id`, `subject_code`, `hour`, `semester`, `year`) VALUES
('IAM', 25, 'RIF184001', 4, 2, 2019),
('IAM', 26, 'RIF184001', 4, 2, 2019),
('SES', 27, 'RIF184001', 4, 2, 2019),
('SES', 28, 'RIF184001', 4, 2, 2019),
('PPA', 25, 'RIF184002', 8, 2, 2019),
('PPA', 26, 'RIF184002', 8, 2, 2019),
('DHS', 27, 'RIF184002', 8, 2, 2019),
('DHS', 28, 'RIF184002', 8, 2, 2019),
('PYS', 25, 'RIF184003', 3, 2, 2019),
('PYS', 26, 'RIF184003', 3, 2, 2019),
('PYS', 27, 'RIF184003', 3, 2, 2019),
('YA', 28, 'RIF184003', 3, 2, 2019),
('TOM', 25, 'RIF184004', 9, 2, 2019),
('YP', 26, 'RIF184004', 9, 2, 2019),
('LA', 27, 'RIF184004', 9, 2, 2019),
('PYS', 28, 'RIF184004', 9, 2, 2019),
('ARP', 25, 'RIF184005', 5, 2, 2019),
('YA', 26, 'RIF184005', 5, 2, 2019),
('YA', 27, 'RIF184005', 5, 2, 2019),
('YA', 28, 'RIF184005', 5, 2, 2019),
('WIS', 25, 'RIF184006', 2, 2, 2019),
('WIS', 26, 'RIF184006', 2, 2, 2019),
('ROW', 27, 'RIF184006', 2, 2, 2019),
('ROW', 28, 'RIF184006', 2, 2, 2019),
('ATF', 25, 'RIF184007', 6, 2, 2019),
('BGS', 26, 'RIF184007', 6, 2, 2019),
('BGS', 27, 'RIF184007', 6, 2, 2019),
('YY', 28, 'RIF184007', 6, 2, 2019),
('IRA', 25, 'RIF183001', 3, 3, 2019),
('IRA', 26, 'RIF183001', 3, 3, 2019),
('IDW', 27, 'RIF183001', 3, 3, 2019),
('IDW', 28, 'RIF183001', 3, 3, 2019),
('FUM', 25, 'RIF183002', 3, 3, 2019),
('FUM', 26, 'RIF183002', 3, 3, 2019),
('ATQ', 27, 'RIF183002', 3, 3, 2019),
('ATQ', 28, 'RIF183002', 3, 3, 2019),
('MSK', 25, 'RIF183003', 6, 3, 2019),
('YP', 26, 'RIF183003', 6, 3, 2019),
('YP', 27, 'RIF183003', 6, 3, 2019),
('YP', 28, 'RIF183003', 6, 3, 2019),
('ARW', 25, 'RIF183004', 3, 3, 2019),
('ARW', 26, 'RIF183004', 3, 3, 2019),
('MUP', 27, 'RIF183004', 3, 3, 2019),
('MUP', 28, 'RIF183004', 3, 3, 2019),
('ANP', 25, 'RIF183005', 6, 3, 2019),
('ANP', 26, 'RIF183005', 6, 3, 2019),
('BGS', 27, 'RIF183005', 6, 3, 2019),
('BGS', 28, 'RIF183005', 6, 3, 2019),
('YA', 25, 'RIF183006', 3, 3, 2019),
('YA', 26, 'RIF183006', 3, 3, 2019),
('SNA', 27, 'RIF183006', 3, 3, 2019),
('SNA', 28, 'RIF183006', 3, 3, 2019),
('YA', 25, 'RIF183007', 5, 3, 2019),
('YA', 26, 'RIF183007', 5, 3, 2019),
('SNA', 27, 'RIF183007', 5, 3, 2019),
('SNA', 28, 'RIF183007', 5, 3, 2019),
('ELA', 25, 'RIF183008', 3, 3, 2019),
('ELA', 26, 'RIF183008', 3, 3, 2019),
('IFR', 27, 'RIF183008', 3, 3, 2019),
('VAH', 28, 'RIF183008', 3, 3, 2019),
('ELA', 25, 'RIF183009', 6, 3, 2019),
('ELA', 26, 'RIF183009', 6, 3, 2019),
('IFR', 27, 'RIF183009', 6, 3, 2019),
('VAH', 28, 'RIF183009', 6, 3, 2019),
('UN', 37, 'RIF175001', 6, 5, 2019),
('UN', 38, 'RIF175001', 6, 5, 2019),
('VAH', 39, 'RIF175001', 6, 5, 2019),
('VAH', 40, 'RIF175001', 6, 5, 2019),
('RIZ', 41, 'RIF175001', 6, 5, 2019),
('RIZ', 42, 'RIF175001', 6, 5, 2019),
('RDA', 37, 'RIF175002', 12, 5, 2019),
('MQ', 38, 'RIF175002', 12, 5, 2019),
('HJT', 39, 'RIF175002', 12, 5, 2019),
('OKE', 40, 'RIF175002', 12, 5, 2019),
('RID', 41, 'RIF175002', 12, 5, 2019),
('UN', 42, 'RIF175002', 12, 5, 2019),
('IRA', 37, 'RIF175003', 4, 5, 2019),
('IRA', 38, 'RIF175003', 4, 5, 2019),
('IRA', 39, 'RIF175003', 4, 5, 2019),
('MM', 40, 'RIF175003', 4, 5, 2019),
('ARW', 41, 'RIF175003', 4, 5, 2019),
('ARW', 42, 'RIF175003', 4, 5, 2019),
('SNA', 37, 'RIF175004', 6, 5, 2019),
('TAW', 38, 'RIF175004', 6, 5, 2019),
('TAW', 39, 'RIF175004', 6, 5, 2019),
('KPA', 40, 'RIF175004', 6, 5, 2019),
('KSB', 41, 'RIF175004', 6, 5, 2019),
('KSB', 42, 'RIF175004', 6, 5, 2019),
('DWI', 37, 'RIF175005', 6, 5, 2019),
('DWI', 38, 'RIF175005', 6, 5, 2019),
('OKE', 39, 'RIF175005', 6, 5, 2019),
('LA', 40, 'RIF175005', 6, 5, 2019),
('HP', 41, 'RIF175005', 6, 5, 2019),
('HP', 42, 'RIF175005', 6, 5, 2019),
('NOP', 37, 'RIF175006', 6, 5, 2019),
('VS', 38, 'RIF175006', 6, 5, 2019),
('CDR', 39, 'RIF175006', 6, 5, 2019),
('GAP', 40, 'RIF175006', 6, 5, 2019),
('MZA', 41, 'RIF175006', 6, 5, 2019),
('MZA', 42, 'RIF175006', 6, 5, 2019),
('IKP', 29, 'RTI175001', 4, 5, 2019),
('MIS', 30, 'RTI175001', 4, 5, 2019),
('MMH', 31, 'RTI175001', 4, 5, 2019),
('WIS', 32, 'RTI175001', 4, 5, 2019),
('WIS', 33, 'RTI175001', 4, 5, 2019),
('WIS', 34, 'RTI175001', 4, 5, 2019),
('WIS', 35, 'RTI175001', 4, 5, 2019),
('PYS', 29, 'RTI175002', 12, 5, 2019),
('RAA', 30, 'RTI175002', 12, 5, 2019),
('ZUL', 31, 'RTI175002', 12, 5, 2019),
('DMR', 32, 'RTI175002', 12, 5, 2019),
('LA', 33, 'RTI175002', 12, 5, 2019),
('DWW', 34, 'RTI175002', 12, 5, 2019),
('YY', 35, 'RTI175002', 12, 5, 2019),
('IFR', 29, 'RTI175003', 6, 5, 2019),
('RAA', 30, 'RTI175003', 6, 5, 2019),
('PPA', 31, 'RTI175003', 6, 5, 2019),
('PPA', 32, 'RTI175003', 6, 5, 2019),
('DHS', 33, 'RTI175003', 6, 5, 2019),
('DOD', 34, 'RTI175003', 6, 5, 2019),
('DOD', 35, 'RTI175003', 6, 5, 2019),
('YY', 29, 'RTI175004', 6, 5, 2019),
('YY', 30, 'RTI175004', 6, 5, 2019),
('DOD', 31, 'RTI175004', 6, 5, 2019),
('DOD', 32, 'RTI175004', 6, 5, 2019),
('MAH', 33, 'RTI175004', 6, 5, 2019),
('MAH', 34, 'RTI175004', 6, 5, 2019),
('IN', 35, 'RTI175004', 6, 5, 2019),
('MAH', 29, 'RTI175005', 4, 5, 2019),
('DMR', 30, 'RTI175005', 4, 5, 2019),
('DMR', 31, 'RTI175005', 4, 5, 2019),
('DMR', 32, 'RTI175005', 4, 5, 2019),
('PPA', 33, 'RTI175005', 4, 5, 2019),
('PPA', 34, 'RTI175005', 4, 5, 2019),
('PPA', 35, 'RTI175005', 4, 5, 2019),
('VS', 29, 'RTI175006', 6, 5, 2019),
('GPR', 30, 'RTI175006', 6, 5, 2019),
('GPR', 31, 'RTI175006', 6, 5, 2019),
('GPR', 32, 'RTI175006', 6, 5, 2019),
('GPR', 33, 'RTI175006', 6, 5, 2019),
('LA', 34, 'RTI175006', 6, 5, 2019),
('VS', 35, 'RTI175006', 6, 5, 2019),
('DSE', 37, 'RIF176001', 4, 6, 2019),
('DSE', 38, 'RIF176001', 4, 6, 2019),
('ANR', 39, 'RIF176001', 4, 6, 2019),
('ANR', 40, 'RIF176001', 4, 6, 2019),
('ANR', 41, 'RIF176001', 4, 6, 2019),
('ANR', 42, 'RIF176001', 4, 6, 2019),
('ATQ', 37, 'RIF176002', 3, 6, 2019),
('ATQ', 38, 'RIF176002', 3, 6, 2019),
('ATQ', 39, 'RIF176002', 3, 6, 2019),
('ATQ', 40, 'RIF176002', 3, 6, 2019),
('FUM', 41, 'RIF176002', 3, 6, 2019),
('FUM', 42, 'RIF176002', 3, 6, 2019),
('WID', 37, 'RIF176003', 3, 6, 2019),
('WID', 38, 'RIF176003', 3, 6, 2019),
('WID', 39, 'RIF176003', 3, 6, 2019),
('WID', 40, 'RIF176003', 3, 6, 2019),
('WID', 41, 'RIF176003', 3, 6, 2019),
('WID', 42, 'RIF176003', 3, 6, 2019),
('NUR', 37, 'RIF176006', 3, 6, 2019),
('NUR', 38, 'RIF176006', 3, 6, 2019),
('NUR', 39, 'RIF176006', 3, 6, 2019),
('NUR', 40, 'RIF176006', 3, 6, 2019),
('NUR', 41, 'RIF176006', 3, 6, 2019),
('NUR', 42, 'RIF176006', 3, 6, 2019),
('FU', 29, 'RTI176001 ', 2, 6, 2019),
('FU', 30, 'RTI176001 ', 2, 6, 2019),
('SBS', 31, 'RTI176001', 2, 6, 2019),
('HP', 32, 'RTI176001', 2, 6, 2019),
('HP', 33, 'RTI176001', 2, 6, 2019),
('SIR', 34, 'RTI176001', 2, 6, 2019),
('SIR', 35, 'RTI176001', 2, 6, 2019),
('ELA', 29, 'RTI176002', 6, 6, 2019),
('ELA', 30, 'RTI176002', 6, 6, 2019),
('UDR', 31, 'RTI176002', 6, 6, 2019),
('MAH', 32, 'RTI176002', 6, 6, 2019),
('MAH', 33, 'RTI176002', 6, 6, 2019),
('MM', 34, 'RTI176002', 6, 6, 2019),
('MM', 35, 'RTI176002', 6, 6, 2019),
('GBP', 29, 'RTI176003', 6, 6, 2019),
('GBP', 30, 'RTI176003', 6, 6, 2019),
('IAM', 31, 'RTI176003', 6, 6, 2019),
('IAM', 32, 'RTI176003', 6, 6, 2019),
('YY', 33, 'RTI176003', 6, 6, 2019),
('YY', 34, 'RTI176003', 6, 6, 2019),
('DOD', 35, 'RTI176003', 6, 6, 2019),
('ANP', 29, 'RTI176004', 4, 6, 2019),
('KSB', 30, 'RTI176004', 4, 6, 2019),
('KSB', 31, 'RTI176004', 4, 6, 2019),
('HAR', 32, 'RTI176004', 4, 6, 2019),
('HAR', 33, 'RTI176004', 4, 6, 2019),
('IAM', 34, 'RTI176004', 4, 6, 2019),
('MUP', 35, 'RTI176004', 4, 6, 2019),
('VAH', 29, 'RTI176005', 6, 6, 2019),
('NOP', 30, 'RTI176005', 6, 6, 2019),
('NOP', 31, 'RTI176005', 6, 6, 2019),
('DOD', 32, 'RTI176005', 6, 6, 2019),
('DOD', 33, 'RTI176005', 6, 6, 2019),
('MSK', 34, 'RTI176005', 6, 6, 2019),
('MSK', 35, 'RTI176005', 6, 6, 2019),
('KSB', 29, 'RTI176006', 3, 6, 2019),
('CR', 30, 'RTI176006', 3, 6, 2019),
('CR', 31, 'RTI176006', 3, 6, 2019),
('CR', 32, 'RTI176006', 3, 6, 2019),
('ANP', 33, 'RTI176006', 3, 6, 2019),
('RAA', 34, 'RTI176006', 3, 6, 2019),
('ANP', 35, 'RTI176006', 3, 6, 2019),
('DWW', 29, 'RTI176007', 3, 6, 2019),
('DWW', 30, 'RTI176007', 3, 6, 2019),
('MZA', 31, 'RTI176007', 3, 6, 2019),
('MZA', 32, 'RTI176007', 3, 6, 2019),
('ODT', 33, 'RTI176007', 3, 6, 2019),
('ODT', 34, 'RTI176007', 3, 6, 2019),
('MEA', 35, 'RTI176007', 3, 6, 2019),
('FPR', 43, 'RTI167001', 4, 7, 2019),
('FPR', 44, 'RTI167001', 4, 7, 2019),
('FPR', 45, 'RTI167001', 4, 7, 2019),
('FPR', 46, 'RTI167001', 4, 7, 2019),
('IN', 47, 'RTI167001', 4, 7, 2019),
('IN', 48, 'RTI167001', 4, 7, 2019),
('IN', 49, 'RTI167001', 4, 7, 2019),
('IN', 50, 'RTI167001', 4, 7, 2019),
('FRP', 51, 'RTI167001', 4, 7, 2019),
('TOM', 43, 'RTI167002', 4, 7, 2019),
('TOM', 44, 'RTI167002', 4, 7, 2019),
('TOM', 45, 'RTI167002', 4, 7, 2019),
('VNW', 46, 'RTI167002', 4, 7, 2019),
('VAL', 47, 'RTI167002', 4, 7, 2019),
('ARW', 48, 'RTI167002', 4, 7, 2019),
('ARW', 49, 'RTI167002', 4, 7, 2019),
('RDN', 50, 'RTI167002', 4, 7, 2019),
('APK', 51, 'RTI167002', 4, 7, 2019),
('IDW', 43, 'RTI167003', 4, 7, 2019),
('IDW', 44, 'RTI167003', 4, 7, 2019),
('GBP', 45, 'RTI167003', 4, 7, 2019),
('GBP', 46, 'RTI167003', 4, 7, 2019),
('GBP', 47, 'RTI167003', 4, 7, 2019),
('GBP', 48, 'RTI167003', 4, 7, 2019),
('DRY', 43, 'RTI167004', 6, 7, 2019),
('DRY', 44, 'RTI167004', 6, 7, 2019),
('DRY', 45, 'RTI167004', 6, 7, 2019),
('DRY', 46, 'RTI167004', 6, 7, 2019),
('ODT', 47, 'RTI167004', 6, 7, 2019),
('ODT', 48, 'RTI167004', 6, 7, 2019),
('ODT', 49, 'RTI167004', 6, 7, 2019),
('ODT', 50, 'RTI167004', 6, 7, 2019),
('ARS', 51, 'RTI167004', 6, 7, 2019),
('ELA', 43, 'RTI167005', 6, 7, 2019),
('RR', 44, 'RTI167005', 6, 7, 2019),
('UDR', 45, 'RTI167005', 6, 7, 2019),
('UDR', 46, 'RTI167005', 6, 7, 2019),
('QH', 47, 'RTI167005', 6, 7, 2019),
('ESS', 48, 'RTI167005', 6, 7, 2019),
('ESS', 49, 'RTI167005', 6, 7, 2019),
('ESS', 50, 'RTI167005', 6, 7, 2019),
('ASA', 51, 'RTI167005', 6, 7, 2019),
('CR', 43, 'RTI167006', 6, 7, 2019),
('RAA', 44, 'RTI167006', 6, 7, 2019),
('ANP', 45, 'RTI167006', 6, 7, 2019),
('ANP', 46, 'RTI167006', 6, 7, 2019),
('KSB', 47, 'RTI167006', 6, 7, 2019),
('KSB', 48, 'RTI167006', 6, 7, 2019),
('QH', 49, 'RTI167006', 6, 7, 2019),
('QH', 50, 'RTI167006', 6, 7, 2019),
('QH', 51, 'RTI167006', 6, 7, 2019),
('ERF', 43, 'RTI167007', 8, 7, 2019),
('CR', 44, 'RTI167007', 8, 7, 2019),
('YA', 45, 'RTI167007', 8, 7, 2019),
('KPA', 46, 'RTI167007', 8, 7, 2019),
('IFR', 47, 'RTI167007', 8, 7, 2019),
('ZUL', 48, 'RTI167007', 8, 7, 2019),
('GBP', 49, 'RTI167007', 8, 7, 2019),
('FPR', 50, 'RTI167007', 8, 7, 2019),
('MAH', 51, 'RTI167007', 8, 7, 2019),
('ERF', 43, 'RTI168001', 2, 8, 2019),
('ERF', 44, 'RTI168001', 2, 8, 2019),
('UN', 45, 'RTI168001', 2, 8, 2019),
('UN', 46, 'RTI168001', 2, 8, 2019),
('UN', 47, 'RTI168001', 2, 8, 2019),
('OKE', 48, 'RTI168001', 2, 8, 2019),
('OKE', 49, 'RTI168001', 2, 8, 2019),
('SNA', 50, 'RTI168001', 2, 8, 2019),
('RDM', 51, 'RTI168001', 2, 8, 2019),
('ERF', 43, 'RTI168002', 2, 8, 2019),
('ERF', 44, 'RTI168002', 2, 8, 2019),
('TOM', 45, 'RTI168002', 2, 8, 2019),
('TOM', 46, 'RTI168002', 2, 8, 2019),
('GBP', 47, 'RTI168002', 2, 8, 2019),
('GBP', 48, 'RTI168002', 2, 8, 2019),
('GBP', 49, 'RTI168002', 2, 8, 2019),
('ARW', 50, 'RTI168002', 2, 8, 2019),
('ARW', 51, 'RTI168002', 2, 8, 2019);

-- --------------------------------------------------------

--
-- Table structure for table `tb_contract_files`
--

CREATE TABLE `tb_contract_files` (
  `subject_code` varchar(9) DEFAULT NULL,
  `contract_file` varchar(33) DEFAULT NULL,
  `uploaded_by` varchar(5) NOT NULL DEFAULT 'Admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_contract_files`
--

INSERT INTO `tb_contract_files` (`subject_code`, `contract_file`, `uploaded_by`) VALUES
('RIF183002', 'Kontrak_RIF183002_BING2', 'Admin'),
('RTI184001', 'Kontrak_RTI184001_SistemInformasi', 'Admin'),
('RTI191005', 'Kontrak_RTI191005_BING', 'Admin'),
('RTI182003', 'Kontrak_RTI192003_BING2', 'Admin'),
('RIF191005', 'Kontrak_RIF191005_BING', 'Admin'),
('RTI184006', 'Kontrak_RTI184006_WebLanjut', 'Admin'),
('RTI175003', 'Kontrak_RTI175003_MobileProgrammi', 'IFR');

-- --------------------------------------------------------

--
-- Table structure for table `tb_dpa`
--

CREATE TABLE `tb_dpa` (
  `code` varchar(3) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `cl_id_dpa` int(11) DEFAULT '0',
  `semester` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_dpa`
--

INSERT INTO `tb_dpa` (`code`, `year`, `cl_id_dpa`, `semester`) VALUES
('ZUL', 2018, 29, 'Odd'),
('RID', 2018, 31, 'Odd'),
('ARP', 2018, 48, 'Odd'),
('HJT', 2018, 28, 'Odd'),
('CR', 2018, 26, 'Odd'),
('DS', 2018, 42, 'Odd'),
('DWW', 2018, 46, 'Odd'),
('ERF', 2018, 41, 'Odd'),
('LA', 2018, 27, 'Odd'),
('MQ', 2018, 50, 'Odd'),
('RWS', 2018, 34, 'Odd'),
('RR', 2018, 35, 'Odd'),
('RAA', 2018, 38, 'Odd'),
('RDA', 2018, 44, 'Odd'),
('UN', 2018, 40, 'Odd'),
('WID', 2018, 32, 'Odd'),
('YA', 2018, 39, 'Odd'),
('DRY', 2018, 43, 'Odd'),
('MEA', 2018, 33, 'Odd'),
('MM', 2018, 45, 'Odd'),
('YY', 2018, 29, 'Odd'),
('DSE', 2018, 25, 'Odd'),
('FU', 2018, 30, 'Odd'),
('ODT', 2018, 36, 'Odd'),
('SIR', 2018, 48, 'Odd'),
('YP', 2018, 50, 'Odd'),
('ZUL', 2019, 43, 'Odd'),
('RID', 2019, 45, 'Odd'),
('HJT', 2019, 42, 'Odd'),
('CR', 2019, 40, 'Odd'),
('KPA', 2019, 32, 'Odd'),
('DWI', 2019, 35, 'Odd'),
('ELA', 2019, 30, 'Odd'),
('TOM', 2019, 26, 'Odd'),
('HP', 2019, 27, 'Odd'),
('LA', 2019, 41, 'Odd'),
('PYS', 2019, 31, 'Odd'),
('PPA', 2019, 38, 'Odd'),
('RWS', 2019, 48, 'Odd'),
('RR', 2019, 49, 'Odd'),
('UDR', 2019, 51, ''),
('WID', 2019, 46, 'Odd'),
('ANP', 2019, 28, 'Odd'),
('ANR', 2019, 29, 'Odd'),
('DHS', 2019, 33, 'Odd'),
('ENH', 2019, 34, 'Odd'),
('MEA', 2019, 47, 'Odd'),
('SNA', 2019, 37, 'Odd'),
('DSE', 2019, 39, 'Odd'),
('FU', 2019, 44, 'Odd'),
('ODT', 2019, 50, 'Odd');

-- --------------------------------------------------------

--
-- Table structure for table `tb_homebase`
--

CREATE TABLE `tb_homebase` (
  `code` varchar(3) DEFAULT NULL,
  `homebase` varchar(2) DEFAULT NULL,
  `homebase_D3` varchar(2) DEFAULT NULL,
  `accreditation_homebase` varchar(2) DEFAULT NULL,
  `level` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_homebase`
--

INSERT INTO `tb_homebase` (`code`, `homebase`, `homebase_D3`, `accreditation_homebase`, `level`) VALUES
('ZUL', 'D4', 'D4', 'D4', 'D4'),
('RID', 'D4', 'D4', 'D4', 'D4'),
('ARP', 'D4', 'D4', 'D4', 'D4'),
('ATQ', 'D4', 'D3', 'D3', 'D4'),
('BSA', 'D4', 'D3', 'D3', 'D4'),
('HJT', 'D3', 'D3', 'D3', 'D3'),
('CR', 'D3', 'D3', 'D3', 'D3'),
('KPA', 'D4', 'D4', 'D4', 'D4'),
('DS', 'D3', 'D3', 'D3', 'D3'),
('DWW', 'D4', 'D4', 'D4', 'D4'),
('DWI', 'D4', 'D3', 'D3', 'D4'),
('IRA', 'D4', 'D3', 'D3', 'D4'),
('ELA', 'D4', 'D4', 'D4', 'D4'),
('OKE', 'D3', 'D3', 'D3', 'D3'),
('ESA', 'D3', 'D4', 'D4', 'D3'),
('ERF', 'D4', 'D3', 'D3', 'D4'),
('TOM', 'D4', 'D3', 'D3', 'D4'),
('GBP', 'D3', 'D3', 'D3', 'D3'),
('HP', 'D3', 'D3', 'D3', 'D3'),
('IFR', 'D4', 'D4', 'D4', 'D4'),
('IDW', 'D4', 'D4', 'D4', 'D4'),
('LA', 'D3', 'D3', 'D3', 'D3'),
('MQ', 'D4', 'D4', 'D4', 'D4'),
('PYS', 'D4', 'D4', 'D4', 'D4'),
('PPA', 'D3', 'D3', 'D3', 'D3'),
('RWS', 'D3', 'D4', 'D4', 'D3'),
('RR', 'D4', 'D4', 'D4', 'D4'),
('RAA', 'D3', 'D3', 'D3', 'D3'),
('RDA', 'D3', 'D4', 'D4', 'D3'),
('UDR', 'D3', 'D3', 'D3', 'D3'),
('UN', 'D3', 'D3', 'D3', 'D3'),
('WID', 'D4', 'D4', 'D4', 'D4'),
('YWS', 'D3', 'D4', 'D4', 'D3'),
('YA', 'D3', 'D3', 'D3', 'D3'),
('ANP', 'D3', 'D3', 'D3', 'D3'),
('APK', 'D3', 'D4', 'D4', 'D3'),
('ATF', 'D3', 'D3', 'D3', 'D3'),
('ANR', 'D4', 'D4', 'D4', 'D4'),
('ARS', 'D4', 'D3', 'D3', 'D4'),
('DHS', 'D3', 'D4', 'D4', 'D3'),
('DRY', 'D4', 'D4', 'D4', 'D4'),
('ENH', 'D4', 'D4', 'D4', 'D4'),
('KSB', 'D4', 'D3', 'D3', 'D4'),
('MEA', 'D3', 'D4', 'D4', 'D3'),
('MAH', 'D3', 'D4', 'D4', 'D3'),
('MSK', 'D3', 'D4', 'D4', 'D3'),
('MM', 'D4', 'D3', 'D3', 'D4'),
('RDM', 'D4', 'D4', 'D4', 'D4'),
('SNA', 'D3', 'D3', 'D3', 'D3'),
('VAH', 'D3', 'D4', 'D4', 'D3'),
('VNW', 'D3', 'D4', 'D4', 'D3'),
('VAL', 'D3', 'D4', 'D4', 'D3'),
('YY', 'D3', 'D3', 'D3', 'D3'),
('ADE', 'D4', 'D3', 'D3', 'D4'),
('BGS', 'D3', 'D3', 'D3', 'D3'),
('VIS', 'D3', 'D3', 'D3', 'D3'),
('FUM', 'D3', 'D3', 'D3', 'D3'),
('HED', 'D3', 'D3', 'D3', 'D3'),
('IKP', 'D3', 'D3', 'D3', 'D3'),
('IAM', 'D3', 'D3', 'D3', 'D3'),
('HAR', 'D4', 'D4', 'D4', 'D4'),
('MMH', 'D4', 'D4', 'D4', 'D4'),
('MIS', 'D4', 'D4', 'D4', 'D4'),
('MZA', 'D4', 'D4', 'D4', 'D4'),
('NOP', 'D3', 'D4', 'D4', 'D3'),
('RKA', 'D4', 'D3', 'D3', 'D4'),
('ROW', 'D4', 'D4', 'D4', 'D4'),
('SES', 'D4', 'D4', 'D4', 'D4'),
('WIS', 'D3', 'D4', 'D4', 'D3'),
('CDR', 'D4', 'D3', 'D3', 'D4'),
('DSE', 'D4', 'D3', 'D3', 'D4'),
('DOD', 'D3', 'D3', 'D3', 'D3'),
('FU', 'D4', 'D3', 'D3', 'D4'),
('MUP', 'D3', 'D3', 'D3', 'D3'),
('ODT', 'D3', 'D3', 'D3', 'D3'),
('RIZ', 'D4', 'D4', 'D4', 'D4'),
('SBS', 'D4', 'D4', 'D4', 'D4'),
('SIR', 'D4', 'D4', 'D4', 'D4'),
('YP', 'D4', 'D4', 'D4', 'D4'),
('RB', 'D3', 'D4', 'D4', 'D3'),
('AB', '', '', 'D3', 'D3'),
('AFN', '', '', 'D3', 'D3'),
('END', '', '', 'D3', 'D3'),
('HRS', '', '', 'D3', 'D3'),
('JAS', '', '', 'D3', 'D3'),
('MS', '', '', 'D3', 'D3'),
('MA', '', '', 'D3', 'D3'),
('SMU', '', '', 'D3', 'D3'),
('YS', '', '', 'D3', 'D3'),
('MMU', '', '', 'D3', 'D3'),
('ACH', '', '', 'D3', 'D3'),
('NUR', '', '', 'D3', 'D3'),
('ARW', '', 'D3', 'D3', 'D3'),
('ARI', '', 'D3', 'D3', 'D3'),
('DMR', '', 'D3', 'D3', 'D3'),
('FPR', '', 'D3', 'D3', 'D3'),
('GPR', '', 'D3', 'D3', 'D3'),
('GAP', '', 'D4', 'D4', 'D3'),
('IWP', '', 'D4', 'D4', 'D3'),
('QH', '', 'D4', 'D4', 'D3'),
('VS', '', 'D4', 'D4', 'D3'),
('ASA', '', 'D4', 'D4', 'D3'),
('ESS', '', 'D4', 'D4', 'D3'),
('FRP', '', 'D3', 'D3', 'D3'),
('IN', '', 'D4', 'D4', 'D3'),
('RDN', '', 'D3', 'D3', 'D3'),
('TAW', '', 'D3', 'D3', 'D3');

-- --------------------------------------------------------

--
-- Table structure for table `tb_lecturer`
--

CREATE TABLE `tb_lecturer` (
  `NIP` varchar(20) DEFAULT NULL,
  `NIDN` varchar(10) DEFAULT NULL,
  `code` varchar(3) NOT NULL,
  `name` varchar(42) DEFAULT NULL,
  `status` varchar(13) DEFAULT NULL,
  `field_of_study` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_lecturer`
--

INSERT INTO `tb_lecturer` (`NIP`, `NIDN`, `code`, `name`, `status`, `field_of_study`) VALUES
('', '', '', '', '', ''),
('', '30078804', 'AB', 'Ahmad Bahauddin', 'MKU', 'MKU'),
('', '', 'ACH', 'Abdul Chalim SAg., MPd.I', 'MKU', ' '),
('199107042019031021', '404079101', 'ADE', 'Ade Ismail', 'CPNS / Magang', ' '),
('', '8119101', 'AFN', 'Ane Fany Novitasari', 'MKU', 'MKU'),
('198902102019031020', '10028903', 'ANP', 'Agung Nugroho Pramudhita, S.T., M.T.', 'CPNS/Kontrak', 'TI'),
('199112302019031016', '30129101', 'ANR', 'Anugrah Nur Rahmanto, S.Sn., M.Ds.', 'CPNS/Kontrak', 'TI'),
('198901232019032016', '', 'APK', 'Annisa Puspa Kirana., M.Kom', 'CPNS/Kontrak', 'TI'),
('', '', 'ARI', 'Ariyanti, SH,.MH', 'LB', 'MP'),
('197903132008121002', '13037905', 'ARP', 'Arief Prasetyo, S.Kom., M.Kom.', 'PNS', 'TI'),
('198708242019031010', '24088701', 'ARS', 'Arie Rachmad Syulistyo, S.Kom., M.Kom', 'CPNS/Kontrak', 'TI'),
('', '', 'ARW', 'Arwin Sumari ST., MT., DR.', 'LB', 'TI'),
('', '', 'ASA', 'Ashri Shabrina Afrah SST., MT.', 'LB', ''),
('198712142019032012', '14128704', 'ATF', 'Annisa Taufika Firdausi, ST., MT.', 'CPNS/Kontrak', 'TI'),
('197606252005012001', '25067607', 'ATQ', 'Atiqah Nurul Asri, S.Pd., M.Pd.', 'PNS', 'BING'),
('199006192019031017', '', 'BGS', 'Bagas Satya Dian Nugraha, ST., MT.', 'CPNS/Magang', ' '),
('198108092010121002', '9088107', 'BSA', 'Banni Satria Andoko, S. Kom., M.MSI', 'PNS', ' '),
('', '', 'CDR', 'Candrasena Setiadi, ST., M.MT', 'Kontrak', 'MP'),
('197202022005011002', '2027214', 'CR', 'Cahya Rahmad, ST., M.Kom., Dr. Eng.', 'PNS', 'TI'),
('198806102019031018', '10068807', 'DHS', 'Dian Hanifudin Subhi, S.Kom., M.Kom.', 'CPNS/Kontrak', 'TI'),
('', '', 'DMR', 'Diana Mayangsari Ramadhani, SST', 'LB', 'MP'),
('', '716037502', 'DOD', 'Dodit Suprianto SKom. MT.', 'Kontrak', 'TI'),
('199206062019031017', '6069202', 'DRY', 'Dika Rizky Yunianto, S.Kom, M.Kom', 'CPNS/Kontrak', 'TI'),
('198311092014042001', '9118305', 'DS', 'Dhebys Suryani, S.Kom., MT', 'PNS', 'TI'),
('', '8129002', 'DSE', 'Deasy Sandhya Elya Ikawati, S.Si, M. Si', 'Kontrak', 'MP'),
('197911152005012002', '15117903', 'DWI', 'Dwi Puspitasari, S.Kom., M.Kom.', 'PNS', 'TI'),
('198410092015041001', '9108402', 'DWW', 'Dimas Wahyu Wibowo, ST., MT.', 'PNS', 'TI'),
('198807112015042005', '11078803', 'ELA', 'Eka Larasati Amalia, S.ST., MT.', 'PNS', 'TI'),
('', '', 'END', 'Endah Lestari SH., MHum.', 'MKU', ' '),
('198610022019032011', '702108601', 'ENH', 'Elok Nur Hamdana, S.T., M.T', 'CPNS/Kontrak', 'TI'),
('197201232008011006', '23017206', 'ERF', 'Erfan Rohadi, ST., M.Eng., Ph.D.', 'PNS', 'TI'),
('197605152009122001', '15057606', 'ESA', 'Ely Setyo Astuti, ST., MT.', 'PNS', ' '),
('', '', 'ESS', 'Endah Septa Sintiya. SPd., MKom.', 'LB', ''),
('', '', 'FPR', 'Farid Angga Pribadi, S.Kom.,M.Kom', 'LB', 'TI'),
('', '', 'FRP', 'Frihandhika Permana SPd., MKom.', 'LB', ''),
('', '14048005', 'FU', 'Farida Ulfa, S.Pd., M.Pd.', 'Kontrak', 'BING'),
('199305052019031018', '5059303', 'FUM', 'Faiz Ushbah Mubarok, S.Pd., M.Pd.', 'CPNS/Magang', 'BING'),
('', '', 'GAP', 'Grezio Arifiyah P. S.Kom., M.Kom', 'LB', 'TI'),
('197704242008121001', '24047706', 'GBP', 'Gunawan Budi Prasetyo, ST., MMT., Ph.D.', 'PNS', 'TI'),
('', '', 'GPR', 'Galih Putra Riatma, S.St.', 'LB', 'TI'),
('199003052019031013', '', 'HAR', 'M. Hasyim Ratsanjani', 'CPNS / Magang', ' '),
('199204122019031013', '', 'HED', 'Habibie Ed Dien, MT.', 'CPNS/Magang', 'TI'),
('196201051990031002', '5016211', 'HJT', 'Budi Harijanto, ST., M.MKom.', 'PNS', 'TI'),
('198305212006041003', '21058301', 'HP', 'Hendra Pradibta, SE., M.Sc.', 'PNS', 'TI'),
('197507082006041002', '8077501', 'HRS', 'Hairus', 'MKU', 'MKU'),
('198902012019031009', '701028901', 'IAM', 'Irsyad Arif Mashudi, M.Kom', 'CPNS/Magang', 'TI'),
('197305102008011010', '10057308', 'IDW', 'Indra Dharma Wijaya, ST., M.MT.', 'PNS', 'TI'),
('198406102008121004', '10068402', 'IFR', 'Imam Fahrur Rozi, ST., MT.', 'PNS', 'TI'),
('199110142019032020', '14109103', 'IKP', 'Ika Kusumaning Putri, MT.', 'CPNS/Magang', 'TI'),
('', '', 'IN', 'Immah Inayati SKom., MKom., MBA.', 'LB', ''),
('198407082008122001', '8078401', 'IRA', 'Dyah Ayu Irawati, ST., M.Cs.', 'PNS', 'TI'),
('', '', 'IWP', 'Irna Wulan Palupi SH, M.Kn', 'LB', 'MP'),
('', '', 'JAS', 'Jasmine Anting Soraya', 'MKU', 'MKU'),
('196211281988111001', '28116204', 'KPA', 'Deddy Kusbianto PA, Ir., M.Mkom.', 'PNS', 'TI'),
('199003202019031016', '720039003', 'KSB', 'Kadek Suarjuna Batubulan, S.Kom, MT', 'CPNS/Kontrak', 'TI'),
('198211302014041001', '730118201', 'LA', 'Luqman Affandi, S.Kom., MMSI', 'PNS', 'TI'),
('', '', 'MA', 'Moh. Amin', 'MKU', 'MKU'),
('199111282019031013', '', 'MAH', 'Muhammad Afif Hendrawan.,S.Kom.', 'CPNS/Kontrak', 'TI'),
('198704242019032017', '1024048703', 'MEA', 'Meyti Eka Apriyani ST., MT.', 'CPNS/Kontrak', 'TI'),
('198805072019032012', '', 'MIS', 'Milyun Ni\'ma Shoumi', 'CPNS/Magang', 'TI'),
('198806072019032016', '7068804', 'MM', 'Mustika Mentari, S.Kom., M.Kom', 'CPNS/Kontrak', 'TI'),
('199002062019032013', '6029003', 'MMH', 'Mamluatul Hani\'ah', 'CPNS/Magang', 'TI'),
('', '', 'MMU', 'Mohammad Muallif, MAg.', 'MKU', ' '),
('197710302005012001', '30107702', 'MQ', 'Mungki Astiningrum, ST., M.Kom.', 'PNS', 'TI'),
('196902052003121003', '5026910', 'MS', 'M Sinal', 'MKU', 'MKU'),
('199205172019031020', '17059201', 'MSK', 'Muhammad Shulhan Khairy, S.Kom, M.Kom', 'CPNS/Kontrak', 'TI'),
('', '23089102', 'MUP', 'Muhammad Unggul Pamenang, S.St., M.T.', 'Kontrak', 'MP'),
('198902102019031019', '', 'MZA', 'Moch. Zawaruddin Abdullah, S.ST., M.Kom', 'CPNS/Magang', 'TI'),
('198911082019031020', '511088901', 'NOP', 'Noprianto SKom., MEng.', 'CPNS/Magang', 'TI'),
('', '', 'NUR', 'Nurzizah', 'MKU', ' '),
('', '15128903', 'ODT', 'Odhitya Desta Triswidrananta, S.Pd., M.Pd.', 'Kontrak', 'TI'),
('195912081985031004', '8125911', 'OKE', 'Ekojono, ST., M.Kom.', 'PNS', 'TI'),
('198611032014041001', '3118602', 'PPA', 'Putra Prima A., ST., M.Kom.', 'PNS', 'TI'),
('198805042015041001', '4058805', 'PYS', 'Pramana Yoga Saputra, S.Kom., MMT.', 'PNS', 'TI'),
('', '', 'QH', 'Qonitatul Hasanah, S.ST', 'LB', 'MP'),
('198010102005011001', '10108003', 'RAA', 'Rosa Andrie Asmara, ST., MT., Dr. Eng.', 'PNS', 'TI'),
('', '', 'RB', 'Robby Anggriawan SE., ME.', 'Kontrak', '#REF!'),
('197111101999031002', '10117109', 'RDA', 'Rudy Ariyanto, ST., M.Cs.', 'PNS', 'TI'),
('198910042019032023', '', 'RDM', 'Retno Damayanti, S.Pd', 'CPNS/Kontrak', 'TI'),
('', '', 'RDN', 'Rizdania ST., MKom.', 'LB', ''),
('198108102005012002', '10088101', 'RID', 'Ariadi Retno Ririd, S.Kom., M.Kom.', 'PNS', 'TI'),
('', '21129003', 'RIZ', 'Rizky Ardiansyah, S.Kom., MT.', 'Kontrak', 'MP'),
('198701082019031004', '308018702', 'RKA', 'Rakhmat Arianto', 'CPNS / Magang', ' '),
('198903192019032013', '19038905', 'ROW', 'Rokhimatul Wakhidah', 'CPNS/Magang', 'TI'),
('198603182012121001', '18038602', 'RR', 'Ridwan Rismanto, SST., M.Kom.', 'PNS', 'TI'),
('195906201994031001', '20065903', 'RWS', 'Rawansyah., Drs., M.Pd.', 'PNS', 'TI'),
('', '26108904', 'SBS', 'Satrio Binusa S, SS, M.Pd', 'Kontrak', 'BING'),
('198909012019031010', '601098901', 'SES', 'Septian Enggar Sukmana, S.Pd., M.T', 'CPNS/Magang', 'TI'),
('195304161979032001', '16045306', 'SIR', 'Siti Romlah, Dra., M.M.', 'Kontrak', 'MP'),
('198507222014041001', '22078505', 'SMU', 'Shohib Muslim', 'MKU', 'MKU'),
('198908132019031017', '13088904', 'SNA', 'Sofyan Noor Arief, S.ST., M.Kom.', 'CPNS/Kontrak', 'TI'),
('', '', 'TAW', 'Triastana Anang Wibawa, ST., MT.', 'LB', ''),
('197711162005011008', '16117704', 'TOM', 'Faisal Rahutomo, ST., M.Kom., Dr.Eng.', 'PNS', 'TI'),
('197803272003122002', '27037801', 'UDR', 'Ulla Delfana Rosiani, ST., MT.', 'PNS', 'TI'),
('198609232015041001', '23098604', 'UN', 'Usman Nurhasan, S.Kom., MT.', 'PNS', 'TI'),
('199105052019031029', '5059104', 'VAH', 'Vipkas Al Hadid Firdaus, ST,. MT', 'CPNS/Kontrak', 'TI'),
('199106212019032020', '21069102', 'VAL', 'Vivin Ayu Lestari, S.Pd', 'CPNS/Kontrak', 'TI'),
('199412172019032020', '17129402', 'VIS', 'Candra Bella Vista, S.Kom., MT.', 'CPNS/Magang', 'TI'),
('199308112019032025', '11089303', 'VNW', 'Vivi Nur Wijayaningrum, S.Kom, M.Kom', 'CPNS/Kontrak', 'TI'),
('', '', 'VS', 'Very Sugiarto, S.Pd', 'LB', ' '),
('198103182010122002', '18038104', 'WID', 'Widaningsih Condrowardhani, SH, MH.', 'PNS', 'MKU'),
('199208292019032023', '29089201', 'WIS', 'Wilda Imama Sabilla', 'CPNS/Magang', 'TI'),
('198007162010121002', '16078008', 'YA', 'Yuri Ariyanto, S.Kom., M.Kom.', 'PNS', 'TI'),
('', '15018803', 'YP', 'Yushintia Pramitarini, S.ST., MT.', 'Kontrak', 'TI'),
('', '', 'YS', 'Yusuf Suprapto', 'MKU', ' '),
('198101052005011005', '5018104', 'YWS', 'Yan Watequlis Syaifuddin, ST., M.MT.', 'PNS', ' '),
('198906212019031013', '21068905', 'YY', 'Yoppy Yunhasnawa, S.ST., M.Sc.', 'CPNS/Kontrak', 'TI'),
('198107052005011002', '5078102', 'ZUL', 'Ahmadi Yuli Ananta, ST., M.M.', 'PNS', 'TI');

-- --------------------------------------------------------

--
-- Table structure for table `tb_lecturerlist`
--

CREATE TABLE `tb_lecturerlist` (
  `code` varchar(3) CHARACTER SET utf8 NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `photo` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_lecturerlist`
--

INSERT INTO `tb_lecturerlist` (`code`, `username`, `password`, `email`, `phone`, `photo`) VALUES
('DHS', 'paksubhi', 'pakhanifudin', '', '', ''),
('ADE', 'ADE', 'ADE', '', '', ''),
('WID', 'wid', 'widaa', '', '', ''),
('ZUL', 'zul', 'zuk', '', '', ''),
('ODT', 'odt', 'odt', '', '', ''),
('IFR', 'pakimam', 'pakimam', '', '', ''),
('ATQ', 'buatiqah', 'bahasainggris', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_lecture_contract`
--

CREATE TABLE `tb_lecture_contract` (
  `subject_code` varchar(9) DEFAULT NULL,
  `week` int(2) DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL,
  `topics` varchar(74) DEFAULT NULL,
  `method` varchar(46) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_lecture_contract`
--

INSERT INTO `tb_lecture_contract` (`subject_code`, `week`, `date`, `topics`, `method`) VALUES
('RTI171005', 1, '', 'Introduction of the Course', 'Ceramah dan diskusi'),
('RTI171005', 2, '', 'Computer Applicaton', 'Ceramah dan diskusi'),
('RTI171005', 3, '', 'Computer Applicaton', 'Ceramah dan diskusi'),
('RTI171005', 4, '', 'Computer Architecture', 'Ceramah dan diskusi'),
('RTI171005', 5, '', 'Computer Architecture', 'Ceramah dan diskusi'),
('RTI171005', 6, '', 'Multimedia', 'Ceramah dan diskusi'),
('RTI171005', 7, '', 'Multimedia', 'Ceramah dan diskusi'),
('RTI171005', 8, '', 'Midterm', 'UTS'),
('RTI171005', 9, '', 'Networking ', 'Ceramah dan diskusi'),
('RTI171005', 10, '', 'Networking ', 'Ceramah dan diskusi'),
('RTI171005', 11, '', 'World Wide Web', 'Ceramah dan diskusi'),
('RTI171005', 12, '', 'World Wide Web', 'Ceramah dan diskusi'),
('RTI171005', 13, '', 'Careers in IT', 'Ceramah dan diskusi'),
('RTI171005', 14, '', 'Careers in IT', 'Ceramah dan diskusi'),
('RTI171005', 15, '', 'IT Support Staff', 'Ceramah dan diskusi'),
('RTI171005', 16, '', 'Workstation Health and Safety', 'Ceramah dan diskusi'),
('RTI171005', 17, '', 'Final Test', 'UAS'),
('RIF171005', 1, '', 'Introduction of the Course', 'Ceramah dan diskusi'),
('RIF171005', 2, '', 'Computer Applicaton', 'Ceramah dan diskusi'),
('RIF171005', 3, '', 'Computer Applicaton', 'Ceramah dan diskusi'),
('RIF171005', 4, '', 'Computer Architecture', 'Ceramah dan diskusi'),
('RIF171005', 5, '', 'Computer Architecture', 'Ceramah dan diskusi'),
('RIF171005', 6, '', 'Multimedia', 'Ceramah dan diskusi'),
('RIF171005', 7, '', 'Multimedia', 'Ceramah dan diskusi'),
('RIF171005', 8, '', 'Midterm', 'UTS'),
('RIF171005', 9, '', 'Networking ', 'Ceramah dan diskusi'),
('RIF171005', 10, '', 'Networking ', 'Ceramah dan diskusi'),
('RIF171005', 11, '', 'World Wide Web', 'Ceramah dan diskusi'),
('RIF171005', 12, '', 'World Wide Web', 'Ceramah dan diskusi'),
('RIF171005', 13, '', 'Careers in IT', 'Ceramah dan diskusi'),
('RIF171005', 14, '', 'Careers in IT', 'Ceramah dan diskusi'),
('RIF171005', 15, '', 'IT Support Staff', 'Ceramah dan diskusi'),
('RIF171005', 16, '', 'Workstation Health and Safety', 'Ceramah dan diskusi'),
('RIF171005', 17, '', 'Final Test', 'UAS'),
('RTI192003', 1, '', 'Programming', 'Diskusi, ceramah, presentasi individu/kelompok'),
('RTI192003', 2, '', 'Programming', 'Diskusi, ceramah, presentasi individu/kelompok'),
('RTI192003', 3, '', 'Programming', 'Diskusi, ceramah, presentasi individu/kelompok'),
('RTI192003', 4, '', 'Database', 'Diskusi, ceramah, presentasi individu/kelompok'),
('RTI192003', 5, '', 'Database', 'Diskusi, ceramah, presentasi individu/kelompok'),
('RTI192003', 6, '', 'Computer Security', 'Diskusi, ceramah, presentasi individu/kelompok'),
('RTI192003', 7, '', 'Computer Security', 'Diskusi, ceramah, presentasi individu/kelompok'),
('RTI192003', 8, '', 'UTS', 'ujian tulis/lisan'),
('RTI192003', 9, '', 'Electronic Publishing', 'Diskusi, ceramah, presentasi individu/kelompok'),
('RTI192003', 10, '', 'E-Commerce', 'Diskusi, ceramah, presentasi individu/kelompok'),
('RTI192003', 11, '', 'E-Commerce', 'Diskusi, ceramah, presentasi individu/kelompok'),
('RTI192003', 12, '', 'E-Commerce', 'Diskusi, ceramah, presentasi individu/kelompok'),
('RTI192003', 13, '', 'Recent Development on Information Technology', 'Diskusi, ceramah, presentasi individu/kelompok'),
('RTI192003', 14, '', 'Recent Development on Information Technology', 'Diskusi, ceramah, presentasi individu/kelompok'),
('RTI192003', 15, '', 'Recent Development on Information Technology', 'Diskusi, ceramah, presentasi individu/kelompok'),
('RTI192003', 16, '', 'Recent Development on Information Technology', 'Diskusi, ceramah, presentasi individu/kelompok'),
('RTI192003', 17, '', 'UAS', 'Ujian Online'),
('RTI184006', 1, '', 'Introduction', 'Ceramah, Praktek, Tugas'),
('RTI184006', 2, '', 'TypeScript Fundamental', 'Ceramah, Praktek, Tugas'),
('RTI184006', 3, '', 'Angular Fundamental', 'Ceramah, Praktek, Tugas'),
('RTI184006', 4, '', 'Displaying Data + Handling Event', 'Ceramah, Praktek, Tugas'),
('RTI184006', 5, '', 'Building Re-Usable Component', 'Ceramah, Praktek, Tugas'),
('RTI184006', 6, '', 'Directives', 'Ceramah, Praktek, Tugas'),
('RTI184006', 7, '', 'Template Driven Forms', 'Ceramah, Praktek, Tugas'),
('RTI184006', 8, '', 'Reactive Forms', 'Ceramah, Praktek, Tugas'),
('RTI184006', 9, '', 'UTS', ''),
('RTI184006', 10, '', 'HTTP Services', 'Ceramah, Praktek, Tugas'),
('RTI184006', 11, '', 'Routing dan Navigation', 'Ceramah, Praktek, Tugas'),
('RTI184006', 12, '', 'Authentication dan Authorization', 'Ceramah, Praktek, Tugas'),
('RTI184006', 13, '', 'Deployment', 'Ceramah, Praktek, Tugas'),
('RTI184006', 14, '', 'Building Realtime Server', 'Ceramah, Praktek, Tugas'),
('RTI184006', 15, '', 'Client Panel Project 1', 'Ceramah, Praktek, Tugas'),
('RTI184006', 16, '', 'Client Panel Project 2', 'Ceramah, Praktek, Tugas'),
('RTI184006', 17, '', 'UAS ( Tugas Besar )', 'Praktek'),
('RTI184001', 1, '', 'Definisi Sistem Informasi', 'Ceramah, Tanya Jawab'),
('RTI184001', 2, '', 'Mampu menjelaskan dan menyajikan konsep sistem informasi secara sistematis', 'Ceramah, Tanya Jawab, Diskusi, Studi Kasus'),
('RTI184001', 3, '', 'Mampu menjelaskan dan menyajikan konsep sistem informasi secara sistematis', 'Ceramah, Tanya Jawab, Diskusi, Studi Kasus'),
('RTI184001', 4, '', 'Memahami Jenis-jenis Sistem Informasi berbasis Komputer', 'Ceramah, Tanya Jawab'),
('RTI184001', 5, '', 'Kuiz 1', ''),
('RTI184001', 6, '', 'Mampu merancang Sistem Informasi', 'Ceramah, Tanya Jawab, Diskusi, Studi Kasus'),
('RTI184001', 7, '', 'Mampu merancang Sistem Informasi', 'Ceramah, Tanya Jawab, Diskusi, Studi Kasus'),
('RTI184001', 8, '', 'Ujian Tengah Semester', ''),
('RTI184001', 9, '', 'E-commerce & E-Business', 'Ceramah, Tanya Jawab, Diskusi, Studi Kasus'),
('RTI184001', 10, '', 'E-commerce & E-Business', 'Ceramah, Tanya Jawab, Diskusi, Studi Kasus'),
('RTI184001', 11, '', 'E-commerce & E-Business', 'Ceramah, Tanya Jawab, Diskusi, Studi Kasus'),
('RTI184001', 12, '', 'E-commerce & E-Business', 'Ceramah, Tanya Jawab, Diskusi, Studi Kasus'),
('RTI184001', 13, '', 'Kuiz 2', ''),
('RTI184001', 14, '', 'Dampak Sistem Informasi', 'Ceramah, Tanya Jawab, Diskusi, Studi Kasus'),
('RTI184001', 15, '', 'Dampak Sistem Informasi', 'Ceramah, Tanya Jawab, Diskusi, Studi Kasus'),
('RTI184001', 16, '', 'Dampak Sistem Informasi', 'Ceramah, Tanya Jawab, Diskusi, Studi Kasus'),
('RTI184001', 17, '', 'Ujian Akhir Semester', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_lec_dpa`
--

CREATE TABLE `tb_lec_dpa` (
  `code` varchar(3) DEFAULT NULL,
  `name` varchar(42) DEFAULT NULL,
  `class_name` varchar(5) DEFAULT NULL,
  `year` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_lec_dpa`
--

INSERT INTO `tb_lec_dpa` (`code`, `name`, `class_name`, `year`) VALUES
('KSB', 'Kadek Suarjuna Batubulan, S.Kom, MT', 'MI-1A', 2018),
('YY', 'Yoppy Yunhasnawa, S.ST., M.Sc.', 'MI-1A', 2019),
('OKE', 'Ekojono, ST., M.Kom.', 'MI-1B', 2018),
('RAA', 'Rosa Andrie Asmara, ST., MT., Dr. Eng.', 'MI-1B', 2019),
('PPA', 'Putra Prima A., ST., M.Kom.', 'MI-1C', 2018),
('ATF', 'Annisa Taufika Firdausi, ST., MT.', 'MI-1C', 2018),
('YA', 'Yuri Ariyanto, S.Kom., M.Kom.', 'MI-1C', 2019),
('TOM', 'Faisal Rahutomo, ST., M.Kom., Dr.Eng.', 'MI-1D', 2018),
('UN', 'Usman Nurhasan, S.Kom., MT.', 'MI-1D', 2019),
('HP', 'Hendra Pradibta, SE., M.Sc.', 'MI-1E', 2018),
('ERF', 'Erfan Rohadi, ST., M.Eng., Ph.D.', 'MI-1E', 2019),
('ANP', 'Agung Nugroho Pramudhita, S.T., M.T.', 'MI-1F', 2018),
('DS', 'Dhebys Suryani, S.Kom., MT', 'MI-1F', 2019),
('SNA', 'Sofyan Noor Arief, S.ST., M.Kom.', 'MI-2A', 2018),
('KSB', 'Kadek Suarjuna Batubulan, S.Kom, MT', 'MI-2A', 2019),
('OKE', 'Ekojono, ST., M.Kom.', 'MI-2B', 2019),
('DSE', 'Deasy Sandhya Elya Ikawati, S.Si, M. Si', 'MI-2C', 2018),
('CR', 'Cahya Rahmad, ST., M.Kom., Dr. Eng.', 'MI-2D', 2018),
('TOM', 'Faisal Rahutomo, ST., M.Kom., Dr.Eng.', 'MI-2D', 2019),
('LA', 'Luqman Affandi, S.Kom., MMSI', 'MI-2E', 2018),
('HP', 'Hendra Pradibta, SE., M.Sc.', 'MI-2E', 2019),
('HJT', 'Budi Harijanto, ST., M.MKom.', 'MI-2F', 2018),
('ANP', 'Agung Nugroho Pramudhita, S.T., M.T.', 'MI-2F', 2019),
('SNA', 'Sofyan Noor Arief, S.ST., M.Kom.', 'MI-3A', 2019),
('RAA', 'Rosa Andrie Asmara, ST., MT., Dr. Eng.', 'MI-3B', 2018),
('PPA', 'Putra Prima A., ST., M.Kom.', 'MI-3B', 2019),
('YA', 'Yuri Ariyanto, S.Kom., M.Kom.', 'MI-3C', 2018),
('DSE', 'Deasy Sandhya Elya Ikawati, S.Si, M. Si', 'MI-3C', 2019),
('UN', 'Usman Nurhasan, S.Kom., MT.', 'MI-3D', 2018),
('CR', 'Cahya Rahmad, ST., M.Kom., Dr. Eng.', 'MI-3D', 2019),
('ERF', 'Erfan Rohadi, ST., M.Eng., Ph.D.', 'MI-3E', 2018),
('LA', 'Luqman Affandi, S.Kom., MMSI', 'MI-3E', 2019),
('DS', 'Dhebys Suryani, S.Kom., MT', 'MI-3F', 2018),
('HJT', 'Budi Harijanto, ST., M.MKom.', 'MI-3F', 2019),
('IRA', 'Dyah Ayu Irawati, ST., M.Cs.', 'TI-1A', 2018),
('DRY', 'Dika Rizky Yunianto, S.Kom, M.Kom', 'TI-1A', 2019),
('ARS', 'Arie Rachmad Syulistyo, S.Kom., M.Kom', 'TI-1B', 2018),
('RDA', 'Rudy Ariyanto, ST., M.Cs.', 'TI-1B', 2019),
('RIZ', 'Rizky Ardiansyah, S.Kom., MT.', 'TI-1C', 2018),
('MM', 'Mustika Mentari, S.Kom., M.Kom', 'TI-1C', 2019),
('ATQ', 'Atiqah Nurul Asri, S.Pd., M.Pd.', 'TI-1D', 2018),
('DWW', 'Dimas Wahyu Wibowo, ST., MT.', 'TI-1D', 2019),
('IDW', 'Indra Dharma Wijaya, ST., M.MT.', 'TI-1E', 2018),
('SIR', 'Siti Romlah, Dra., M.M.', 'TI-1E', 2019),
('ARP', 'Arief Prasetyo, S.Kom., M.Kom.', 'TI-1F', 2019),
('IFR', 'Imam Fahrur Rozi, ST., MT.', 'TI-1G', 2018),
('YP', 'Yushintia Pramitarini, S.ST., MT.', 'TI-1G', 2019),
('MQ', 'Mungki Astiningrum, ST., M.Kom.', 'TI-1H', 2019),
('ANR', 'Anugrah Nur Rahmanto, S.Sn., M.Ds.', 'TI-2A', 2018),
('VNW', 'Vivi Nur Wijayaningrum, S.Kom, M.Kom', 'TI-2A', 2019),
('ELA', 'Eka Larasati Amalia, S.ST., MT.', 'TI-2B', 2018),
('ARS', 'Arie Rachmad Syulistyo, S.Kom., M.Kom', 'TI-2B', 2019),
('PYS', 'Pramana Yoga Saputra, S.Kom., MMT.', 'TI-2C', 2018),
('ATF', 'Annisa Taufika Firdausi, ST., MT.', 'TI-2C', 2019),
('KPA', 'Deddy Kusbianto PA, Ir., M.Mkom.', 'TI-2D', 2018),
('ATQ', 'Atiqah Nurul Asri, S.Pd., M.Pd.', 'TI-2D', 2019),
('RIZ', 'Rizky Ardiansyah, S.Kom., MT.', 'TI-2D', 2019),
('DHS', 'Dian Hanifudin Subhi, S.Kom., M.Kom.', 'TI-2E', 2018),
('IDW', 'Indra Dharma Wijaya, ST., M.MT.', 'TI-2E', 2019),
('ENH', 'Elok Nur Hamdana, S.T., M.T', 'TI-2F', 2018),
('MAH', 'Muhammad Afif Hendrawan.,S.Kom.', 'TI-2F', 2019),
('DWI', 'Dwi Puspitasari, S.Kom., M.Kom.', 'TI-2G', 2018),
('IFR', 'Imam Fahrur Rozi, ST., MT.', 'TI-2G', 2019),
('GBP', 'Gunawan Budi Prasetyo, ST., MMT., Ph.D.', 'TI-2H', 2019),
('ZUL', 'Ahmadi Yuli Ananta, ST., M.M.', 'TI-3A', 2018),
('YY', 'Yoppy Yunhasnawa, S.ST., M.Sc.', 'TI-3A', 2018),
('ANR', 'Anugrah Nur Rahmanto, S.Sn., M.Ds.', 'TI-3A', 2019),
('FU', 'Farida Ulfa, S.Pd., M.Pd.', 'TI-3B', 2018),
('ELA', 'Eka Larasati Amalia, S.ST., MT.', 'TI-3B', 2019),
('RID', 'Ariadi Retno Ririd, S.Kom., M.Kom.', 'TI-3C', 2018),
('PYS', 'Pramana Yoga Saputra, S.Kom., MMT.', 'TI-3C', 2019),
('WID', 'Widaningsih Condrowardhani, SH, MH.', 'TI-3D', 2018),
('KPA', 'Deddy Kusbianto PA, Ir., M.Mkom.', 'TI-3D', 2019),
('MEA', 'Meyti Eka Apriyani ST., MT.', 'TI-3E', 2018),
('DHS', 'Dian Hanifudin Subhi, S.Kom., M.Kom.', 'TI-3E', 2019),
('RWS', 'Rawansyah., Drs., M.Pd.', 'TI-3F', 2018),
('ENH', 'Elok Nur Hamdana, S.T., M.T', 'TI-3F', 2019),
('RR', 'Ridwan Rismanto, SST., M.Kom.', 'TI-3G', 2018),
('DWI', 'Dwi Puspitasari, S.Kom., M.Kom.', 'TI-3G', 2019),
('ODT', 'Odhitya Desta Triswidrananta, S.Pd., M.Pd.', 'TI-3H', 2018),
('DRY', 'Dika Rizky Yunianto, S.Kom, M.Kom', 'TI-4A', 2018),
('ZUL', 'Ahmadi Yuli Ananta, ST., M.M.', 'TI-4A', 2019),
('RDA', 'Rudy Ariyanto, ST., M.Cs.', 'TI-4B', 2018),
('FU', 'Farida Ulfa, S.Pd., M.Pd.', 'TI-4B', 2019),
('MM', 'Mustika Mentari, S.Kom., M.Kom', 'TI-4C', 2018),
('RID', 'Ariadi Retno Ririd, S.Kom., M.Kom.', 'TI-4C', 2019),
('DWW', 'Dimas Wahyu Wibowo, ST., MT.', 'TI-4D', 2018),
('WID', 'Widaningsih Condrowardhani, SH, MH.', 'TI-4D', 2019),
('MEA', 'Meyti Eka Apriyani ST., MT.', 'TI-4E', 2019),
('ARP', 'Arief Prasetyo, S.Kom., M.Kom.', 'TI-4F', 2018),
('SIR', 'Siti Romlah, Dra., M.M.', 'TI-4F', 2018),
('RWS', 'Rawansyah., Drs., M.Pd.', 'TI-4F', 2019),
('RR', 'Ridwan Rismanto, SST., M.Kom.', 'TI-4G', 2019),
('MQ', 'Mungki Astiningrum, ST., M.Kom.', 'TI-4H', 2018),
('YP', 'Yushintia Pramitarini, S.ST., MT.', 'TI-4H', 2018),
('ODT', 'Odhitya Desta Triswidrananta, S.Pd., M.Pd.', 'TI-4H', 2019),
('UDR', 'Ulla Delfana Rosiani, ST., MT.', 'TI-4I', 2019);

-- --------------------------------------------------------

--
-- Table structure for table `tb_lec_field`
--

CREATE TABLE `tb_lec_field` (
  `code` varchar(3) DEFAULT NULL,
  `name` varchar(42) DEFAULT NULL,
  `field` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_lec_field`
--

INSERT INTO `tb_lec_field` (`code`, `name`, `field`) VALUES
('', '', ''),
('AB', 'Ahmad Bahauddin', 'MKU'),
('ACH', 'Abdul Chalim SAg., MPd.I', ' '),
('ADE', 'Ade Ismail', ' '),
('AFN', 'Ane Fany Novitasari', 'MKU'),
('ANP', 'Agung Nugroho Pramudhita, S.T., M.T.', 'TI'),
('ANR', 'Anugrah Nur Rahmanto, S.Sn., M.Ds.', 'TI'),
('APK', 'Annisa Puspa Kirana., M.Kom', 'TI'),
('ARI', 'Ariyanti, SH,.MH', 'MP'),
('ARP', 'Arief Prasetyo, S.Kom., M.Kom.', 'TI'),
('ARS', 'Arie Rachmad Syulistyo, S.Kom., M.Kom', 'TI'),
('ARW', 'Arwin Sumari ST., MT., DR.', 'TI'),
('ASA', 'Ashri Shabrina Afrah SST., MT.', ''),
('ATF', 'Annisa Taufika Firdausi, ST., MT.', 'TI'),
('ATQ', 'Atiqah Nurul Asri, S.Pd., M.Pd.', 'BING'),
('BGS', 'Bagas Satya Dian Nugraha, ST., MT.', ' '),
('BSA', 'Banni Satria Andoko, S. Kom., M.MSI', ' '),
('CDR', 'Candrasena Setiadi, ST., M.MT', 'MP'),
('CR', 'Cahya Rahmad, ST., M.Kom., Dr. Eng.', 'TI'),
('DHS', 'Dian Hanifudin Subhi, S.Kom., M.Kom.', 'TI'),
('DMR', 'Diana Mayangsari Ramadhani, SST', 'MP'),
('DOD', 'Dodit Suprianto SKom. MT.', 'TI'),
('DRY', 'Dika Rizky Yunianto, S.Kom, M.Kom', 'TI'),
('DS', 'Dhebys Suryani, S.Kom., MT', 'TI'),
('DSE', 'Deasy Sandhya Elya Ikawati, S.Si, M. Si', 'MP'),
('DWI', 'Dwi Puspitasari, S.Kom., M.Kom.', 'TI'),
('DWW', 'Dimas Wahyu Wibowo, ST., MT.', 'TI'),
('ELA', 'Eka Larasati Amalia, S.ST., MT.', 'TI'),
('END', 'Endah Lestari SH., MHum.', ' '),
('ENH', 'Elok Nur Hamdana, S.T., M.T', 'TI'),
('ERF', 'Erfan Rohadi, ST., M.Eng., Ph.D.', 'TI'),
('ESA', 'Ely Setyo Astuti, ST., MT.', ' '),
('ESS', 'Endah Septa Sintiya. SPd., MKom.', ''),
('FPR', 'Farid Angga Pribadi, S.Kom.,M.Kom', 'TI'),
('FRP', 'Frihandhika Permana SPd., MKom.', ''),
('FU', 'Farida Ulfa, S.Pd., M.Pd.', 'BING'),
('FUM', 'Faiz Ushbah Mubarok, S.Pd., M.Pd.', 'BING'),
('GAP', 'Grezio Arifiyah P. S.Kom., M.Kom', 'TI'),
('GBP', 'Gunawan Budi Prasetyo, ST., MMT., Ph.D.', 'TI'),
('GPR', 'Galih Putra Riatma, S.St.', 'TI'),
('HAR', 'M. Hasyim Ratsanjani', ' '),
('HED', 'Habibie Ed Dien, MT.', 'TI'),
('HJT', 'Budi Harijanto, ST., M.MKom.', 'TI'),
('HP', 'Hendra Pradibta, SE., M.Sc.', 'TI'),
('HRS', 'Hairus', 'MKU'),
('IAM', 'Irsyad Arif Mashudi, M.Kom', 'TI'),
('IDW', 'Indra Dharma Wijaya, ST., M.MT.', 'TI'),
('IFR', 'Imam Fahrur Rozi, ST., MT.', 'TI'),
('IKP', 'Ika Kusumaning Putri, MT.', 'TI'),
('IN', 'Immah Inayati SKom., MKom., MBA.', ''),
('IRA', 'Dyah Ayu Irawati, ST., M.Cs.', 'TI'),
('IWP', 'Irna Wulan Palupi SH, M.Kn', 'MP'),
('JAS', 'Jasmine Anting Soraya', 'MKU'),
('KPA', 'Deddy Kusbianto PA, Ir., M.Mkom.', 'TI'),
('KSB', 'Kadek Suarjuna Batubulan, S.Kom, MT', 'TI'),
('LA', 'Luqman Affandi, S.Kom., MMSI', 'TI'),
('MA', 'Moh. Amin', 'MKU'),
('MAH', 'Muhammad Afif Hendrawan.,S.Kom.', 'TI'),
('MEA', 'Meyti Eka Apriyani ST., MT.', 'TI'),
('MIS', 'Milyun Ni\'ma Shoumi', 'TI'),
('MM', 'Mustika Mentari, S.Kom., M.Kom', 'TI'),
('MMH', 'Mamluatul Hani\'ah', 'TI'),
('MMU', 'Mohammad Muallif, MAg.', ' '),
('MQ', 'Mungki Astiningrum, ST., M.Kom.', 'TI'),
('MS', 'M Sinal', 'MKU'),
('MSK', 'Muhammad Shulhan Khairy, S.Kom, M.Kom', 'TI'),
('MUP', 'Muhammad Unggul Pamenang, S.St., M.T.', 'MP'),
('MZA', 'Moch. Zawaruddin Abdullah, S.ST., M.Kom', 'TI'),
('NOP', 'Noprianto SKom., MEng.', 'TI'),
('NUR', 'Nurzizah', ' '),
('ODT', 'Odhitya Desta Triswidrananta, S.Pd., M.Pd.', 'TI'),
('OKE', 'Ekojono, ST., M.Kom.', 'TI'),
('PPA', 'Putra Prima A., ST., M.Kom.', 'TI'),
('PYS', 'Pramana Yoga Saputra, S.Kom., MMT.', 'TI'),
('QH', 'Qonitatul Hasanah, S.ST', 'MP'),
('RAA', 'Rosa Andrie Asmara, ST., MT., Dr. Eng.', 'TI'),
('RB', 'Robby Anggriawan SE., ME.', '#REF!'),
('RDA', 'Rudy Ariyanto, ST., M.Cs.', 'TI'),
('RDM', 'Retno Damayanti, S.Pd', 'TI'),
('RDN', 'Rizdania ST., MKom.', ''),
('RID', 'Ariadi Retno Ririd, S.Kom., M.Kom.', 'TI'),
('RIZ', 'Rizky Ardiansyah, S.Kom., MT.', 'MP'),
('RKA', 'Rakhmat Arianto', ' '),
('ROW', 'Rokhimatul Wakhidah', 'TI'),
('RR', 'Ridwan Rismanto, SST., M.Kom.', 'TI'),
('RWS', 'Rawansyah., Drs., M.Pd.', 'TI'),
('SBS', 'Satrio Binusa S, SS, M.Pd', 'BING'),
('SES', 'Septian Enggar Sukmana, S.Pd., M.T', 'TI'),
('SIR', 'Siti Romlah, Dra., M.M.', 'MP'),
('SMU', 'Shohib Muslim', 'MKU'),
('SNA', 'Sofyan Noor Arief, S.ST., M.Kom.', 'TI'),
('TAW', 'Triastana Anang Wibawa, ST., MT.', ''),
('TOM', 'Faisal Rahutomo, ST., M.Kom., Dr.Eng.', 'TI'),
('UDR', 'Ulla Delfana Rosiani, ST., MT.', 'TI'),
('UN', 'Usman Nurhasan, S.Kom., MT.', 'TI'),
('VAH', 'Vipkas Al Hadid Firdaus, ST,. MT', 'TI'),
('VAL', 'Vivin Ayu Lestari, S.Pd', 'TI'),
('VIS', 'Candra Bella Vista, S.Kom., MT.', 'TI'),
('VNW', 'Vivi Nur Wijayaningrum, S.Kom, M.Kom', 'TI'),
('VS', 'Very Sugiarto, S.Pd', ' '),
('WID', 'Widaningsih Condrowardhani, SH, MH.', 'MKU'),
('WIS', 'Wilda Imama Sabilla', 'TI'),
('YA', 'Yuri Ariyanto, S.Kom., M.Kom.', 'TI'),
('YP', 'Yushintia Pramitarini, S.ST., MT.', 'TI'),
('YS', 'Yusuf Suprapto', ' '),
('YWS', 'Yan Watequlis Syaifuddin, ST., M.MT.', ' '),
('YY', 'Yoppy Yunhasnawa, S.ST., M.Sc.', 'TI'),
('ZUL', 'Ahmadi Yuli Ananta, ST., M.M.', 'TI');

-- --------------------------------------------------------

--
-- Table structure for table `tb_lec_hourdist`
--

CREATE TABLE `tb_lec_hourdist` (
  `code` varchar(3) DEFAULT NULL,
  `name` varchar(42) DEFAULT NULL,
  `subject` varchar(53) DEFAULT NULL,
  `class` varchar(5) DEFAULT NULL,
  `total_hour` int(2) DEFAULT NULL,
  `semester` int(1) DEFAULT NULL,
  `year` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_lec_hourdist`
--

INSERT INTO `tb_lec_hourdist` (`code`, `name`, `subject`, `class`, `total_hour`, `semester`, `year`) VALUES
('ACH', 'Abdul Chalim SAg., MPd.I', 'Agama', 'MI-1A', 12, 2, 2019),
('ADE', 'Ade Ismail', 'Komputasi Kognitif', 'TI-2D', 16, 4, 2019),
('ANP', 'Agung Nugroho Pramudhita, S.T., M.T.', 'Basis Data Lanjut', 'MI-2C', 12, 3, 2019),
('ANP', 'Agung Nugroho Pramudhita, S.T., M.T.', 'Komputasi Multimedia', 'TI-3A', 10, 6, 2019),
('ANP', 'Agung Nugroho Pramudhita, S.T., M.T.', 'Pengolahan Citra Dijital', 'TI-4C', 12, 7, 2019),
('AB', 'Ahmad Bahauddin', 'Agama ', 'TI-1C', 12, 2, 2019),
('ZUL', 'Ahmadi Yuli Ananta, ST., M.M.', 'Sistem Operasi ', 'TI-1C', 3, 2, 2019),
('ZUL', 'Ahmadi Yuli Ananta, ST., M.M.', 'Proyek 1', 'TI-2C', 9, 4, 2019),
('ZUL', 'Ahmadi Yuli Ananta, ST., M.M.', ' Proyek 2 ', 'TI-3C', 12, 5, 2019),
('ZUL', 'Ahmadi Yuli Ananta, ST., M.M.', 'Proyek Tingkat III', 'TI-4F', 8, 7, 2019),
('AFN', 'Ane Fany Novitasari', 'Kewarganegeraan ', 'TI-1C', 8, 2, 2019),
('APK', 'Annisa Puspa Kirana., M.Kom', 'Dasar Pemrograman', 'TI-1E', 20, 1, 2019),
('APK', 'Annisa Puspa Kirana., M.Kom', 'Sistem Manajemen Basis Data', 'MI-2B', 15, 2, 2019),
('APK', 'Annisa Puspa Kirana., M.Kom', 'Keamanan Informasi', 'TI-4I', 4, 7, 2019),
('ATF', 'Annisa Taufika Firdausi, ST., MT.', 'Aplikasi Komputer Perkantoran ', 'MI-1A', 24, 1, 2019),
('ATF', 'Annisa Taufika Firdausi, ST., MT.', 'Sistem Manajemen Basis Data', 'MI-2C', 9, 2, 2019),
('ANR', 'Anugrah Nur Rahmanto, S.Sn., M.Ds.', 'Keselamatan Dan Kesehatan Kerja ', 'TI-1A', 12, 1, 2019),
('ANR', 'Anugrah Nur Rahmanto, S.Sn., M.Ds.', 'Desain Antarmuka', 'TI-2A', 12, 3, 2019),
('ANR', 'Anugrah Nur Rahmanto, S.Sn., M.Ds.', 'Digital Enterpreneurship', 'MI-3C', 16, 6, 2019),
('RID', 'Ariadi Retno Ririd, S.Kom., M.Kom.', 'Konsep Teknologi InformasI', 'MI-1A', 12, 1, 2019),
('RID', 'Ariadi Retno Ririd, S.Kom., M.Kom.', 'Rekayasa Perangkat Lunak ', 'TI-1A', 12, 2, 2019),
('RID', 'Ariadi Retno Ririd, S.Kom., M.Kom.', 'Analisis Dan Desain Berorientasi Objek', 'TI-2C', 12, 4, 2019),
('RID', 'Ariadi Retno Ririd, S.Kom., M.Kom.', 'Proyek 2', 'MI-3E', 12, 5, 2019),
('ARS', 'Arie Rachmad Syulistyo, S.Kom., M.Kom', 'Pengembangan Perangkat Lunak Berbasis Objek', 'MI-1A', 12, 2, 2019),
('ARS', 'Arie Rachmad Syulistyo, S.Kom., M.Kom', 'Pemrograman Berbasis Objek', 'TI-2G', 18, 3, 2019),
('ARS', 'Arie Rachmad Syulistyo, S.Kom., M.Kom', 'Komputasi Kognitif', 'TI-2C', 5, 4, 2019),
('ARS', 'Arie Rachmad Syulistyo, S.Kom., M.Kom', 'Pemrograman Platform Bergerak (Mobile)', 'TI-4I', 6, 7, 2019),
('ARP', 'Arief Prasetyo, S.Kom., M.Kom.', 'Manajemen Jaringan Komputer', 'MI-2A', 15, 2, 2019),
('ARP', 'Arief Prasetyo, S.Kom., M.Kom.', 'Jaringan Komputer', 'MI-2A', 24, 3, 2019),
('ARP', 'Arief Prasetyo, S.Kom., M.Kom.', 'Proyek 1', 'TI-2B', 9, 4, 2019),
('ARI', 'Ariyanti, SH,.MH', 'Pancasila ', 'MI-1E', 21, 1, 2019),
('ARW', 'Arwin Sumari ST., MT., DR.', 'Sistem Informasi', 'MI-2C', 6, 3, 2019),
('ARW', 'Arwin Sumari ST., MT., DR.', 'Komputasi Kognitif', 'TI-2H', 5, 4, 2019),
('ARW', 'Arwin Sumari ST., MT., DR.', 'Kecerdasan Buatan', 'MI-3E', 8, 5, 2019),
('ARW', 'Arwin Sumari ST., MT., DR.', 'Keamanan Informasi', 'TI-4F', 8, 7, 2019),
('ARW', 'Arwin Sumari ST., MT., DR.', 'Metodologi Penelitian', 'TI-4H', 4, 8, 2019),
('ASA', 'Ashri Shabrina Afrah SST., MT.', 'Matematika Diskrit', 'TI-1E', 16, 1, 2019),
('ASA', 'Ashri Shabrina Afrah SST., MT.', 'Sistem Pendukung Keputusan', 'TI-4I', 6, 7, 2019),
('ATQ', 'Atiqah Nurul Asri, S.Pd., M.Pd.', 'Bahasa Inggris 1', 'MI-1E', 18, 1, 2019),
('ATQ', 'Atiqah Nurul Asri, S.Pd., M.Pd.', 'Bahasa Inggris 2', 'TI-1E', 8, 2, 2019),
('ATQ', 'Atiqah Nurul Asri, S.Pd., M.Pd.', 'Bahasa Inggris 2', 'MI-2E', 6, 3, 2019),
('ATQ', 'Atiqah Nurul Asri, S.Pd., M.Pd.', 'Bahasa Inggris Persiapan Kerja', 'MI-3A', 12, 6, 2019),
('BGS', 'Bagas Satya Dian Nugraha, ST., MT.', 'Konsep Teknologi Informasi ', 'TI-1B', 6, 1, 2019),
('BGS', 'Bagas Satya Dian Nugraha, ST., MT.', 'Sistem Manajemen Basis Data', 'MI-2D', 12, 2, 2019),
('BGS', 'Bagas Satya Dian Nugraha, ST., MT.', 'Basis Data Lanjut', 'MI-2E', 12, 3, 2019),
('BGS', 'Bagas Satya Dian Nugraha, ST., MT.', 'Analisis Dan Desain Berorientasi Objek', 'TI-2E', 6, 4, 2019),
('HJT', 'Budi Harijanto, ST., M.MKom.', 'Keselamatan Dan Kesehatan Kerja', 'MI-1A', 12, 1, 2019),
('HJT', 'Budi Harijanto, ST., M.MKom.', 'Sistem Operasi ', 'TI-1A', 6, 2, 2019),
('HJT', 'Budi Harijanto, ST., M.MKom.', 'Proyek 1', 'TI-2F', 9, 4, 2019),
('HJT', 'Budi Harijanto, ST., M.MKom.', 'Proyek 2', 'MI-3C', 12, 5, 2019),
('CR', 'Cahya Rahmad, ST., M.Kom., Dr. Eng.', 'Matematika Diskrit', 'MI-1E', 8, 1, 2019),
('CR', 'Cahya Rahmad, ST., M.Kom., Dr. Eng.', 'Pengolahan Citra Dan Visi Komputer ', 'TI-3B', 9, 6, 2019),
('CR', 'Cahya Rahmad, ST., M.Kom., Dr. Eng.', 'Pengolahan Citra Dijital', 'TI-4A', 14, 7, 2019),
('VIS', 'Candra Bella Vista, S.Kom., MT.', 'E-Business', 'MI-2A', 11, 2, 2019),
('VIS', 'Candra Bella Vista, S.Kom., MT.', 'Basis Data Lanjut', 'TI-2A', 12, 3, 2019),
('CDR', 'Candrasena Setiadi, ST., M.MT', 'Sistem Operasi ', 'TI-1D', 15, 2, 2019),
('CDR', 'Candrasena Setiadi, ST., M.MT', 'Jaringan Komputer', 'TI-2G', 16, 3, 2019),
('CDR', 'Candrasena Setiadi, ST., M.MT', 'Pemrograman Jaringan', 'MI-3C', 6, 5, 2019),
('DSE', 'Deasy Sandhya Elya Ikawati, S.Si, M. Si', 'Matematika Diskrit', 'TI-1A', 16, 1, 2019),
('DSE', 'Deasy Sandhya Elya Ikawati, S.Si, M. Si', 'Aljabar Linier ', 'TI-1F', 8, 2, 2019),
('DSE', 'Deasy Sandhya Elya Ikawati, S.Si, M. Si', 'Statistik Komputasi', 'TI-2C', 6, 3, 2019),
('DSE', 'Deasy Sandhya Elya Ikawati, S.Si, M. Si', 'Digital Enterpreneurship', 'MI-3A', 8, 6, 2019),
('KPA', 'Deddy Kusbianto PA, Ir., M.Mkom.', 'Teknik Dokumentasi', 'MI-1D', 9, 1, 2019),
('KPA', 'Deddy Kusbianto PA, Ir., M.Mkom.', 'Analisis Dan Desain Berorientasi Objek', 'TI-2F', 21, 4, 2019),
('KPA', 'Deddy Kusbianto PA, Ir., M.Mkom.', 'Keamanan Sistem Dan Jaringan Komputer', 'MI-3D', 6, 5, 2019),
('KPA', 'Deddy Kusbianto PA, Ir., M.Mkom.', 'Proyek Tingkat III', 'TI-4D', 8, 7, 2019),
('DS', 'Dhebys Suryani, S.Kom., MT', 'Aplikasi Komputer Perkantoran ', 'MI-1E', 24, 1, 2019),
('DHS', 'Dian Hanifudin Subhi, S.Kom., M.Kom.', 'Dasar Pemrograman', 'TI-1A', 20, 1, 2019),
('DHS', 'Dian Hanifudin Subhi, S.Kom., M.Kom.', 'Pemrograman Mobile', 'MI-2E', 16, 2, 2019),
('DHS', 'Dian Hanifudin Subhi, S.Kom., M.Kom.', ' Pemrograman Mobile ', 'TI-3E', 6, 5, 2019),
('DMR', 'Diana Mayangsari Ramadhani, SST', ' Proyek 2 ', 'TI-3D', 24, 5, 2019),
('DRY', 'Dika Rizky Yunianto, S.Kom, M.Kom', 'Basis Data ', 'TI-1A', 18, 2, 2019),
('DRY', 'Dika Rizky Yunianto, S.Kom, M.Kom', 'Pemrograman Platform Bergerak (Mobile)', 'TI-4A', 24, 7, 2019),
('DWW', 'Dimas Wahyu Wibowo, ST., MT.', 'Pemrograman Web Lanjut', 'MI-2A', 12, 3, 2019),
('DWW', 'Dimas Wahyu Wibowo, ST., MT.', 'Pemrograman Web Lanjut', 'TI-2A', 12, 4, 2019),
('DWW', 'Dimas Wahyu Wibowo, ST., MT.', ' Proyek 2 ', 'TI-3F', 12, 5, 2019),
('DWW', 'Dimas Wahyu Wibowo, ST., MT.', 'Pemrograman Berbasis Framework ', 'TI-3A', 6, 6, 2019),
('DOD', 'Dodit Suprianto SKom. MT.', ' Pemrograman Mobile ', 'TI-3F', 24, 5, 2019),
('DOD', 'Dodit Suprianto SKom. MT.', 'Teknologi Data', 'TI-3G', 18, 6, 2019),
('DWI', 'Dwi Puspitasari, S.Kom., M.Kom.', 'Basis Data', 'MI-1A', 24, 2, 2019),
('DWI', 'Dwi Puspitasari, S.Kom., M.Kom.', 'Basis Data Lanjut', 'MI-2A', 12, 3, 2019),
('DWI', 'Dwi Puspitasari, S.Kom., M.Kom.', 'Proposal Laporan Akhir', 'MI-3A', 12, 5, 2019),
('IRA', 'Dyah Ayu Irawati, ST., M.Cs.', 'Desain Antarmuka', 'MI-2A', 12, 3, 2019),
('IRA', 'Dyah Ayu Irawati, ST., M.Cs.', 'Kecerdasan Buatan', 'MI-3A', 12, 5, 2019),
('ELA', 'Eka Larasati Amalia, S.ST., MT.', 'Pemrograman Berbasis Objek', 'MI-2C', 18, 3, 2019),
('ELA', 'Eka Larasati Amalia, S.ST., MT.', 'Analisis Dan Desain Berorientasi Objek', 'TI-2A', 12, 4, 2019),
('ELA', 'Eka Larasati Amalia, S.ST., MT.', 'Sistem Pendukung Keputusan ', 'TI-3A', 12, 6, 2019),
('ELA', 'Eka Larasati Amalia, S.ST., MT.', 'Sistem Pendukung Keputusan', 'TI-4A', 6, 7, 2019),
('OKE', 'Ekojono, ST., M.Kom.', 'Sistem Informasi', 'MI-2A', 6, 3, 2019),
('OKE', 'Ekojono, ST., M.Kom.', 'Sistem Informasi', 'TI-2C', 13, 4, 2019),
('OKE', 'Ekojono, ST., M.Kom.', 'Proyek 2', 'MI-3D', 18, 5, 2019),
('OKE', 'Ekojono, ST., M.Kom.', 'Issue Profesional dan Sosial Teknologi Informasi (TI)', 'TI-4F', 4, 8, 2019),
('ENH', 'Elok Nur Hamdana, S.T., M.T', 'Teknik Dokumentasi', 'MI-1C', 3, 1, 2019),
('ENH', 'Elok Nur Hamdana, S.T., M.T', 'Basis Data', 'MI-1C', 18, 2, 2019),
('ENH', 'Elok Nur Hamdana, S.T., M.T', 'Desain & Pemrograman Web', 'TI-2C', 20, 3, 2019),
('END', 'Endah Lestari SH., MHum.', 'Pancasila ', 'MI-1C', 12, 1, 2019),
('ESS', 'Endah Septa Sintiya. SPd., MKom.', 'Desain & Pemrograman Web', 'TI-2H', 5, 3, 2019),
('ESS', 'Endah Septa Sintiya. SPd., MKom.', 'Sistem Pendukung Keputusan', 'TI-4F', 18, 7, 2019),
('ERF', 'Erfan Rohadi, ST., M.Eng., Ph.D.', 'Konsep Teknologi InformasI', 'MI-1E', 12, 1, 2019),
('ERF', 'Erfan Rohadi, ST., M.Eng., Ph.D.', 'Proyek Tingkat III', 'TI-4A', 8, 7, 2019),
('ERF', 'Erfan Rohadi, ST., M.Eng., Ph.D.', 'Issue Profesional dan Sosial Teknologi Informasi (TI)', 'TI-4A', 8, 8, 2019),
('TOM', 'Faisal Rahutomo, ST., M.Kom., Dr.Eng.', 'Proyek 1', 'MI-2C', 9, 2, 2019),
('TOM', 'Faisal Rahutomo, ST., M.Kom., Dr.Eng.', 'Kecerdasan Buatan', 'TI-2A', 12, 3, 2019),
('TOM', 'Faisal Rahutomo, ST., M.Kom., Dr.Eng.', 'Sistem Informasi', 'TI-2G', 4, 4, 2019),
('TOM', 'Faisal Rahutomo, ST., M.Kom., Dr.Eng.', 'Keamanan Informasi', 'TI-4A', 12, 7, 2019),
('TOM', 'Faisal Rahutomo, ST., M.Kom., Dr.Eng.', 'Metodologi Penelitian', 'TI-4C', 4, 8, 2019),
('FUM', 'Faiz Ushbah Mubarok, S.Pd., M.Pd.', 'Bahasa Inggris 1 ', 'TI-1D', 3, 1, 2019),
('FUM', 'Faiz Ushbah Mubarok, S.Pd., M.Pd.', 'Bahasa Inggris 2', 'TI-1A', 4, 2, 2019),
('FUM', 'Faiz Ushbah Mubarok, S.Pd., M.Pd.', 'Bahasa Inggris 2', 'MI-2A', 12, 3, 2019),
('FUM', 'Faiz Ushbah Mubarok, S.Pd., M.Pd.', 'Bahasa Inggris Persiapan Kerja', 'MI-3E', 6, 6, 2019),
('FPR', 'Farid Angga Pribadi, S.Kom.,M.Kom', 'Manajemen Proyek', 'TI-4A', 24, 7, 2019),
('FU', 'Farida Ulfa, S.Pd., M.Pd.', 'Bahasa Inggris 1', 'MI-1A', 12, 1, 2019),
('FU', 'Farida Ulfa, S.Pd., M.Pd.', 'Bahasa Inggris 2', 'TI-1C', 2, 2, 2019),
('FU', 'Farida Ulfa, S.Pd., M.Pd.', 'Digital Enterpreneurship ', 'TI-3A', 4, 6, 2019),
('FRP', 'Frihandhika Permana SPd., MKom.', 'Desain Antarmuka', 'TI-2F', 19, 3, 2019),
('FRP', 'Frihandhika Permana SPd., MKom.', 'Manajemen Proyek', 'TI-4I', 4, 7, 2019),
('GPR', 'Galih Putra Riatma, S.St.', ' Pemrograman Jaringan ', 'TI-3B', 24, 5, 2019),
('GAP', 'Grezio Arifiyah P. S.Kom., M.Kom', 'Jaringan Komputer', 'TI-2C', 16, 3, 2019),
('GAP', 'Grezio Arifiyah P. S.Kom., M.Kom', 'Pemrograman Jaringan', 'MI-3D', 6, 5, 2019),
('GBP', 'Gunawan Budi Prasetyo, ST., MMT., Ph.D.', 'Teknologi Data', 'TI-3A', 12, 6, 2019),
('GBP', 'Gunawan Budi Prasetyo, ST., MMT., Ph.D.', 'E-Business', 'TI-4C', 24, 7, 2019),
('GBP', 'Gunawan Budi Prasetyo, ST., MMT., Ph.D.', 'Metodologi Penelitian', 'TI-4E', 6, 8, 2019),
('HED', 'Habibie Ed Dien, MT.', 'Rekayasa Perangkat Lunak ', 'TI-1G', 11, 2, 2019),
('HED', 'Habibie Ed Dien, MT.', 'Pemrograman Berbasis Objek', 'TI-2C', 18, 3, 2019),
('HRS', 'Hairus', 'Kewarganegaraan', 'MI-1C', 12, 2, 2019),
('HP', 'Hendra Pradibta, SE., M.Sc.', 'Teknik Dokumentasi ', 'TI-1E', 12, 1, 2019),
('HP', 'Hendra Pradibta, SE., M.Sc.', 'Proyek 1', 'TI-2H', 9, 4, 2019),
('HP', 'Hendra Pradibta, SE., M.Sc.', 'Proposal Laporan Akhir', 'MI-3E', 12, 5, 2019),
('HP', 'Hendra Pradibta, SE., M.Sc.', 'Digital Enterpreneurship ', 'TI-3D', 4, 6, 2019),
('IKP', 'Ika Kusumaning Putri, MT.', 'Basis Data ', 'TI-1C', 9, 2, 2019),
('IKP', 'Ika Kusumaning Putri, MT.', 'Basis Data Lanjut', 'TI-2G', 12, 3, 2019),
('IKP', 'Ika Kusumaning Putri, MT.', 'Sistem Manajemen Basis Data', 'TI-2A', 12, 4, 2019),
('IKP', 'Ika Kusumaning Putri, MT.', 'E-Business ', 'TI-3A', 4, 5, 2019),
('IFR', 'Imam Fahrur Rozi, ST., MT.', 'Struktur Data', 'MI-1A', 3, 2, 2019),
('IFR', 'Imam Fahrur Rozi, ST., MT.', 'Pemrograman Berbasis Objek', 'MI-2E', 9, 3, 2019),
('IFR', 'Imam Fahrur Rozi, ST., MT.', 'Proyek 1', 'TI-2A', 9, 4, 2019),
('IFR', 'Imam Fahrur Rozi, ST., MT.', ' Pemrograman Mobile ', 'TI-3A', 6, 5, 2019),
('IFR', 'Imam Fahrur Rozi, ST., MT.', 'Proyek Tingkat III', 'TI-4E', 8, 7, 2019),
('IN', 'Immah Inayati SKom., MKom., MBA.', ' Data Warehouse ', 'TI-3G', 6, 5, 2019),
('IN', 'Immah Inayati SKom., MKom., MBA.', 'Manajemen Proyek', 'TI-4E', 16, 7, 2019),
('IDW', 'Indra Dharma Wijaya, ST., M.MT.', 'Penulisan Ilmiah', 'MI-1E', 8, 2, 2019),
('IDW', 'Indra Dharma Wijaya, ST., M.MT.', 'Desain Antarmuka', 'MI-2E', 6, 3, 2019),
('IDW', 'Indra Dharma Wijaya, ST., M.MT.', 'E-Business', 'TI-4A', 8, 7, 2019),
('IWP', 'Irna Wulan Palupi SH, M.Kn', 'Ilmu Komunikasi Dan Organisasi ', 'TI-1G', 9, 1, 2019),
('IAM', 'Irsyad Arif Mashudi, M.Kom', 'Komputasi Multimedia', 'MI-2C', 8, 2, 2019),
('IAM', 'Irsyad Arif Mashudi, M.Kom', 'Jaringan Komputer', 'TI-2A', 16, 3, 2019),
('IAM', 'Irsyad Arif Mashudi, M.Kom', 'Teknologi Data', 'TI-3C', 16, 6, 2019),
('KSB', 'Kadek Suarjuna Batubulan, S.Kom, MT', 'Komputasi Multimedia', 'MI-2A', 8, 2, 2019),
('KSB', 'Kadek Suarjuna Batubulan, S.Kom, MT', 'Keamanan Sistem Dan Jaringan Komputer', 'MI-3E', 12, 5, 2019),
('KSB', 'Kadek Suarjuna Batubulan, S.Kom, MT', 'Komputasi Multimedia', 'TI-3B', 11, 6, 2019),
('KSB', 'Kadek Suarjuna Batubulan, S.Kom, MT', 'Pengolahan Citra Dijital', 'TI-4E', 12, 7, 2019),
('LA', 'Luqman Affandi, S.Kom., MMSI', 'Pemrograman Mobile', 'MI-2A', 23, 2, 2019),
('LA', 'Luqman Affandi, S.Kom., MMSI', 'Proposal Laporan Akhir', 'MI-3D', 24, 5, 2019),
('HAR', 'M. Hasyim Ratsanjani', 'Manajemen Proyek', 'TI-2A', 12, 4, 2019),
('HAR', 'M. Hasyim Ratsanjani', 'Komputasi Multimedia', 'TI-3D', 8, 6, 2019),
('MMH', 'Mamluatul Hani\'ah', 'Konsep Teknologi Informasi ', 'TI-1D', 13, 1, 2019),
('MMH', 'Mamluatul Hani\'ah', 'Algoritma Dan Struktur Data ', 'TI-1C', 3, 2, 2019),
('MMH', 'Mamluatul Hani\'ah', 'Analisis Dan Desain Berorientasi Objek', 'TI-2G', 6, 4, 2019),
('MMH', 'Mamluatul Hani\'ah', 'E-Business ', 'TI-3C', 4, 5, 2019),
('MEA', 'Meyti Eka Apriyani ST., MT.', 'Desain & Pemrograman Web', 'MI-1A', 15, 2, 2019),
('MEA', 'Meyti Eka Apriyani ST., MT.', 'Pemrograman Berbasis Framework ', 'TI-3G', 3, 6, 2019),
('MIS', 'Milyun Ni\'ma Shoumi', 'Basis Data ', 'TI-1F', 9, 2, 2019),
('MIS', 'Milyun Ni\'ma Shoumi', 'Basis Data Lanjut', 'TI-2E', 12, 3, 2019),
('MIS', 'Milyun Ni\'ma Shoumi', 'Pemrograman Web Lanjut', 'TI-2C', 6, 4, 2019),
('MIS', 'Milyun Ni\'ma Shoumi', 'E-Business ', 'TI-3B', 4, 5, 2019),
('MZA', 'Moch. Zawaruddin Abdullah, S.ST., M.Kom', 'Konsep Teknologi Informasi ', 'TI-1A', 6, 1, 2019),
('MZA', 'Moch. Zawaruddin Abdullah, S.ST., M.Kom', 'Algoritma Dan Struktur Data ', 'TI-1D', 3, 2, 2019),
('MZA', 'Moch. Zawaruddin Abdullah, S.ST., M.Kom', 'Pemrograman Jaringan', 'MI-3E', 12, 5, 2019),
('MZA', 'Moch. Zawaruddin Abdullah, S.ST., M.Kom', 'Pemrograman Berbasis Framework ', 'TI-3C', 6, 6, 2019),
('MA', 'Moh. Amin', 'Agama ', 'TI-1A', 4, 2, 2019),
('MAH', 'Muhammad Afif Hendrawan.,S.Kom.', 'Pengembangan Perangkat Lunak Berbasis Objek', 'MI-1D', 12, 2, 2019),
('MAH', 'Muhammad Afif Hendrawan.,S.Kom.', ' Data Warehouse ', 'TI-3E', 16, 5, 2019),
('MAH', 'Muhammad Afif Hendrawan.,S.Kom.', 'Sistem Pendukung Keputusan ', 'TI-3D', 12, 6, 2019),
('MAH', 'Muhammad Afif Hendrawan.,S.Kom.', 'Proyek Tingkat III', 'TI-4I', 8, 7, 2019),
('MSK', 'Muhammad Shulhan Khairy, S.Kom, M.Kom', 'Basis Data ', 'TI-1E', 9, 2, 2019),
('MSK', 'Muhammad Shulhan Khairy, S.Kom, M.Kom', 'Pemrograman Web Lanjut', 'MI-2C', 24, 3, 2019),
('MSK', 'Muhammad Shulhan Khairy, S.Kom, M.Kom', 'Internet Of Things', 'TI-3F', 12, 6, 2019),
('MUP', 'Muhammad Unggul Pamenang, S.St., M.T.', 'Teknik Dokumentasi', 'MI-1A', 18, 1, 2019),
('MUP', 'Muhammad Unggul Pamenang, S.St., M.T.', 'Sistem Informasi', 'MI-2E', 6, 3, 2019),
('MUP', 'Muhammad Unggul Pamenang, S.St., M.T.', 'Pemrograman Web Lanjut', 'TI-2E', 18, 4, 2019),
('MUP', 'Muhammad Unggul Pamenang, S.St., M.T.', 'Komputasi Multimedia', 'TI-3G', 4, 6, 2019),
('MQ', 'Mungki Astiningrum, ST., M.Kom.', 'Dasar Pemrograman', 'MI-1B', 10, 1, 2019),
('MQ', 'Mungki Astiningrum, ST., M.Kom.', 'Struktur Data', 'MI-1C', 15, 2, 2019),
('MQ', 'Mungki Astiningrum, ST., M.Kom.', 'Proyek 2', 'MI-3B', 12, 5, 2019),
('MM', 'Mustika Mentari, S.Kom., M.Kom', 'Dasar Pemrograman', 'TI-1G', 20, 1, 2019),
('MM', 'Mustika Mentari, S.Kom., M.Kom', 'Algoritma Dan Struktur Data ', 'TI-1B', 3, 2, 2019),
('MM', 'Mustika Mentari, S.Kom., M.Kom', 'Kecerdasan Buatan', 'MI-3D', 4, 5, 2019),
('MM', 'Mustika Mentari, S.Kom., M.Kom', 'Sistem Pendukung Keputusan ', 'TI-3F', 12, 6, 2019),
('NOP', 'Noprianto SKom., MEng.', 'Dasar Pemrograman', 'TI-1C', 10, 1, 2019),
('NOP', 'Noprianto SKom., MEng.', 'Basis Data ', 'TI-1G', 9, 2, 2019),
('NOP', 'Noprianto SKom., MEng.', 'Pemrograman Jaringan', 'MI-3A', 6, 5, 2019),
('NOP', 'Noprianto SKom., MEng.', 'Internet Of Things', 'TI-3B', 12, 6, 2019),
('NUR', 'Nurzizah', 'Bahasa Indonesia', 'MI-3A', 18, 6, 2019),
('ODT', 'Odhitya Desta Triswidrananta, S.Pd., M.Pd.', 'Sistem Operasi', 'MI-1C', 4, 2, 2019),
('ODT', 'Odhitya Desta Triswidrananta, S.Pd., M.Pd.', 'Sistem Informasi', 'TI-2E', 4, 4, 2019),
('ODT', 'Odhitya Desta Triswidrananta, S.Pd., M.Pd.', 'Pemrograman Berbasis Framework ', 'TI-3E', 6, 6, 2019),
('ODT', 'Odhitya Desta Triswidrananta, S.Pd., M.Pd.', 'Pemrograman Platform Bergerak (Mobile)', 'TI-4E', 24, 7, 2019),
('PYS', 'Pramana Yoga Saputra, S.Kom., MMT.', 'Manajemen Proyek', 'MI-2C', 18, 2, 2019),
('PYS', 'Pramana Yoga Saputra, S.Kom., MMT.', 'Statistik Komputasi', 'TI-2E', 12, 3, 2019),
('PYS', 'Pramana Yoga Saputra, S.Kom., MMT.', 'Manajemen Proyek', 'TI-2E', 6, 4, 2019),
('PYS', 'Pramana Yoga Saputra, S.Kom., MMT.', ' Proyek 2 ', 'TI-3A', 12, 5, 2019),
('PPA', 'Putra Prima A., ST., M.Kom.', 'Pemrograman Mobile', 'MI-2B', 24, 2, 2019),
('PPA', 'Putra Prima A., ST., M.Kom.', ' Pemrograman Mobile ', 'TI-3C', 24, 5, 2019),
('QH', 'Qonitatul Hasanah, S.ST', 'Konsep Teknologi Informasi ', 'TI-1H', 3, 1, 2019),
('QH', 'Qonitatul Hasanah, S.ST', 'Sistem Pendukung Keputusan', 'TI-4E', 24, 7, 2019),
('RKA', 'Rakhmat Arianto', 'Komputasi Kognitif', 'TI-2A', 16, 4, 2019),
('RWS', 'Rawansyah., Drs., M.Pd.', 'Matematika Diskrit', 'MI-1A', 16, 1, 2019),
('RWS', 'Rawansyah., Drs., M.Pd.', 'Aljabar Linier ', 'TI-1A', 24, 2, 2019),
('RWS', 'Rawansyah., Drs., M.Pd.', 'Statistik Komputasi', 'TI-2A', 6, 3, 2019),
('RDM', 'Retno Damayanti, S.Pd', 'Aplikasi Komputer Perkantoran ', 'TI-1C', 24, 1, 2019),
('RDM', 'Retno Damayanti, S.Pd', 'Basis Data', 'MI-1E', 18, 2, 2019),
('RDM', 'Retno Damayanti, S.Pd', 'Issue Profesional dan Sosial Teknologi Informasi (TI)', 'TI-4I', 2, 8, 2019),
('RR', 'Ridwan Rismanto, SST., M.Kom.', 'Pemrograman Berbasis Objek', 'MI-2A', 18, 3, 2019),
('RR', 'Ridwan Rismanto, SST., M.Kom.', 'Sistem Pendukung Keputusan', 'TI-4B', 6, 7, 2019),
('RDN', 'Rizdania ST., MKom.', 'Kecerdasan Buatan', 'TI-2D', 20, 3, 2019),
('RDN', 'Rizdania ST., MKom.', 'Keamanan Informasi', 'TI-4H', 4, 7, 2019),
('RIZ', 'Rizky Ardiansyah, S.Kom., MT.', 'Teknik Dokumentasi ', 'TI-1A', 12, 1, 2019),
('RIZ', 'Rizky Ardiansyah, S.Kom., MT.', 'Penulisan Ilmiah', 'MI-1A', 4, 2, 2019),
('RIZ', 'Rizky Ardiansyah, S.Kom., MT.', 'Sistem Manajemen Basis Data', 'TI-2F', 18, 4, 2019),
('RIZ', 'Rizky Ardiansyah, S.Kom., MT.', 'Sistem Terdistribusi ', 'MI-3E', 12, 5, 2019),
('RB', 'Robby Anggriawan SE., ME.', 'Ilmu Komunikasi Dan Organisasi ', 'MI-1E', 6, 1, 2019),
('ROW', 'Rokhimatul Wakhidah', 'E-Business', 'MI-2E', 7, 2, 2019),
('ROW', 'Rokhimatul Wakhidah', 'Desain Antarmuka', 'TI-2E', 15, 3, 2019),
('RAA', 'Rosa Andrie Asmara, ST., MT., Dr. Eng.', 'Proyek 1', 'TI-2G', 9, 4, 2019),
('RAA', 'Rosa Andrie Asmara, ST., MT., Dr. Eng.', ' Proyek 2 ', 'TI-3B', 18, 5, 2019),
('RAA', 'Rosa Andrie Asmara, ST., MT., Dr. Eng.', 'Pengolahan Citra Dan Visi Komputer ', 'TI-3F', 3, 6, 2019),
('RAA', 'Rosa Andrie Asmara, ST., MT., Dr. Eng.', 'Pengolahan Citra Dijital', 'TI-4B', 6, 7, 2019),
('RDA', 'Rudy Ariyanto, ST., M.Cs.', 'Dasar Pemrograman', 'MI-1A', 10, 1, 2019),
('RDA', 'Rudy Ariyanto, ST., M.Cs.', 'Proyek 1', 'MI-2A', 9, 2, 2019),
('RDA', 'Rudy Ariyanto, ST., M.Cs.', 'Sistem Informasi', 'TI-2A', 4, 4, 2019),
('RDA', 'Rudy Ariyanto, ST., M.Cs.', 'Proyek 2', 'MI-3A', 12, 5, 2019),
('SBS', 'Satrio Binusa S, SS, M.Pd', 'Keselamatan Dan Kesehatan Kerja', 'MI-1E', 24, 1, 2019),
('SBS', 'Satrio Binusa S, SS, M.Pd', 'Penulisan Ilmiah', 'MI-1C', 6, 2, 2019),
('SBS', 'Satrio Binusa S, SS, M.Pd', 'Digital Enterpreneurship ', 'TI-3C', 2, 6, 2019),
('SES', 'Septian Enggar Sukmana, S.Pd., M.T', 'Komputasi Multimedia', 'MI-2E', 11, 2, 2019),
('SES', 'Septian Enggar Sukmana, S.Pd., M.T', 'Pemrograman Berbasis Objek', 'TI-2E', 18, 3, 2019),
('SMU', 'Shohib Muslim', 'Pancasila ', 'TI-1C', 6, 1, 2019),
('SMU', 'Shohib Muslim', 'Kewarganegaraan', 'MI-1A', 8, 2, 2019),
('SIR', 'Siti Romlah, Dra., M.M.', 'Ilmu Komunikasi Dan Organisasi ', 'MI-1A', 12, 1, 2019),
('SIR', 'Siti Romlah, Dra., M.M.', 'Digital Enterpreneurship ', 'TI-3F', 4, 6, 2019),
('SNA', 'Sofyan Noor Arief, S.ST., M.Kom.', 'Desain & Pemrograman Web', 'MI-1D', 15, 2, 2019),
('SNA', 'Sofyan Noor Arief, S.ST., M.Kom.', 'Jaringan Komputer', 'MI-2E', 16, 3, 2019),
('SNA', 'Sofyan Noor Arief, S.ST., M.Kom.', 'Keamanan Sistem Dan Jaringan Komputer', 'MI-3A', 6, 5, 2019),
('SNA', 'Sofyan Noor Arief, S.ST., M.Kom.', 'Issue Profesional dan Sosial Teknologi Informasi (TI)', 'TI-4H', 2, 8, 2019),
('TAW', 'Triastana Anang Wibawa, ST., MT.', 'Keamanan Sistem Dan Jaringan Komputer', 'MI-3B', 12, 5, 2019),
('UDR', 'Ulla Delfana Rosiani, ST., MT.', 'Sistem Pendukung Keputusan ', 'TI-3C', 6, 6, 2019),
('UDR', 'Ulla Delfana Rosiani, ST., MT.', 'Sistem Pendukung Keputusan', 'TI-4C', 12, 7, 2019),
('UN', 'Usman Nurhasan, S.Kom., MT.', 'Rekayasa Perangkat Lunak ', 'TI-1D', 12, 2, 2019),
('UN', 'Usman Nurhasan, S.Kom., MT.', 'Sistem Terdistribusi ', 'MI-3A', 24, 5, 2019),
('UN', 'Usman Nurhasan, S.Kom., MT.', 'Issue Profesional dan Sosial Teknologi Informasi (TI)', 'TI-4C', 6, 8, 2019),
('VS', 'Very Sugiarto, S.Pd', 'Jaringan Komputer', 'TI-2E', 8, 3, 2019),
('VS', 'Very Sugiarto, S.Pd', 'Pemrograman Jaringan', 'MI-3B', 18, 5, 2019),
('VAH', 'Vipkas Al Hadid Firdaus, ST,. MT', 'Pemrograman Berbasis Objek', 'MI-2F', 9, 3, 2019),
('VAH', 'Vipkas Al Hadid Firdaus, ST,. MT', 'Komputasi Kognitif', 'TI-2F', 10, 4, 2019),
('VAH', 'Vipkas Al Hadid Firdaus, ST,. MT', 'Sistem Terdistribusi ', 'MI-3C', 12, 5, 2019),
('VAH', 'Vipkas Al Hadid Firdaus, ST,. MT', 'Internet Of Things', 'TI-3A', 6, 6, 2019),
('VNW', 'Vivi Nur Wijayaningrum, S.Kom, M.Kom', 'Dasar Pemrograman', 'MI-1C', 20, 1, 2019),
('VNW', 'Vivi Nur Wijayaningrum, S.Kom, M.Kom', 'Struktur Data', 'MI-1E', 6, 2, 2019),
('VNW', 'Vivi Nur Wijayaningrum, S.Kom, M.Kom', 'Keamanan Informasi', 'TI-4D', 4, 7, 2019),
('VAL', 'Vivin Ayu Lestari, S.Pd', 'Dasar Pemrograman', 'MI-1E', 20, 1, 2019),
('VAL', 'Vivin Ayu Lestari, S.Pd', 'Struktur Data', 'MI-1B', 6, 2, 2019),
('VAL', 'Vivin Ayu Lestari, S.Pd', 'Keamanan Informasi', 'TI-4E', 4, 7, 2019),
('WID', 'Widaningsih Condrowardhani, SH, MH.', 'Pancasila ', 'MI-1A', 21, 1, 2019),
('WID', 'Widaningsih Condrowardhani, SH, MH.', 'Etika Profesi Bidang TI', 'MI-3A', 18, 6, 2019),
('WIS', 'Wilda Imama Sabilla', 'E-Business', 'MI-2B', 6, 2, 2019),
('WIS', 'Wilda Imama Sabilla', 'Pemrograman Web Lanjut', 'TI-2D', 6, 4, 2019),
('WIS', 'Wilda Imama Sabilla', 'E-Business ', 'TI-3D', 16, 5, 2019),
('YY', 'Yoppy Yunhasnawa, S.ST., M.Sc.', 'Sistem Manajemen Basis Data', 'MI-2F', 6, 2, 2019),
('YY', 'Yoppy Yunhasnawa, S.ST., M.Sc.', ' Proyek 2 ', 'TI-3G', 24, 5, 2019),
('YY', 'Yoppy Yunhasnawa, S.ST., M.Sc.', 'Teknologi Data', 'TI-3E', 12, 6, 2019),
('YA', 'Yuri Ariyanto, S.Kom., M.Kom.', 'Manajemen Proyek', 'MI-2F', 18, 2, 2019),
('YA', 'Yuri Ariyanto, S.Kom., M.Kom.', 'Jaringan Komputer', 'MI-2C', 16, 3, 2019),
('YA', 'Yuri Ariyanto, S.Kom., M.Kom.', 'Manajemen Proyek', 'TI-2C', 6, 4, 2019),
('YA', 'Yuri Ariyanto, S.Kom., M.Kom.', 'Proyek Tingkat III', 'TI-4C', 8, 7, 2019),
('YP', 'Yushintia Pramitarini, S.ST., MT.', 'Sistem Operasi', 'MI-1E', 13, 2, 2019),
('YP', 'Yushintia Pramitarini, S.ST., MT.', 'Pemrograman Web Lanjut', 'MI-2D', 23, 3, 2019),
('YP', 'Yushintia Pramitarini, S.ST., MT.', 'Sistem Manajemen Basis Data', 'TI-2D', 12, 4, 2019);

-- --------------------------------------------------------

--
-- Table structure for table `tb_lec_position`
--

CREATE TABLE `tb_lec_position` (
  `code` varchar(3) DEFAULT NULL,
  `name` varchar(39) DEFAULT NULL,
  `position` varchar(57) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `semester` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_lec_position`
--

INSERT INTO `tb_lec_position` (`code`, `name`, `position`, `year`, `semester`) VALUES
('ARP', 'Arief Prasetyo, S.Kom., M.Kom.', 'Ka.Lab. Sistem Komputer dan  Jaringan', 2019, 'Odd'),
('ATQ', 'Atiqah Nurul Asri, S.Pd., M.Pd.', 'KaPokJar. MK. MKU, Wajib, dan Penunjang D4', 2019, 'Odd'),
('HJT', 'Budi Harijanto, ST., M.MKom.', 'Ka. Lab. Informatika Dasar', 2019, 'Odd'),
('KPA', 'Deddy Kusbianto PA, Ir., M.Mkom.', 'Ka. Lab. Project', 2019, 'Odd'),
('DWW', 'Dimas Wahyu Wibowo, ST., MT.', 'Ka. Lab. Image dan Graphics', 2019, 'Odd'),
('DWI', 'Dwi Puspitasari, S.Kom., M.Kom.', 'KaPokJar. MK. Keahlian D4', 2019, 'Odd'),
('ELA', 'Eka Larasati Amalia, S.ST., MT.', 'KaPokJar MK. Inti D3 ', 2019, 'Odd'),
('OKE', 'Ekojono, ST., M.Kom.', 'KaPokJar MK. Informatika Dasar D3', 2019, 'Odd'),
('ERF', 'Erfan Rohadi, ST., M.Eng., Ph.D.', 'Ka. Lab. SIstem Informasi', 2019, 'Odd'),
('GBP', 'Gunawan Budi Prasetyo, ST., MMT., Ph.D.', 'Ka. Lab. Sistem Cerdas', 2019, 'Odd'),
('IDW', 'Indra Dharma Wijaya, ST., M.MT.', 'Ka. Lab. Basisdata', 2019, 'Odd'),
('LA', 'Luqman Affandi, S.Kom., MMSI', 'KaPokJar. MK. Keahlian D3', 2019, 'Odd'),
('MQ', 'Mungki Astiningrum, ST., M.Kom.', 'KaPokJar MK. Informatika Dasar D4', 2019, 'Odd'),
('PYS', 'Pramana Yoga Saputra, S.Kom., MMT.', 'Ka. Lab. Pengembangan Inkubator Bisnis Berbasis Teknologi', 2019, 'Odd'),
('PPA', 'Putra Prima A., ST., M.Kom.', 'KaPokJar MK Inti D4', 2019, 'Odd'),
('RWS', 'Rawansyah., Drs., M.Pd.', 'KaPokJar. MK. Umum, Wajib dan Penunjang D3', 2019, 'Odd'),
('RR', 'Ridwan Rismanto, SST., M.Kom.', 'Ka. Lab. Rekayasa Perangkat Lunak', 2019, 'Odd'),
('UDR', 'Ulla Delfana Rosiani, ST., MT.', 'Ka. Lab. Visi Komputer', 2019, 'Odd'),
('UN', 'Usman Nurhasan, S.Kom., MT.', 'Ka. Lab. Sistem Cerdas', 2019, 'Odd'),
('YA', 'Yuri Ariyanto, S.Kom., M.Kom.', 'Ka. Lab. Sistem Informasi', 2019, 'Odd'),
('ARP', 'Arief Prasetyo, S.Kom., M.Kom.', 'Ka.Lab. Sistem Komputer dan  Jaringan', 2019, 'Odd'),
('ATQ', 'Atiqah Nurul Asri, S.Pd., M.Pd.', 'KaPokJar. MK. MKU, Wajib, dan Penunjang D4', 2019, 'Odd'),
('HJT', 'Budi Harijanto, ST., M.MKom.', 'Ka. Lab. Informatika Dasar', 2019, 'Odd'),
('KPA', 'Deddy Kusbianto PA, Ir., M.Mkom.', 'Ka. Lab. Project', 2019, 'Odd'),
('DWW', 'Dimas Wahyu Wibowo, ST., MT.', 'Ka. Lab. Image dan Graphics', 2019, 'Odd'),
('DWI', 'Dwi Puspitasari, S.Kom., M.Kom.', 'KaPokJar. MK. Keahlian D4', 2019, 'Odd'),
('ELA', 'Eka Larasati Amalia, S.ST., MT.', 'KaPokJar MK. Inti D3 ', 2019, 'Odd'),
('OKE', 'Ekojono, ST., M.Kom.', 'KaPokJar MK. Informatika Dasar D3', 2019, 'Odd'),
('ERF', 'Erfan Rohadi, ST., M.Eng., Ph.D.', 'Ka. Lab. SIstem Informasi', 2019, 'Odd'),
('GBP', 'Gunawan Budi Prasetyo, ST., MMT., Ph.D.', 'Ka. Lab. Sistem Cerdas', 2019, 'Odd'),
('IDW', 'Indra Dharma Wijaya, ST., M.MT.', 'Ka. Lab. Basisdata', 2019, 'Odd'),
('LA', 'Luqman Affandi, S.Kom., MMSI', 'KaPokJar. MK. Keahlian D3', 2019, 'Odd'),
('MQ', 'Mungki Astiningrum, ST., M.Kom.', 'KaPokJar MK. Informatika Dasar D4', 2019, 'Odd'),
('PYS', 'Pramana Yoga Saputra, S.Kom., MMT.', 'Ka. Lab. Pengembangan Inkubator Bisnis Berbasis Teknologi', 2019, 'Odd'),
('PPA', 'Putra Prima A., ST., M.Kom.', 'KaPokJar MK Inti D4', 2019, 'Odd'),
('RWS', 'Rawansyah., Drs., M.Pd.', 'KaPokJar. MK. Umum, Wajib dan Penunjang D3', 2019, 'Odd'),
('RR', 'Ridwan Rismanto, SST., M.Kom.', 'Ka. Lab. Rekayasa Perangkat Lunak', 2019, 'Odd'),
('UDR', 'Ulla Delfana Rosiani, ST., MT.', 'Ka. Lab. Visi Komputer', 2019, 'Odd'),
('UN', 'Usman Nurhasan, S.Kom., MT.', 'Ka. Lab. Sistem Cerdas', 2019, 'Odd'),
('YA', 'Yuri Ariyanto, S.Kom., M.Kom.', 'Ka. Lab. Sistem Informasi', 2019, 'Odd');

-- --------------------------------------------------------

--
-- Table structure for table `tb_lec_research`
--

CREATE TABLE `tb_lec_research` (
  `code` varchar(3) DEFAULT NULL,
  `name` varchar(39) DEFAULT NULL,
  `research` varchar(10) DEFAULT NULL,
  `priority` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_lec_research`
--

INSERT INTO `tb_lec_research` (`code`, `name`, `research`, `priority`) VALUES
('RID', 'Ariadi Retno Ririd, S.Kom., M.Kom.', 'CERDAS', 'Primary'),
('ENH', 'Elok Nur Hamdana, S.T., M.T', 'CERDAS', 'Primary'),
('RDA', 'Rudy Ariyanto, ST., M.Cs.', 'SI', 'Primary'),
('FU', 'Farida Ulfa, S.Pd., M.Pd.', 'SI', 'Primary'),
('GAP', 'Grezio Arifiyah P. S.Kom., M.Kom', 'JARINGAN', 'Primary'),
('HP', 'Hendra Pradibta, SE., M.Sc.', 'MULTIMEDIA', 'Primary'),
('ARS', 'Arie Rachmad Syulistyo, S.Kom., M.Kom', 'CERDAS', 'Primary'),
('RWS', 'Rawansyah., Drs., M.Pd.', 'SI', 'Primary'),
('DOD', 'Dodit Suprianto SKom. MT.', 'SI', 'Primary'),
('SES', 'Septian Enggar Sukmana, S.Pd., M.T', 'JARINGAN', 'Primary'),
('OKE', 'Ekojono, ST., M.Kom.', 'MULTIMEDIA', 'Primary'),
('ATF', 'Annisa Taufika Firdausi, ST., MT.', 'CERDAS', 'Primary'),
('IDW', 'Indra Dharma Wijaya, ST., M.MT.', 'SI', 'Primary'),
('MZA', 'Moch. Zawaruddin Abdullah, S.ST., M.Kom', 'SI', 'Primary'),
('VAH', 'Vipkas Al Hadid Firdaus, ST,. MT', 'JARINGAN', 'Primary'),
('DWW', 'Dimas Wahyu Wibowo, ST., MT.', 'MULTIMEDIA', 'Primary'),
('ANP', 'Agung Nugroho Pramudhita, S.T., M.T.', 'CERDAS', 'Primary'),
('ERF', 'Erfan Rohadi, ST., M.Eng., Ph.D.', 'SI', 'Primary'),
('BGS', 'Bagas Satya Dian Nugraha, ST., MT.', 'SI', 'Primary'),
('MM', 'Mustika Mentari, S.Kom., M.Kom', 'JARINGAN', 'Primary'),
('DS', 'Dhebys Suryani, S.Kom., MT', 'MULTIMEDIA', 'Primary'),
('RR', 'Ridwan Rismanto, SST., M.Kom.', 'CERDAS', 'Primary'),
('ELA', 'Eka Larasati Amalia, S.ST., MT.', 'SI', 'Primary'),
('YY', 'Yoppy Yunhasnawa, S.ST., M.Sc.', 'SI', 'Primary'),
('DRY', 'Dika Rizky Yunianto, S.Kom, M.Kom', 'JARINGAN', 'Primary'),
('PYS', 'Pramana Yoga Saputra, S.Kom., MMT.', 'CERDAS', 'Primary'),
('IRA', 'Dyah Ayu Irawati, ST., M.Cs.', 'SI', 'Primary'),
('MAH', 'Muhammad Afif Hendrawan.,S.Kom.', 'SI', 'Primary'),
('DHS', 'Dian Hanifudin Subhi, S.Kom., M.Kom.', 'JARINGAN', 'Primary'),
('IFR', 'Imam Fahrur Rozi, ST., MT.', 'CERDAS', 'Primary'),
('MMH', 'Mamluatul Hani\'ah', 'CERDAS', 'Primary'),
('KPA', 'Deddy Kusbianto PA, Ir., M.Mkom.', 'SI', 'Primary'),
('MEA', 'Meyti Eka Apriyani ST., MT.', 'SI', 'Primary'),
('YA', 'Yuri Ariyanto, S.Kom., M.Kom.', 'JARINGAN', 'Primary'),
('HED', 'Habibie Ed Dien, MT.', 'MULTIMEDIA', 'Primary'),
('TOM', 'Faisal Rahutomo, ST., M.Kom., Dr.Eng.', 'CERDAS', 'Primary'),
('IKP', 'Ika Kusumaning Putri, MT.', 'CERDAS', 'Primary'),
('BSA', 'Banni Satria Andoko, S. Kom., M.MSI', 'SI', 'Primary'),
('KSB', 'Kadek Suarjuna Batubulan, S.Kom, MT', 'SI', 'Primary'),
('LA', 'Luqman Affandi, S.Kom., MMSI', 'JARINGAN', 'Primary'),
('YP', 'Yushintia Pramitarini, S.ST., MT.', 'SI', 'Primary'),
('ANR', 'Anugrah Nur Rahmanto, S.Sn., M.Ds.', 'MULTIMEDIA', 'Primary'),
('DWI', 'Dwi Puspitasari, S.Kom., M.Kom.', 'CERDAS', 'Primary'),
('SNA', 'Sofyan Noor Arief, S.ST., M.Kom.', 'CERDAS', 'Primary'),
('ZUL', 'Ahmadi Yuli Ananta, ST., M.M.', 'SI', 'Primary'),
('APK', 'Annisa Puspa Kirana., M.Kom', 'SI', 'Primary'),
('ARP', 'Arief Prasetyo, S.Kom., M.Kom.', 'JARINGAN', 'Primary'),
('RIZ', 'Rizky Ardiansyah, S.Kom., MT.', 'SI', 'Primary'),
('UN', 'Usman Nurhasan, S.Kom., MT.', 'MULTIMEDIA', 'Primary'),
('YP', 'Yushintia Pramitarini, S.ST., MT.', 'MULTIMEDIA', 'Secondary'),
('OKE', 'Ekojono, ST., M.Kom.', 'CERDAS', 'Secondary'),
('MEA', 'Meyti Eka Apriyani ST., MT.', 'CERDAS', 'Secondary'),
('PYS', 'Pramana Yoga Saputra, S.Kom., MMT.', 'SI', 'Secondary'),
('WIS', 'Wilda Imama Sabilla', 'SI', 'Secondary'),
('ROW', 'Rokhimatul Wakhidah', 'MULTIMEDIA', 'Secondary'),
('ELA', 'Eka Larasati Amalia, S.ST., MT.', 'CERDAS', 'Secondary'),
('KSB', 'Kadek Suarjuna Batubulan, S.Kom, MT', 'CERDAS', 'Secondary'),
('RIZ', 'Rizky Ardiansyah, S.Kom., MT.', 'CERDAS', 'Secondary'),
('IFR', 'Imam Fahrur Rozi, ST., MT.', 'SI', 'Secondary'),
('MMH', 'Mamluatul Hani\'ah', 'SI', 'Secondary'),
('IKP', 'Ika Kusumaning Putri, MT.', 'MULTIMEDIA', 'Secondary'),
('IRA', 'Dyah Ayu Irawati, ST., M.Cs.', 'CERDAS', 'Secondary'),
('DRY', 'Dika Rizky Yunianto, S.Kom, M.Kom', 'CERDAS', 'Secondary'),
('FU', 'Farida Ulfa, S.Pd., M.Pd.', 'CERDAS', 'Secondary'),
('HP', 'Hendra Pradibta, SE., M.Sc.', 'SI', 'Secondary'),
('DHS', 'Dian Hanifudin Subhi, S.Kom., M.Kom.', 'SI', 'Secondary'),
('BGS', 'Bagas Satya Dian Nugraha, ST., MT.', 'MULTIMEDIA', 'Secondary'),
('DS', 'Dhebys Suryani, S.Kom., MT', 'CERDAS', 'Secondary'),
('APK', 'Annisa Puspa Kirana., M.Kom', 'CERDAS', 'Secondary'),
('DOD', 'Dodit Suprianto SKom. MT.', 'CERDAS', 'Secondary'),
('TOM', 'Faisal Rahutomo, ST., M.Kom., Dr.Eng.', 'SI', 'Secondary'),
('ANR', 'Anugrah Nur Rahmanto, S.Sn., M.Ds.', 'SI', 'Secondary'),
('MAH', 'Muhammad Afif Hendrawan.,S.Kom.', 'MULTIMEDIA', 'Secondary'),
('KPA', 'Deddy Kusbianto PA, Ir., M.Mkom.', 'CERDAS', 'Secondary'),
('RDA', 'Rudy Ariyanto, ST., M.Cs.', 'CERDAS', 'Secondary'),
('NOP', 'Noprianto SKom., MEng.', 'CERDAS', 'Secondary'),
('DWI', 'Dwi Puspitasari, S.Kom., M.Kom.', 'SI', 'Secondary'),
('SIR', 'Siti Romlah, Dra., M.M.', 'JARINGAN', 'Secondary'),
('ATF', 'Annisa Taufika Firdausi, ST., MT.', 'SI', 'Secondary'),
('MQ', 'Mungki Astiningrum, ST., M.Kom.', 'MULTIMEDIA', 'Secondary'),
('CR', 'Cahya Rahmad, ST., M.Kom., Dr. Eng.', 'CERDAS', 'Secondary'),
('RAA', 'Rosa Andrie Asmara, ST., MT., Dr. Eng.', 'CERDAS', 'Secondary'),
('MIS', 'Milyun Ni\'ma Shoumi', 'CERDAS', 'Secondary'),
('DWW', 'Dimas Wahyu Wibowo, ST., MT.', 'SI', 'Secondary'),
('MSK', 'Muhammad Shulhan Khairy, S.Kom, M.Kom', 'JARINGAN', 'Secondary'),
('ANP', 'Agung Nugroho Pramudhita, S.T., M.T.', 'SI', 'Secondary'),
('ARP', 'Arief Prasetyo, S.Kom., M.Kom.', 'MULTIMEDIA', 'Secondary'),
('PPA', 'Putra Prima A., ST., M.Kom.', 'CERDAS', 'Secondary'),
('VIS', 'Candra Bella Vista, S.Kom., MT.', 'CERDAS', 'Secondary'),
('RID', 'Ariadi Retno Ririd, S.Kom., M.Kom.', 'SI', 'Secondary'),
('ERF', 'Erfan Rohadi, ST., M.Eng., Ph.D.', 'JARINGAN', 'Secondary'),
('YA', 'Yuri Ariyanto, S.Kom., M.Kom.', 'SI', 'Secondary'),
('LA', 'Luqman Affandi, S.Kom., MMSI', 'CERDAS', 'Secondary'),
('YY', 'Yoppy Yunhasnawa, S.ST., M.Sc.', 'CERDAS', 'Secondary'),
('HJT', 'Budi Harijanto, ST., M.MKom.', 'JARINGAN', 'Secondary'),
('UN', 'Usman Nurhasan, S.Kom., MT.', 'SI', 'Secondary'),
('GAP', 'Grezio Arifiyah P. S.Kom., M.Kom', 'MULTIMEDIA', 'Secondary'),
('IDW', 'Indra Dharma Wijaya, ST., M.MT.', 'CERDAS', 'Secondary'),
('RDM', 'Retno Damayanti, S.Pd', 'CERDAS', 'Secondary'),
('ZUL', 'Ahmadi Yuli Ananta, ST., M.M.', 'JARINGAN', 'Secondary'),
('RR', 'Ridwan Rismanto, SST., M.Kom.', 'SI', 'Secondary'),
('ROW', 'Rokhimatul Wakhidah', 'CERDAS', 'Tertiary');

-- --------------------------------------------------------

--
-- Table structure for table `tb_lec_status`
--

CREATE TABLE `tb_lec_status` (
  `code` varchar(3) DEFAULT NULL,
  `name` varchar(42) DEFAULT NULL,
  `status` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_lec_status`
--

INSERT INTO `tb_lec_status` (`code`, `name`, `status`) VALUES
('', '', ''),
('AB', 'Ahmad Bahauddin', 'MKU'),
('ACH', 'Abdul Chalim SAg., MPd.I', 'MKU'),
('ADE', 'Ade Ismail', ' '),
('AFN', 'Ane Fany Novitasari', 'MKU'),
('ANP', 'Agung Nugroho Pramudhita, S.T., M.T.', 'CPNS/Kontrak'),
('ANR', 'Anugrah Nur Rahmanto, S.Sn., M.Ds.', 'CPNS/Kontrak'),
('APK', 'Annisa Puspa Kirana., M.Kom', 'CPNS/Kontrak'),
('ARI', 'Ariyanti, SH,.MH', 'LB'),
('ARP', 'Arief Prasetyo, S.Kom., M.Kom.', 'PNS'),
('ARS', 'Arie Rachmad Syulistyo, S.Kom., M.Kom', 'CPNS/Kontrak'),
('ARW', 'Arwin Sumari ST., MT., DR.', 'LB'),
('ASA', 'Ashri Shabrina Afrah SST., MT.', 'LB'),
('ATF', 'Annisa Taufika Firdausi, ST., MT.', 'CPNS/Kontrak'),
('ATQ', 'Atiqah Nurul Asri, S.Pd., M.Pd.', 'PNS'),
('BGS', 'Bagas Satya Dian Nugraha, ST., MT.', 'CPNS/Magang'),
('BSA', 'Banni Satria Andoko, S. Kom., M.MSI', 'PNS'),
('CDR', 'Candrasena Setiadi, ST., M.MT', 'Kontrak'),
('CR', 'Cahya Rahmad, ST., M.Kom., Dr. Eng.', 'PNS'),
('DHS', 'Dian Hanifudin Subhi, S.Kom., M.Kom.', 'CPNS/Kontrak'),
('DMR', 'Diana Mayangsari Ramadhani, SST', 'LB'),
('DOD', 'Dodit Suprianto SKom. MT.', 'Kontrak'),
('DRY', 'Dika Rizky Yunianto, S.Kom, M.Kom', 'CPNS/Kontrak'),
('DS', 'Dhebys Suryani, S.Kom., MT', 'PNS'),
('DSE', 'Deasy Sandhya Elya Ikawati, S.Si, M. Si', 'Kontrak'),
('DWI', 'Dwi Puspitasari, S.Kom., M.Kom.', 'PNS'),
('DWW', 'Dimas Wahyu Wibowo, ST., MT.', 'PNS'),
('ELA', 'Eka Larasati Amalia, S.ST., MT.', 'PNS'),
('END', 'Endah Lestari SH., MHum.', 'MKU'),
('ENH', 'Elok Nur Hamdana, S.T., M.T', 'CPNS/Kontrak'),
('ERF', 'Erfan Rohadi, ST., M.Eng., Ph.D.', 'PNS'),
('ESA', 'Ely Setyo Astuti, ST., MT.', 'PNS'),
('ESS', 'Endah Septa Sintiya. SPd., MKom.', 'LB'),
('FPR', 'Farid Angga Pribadi, S.Kom.,M.Kom', 'LB'),
('FRP', 'Frihandhika Permana SPd., MKom.', 'LB'),
('FU', 'Farida Ulfa, S.Pd., M.Pd.', 'Kontrak'),
('FUM', 'Faiz Ushbah Mubarok, S.Pd., M.Pd.', 'CPNS/Magang'),
('GAP', 'Grezio Arifiyah P. S.Kom., M.Kom', 'LB'),
('GBP', 'Gunawan Budi Prasetyo, ST., MMT., Ph.D.', 'PNS'),
('GPR', 'Galih Putra Riatma, S.St.', 'LB'),
('HAR', 'M. Hasyim Ratsanjani', 'CPNS / Magang'),
('HED', 'Habibie Ed Dien, MT.', 'CPNS/Magang'),
('HJT', 'Budi Harijanto, ST., M.MKom.', 'PNS'),
('HP', 'Hendra Pradibta, SE., M.Sc.', 'PNS'),
('HRS', 'Hairus', 'MKU'),
('IAM', 'Irsyad Arif Mashudi, M.Kom', 'CPNS/Magang'),
('IDW', 'Indra Dharma Wijaya, ST., M.MT.', 'PNS'),
('IFR', 'Imam Fahrur Rozi, ST., MT.', 'PNS'),
('IKP', 'Ika Kusumaning Putri, MT.', 'CPNS/Magang'),
('IN', 'Immah Inayati SKom., MKom., MBA.', 'LB'),
('IRA', 'Dyah Ayu Irawati, ST., M.Cs.', 'PNS'),
('IWP', 'Irna Wulan Palupi SH, M.Kn', 'LB'),
('JAS', 'Jasmine Anting Soraya', 'MKU'),
('KPA', 'Deddy Kusbianto PA, Ir., M.Mkom.', 'PNS'),
('KSB', 'Kadek Suarjuna Batubulan, S.Kom, MT', 'CPNS/Kontrak'),
('LA', 'Luqman Affandi, S.Kom., MMSI', 'PNS'),
('MA', 'Moh. Amin', 'MKU'),
('MAH', 'Muhammad Afif Hendrawan.,S.Kom.', 'CPNS/Kontrak'),
('MEA', 'Meyti Eka Apriyani ST., MT.', 'CPNS/Kontrak'),
('MIS', 'Milyun Ni\'ma Shoumi', 'CPNS/Magang'),
('MM', 'Mustika Mentari, S.Kom., M.Kom', 'CPNS/Kontrak'),
('MMH', 'Mamluatul Hani\'ah', 'CPNS/Magang'),
('MMU', 'Mohammad Muallif, MAg.', 'MKU'),
('MQ', 'Mungki Astiningrum, ST., M.Kom.', 'PNS'),
('MS', 'M Sinal', 'MKU'),
('MSK', 'Muhammad Shulhan Khairy, S.Kom, M.Kom', 'CPNS/Kontrak'),
('MUP', 'Muhammad Unggul Pamenang, S.St., M.T.', 'Kontrak'),
('MZA', 'Moch. Zawaruddin Abdullah, S.ST., M.Kom', 'CPNS/Magang'),
('NOP', 'Noprianto SKom., MEng.', 'CPNS/Magang'),
('NUR', 'Nurzizah', 'MKU'),
('ODT', 'Odhitya Desta Triswidrananta, S.Pd., M.Pd.', 'Kontrak'),
('OKE', 'Ekojono, ST., M.Kom.', 'PNS'),
('PPA', 'Putra Prima A., ST., M.Kom.', 'PNS'),
('PYS', 'Pramana Yoga Saputra, S.Kom., MMT.', 'PNS'),
('QH', 'Qonitatul Hasanah, S.ST', 'LB'),
('RAA', 'Rosa Andrie Asmara, ST., MT., Dr. Eng.', 'PNS'),
('RB', 'Robby Anggriawan SE., ME.', 'Kontrak'),
('RDA', 'Rudy Ariyanto, ST., M.Cs.', 'PNS'),
('RDM', 'Retno Damayanti, S.Pd', 'CPNS/Kontrak'),
('RDN', 'Rizdania ST., MKom.', 'LB'),
('RID', 'Ariadi Retno Ririd, S.Kom., M.Kom.', 'PNS'),
('RIZ', 'Rizky Ardiansyah, S.Kom., MT.', 'Kontrak'),
('RKA', 'Rakhmat Arianto', 'CPNS / Magang'),
('ROW', 'Rokhimatul Wakhidah', 'CPNS/Magang'),
('RR', 'Ridwan Rismanto, SST., M.Kom.', 'PNS'),
('RWS', 'Rawansyah., Drs., M.Pd.', 'PNS'),
('SBS', 'Satrio Binusa S, SS, M.Pd', 'Kontrak'),
('SES', 'Septian Enggar Sukmana, S.Pd., M.T', 'CPNS/Magang'),
('SIR', 'Siti Romlah, Dra., M.M.', 'Kontrak'),
('SMU', 'Shohib Muslim', 'MKU'),
('SNA', 'Sofyan Noor Arief, S.ST., M.Kom.', 'CPNS/Kontrak'),
('TAW', 'Triastana Anang Wibawa, ST., MT.', 'LB'),
('TOM', 'Faisal Rahutomo, ST., M.Kom., Dr.Eng.', 'PNS'),
('UDR', 'Ulla Delfana Rosiani, ST., MT.', 'PNS'),
('UN', 'Usman Nurhasan, S.Kom., MT.', 'PNS'),
('VAH', 'Vipkas Al Hadid Firdaus, ST,. MT', 'CPNS/Kontrak'),
('VAL', 'Vivin Ayu Lestari, S.Pd', 'CPNS/Kontrak'),
('VIS', 'Candra Bella Vista, S.Kom., MT.', 'CPNS/Magang'),
('VNW', 'Vivi Nur Wijayaningrum, S.Kom, M.Kom', 'CPNS/Kontrak'),
('VS', 'Very Sugiarto, S.Pd', 'LB'),
('WID', 'Widaningsih Condrowardhani, SH, MH.', 'PNS'),
('WIS', 'Wilda Imama Sabilla', 'CPNS/Magang'),
('YA', 'Yuri Ariyanto, S.Kom., M.Kom.', 'PNS'),
('YP', 'Yushintia Pramitarini, S.ST., MT.', 'Kontrak'),
('YS', 'Yusuf Suprapto', 'MKU'),
('YWS', 'Yan Watequlis Syaifuddin, ST., M.MT.', 'PNS'),
('YY', 'Yoppy Yunhasnawa, S.ST., M.Sc.', 'CPNS/Kontrak'),
('ZUL', 'Ahmadi Yuli Ananta, ST., M.M.', 'PNS');

-- --------------------------------------------------------

--
-- Table structure for table `tb_position`
--

CREATE TABLE `tb_position` (
  `code` varchar(3) DEFAULT NULL,
  `position` varchar(57) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_position`
--

INSERT INTO `tb_position` (`code`, `position`, `year`, `semester`) VALUES
('ZUL', '', '2019', 'Odd'),
('RID', '', '2019', 'Odd'),
('ARP', 'Ka.Lab. Sistem Komputer dan  Jaringan', '2019', 'Odd'),
('ATQ', 'KaPokJar. MK. MKU, Wajib, dan Penunjang D4', '2019', 'Odd'),
('BSA', '', '2019', 'Odd'),
('HJT', 'Ka. Lab. Informatika Dasar', '2019', 'Odd'),
('CR', '', '2019', 'Odd'),
('KPA', 'Ka. Lab. Project', '2019', 'Odd'),
('DS', '', '2019', 'Odd'),
('DWW', 'Ka. Lab. Image dan Graphics', '2019', 'Odd'),
('DWI', 'KaPokJar. MK. Keahlian D4', '2019', 'Odd'),
('IRA', '', '2019', 'Odd'),
('ELA', 'KaPokJar MK. Inti D3 ', '2019', 'Odd'),
('OKE', 'KaPokJar MK. Informatika Dasar D3', '2019', 'Odd'),
('ESA', '', '2019', 'Odd'),
('ERF', 'Ka. Lab. SIstem Informasi', '2019', 'Odd'),
('TOM', '', '2019', 'Odd'),
('GBP', 'Ka. Lab. Sistem Cerdas', '2019', 'Odd'),
('HP', '', '2019', 'Odd'),
('IFR', '', '2019', 'Odd'),
('IDW', 'Ka. Lab. Basisdata', '2019', 'Odd'),
('LA', 'KaPokJar. MK. Keahlian D3', '2019', 'Odd'),
('MQ', 'KaPokJar MK. Informatika Dasar D4', '2019', 'Odd'),
('PYS', 'Ka. Lab. Pengembangan Inkubator Bisnis Berbasis Teknologi', '2019', 'Odd'),
('PPA', 'KaPokJar MK Inti D4', '2019', 'Odd'),
('RWS', 'KaPokJar. MK. Umum, Wajib dan Penunjang D3', '2019', 'Odd'),
('RR', 'Ka. Lab. Rekayasa Perangkat Lunak', '2019', 'Odd'),
('RAA', '', '2019', 'Odd'),
('RDA', '', '2019', 'Odd'),
('UDR', 'Ka. Lab. Visi Komputer', '2019', 'Odd'),
('UN', 'Ka. Lab. Sistem Cerdas', '2019', 'Odd'),
('WID', '', '2019', 'Odd'),
('YWS', '', '2019', 'Odd'),
('YA', 'Ka. Lab. Sistem Informasi', '2019', 'Odd'),
('ANP', '', '2019', 'Odd'),
('APK', '', '2019', 'Odd'),
('ATF', '', '2019', 'Odd'),
('ANR', '', '2019', 'Odd'),
('ARS', '', '2019', 'Odd'),
('DHS', '', '2019', 'Odd'),
('DRY', '', '2019', 'Odd'),
('ENH', '', '2019', 'Odd'),
('KSB', '', '2019', 'Odd'),
('MEA', '', '2019', 'Odd'),
('MAH', '', '2019', 'Odd'),
('MSK', '', '2019', 'Odd'),
('MM', '', '2019', 'Odd'),
('RDM', '', '2019', 'Odd'),
('SNA', '', '2019', 'Odd'),
('VAH', '', '2019', 'Odd'),
('VNW', '', '2019', 'Odd'),
('VAL', '', '2019', 'Odd'),
('YY', '', '2019', 'Odd'),
('ADE', '', '2019', 'Odd'),
('BGS', '', '2019', 'Odd'),
('VIS', '', '2019', 'Odd'),
('FUM', '', '2019', 'Odd'),
('HED', '', '2019', 'Odd'),
('IKP', '', '2019', 'Odd'),
('IAM', '', '2019', 'Odd'),
('HAR', '', '2019', 'Odd'),
('MMH', '', '2019', 'Odd'),
('MIS', '', '2019', 'Odd'),
('MZA', '', '2019', 'Odd'),
('NOP', '', '2019', 'Odd'),
('RKA', '', '2019', 'Odd'),
('ROW', '', '2019', 'Odd'),
('SES', '', '2019', 'Odd'),
('WIS', '', '2019', 'Odd'),
('CDR', '', '2019', 'Odd'),
('DSE', '', '2019', 'Odd'),
('DOD', '', '2019', 'Odd'),
('FU', '', '2019', 'Odd'),
('MUP', '', '2019', 'Odd'),
('ODT', '', '2019', 'Odd'),
('RIZ', '', '2019', 'Odd'),
('SBS', '', '2019', 'Odd'),
('SIR', '', '2019', 'Odd'),
('YP', '', '2019', 'Odd'),
('RB', '', '2019', 'Odd'),
('AB', '', '2019', 'Odd'),
('AFN', '', '2019', 'Odd'),
('END', '', '2019', 'Odd'),
('HRS', '', '2019', 'Odd'),
('JAS', '', '2019', 'Odd'),
('MS', '', '2019', 'Odd'),
('MA', '', '2019', 'Odd'),
('SMU', '', '2019', 'Odd'),
('YS', '', '2019', 'Odd'),
('MMU', '', '2019', 'Odd'),
('ACH', '', '2019', 'Odd'),
('NUR', '', '2019', 'Odd'),
('ARW', '', '2019', 'Odd'),
('ARI', '', '2019', 'Odd'),
('DMR', '', '2019', 'Odd'),
('FPR', '', '2019', 'Odd'),
('GPR', '', '2019', 'Odd'),
('GAP', '', '2019', 'Odd'),
('IWP', '', '2019', 'Odd'),
('QH', '', '2019', 'Odd'),
('VS', '', '2019', 'Odd'),
('ASA', '', '2019', 'Odd'),
('ESS', '', '2019', 'Odd'),
('FRP', '', '2019', 'Odd'),
('IN', '', '2019', 'Odd'),
('RDN', '', '2019', 'Odd'),
('TAW', '', '2019', 'Odd'),
('', '', '', 'Odd');

-- --------------------------------------------------------

--
-- Table structure for table `tb_researcher`
--

CREATE TABLE `tb_researcher` (
  `code` varchar(3) DEFAULT NULL,
  `rs_id` varchar(1) DEFAULT NULL,
  `priority` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_researcher`
--

INSERT INTO `tb_researcher` (`code`, `rs_id`, `priority`) VALUES
('ZUL', '1', 'Primary'),
('RID', '2', 'Primary'),
('ARP', '3', 'Primary'),
('ATQ', '0', 'Primary'),
('BSA', '1', 'Primary'),
('HJT', '0', 'Primary'),
('KPA', '1', 'Primary'),
('DS', '4', 'Primary'),
('DWW', '4', 'Primary'),
('DWI', '2', 'Primary'),
('IRA', '1', 'Primary'),
('ELA', '1', 'Primary'),
('OKE', '4', 'Primary'),
('ESA', '0', 'Primary'),
('ERF', '1', 'Primary'),
('TOM', '2', 'Primary'),
('GBP', '0', 'Primary'),
('HP', '4', 'Primary'),
('IFR', '2', 'Primary'),
('IDW', '1', 'Primary'),
('LA', '3', 'Primary'),
('PYS', '2', 'Primary'),
('RWS', '1', 'Primary'),
('RR', '2', 'Primary'),
('RDA', '1', 'Primary'),
('UDR', '0', 'Primary'),
('UN', '4', 'Primary'),
('WID', '0', 'Primary'),
('YWS', '0', 'Primary'),
('YA', '3', 'Primary'),
('ANP', '2', 'Primary'),
('APK', '1', 'Primary'),
('ATF', '2', 'Primary'),
('ANR', '4', 'Primary'),
('ARS', '2', 'Primary'),
('DHS', '3', 'Primary'),
('DRY', '3', 'Primary'),
('ENH', '2', 'Primary'),
('KSB', '1', 'Primary'),
('MEA', '1', 'Primary'),
('MAH', '1', 'Primary'),
('MM', '3', 'Primary'),
('SNA', '2', 'Primary'),
('VAH', '3', 'Primary'),
('VNW', '0', 'Primary'),
('VAL', '0', 'Primary'),
('YY', '1', 'Primary'),
('ADE', '0', 'Primary'),
('BGS', '1', 'Primary'),
('FUM', '0', 'Primary'),
('HED', '4', 'Primary'),
('IKP', '2', 'Primary'),
('IAM', '0', 'Primary'),
('HAR', '0', 'Primary'),
('MMH', '2', 'Primary'),
('MZA', '1', 'Primary'),
('RKA', '0', 'Primary'),
('ROW', '0', 'Primary'),
('SES', '3', 'Primary'),
('WIS', '0', 'Primary'),
('CDR', '0', 'Primary'),
('DSE', '0', 'Primary'),
('DOD', '1', 'Primary'),
('FU', '1', 'Primary'),
('MUP', '0', 'Primary'),
('ODT', '0', 'Primary'),
('RIZ', '1', 'Primary'),
('SBS', '0', 'Primary'),
('YP', '1', 'Primary'),
('RB', '0', 'Primary'),
('AB', '0', 'Primary'),
('AFN', '0', 'Primary'),
('END', '0', 'Primary'),
('HRS', '0', 'Primary'),
('JAS', '0', 'Primary'),
('MS', '0', 'Primary'),
('MA', '0', 'Primary'),
('SMU', '0', 'Primary'),
('YS', '0', 'Primary'),
('MMU', '0', 'Primary'),
('ACH', '0', 'Primary'),
('NUR', '0', 'Primary'),
('ARW', '0', 'Primary'),
('ARI', '0', 'Primary'),
('DMR', '0', 'Primary'),
('FPR', '0', 'Primary'),
('GPR', '0', 'Primary'),
('GAP', '3', 'Primary'),
('IWP', '0', 'Primary'),
('QH', '0', 'Primary'),
('VS', '0', 'Primary'),
('ASA', '0', 'Primary'),
('ESS', '0', 'Primary'),
('FRP', '0', 'Primary'),
('IN', '0', 'Primary'),
('RDN', '0', 'Primary'),
('TAW', '0', 'Primary'),
('ZUL', '3', 'Secondary'),
('RID', '1', 'Secondary'),
('ARP', '4', 'Secondary'),
('ATQ', '0', 'Secondary'),
('BSA', '0', 'Secondary'),
('HJT', '3', 'Secondary'),
('CR', '2', 'Secondary'),
('KPA', '2', 'Secondary'),
('DS', '2', 'Secondary'),
('DWW', '1', 'Secondary'),
('DWI', '1', 'Secondary'),
('IRA', '2', 'Secondary'),
('ELA', '2', 'Secondary'),
('OKE', '2', 'Secondary'),
('ESA', '0', 'Secondary'),
('ERF', '3', 'Secondary'),
('TOM', '1', 'Secondary'),
('GBP', '0', 'Secondary'),
('HP', '1', 'Secondary'),
('IFR', '1', 'Secondary'),
('IDW', '2', 'Secondary'),
('LA', '2', 'Secondary'),
('MQ', '4', 'Secondary'),
('PYS', '1', 'Secondary'),
('PPA', '2', 'Secondary'),
('RR', '1', 'Secondary'),
('RAA', '2', 'Secondary'),
('RDA', '2', 'Secondary'),
('UDR', '0', 'Secondary'),
('UN', '1', 'Secondary'),
('WID', '0', 'Secondary'),
('YWS', '0', 'Secondary'),
('YA', '1', 'Secondary'),
('ANP', '1', 'Secondary'),
('APK', '2', 'Secondary'),
('ATF', '1', 'Secondary'),
('ANR', '1', 'Secondary'),
('DHS', '1', 'Secondary'),
('DRY', '2', 'Secondary'),
('ENH', '0', 'Secondary'),
('KSB', '2', 'Secondary'),
('MEA', '2', 'Secondary'),
('MAH', '4', 'Secondary'),
('MSK', '3', 'Secondary'),
('RDM', '2', 'Secondary'),
('VNW', '0', 'Secondary'),
('VAL', '0', 'Secondary'),
('YY', '2', 'Secondary'),
('ADE', '0', 'Secondary'),
('BGS', '4', 'Secondary'),
('VIS', '2', 'Secondary'),
('FUM', '0', 'Secondary'),
('HED', '0', 'Secondary'),
('IKP', '4', 'Secondary'),
('IAM', '0', 'Secondary'),
('HAR', '0', 'Secondary'),
('MMH', '1', 'Secondary'),
('MIS', '2', 'Secondary'),
('MZA', '0', 'Secondary'),
('NOP', '2', 'Secondary'),
('RKA', '0', 'Secondary'),
('ROW', '4', 'Secondary'),
('SES', '0', 'Secondary'),
('WIS', '1', 'Secondary'),
('CDR', '0', 'Secondary'),
('DSE', '0', 'Secondary'),
('DOD', '2', 'Secondary'),
('FU', '2', 'Secondary'),
('MUP', '0', 'Secondary'),
('ODT', '0', 'Secondary'),
('RIZ', '2', 'Secondary'),
('SBS', '0', 'Secondary'),
('SIR', '3', 'Secondary'),
('YP', '4', 'Secondary'),
('RB', '0', 'Secondary'),
('AB', '0', 'Secondary'),
('AFN', '0', 'Secondary'),
('END', '0', 'Secondary'),
('HRS', '0', 'Secondary'),
('JAS', '0', 'Secondary'),
('MS', '0', 'Secondary'),
('MA', '0', 'Secondary'),
('SMU', '0', 'Secondary'),
('YS', '0', 'Secondary'),
('MMU', '0', 'Secondary'),
('ACH', '0', 'Secondary'),
('NUR', '0', 'Secondary'),
('ARW', '0', 'Secondary'),
('ARI', '0', 'Secondary'),
('DMR', '0', 'Secondary'),
('FPR', '0', 'Secondary'),
('GPR', '0', 'Secondary'),
('GAP', '4', 'Secondary'),
('IWP', '0', 'Secondary'),
('QH', '0', 'Secondary'),
('VS', '0', 'Secondary'),
('ASA', '0', 'Secondary'),
('ESS', '0', 'Secondary'),
('FRP', '0', 'Secondary'),
('IN', '0', 'Secondary'),
('RDN', '0', 'Secondary'),
('TAW', '0', 'Secondary'),
('ROW', '2', 'Tertiary');

-- --------------------------------------------------------

--
-- Table structure for table `tb_research_category`
--

CREATE TABLE `tb_research_category` (
  `rs_id` varchar(1) NOT NULL,
  `research` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_research_category`
--

INSERT INTO `tb_research_category` (`rs_id`, `research`) VALUES
('0', 'None'),
('1', 'SI'),
('2', 'CERDAS'),
('3', 'JARINGAN'),
('4', 'MULTIMEDIA');

-- --------------------------------------------------------

--
-- Table structure for table `tb_research_sub_category`
--

CREATE TABLE `tb_research_sub_category` (
  `sub_id` int(2) NOT NULL,
  `rs_id` varchar(1) DEFAULT NULL,
  `research_sub_category` varchar(37) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_research_sub_category`
--

INSERT INTO `tb_research_sub_category` (`sub_id`, `rs_id`, `research_sub_category`) VALUES
(1, '1', 'Data Scalability and Analytics'),
(2, '1', 'AI'),
(3, '1', 'Big Data'),
(4, '1', 'Information retrieval'),
(5, '1', 'Expert System'),
(6, '1', 'Data Mining'),
(7, '1', 'Text Mining'),
(8, '1', 'Business Intelligent'),
(9, '2', 'Cloud computing'),
(10, '2', 'IoT'),
(11, '2', 'Security data'),
(12, '2', 'Cyber security'),
(13, '2', 'Virtualisasi'),
(14, '2', 'Network technology'),
(15, '2', 'Wireless technology'),
(16, '2', 'IT Forensic pada jaringan'),
(17, '2', 'Cyber security'),
(18, '2', 'Enkripsi'),
(19, '3', 'Pattern Recognition -Object and image'),
(20, '3', 'Pattern Recognition -Biometric'),
(21, '3', 'Pattern Recognition -Remote sensing'),
(22, '3', 'Watermarking'),
(23, '3', 'Kompresi'),
(24, '3', 'Pengolahan citra'),
(25, '3', 'Transformasi'),
(26, '3', 'Filtering'),
(27, '3', 'Morphology'),
(28, '4', 'System Integration and Architecture'),
(29, '4', 'Information management'),
(30, '4', 'GIS'),
(31, '4', 'Global Professional Practice'),
(32, '4', 'Sistem peramalan'),
(33, '4', 'Sistem Pendukung Keputusan'),
(34, '4', 'E-business'),
(35, '4', 'CRM');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rps_sap`
--

CREATE TABLE `tb_rps_sap` (
  `subject_code` varchar(10) DEFAULT NULL,
  `RPS` varchar(34) DEFAULT NULL,
  `SAP` varchar(33) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_rps_sap`
--

INSERT INTO `tb_rps_sap` (`subject_code`, `RPS`, `SAP`) VALUES
('RIF191004', 'RPS_RIF191004_Aplikom', NULL),
('RIF175004', 'RPS_RIF175004_KeamananJarkom', NULL),
('RIF183007', 'RPS_RIF183007_PrakJarKom', NULL),
('RIF183006', 'RPS_RIF183006_Jarkom', NULL),
('RIF183001', 'RPS_RIF183001_DesainAntarmuka', NULL),
('RTI183005', 'RPS_RTI183005_BasisDataLanjut', NULL),
('RTI192003', 'RPS_RTI192003_BING2', NULL),
('RIF191007', 'RPS_RIF191007_MatematikaDiskrit', NULL),
('RTI1920010', 'RPS_RTI1920010_PrakASD', NULL),
('RTI191009', 'RPS_RTI191009_DasPro', NULL),
('RIF1910010', 'RPS_RIF1910010_PrakDasPro', NULL),
('RTI191001', 'RPS_RTI191001_Pancasila', NULL),
('RIF191005', 'RPS_RIF191005_BING', 'SAP_RIF191005_BING'),
('RIF191006', 'RPS_RIF191006_KonsepTI', 'SAP_RIF191006_KonsepTI'),
('RIF183008', 'RPS_RIF183008_PBO', 'SAP_RIF183008_PBO'),
('RIF183009', 'RPS_RIF183009_PrakPBO', 'SAP_RIF183009_PrakPBO'),
('RIF175005', 'RPS_RIF175005_ProposalLaporanAkhir', 'SAP_RIF175005_LaporanAkhir'),
('RTI183003', 'RPS_RTI183003_KecerdasanBuatan', 'SAP_RTI183003_KecerdasanBuatan'),
('RTI191002', 'RPS_RTI191002_TeknikDokumentasi', 'SAP_RTI191002_TekDok'),
('RTI175006', 'RPS_RTI175006_PemrogramanJaringan', 'SAP_RTI175006_PemrogramanJaringan'),
('RTI175002', 'RPS_RTI175002_Proyek2', 'SAP_RTI175002_Proyek2'),
('RTI191003', 'RPS_RTI191003_IlmuKomunikasi', 'SAP_RTI191003_Ilkom'),
('RTI191007', 'RPS_RTI191007_MatematikaDiskrit', 'SAP_RTI171007_MatematikaDiskrit'),
('RTI184006', 'RPS_RTI184006_WebLanjut', 'SAP_RTI184006_PWL'),
('RTI191008', 'RPS_RTI191008_K3', 'SAP_RTI191008_K3'),
('RTI184001', 'RPS_RTI184001_SistemInformasi', 'SAP_RTI184001_SistemInformasi');

-- --------------------------------------------------------

--
-- Table structure for table `tb_subjects`
--

CREATE TABLE `tb_subjects` (
  `subject_code` varchar(10) NOT NULL,
  `subject` varchar(53) DEFAULT NULL,
  `credit_hour` varchar(1) DEFAULT NULL,
  `TP` varchar(3) DEFAULT NULL,
  `semester` varchar(1) DEFAULT NULL,
  `level` varchar(1) DEFAULT NULL,
  `major` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_subjects`
--

INSERT INTO `tb_subjects` (`subject_code`, `subject`, `credit_hour`, `TP`, `semester`, `level`, `major`, `year`) VALUES
('RIF175001', 'Sistem Terdistribusi ', '3', 'P', '5', '3', 'D3', '2017'),
('RIF175002', 'Proyek 2', '4', 'P', '5', '3', 'D3', '2017'),
('RIF175003', 'Kecerdasan Buatan', '2', 'P', '5', '3', 'D3', '2017'),
('RIF175004', 'Keamanan Sistem Dan Jaringan Komputer', '3', 'P', '5', '3', 'D3', '2017'),
('RIF175005', 'Proposal Laporan Akhir', '2', 'P', '5', '3', 'D3', '2017'),
('RIF175006', 'Pemrograman Jaringan', '3', 'P', '5', '3', 'D3', '2017'),
('RIF176001', 'Digital Enterpreneurship', '2', 'T', '6', '3', 'D3', '2017'),
('RIF176002', 'Bahasa Inggris Persiapan Kerja', '2', 'T', '6', '3', 'D3', '2017'),
('RIF176003', 'Etika Profesi Bidang TI', '2', 'T', '6', '3', 'D3', '2017'),
('RIF176004', 'Praktek Kerja Lapangan', '3', 'P', '6', '3', 'D3', '2017'),
('RIF176005', 'Laporan Akhir', '6', 'P', '6', '3', 'D3', '2017'),
('RIF176006', 'Bahasa Indonesia', '', '', '', '', '', ''),
('RIF183001', 'Desain Antarmuka', '2', 'T', '3', '2', 'D3', '2018'),
('RIF183002', 'Bahasa Inggris 2', '2', 'T', '3', '2', 'D3', '2018'),
('RIF183003', 'Pemrograman Web Lanjut', '3', 'P', '3', '2', 'D3', '2018'),
('RIF183004', 'Sistem Informasi', '2', 'T', '3', '2', 'D3', '2018'),
('RIF183005', 'Basis Data Lanjut', '3', 'P', '3', '2', 'D3', '2018'),
('RIF183006', 'Jaringan Komputer', '2', 'T', '3', '2', 'D3', '2018'),
('RIF183007', 'Praktikum Jaringan Komputer', '2', 'P', '3', '2', 'D3', '2018'),
('RIF183008', 'Pemrograman Berbasis Objek', '2', 'T', '3', '2', 'D3', '2018'),
('RIF183009', 'Praktikum Pemrograman Berbasis Objek', '2', 'P', '3', '2', 'D3', '2018'),
('RIF184001', 'Komputasi Multimedia', '2', 'T', '4', '2', 'D3', '2018'),
('RIF184002', 'Pemrograman Mobile', '3', 'P', '4', '2', 'D3', '2018'),
('RIF184003', 'Manajemen Proyek', '2', 'T', '4', '2', 'D3', '2018'),
('RIF184004', 'Proyek 1', '3', 'P', '4', '2', 'D3', '2018'),
('RIF184005', 'Manajemen Jaringan Komputer', '2', 'P', '4', '2', 'D3', '2018'),
('RIF184006', 'E-Business', '2', 'T', '4', '2', 'D3', '2018'),
('RIF184007', 'Sistem Manajemen Basis Data', '3', 'P', '4', '2', 'D3', '2018'),
('RIF191001', 'Pancasila ', '2', 'T', '1', '1', 'D3', '2019'),
('RIF1910010', 'Praktikum Dasar Pemrograman', '3', 'P', '1', '1', 'D3', '2019'),
('RIF191002', 'Teknik Dokumentasi', '2', 'T', '1', '1', 'D3', '2019'),
('RIF191003', 'Ilmu Komunikasi Dan Organisasi ', '2', 'T', '1', '1', 'D3', '2019'),
('RIF191004', 'Aplikasi Komputer Perkantoran ', '2', 'P', '1', '1', 'D3', '2019'),
('RIF191005', 'Bahasa Inggris 1', '2', 'T', '1', '1', 'D3', '2019'),
('RIF191006', 'Konsep Teknologi InformasI', '2', 'T', '1', '1', 'D3', '2019'),
('RIF191007', 'Matematika Diskrit', '2', 'T', '1', '1', 'D3', '2019'),
('RIF191008', 'Keselamatan Dan Kesehatan Kerja', '2', 'T', '1', '1', 'D3', '2019'),
('RIF191009', 'Dasar Pemrograman', '2', 'T', '1', '1', 'D3', '2019'),
('RIF192001', 'Agama', '2', 'T', '2', '1', 'D3', '2019'),
('RIF1920010', 'Praktikum Struktur Data', '2', 'P', '2', '1', 'D3', '2019'),
('RIF192002', 'Kewarganegaraan', '2', 'T', '2', '1', 'D3', '2019'),
('RIF192003', 'Penulisan Ilmiah', '2', 'T', '2', '1', 'D3', '2019'),
('RIF192004', 'Sistem Operasi', '2', 'T', '2', '1', 'D3', '2019'),
('RIF192005', 'Pengembangan Perangkat Lunak Berbasis Objek', '2', 'T', '2', '1', 'D3', '2019'),
('RIF192006', 'Desain & Pemrograman Web', '3', 'P', '2', '1', 'D3', '2019'),
('RIF192007', 'Basis Data', '2', 'T', '2', '1', 'D3', '2019'),
('RIF192008', 'Praktikum Basis Data', '2', 'P', '2', '1', 'D3', '2019'),
('RIF192009', 'Struktur Data', '2', 'T', '2', '1', 'D3', '2019'),
('RTI161009', 'Praktikum Algoritma dan Struktur Data', '2', 'P', '1', '1', 'D4', '2016'),
('RTI165005', 'Keamanan Sistem dan Jaringan Komputer', '3', 'T', '5', '3', 'D4', '2016'),
('RTI167001', 'Manajemen Proyek', '2', 'T', '7', '4', 'D4', '2016'),
('RTI167002', 'Keamanan Informasi', '2', 'T', '7', '4', 'D4', '2016'),
('RTI167003', 'E-Business', '2', 'T', '7', '4', 'D4', '2016'),
('RTI167004', 'Pemrograman Platform Bergerak (Mobile)', '3', 'P', '7', '4', 'D4', '2016'),
('RTI167005', 'Sistem Pendukung Keputusan', '4', 'T/P', '7', '4', 'D4', '2016'),
('RTI167006', 'Pengolahan Citra Dijital', '4', 'T/P', '7', '4', 'D4', '2016'),
('RTI167007', 'Proyek Tingkat III', '3', 'P', '7', '4', 'D4', '2016'),
('RTI168001', 'Issue Profesional dan Sosial Teknologi Informasi (TI)', '2', 'T', '8', '4', 'D4', '2016'),
('RTI168002', 'Metodologi Penelitian', '2', 'T', '8', '4', 'D4', '2016'),
('RTI168003', 'Praktek Kerja Lapangan', '4', 'P', '8', '4', 'D4', '2016'),
('RTI168004', 'Tugas Akhir', '6', 'P', '8', '4', 'D4', '2016'),
('RTI175001', 'E-Business ', '2', 'T', '5', '3', 'D4', '2017'),
('RTI175002', ' Proyek 2 ', '4', 'P', '5', '3', 'D4', '2017'),
('RTI175003', ' Pemrograman Mobile ', '3', 'P', '5', '3', 'D4', '2017'),
('RTI175004', ' Data Warehouse ', '3', 'P', '5', '3', 'D4', '2017'),
('RTI175005', ' Pengujian Perangkat Lunak ', '2', 'T', '5', '3', 'D4', '2017'),
('RTI175006', ' Pemrograman Jaringan ', '3', 'P', '5', '3', 'D4', '2017'),
('RTI176001 ', 'Digital Enterpreneurship ', '2', 'T', '6', '3', 'D4', '2017'),
('RTI176002 ', 'Sistem Pendukung Keputusan ', '3', 'P', '6', '3', 'D4', '2017'),
('RTI176003', 'Teknologi Data', '3', 'P', '6', '3', 'D4', '2017'),
('RTI176004', 'Komputasi Multimedia', '2', 'T', '6', '3', 'D4', '2017'),
('RTI176005', 'Internet Of Things', '3', 'P', '6', '3', 'D4', '2017'),
('RTI176006', 'Pengolahan Citra Dan Visi Komputer ', '3', 'P', '6', '3', 'D4', '2017'),
('RTI176007', 'Pemrograman Berbasis Framework ', '3', 'P', '6', '3', 'D4', '2017'),
('RTI183001', 'Desain Antarmuka', '2', 'T', '3', '2', 'D4', '2018'),
('RTI183002', 'Statistik Komputasi', '2', 'T', '3', '2', 'D4', '2018'),
('RTI183003', 'Kecerdasan Buatan', '2', 'P', '3', '2', 'D4', '2018'),
('RTI183004', 'Desain & Pemrograman Web', '2', 'P', '3', '2', 'D4', '2018'),
('RTI183005', 'Basis Data Lanjut', '3', 'P', '3', '2', 'D4', '2018'),
('RTI183006', 'Jaringan Komputer', '2', 'T', '3', '2', 'D4', '2018'),
('RTI183007', 'Praktikum Jaringan Komputer', '2', 'P', '3', '2', 'D4', '2018'),
('RTI183008', 'Pemrograman Berbasis Objek', '2', 'T', '3', '2', 'D4', '2018'),
('RTI183009', 'Praktikum Pemrograman Berbasis Objek', '2', 'P', '3', '2', 'D4', '2018'),
('RTI184001', 'Sistem Informasi', '2', 'T', '4', '2', 'D4', '2018'),
('RTI184002', 'Analisis Dan Desain Berorientasi Objek', '3', 'P', '4', '2', 'D4', '2018'),
('RTI184003', 'Manajemen Proyek', '2', 'T', '4', '2', 'D4', '2018'),
('RTI184004', 'Proyek 1', '3', 'P', '4', '2', 'D4', '2018'),
('RTI184005', 'Komputasi Kognitif', '2', 'P', '4', '2', 'D4', '2018'),
('RTI184006', 'Pemrograman Web Lanjut', '3', 'P', '4', '2', 'D4', '2018'),
('RTI184007', 'Sistem Manajemen Basis Data', '3', 'P', '4', '2', 'D4', '2018'),
('RTI191001', 'Pancasila ', '2', 'T', '1', '1', 'D4', '2019'),
('RTI1910010', 'Praktikum Dasar Pemrograman', '2', 'P', '1', '1', 'D4', '2019'),
('RTI191002', 'Teknik Dokumentasi ', '2', 'T', '1', '1', 'D4', '2019'),
('RTI191003', 'Ilmu Komunikasi Dan Organisasi ', '2', 'T', '1', '1', 'D4', '2019'),
('RTI191004', 'Aplikasi Komputer Perkantoran ', '2', 'P', '1', '1', 'D4', '2019'),
('RTI191005', 'Bahasa Inggris 1 ', '2', 'T', '1', '1', 'D4', '2019'),
('RTI191006', 'Konsep Teknologi Informasi ', '2', 'T', '1', '1', 'D4', '2019'),
('RTI191007', 'Matematika Diskrit', '2', 'T', '1', '1', 'D4', '2019'),
('RTI191008', 'Keselamatan Dan Kesehatan Kerja ', '2', 'T', '1', '1', 'D4', '2019'),
('RTI191009', 'Dasar Pemrograman', '2', 'T', '1', '1', 'D4', '2019'),
('RTI192001 ', 'Agama ', '2', 'T', '2', '1', 'D4', '2019'),
('RTI1920010', 'Praktikum Algoritma Dan Struktur Data ', '3', 'P', '2', '1', 'D4', '2019'),
('RTI192002', 'Kewarganegeraan ', '2', 'T', '2', '1', 'D4', '2019'),
('RTI192003', 'Bahasa Inggris 2', '2', 'T', '2', '1', 'D4', '2019'),
('RTI192004', 'Sistem Operasi ', '2', 'T', '2', '1', 'D4', '2019'),
('RTI192005', 'Rekayasa Perangkat Lunak ', '2', 'T', '2', '1', 'D4', '2019'),
('RTI192006', 'Aljabar Linier ', '2', 'T', '2', '1', 'D4', '2019'),
('RTI192007', 'Basis Data ', '2', 'T', '2', '1', 'D4', '2019'),
('RTI192008', 'Praktikum Basis Data ', '2', 'P', '2', '1', 'D4', '2019'),
('RTI192009', 'Algoritma Dan Struktur Data ', '2', 'T', '2', '1', 'D4', '2019');

-- --------------------------------------------------------

--
-- Table structure for table `tb_teaching_rules`
--

CREATE TABLE `tb_teaching_rules` (
  `code` varchar(3) DEFAULT NULL,
  `weekly_hour_quota` varchar(4) DEFAULT '0',
  `weekly_teaching_time` varchar(2) DEFAULT '0',
  `credit_hour` varchar(2) DEFAULT '0',
  `distribution` varchar(2) DEFAULT '0',
  `quota_19_20` varchar(2) DEFAULT '0',
  `distribution_19_20` varchar(2) DEFAULT '0',
  `amount_of_subjects` varchar(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_teaching_rules`
--

INSERT INTO `tb_teaching_rules` (`code`, `weekly_hour_quota`, `weekly_teaching_time`, `credit_hour`, `distribution`, `quota_19_20`, `distribution_19_20`, `amount_of_subjects`) VALUES
('ZUL', '24', '18', '6', '20', '18', '12', ''),
('RID', '24', '24', '12', '24', '24', '24', ''),
('ARP', '24', '24', '9', '24', '24', '24', ''),
('ATQ', '24', '23', '14', '24', '24', '24', ''),
('BSA', '0', '0', '0', '0', '0', '0', ''),
('HJT', '24', '21', '11', '24', '18', '15', ''),
('CR', '24', '24', '12', '22', '18', '18', ''),
('KPA', '24', '21', '9', '23', '24', '21', ''),
('DS', '24', '18', '12', '24', '24', '24', ''),
('DWW', '24', '24', '14', '24', '24', '24', ''),
('DWI', '24', '23', '12', '24', '24', '24', ''),
('IRA', '24', '22', '10', '24', '0', '0', ''),
('ELA', '24', '24', '13', '24', '24', '24', ''),
('OKE', '24', '27', '13', '24', '24', '23', ''),
('ESA', '0', '0', '0', '0', '0', '0', ''),
('ERF', '24', '20', '10', '20', '18', '16', ''),
('TOM', '24', '26', '14', '24', '24', '23', ''),
('GBP', '24', '23', '14', '24', '24', '24', ''),
('HP', '18', '24', '16', '24', '18', '17', ''),
('IFR', '18', '26', '14', '23', '18', '17', ''),
('IDW', '12', '24', '13', '14', '12', '12', ''),
('LA', '24', '24', '16', '24', '24', '23', ''),
('MQ', '22', '26', '14', '22', '24', '25', ''),
('PYS', '24', '25', '14', '24', '24', '24', ''),
('PPA', '24', '25', '9', '24', '24', '24', ''),
('RWS', '24', '24', '12', '22', '24', '24', ''),
('RR', '0', '24', '12', '24', '0', '0', ''),
('RAA', '16', '17', '8', '24', '16', '15', ''),
('RDA', '14', '15', '7', '22', '15', '15', ''),
('UDR', '6', '0', '0', '12', '12', '6', ''),
('UN', '24', '25', '11', '24', '24', '24', ''),
('WID', '21', '18', '12', '21', '21', '18', ''),
('YWS', '0', '0', '0', '0', '0', '0', ''),
('YA', '24', '26', '13', '24', '24', '24', ''),
('ANP', '24', '21', '10', '24', '16', '16', ''),
('APK', '24', '24', '12', '24', '16', '15', ''),
('ATF', '24', '12', '8', '24', '16', '15', ''),
('ANR', '24', '18', '12', '24', '16', '16', ''),
('ARS', '24', '23', '10', '24', '16', '17', ''),
('DHS', '24', '19', '7', '26', '16', '16', ''),
('DRY', '24', '25', '9', '24', '16', '18', ''),
('ENH', '24', '23', '12', '23', '16', '18', ''),
('KSB', '24', '23', '12', '24', '16', '22', ''),
('MEA', '24', '17', '9', '0', '16', '21', ''),
('MAH', '24', '21', '10', '24', '16', '24', ''),
('MSK', '24', '20', '10', '24', '16', '21', ''),
('MM', '24', '20', '8', '24', '16', '21', ''),
('RDM', '24', '24', '13', '24', '16', '22', ''),
('SNA', '24', '24', '11', '22', '16', '19', ''),
('VAH', '24', '23', '9', '21', '16', '16', ''),
('VNW', '24', '17', '10', '24', '16', '16', ''),
('VAL', '24', '18', '8', '24', '16', '17', ''),
('YY', '24', '18', '8', '24', '16', '18', ''),
('ADE', '24', '0', '0', '0', '12', '16', ''),
('BGS', '24', '0', '0', '18', '16', '18', ''),
('VIS', '12', '0', '0', '12', '12', '12', ''),
('FUM', '24', '0', '0', '15', '16', '12', ''),
('HED', '24', '0', '0', '18', '16', '17', ''),
('IKP', '24', '0', '0', '16', '16', '21', ''),
('IAM', '24', '0', '0', '16', '16', '24', ''),
('HAR', '24', '0', '0', '0', '12', '20', ''),
('MMH', '24', '0', '0', '17', '16', '15', ''),
('MIS', '24', '0', '0', '16', '16', '15', ''),
('MZA', '24', '0', '0', '18', '16', '21', ''),
('NOP', '24', '0', '0', '16', '16', '21', ''),
('RKA', '24', '12', '8', '0', '12', '16', ''),
('ROW', '24', '0', '0', '15', '16', '15', ''),
('SES', '24', '0', '0', '18', '16', '17', ''),
('WIS', '24', '0', '0', '16', '16', '15', ''),
('CDR', '24', '9', '6', '22', '0', '15', ''),
('DSE', '24', '15', '10', '22', '16', '16', ''),
('DOD', '24', '22', '12', '24', '16', '18', ''),
('FU', '24', '21', '11', '12', '16', '11', ''),
('MUP', '24', '0', '0', '24', '16', '22', ''),
('ODT', '24', '0', '0', '24', '16', '18', ''),
('RIZ', '24', '21', '10', '24', '16', '18', ''),
('SBS', '24', '12', '8', '24', '16', '7', ''),
('SIR', '12', '10', '6', '12', '16', '8', ''),
('YP', '24', '22', '10', '23', '16', '21', ''),
('RB', '8', '18', '12', '6', '0', '0', ''),
('AB', '24', '0', '0', '0', '0', '18', ''),
('AFN', '24', '0', '0', '0', '0', '12', ''),
('END', '0', '0', '0', '12', '0', '0', ''),
('HRS', '0', '10', '5', '0', '0', '18', ''),
('JAS', '0', '0', '0', '0', '0', '0', ''),
('MS', '0', '0', '0', '0', '0', '0', ''),
('MA', '0', '0', '0', '0', '0', '6', '1'),
('SMU', '0', '0', '0', '6', '0', '12', ''),
('YS', '0', '0', '0', '18', '0', '0', ''),
('MMU', '0', '0', '0', '0', '0', '0', ''),
('ACH', '0', '0', '0', '0', '0', '0', ''),
('NUR', '0', '0', '0', '0', '0', '0', ''),
('ARW', '24', '9', '6', '22', '0', '13', ''),
('ARI', '0', '15', '10', '21', '0', '0', ''),
('DMR', '0', '0', '0', '24', '0', '0', ''),
('FPR', '0', '0', '0', '24', '0', '0', ''),
('GPR', '24', '0', '0', '24', '0', '0', ''),
('GAP', '24', '0', '0', '22', '0', '0', ''),
('IWP', '0', '0', '0', '9', '0', '0', ''),
('QH', '24', '6', '3', '27', '0', '0', ''),
('VS', '0', '7', '4', '26', '0', '0', ''),
('ASA', '0', '0', '0', '22', '0', '0', ''),
('ESS', '0', '0', '0', '23', '0', '0', ''),
('FRP', '0', '0', '0', '23', '0', '0', ''),
('IN', '24', '0', '0', '22', '0', '0', ''),
('RDN', '24', '0', '0', '24', '0', '0', ''),
('TAW', '0', '0', '0', '12', '0', '0', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vu_class_schedule`
-- (See below for the actual view)
--
CREATE TABLE `vu_class_schedule` (
`code` varchar(3)
,`name` varchar(42)
,`subject` varchar(53)
,`subject_code` varchar(10)
,`class` varchar(15)
,`total_hour` decimal(32,0)
,`semester` int(1)
,`year` int(4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vu_contracts_lecturer`
-- (See below for the actual view)
--
CREATE TABLE `vu_contracts_lecturer` (
`code` varchar(3)
,`name` varchar(42)
,`subject` varchar(53)
,`subject_code` varchar(10)
,`contract_file` varchar(33)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vu_dpa`
-- (See below for the actual view)
--
CREATE TABLE `vu_dpa` (
`code` varchar(3)
,`name` varchar(42)
,`class_name` varchar(15)
,`year` int(4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vu_hour_distribution`
-- (See below for the actual view)
--
CREATE TABLE `vu_hour_distribution` (
`name` varchar(42)
,`subject` varchar(53)
,`class` varchar(15)
,`total_hour` decimal(32,0)
,`semester` int(1)
,`year` int(4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vu_lecturer_field`
-- (See below for the actual view)
--
CREATE TABLE `vu_lecturer_field` (
`code` varchar(3)
,`name` varchar(42)
,`field_of_study` varchar(5)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vu_lecturer_personal`
-- (See below for the actual view)
--
CREATE TABLE `vu_lecturer_personal` (
`code` varchar(3)
,`name` varchar(42)
,`status` varchar(13)
,`NIP` varchar(20)
,`NIDN` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vu_position_2018`
-- (See below for the actual view)
--
CREATE TABLE `vu_position_2018` (
`name` varchar(42)
,`position` varchar(57)
,`year` varchar(4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vu_position_2019`
-- (See below for the actual view)
--
CREATE TABLE `vu_position_2019` (
`code` varchar(3)
,`name` varchar(42)
,`position` varchar(57)
,`year` varchar(4)
,`semester` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vu_research`
-- (See below for the actual view)
--
CREATE TABLE `vu_research` (
`code` varchar(3)
,`name` varchar(42)
,`research` varchar(10)
,`priority` varchar(9)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vu_research_group_details`
-- (See below for the actual view)
--
CREATE TABLE `vu_research_group_details` (
`research` varchar(10)
,`research_sub_category` varchar(37)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vu_teachings`
-- (See below for the actual view)
--
CREATE TABLE `vu_teachings` (
`code` varchar(3)
,`name` varchar(42)
,`weekly_teaching_time` varchar(2)
,`weekly_hour_quota` varchar(4)
,`distribution_19_20` varchar(2)
,`quota_19_20` varchar(2)
);

-- --------------------------------------------------------

--
-- Structure for view `vu_class_schedule`
--
DROP TABLE IF EXISTS `vu_class_schedule`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vu_class_schedule`  AS  select `tb_lecturer`.`code` AS `code`,`tb_lecturer`.`name` AS `name`,`tb_subjects`.`subject` AS `subject`,`tb_subjects`.`subject_code` AS `subject_code`,concat(`tb_class`.`cl_major`,'-',`tb_class`.`cl_level`,`tb_class`.`cl_name`) AS `class`,sum(`tb_class_schedule`.`hour`) AS `total_hour`,`tb_class_schedule`.`semester` AS `semester`,`tb_class_schedule`.`year` AS `year` from (((`tb_lecturer` join `tb_class_schedule` on((`tb_lecturer`.`code` = `tb_class_schedule`.`lc_code`))) join `tb_class` on((`tb_class`.`cl_id` = `tb_class_schedule`.`cl_id`))) join `tb_subjects` on((`tb_subjects`.`subject_code` = `tb_class_schedule`.`subject_code`))) group by `tb_lecturer`.`name`,`tb_class_schedule`.`semester` ;

-- --------------------------------------------------------

--
-- Structure for view `vu_contracts_lecturer`
--
DROP TABLE IF EXISTS `vu_contracts_lecturer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vu_contracts_lecturer`  AS  select `vu_class_schedule`.`code` AS `code`,`vu_class_schedule`.`name` AS `name`,`vu_class_schedule`.`subject` AS `subject`,`vu_class_schedule`.`subject_code` AS `subject_code`,`tb_contract_files`.`contract_file` AS `contract_file` from (`vu_class_schedule` join `tb_contract_files` on((`vu_class_schedule`.`subject_code` = `tb_contract_files`.`subject_code`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vu_dpa`
--
DROP TABLE IF EXISTS `vu_dpa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vu_dpa`  AS  select `tb_lecturer`.`code` AS `code`,`tb_lecturer`.`name` AS `name`,concat(`tb_class`.`cl_major`,'-',`tb_class`.`cl_level`,`tb_class`.`cl_name`) AS `class_name`,`tb_dpa`.`year` AS `year` from ((`tb_lecturer` join `tb_dpa`) join `tb_class`) where ((`tb_lecturer`.`code` = `tb_dpa`.`code`) and (`tb_class`.`cl_id` = `tb_dpa`.`cl_id_dpa`) and (`tb_class`.`cl_level` <> 0)) order by concat(`tb_class`.`cl_major`,'-',`tb_class`.`cl_level`,`tb_class`.`cl_name`) ;

-- --------------------------------------------------------

--
-- Structure for view `vu_hour_distribution`
--
DROP TABLE IF EXISTS `vu_hour_distribution`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vu_hour_distribution`  AS  select `tb_lecturer`.`name` AS `name`,`tb_subjects`.`subject` AS `subject`,concat(`tb_class`.`cl_major`,'-',`tb_class`.`cl_level`,`tb_class`.`cl_name`) AS `class`,sum(`tb_class_schedule`.`hour`) AS `total_hour`,`tb_class_schedule`.`semester` AS `semester`,`tb_class_schedule`.`year` AS `year` from (((`tb_lecturer` join `tb_class_schedule` on((`tb_lecturer`.`code` = `tb_class_schedule`.`lc_code`))) join `tb_class` on((`tb_class`.`cl_id` = `tb_class_schedule`.`cl_id`))) join `tb_subjects` on((`tb_subjects`.`subject_code` = `tb_class_schedule`.`subject_code`))) group by `tb_lecturer`.`name`,`tb_class_schedule`.`semester` ;

-- --------------------------------------------------------

--
-- Structure for view `vu_lecturer_field`
--
DROP TABLE IF EXISTS `vu_lecturer_field`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vu_lecturer_field`  AS  select `tb_lecturer`.`code` AS `code`,`tb_lecturer`.`name` AS `name`,`tb_lecturer`.`field_of_study` AS `field_of_study` from `tb_lecturer` ;

-- --------------------------------------------------------

--
-- Structure for view `vu_lecturer_personal`
--
DROP TABLE IF EXISTS `vu_lecturer_personal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vu_lecturer_personal`  AS  select `tb_lecturer`.`code` AS `code`,`tb_lecturer`.`name` AS `name`,`tb_lecturer`.`status` AS `status`,`tb_lecturer`.`NIP` AS `NIP`,`tb_lecturer`.`NIDN` AS `NIDN` from `tb_lecturer` order by `tb_lecturer`.`code` desc ;

-- --------------------------------------------------------

--
-- Structure for view `vu_position_2018`
--
DROP TABLE IF EXISTS `vu_position_2018`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vu_position_2018`  AS  select `tb_lecturer`.`name` AS `name`,`tb_position`.`position` AS `position`,`tb_position`.`year` AS `year` from (`tb_lecturer` join `tb_position`) where ((`tb_lecturer`.`code` = `tb_position`.`code`) and (`tb_position`.`position` <> ' ') and (`tb_position`.`year` = 2018)) order by `tb_lecturer`.`name` ;

-- --------------------------------------------------------

--
-- Structure for view `vu_position_2019`
--
DROP TABLE IF EXISTS `vu_position_2019`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vu_position_2019`  AS  select `tb_lecturer`.`code` AS `code`,`tb_lecturer`.`name` AS `name`,`tb_position`.`position` AS `position`,`tb_position`.`year` AS `year`,`tb_position`.`semester` AS `semester` from (`tb_lecturer` join `tb_position`) where ((`tb_lecturer`.`code` = `tb_position`.`code`) and (`tb_position`.`position` <> ' ') and (`tb_position`.`year` = 2019)) order by `tb_lecturer`.`name` WITH CASCADED CHECK OPTION ;

-- --------------------------------------------------------

--
-- Structure for view `vu_research`
--
DROP TABLE IF EXISTS `vu_research`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vu_research`  AS  select `tb_lecturer`.`code` AS `code`,`tb_lecturer`.`name` AS `name`,`tb_research_category`.`research` AS `research`,`tb_researcher`.`priority` AS `priority` from ((`tb_lecturer` join `tb_researcher`) join `tb_research_category`) where ((`tb_lecturer`.`code` = `tb_researcher`.`code`) and (`tb_research_category`.`rs_id` = `tb_researcher`.`rs_id`) and (`tb_research_category`.`research` <> 'None')) order by `tb_researcher`.`priority` WITH CASCADED CHECK OPTION ;

-- --------------------------------------------------------

--
-- Structure for view `vu_research_group_details`
--
DROP TABLE IF EXISTS `vu_research_group_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vu_research_group_details`  AS  select `tb_research_category`.`research` AS `research`,`tb_research_sub_category`.`research_sub_category` AS `research_sub_category` from (`tb_research_category` join `tb_research_sub_category` on((`tb_research_category`.`rs_id` = `tb_research_sub_category`.`rs_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vu_teachings`
--
DROP TABLE IF EXISTS `vu_teachings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vu_teachings`  AS  select `tb_lecturer`.`code` AS `code`,`tb_lecturer`.`name` AS `name`,`tb_teaching_rules`.`weekly_teaching_time` AS `weekly_teaching_time`,`tb_teaching_rules`.`weekly_hour_quota` AS `weekly_hour_quota`,`tb_teaching_rules`.`distribution_19_20` AS `distribution_19_20`,`tb_teaching_rules`.`quota_19_20` AS `quota_19_20` from (`tb_lecturer` join `tb_teaching_rules`) where (`tb_lecturer`.`code` = `tb_teaching_rules`.`code`) order by `tb_lecturer`.`name` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_class`
--
ALTER TABLE `tb_class`
  ADD PRIMARY KEY (`cl_id`),
  ADD UNIQUE KEY `cl_id` (`cl_id`);

--
-- Indexes for table `tb_class_schedule`
--
ALTER TABLE `tb_class_schedule`
  ADD KEY `cl_id` (`cl_id`),
  ADD KEY `lc_code` (`lc_code`),
  ADD KEY `subject_code` (`subject_code`);

--
-- Indexes for table `tb_dpa`
--
ALTER TABLE `tb_dpa`
  ADD KEY `code` (`code`),
  ADD KEY `cl_id_dpa` (`cl_id_dpa`);

--
-- Indexes for table `tb_homebase`
--
ALTER TABLE `tb_homebase`
  ADD KEY `code` (`code`);

--
-- Indexes for table `tb_lecturer`
--
ALTER TABLE `tb_lecturer`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `tb_lecturerlist`
--
ALTER TABLE `tb_lecturerlist`
  ADD KEY `code` (`code`);

--
-- Indexes for table `tb_position`
--
ALTER TABLE `tb_position`
  ADD KEY `code` (`code`);

--
-- Indexes for table `tb_researcher`
--
ALTER TABLE `tb_researcher`
  ADD KEY `rs_id` (`rs_id`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `tb_research_category`
--
ALTER TABLE `tb_research_category`
  ADD PRIMARY KEY (`rs_id`);

--
-- Indexes for table `tb_research_sub_category`
--
ALTER TABLE `tb_research_sub_category`
  ADD PRIMARY KEY (`sub_id`),
  ADD KEY `rs_id` (`rs_id`);

--
-- Indexes for table `tb_rps_sap`
--
ALTER TABLE `tb_rps_sap`
  ADD KEY `subject_code` (`subject_code`);

--
-- Indexes for table `tb_subjects`
--
ALTER TABLE `tb_subjects`
  ADD PRIMARY KEY (`subject_code`);

--
-- Indexes for table `tb_teaching_rules`
--
ALTER TABLE `tb_teaching_rules`
  ADD KEY `code` (`code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_class_schedule`
--
ALTER TABLE `tb_class_schedule`
  ADD CONSTRAINT `tb_class_schedule_ibfk_1` FOREIGN KEY (`cl_id`) REFERENCES `tb_class` (`cl_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_class_schedule_ibfk_2` FOREIGN KEY (`lc_code`) REFERENCES `tb_lecturer` (`code`),
  ADD CONSTRAINT `tb_class_schedule_ibfk_3` FOREIGN KEY (`subject_code`) REFERENCES `tb_subjects` (`subject_code`);

--
-- Constraints for table `tb_dpa`
--
ALTER TABLE `tb_dpa`
  ADD CONSTRAINT `tb_dpa_ibfk_1` FOREIGN KEY (`code`) REFERENCES `tb_lecturer` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_dpa_ibfk_2` FOREIGN KEY (`cl_id_dpa`) REFERENCES `tb_class` (`cl_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_homebase`
--
ALTER TABLE `tb_homebase`
  ADD CONSTRAINT `tb_homebase_ibfk_1` FOREIGN KEY (`code`) REFERENCES `tb_lecturer` (`code`);

--
-- Constraints for table `tb_lecturerlist`
--
ALTER TABLE `tb_lecturerlist`
  ADD CONSTRAINT `tb_lecturerlist_ibfk_1` FOREIGN KEY (`code`) REFERENCES `tb_lecturer` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_position`
--
ALTER TABLE `tb_position`
  ADD CONSTRAINT `tb_position_ibfk_1` FOREIGN KEY (`code`) REFERENCES `tb_lecturer` (`code`);

--
-- Constraints for table `tb_researcher`
--
ALTER TABLE `tb_researcher`
  ADD CONSTRAINT `tb_researcher_ibfk_1` FOREIGN KEY (`code`) REFERENCES `tb_lecturer` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_researcher_ibfk_2` FOREIGN KEY (`rs_id`) REFERENCES `tb_research_category` (`rs_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_research_sub_category`
--
ALTER TABLE `tb_research_sub_category`
  ADD CONSTRAINT `tb_research_sub_category_ibfk_1` FOREIGN KEY (`rs_id`) REFERENCES `tb_research_category` (`rs_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_rps_sap`
--
ALTER TABLE `tb_rps_sap`
  ADD CONSTRAINT `tb_rps_sap_ibfk_1` FOREIGN KEY (`subject_code`) REFERENCES `tb_subjects` (`subject_code`);

--
-- Constraints for table `tb_teaching_rules`
--
ALTER TABLE `tb_teaching_rules`
  ADD CONSTRAINT `tb_teaching_rules_ibfk_1` FOREIGN KEY (`code`) REFERENCES `tb_lecturer` (`code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
