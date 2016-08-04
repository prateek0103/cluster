-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 16, 2016 at 09:45 PM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vpn`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `uname`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `clients_data`
--

CREATE TABLE IF NOT EXISTS `clients_data` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `Group` int(11) DEFAULT NULL,
  `responsible_email` varchar(50) NOT NULL,
  `internet_tunnel` tinyint(1) NOT NULL,
  `max_simultaneous_login` tinyint(4) NOT NULL,
  `cloud_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `servers_ACL` varchar(128) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `traffic` bigint(20) NOT NULL,
  `bidirectional_mode` tinyint(4) NOT NULL,
  `controller_id` int(20) NOT NULL,
  `group_id` int(20) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `subnet` varchar(255) NOT NULL,
  `is_deleted` int(10) NOT NULL,
  `last_updated` datetime NOT NULL,
  `no_of_revision` bigint(15) NOT NULL,
  `local_ip` varchar(100) NOT NULL,
  `IPAlias` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `last_action` varchar(100) NOT NULL,
  `is_complete_action` int(10) NOT NULL DEFAULT '-1',
  `is_updated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`client_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `clients_data`
--

INSERT INTO `clients_data` (`client_id`, `type`, `Group`, `responsible_email`, `internet_tunnel`, `max_simultaneous_login`, `cloud_id`, `customer_id`, `status`, `servers_ACL`, `last_login`, `traffic`, `bidirectional_mode`, `controller_id`, `group_id`, `display_name`, `subnet`, `is_deleted`, `last_updated`, `no_of_revision`, `local_ip`, `IPAlias`, `location`, `last_action`, `is_complete_action`, `is_updated`) VALUES
(1, 0, NULL, 'amitavads9@gmail.com', 0, 0, 1, 1, 1, '', '2015-10-12 07:15:08', 0, 1, 0, 0, 'Amitava Das', '5.5.5.10', 0, '0000-00-00 00:00:00', 0, '', '', '', 'Activate client status', -1, 1),
(2, 0, NULL, 'subratar19@hotmail.com', 0, 0, 1, 1, 1, '', '2015-10-09 06:55:04', 0, 0, 0, 0, 'subratar19@hotmail.com', '5.5.5.10', 0, '0000-00-00 00:00:00', 0, '', '', '', 'Activate client status', -1, 1),
(3, 0, NULL, 'manoranjankumar93@gmail.com', 0, 0, 1, 1, 1, '', '2015-10-12 06:38:04', 0, 1, 0, 0, 'manoranjan kumar Singh', '5.5.5.11', 0, '0000-00-00 00:00:00', 0, '', '', '', 'Activate client status', -1, 1),
(4, 0, NULL, 'surajitroycse@gmail.com', 0, 0, 1, 1, 1, '', '2015-10-12 07:08:26', 0, 1, 0, 0, 'Surajit Roy', '5.5.5.12', 0, '0000-00-00 00:00:00', 0, '', '', '', 'Activate client status', -1, 1),
(5, 0, NULL, 'rupsena@gmail.com', 0, 0, 1, 1, 1, '', '2015-10-12 07:13:29', 0, 3, 0, 0, 'Rupsena Sir-Ejob', '5.5.5.12', 0, '0000-00-00 00:00:00', 0, '', '', '', 'Activate client status', -1, 1),
(6, 0, NULL, 'rupsena@gmail.com', 0, 0, 1, 1, 0, '', '2015-09-30 09:44:23', 0, 0, 0, 0, 'Rupsena Sir-Ejob', '5.5.5.13', 0, '0000-00-00 00:00:00', 0, '', '', '', 'Add new client', -1, 1),
(7, 0, NULL, 'tanaychatterjee7@gmail.com', 0, 0, 1, 1, 0, '', '2015-09-30 09:44:23', 0, 0, 0, 0, 'Tanay Chatterjee', '5.5.5.13', 0, '0000-00-00 00:00:00', 0, '', '', '', 'Add new client', -1, 1),
(8, 0, NULL, 'sammm4444@gmail.com', 0, 0, 1, 1, 0, '', '2015-09-30 09:53:50', 0, 0, 0, 0, '@runav@ chakraborty', '5.5.5.14', 0, '0000-00-00 00:00:00', 0, '', '', '', 'Add new client', -1, 1),
(9, 0, NULL, 'jncsmdirector@gmail.com', 0, 0, 1, 1, 0, '', '2015-09-30 09:53:50', 0, 0, 0, 0, 'jncsm director', '5.5.5.14', 0, '0000-00-00 00:00:00', 0, '', '', '', 'Add new client', -1, 1),
(10, 0, NULL, 'pritam55paul@gmail.com', 0, 0, 1, 1, 0, '', '2015-09-30 09:55:10', 0, 0, 0, 0, 'pritam55paul@gmail.com', '5.5.5.15', 0, '0000-00-00 00:00:00', 0, '', '', '', 'Add new client', -1, 1),
(11, 0, NULL, 'abbadi555@hotmail.com', 0, 0, 2, 3, 1, '', '2015-11-27 13:56:18', 0, 2, 0, 0, 'Client11', '5.5.5.16', 0, '0000-00-00 00:00:00', 0, '', '', '', 'Change client biderection', 0, 0),
(12, 0, NULL, 'spark@gmail.com', 0, 0, 2, 3, 0, '', '2015-11-24 17:27:49', 0, 3, 0, 0, 'spark@gmail.com', '5.5.5.17', 0, '0000-00-00 00:00:00', 0, '', '', '', '', 0, 0),
(13, 0, NULL, 'tanaychatterjee7@gmail.com', 0, 0, 1, 1, 0, '', '2015-11-25 06:25:34', 0, 0, 2, 0, 'Tanay Chatterjee', '5.5.5.17', 0, '0000-00-00 00:00:00', 0, '', '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `client_subnets`
--

CREATE TABLE IF NOT EXISTS `client_subnets` (
  `cloud_id` int(11) NOT NULL AUTO_INCREMENT,
  `subnet` varchar(18) NOT NULL,
  `used_ips` int(11) NOT NULL DEFAULT '0',
  `full` tinyint(1) NOT NULL,
  `client_id` int(11) NOT NULL,
  `last_updated` datetime NOT NULL,
  `no_of_revision` bigint(15) NOT NULL,
  PRIMARY KEY (`cloud_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `client_subnets`
--

INSERT INTO `client_subnets` (`cloud_id`, `subnet`, `used_ips`, `full`, `client_id`, `last_updated`, `no_of_revision`) VALUES
(1, '0.255.255.255', 1, 0, 4, '2015-09-30 06:13:42', 9),
(2, '1.0.0.255', 1, 0, 53, '2015-09-30 06:17:43', 7),
(3, '1.0.3.255', 1, 0, 54, '2015-09-30 06:24:02', 5),
(4, '5.5.5.1', 1, 0, 65, '2015-09-30 06:32:02', 6),
(5, '5.5.5.2', 1, 0, 116, '2015-09-30 07:00:02', 8),
(6, '5.5.5.3', 0, 0, 117, '2015-09-30 07:20:23', 10),
(7, '5.5.5.4', 1, 0, 18, '2015-09-30 07:22:21', 29),
(8, '5.5.5.5', 1, 0, 19, '2015-09-30 07:28:42', 11),
(9, '5.5.5.6', 0, 0, 184, '2015-09-30 07:31:41', 8),
(10, '5.5.5.7', 0, 0, 185, '2015-09-30 07:34:01', 15),
(11, '5.5.5.8', 0, 0, 186, '2015-09-30 07:34:22', 12),
(12, '5.5.5.9', 0, 0, 187, '2015-09-30 07:38:42', 8),
(13, '5.5.5.10', 0, 0, 188, '2015-09-30 09:09:02', 13),
(14, '5.5.5.11', 0, 0, 189, '2015-09-30 09:25:21', 10),
(15, '5.5.5.12', 0, 0, 190, '2015-09-30 09:39:42', 57),
(16, '5.5.5.13', 0, 0, 191, '2015-09-30 09:44:23', 8),
(17, '5.5.5.14', 0, 0, 192, '2015-09-30 09:53:42', 8),
(18, '5.5.5.15', 0, 0, 1, '2015-09-30 09:55:02', 23),
(19, '5.5.5.16', 0, 0, 171, '2015-09-30 10:15:21', 4),
(20, '5.5.5.17', 0, 0, 3, '2015-08-06 07:16:18', 4),
(21, '5.5.5.18', 0, 0, 4, '2015-08-06 07:19:02', 18),
(22, '5.5.5.19', 0, 0, 5, '2015-08-06 07:27:11', 12),
(23, '5.5.5.20', 0, 0, 6, '2015-08-06 07:27:11', 18),
(24, '5.5.5.21', 0, 0, 7, '2015-08-11 10:35:19', 15),
(25, '5.5.5.22', 0, 0, 8, '2015-08-11 10:35:19', 8),
(26, '5.5.5.23', 0, 0, 9, '2015-08-11 10:35:19', 5),
(27, '5.5.5.24', 0, 0, 10, '2015-08-06 07:42:51', 4),
(28, '5.5.5.25', 0, 0, 11, '2015-08-06 09:47:19', 4),
(29, '5.5.5.26', 0, 0, 148, '2015-07-23 10:03:41', 3),
(30, '5.5.5.27', 0, 0, 149, '2015-07-23 10:47:52', 2),
(31, '5.5.5.28', 0, 0, 150, '2015-07-23 10:49:09', 6),
(32, '5.5.5.29', 0, 0, 151, '2015-07-23 10:49:09', 2),
(33, '5.5.5.30', 0, 0, 152, '2015-07-23 10:52:09', 2);

-- --------------------------------------------------------

--
-- Table structure for table `clouds_data`
--

CREATE TABLE IF NOT EXISTS `clouds_data` (
  `cloud_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `cloud_name` varchar(50) NOT NULL,
  `cloud_name_prefix` varchar(10) NOT NULL,
  `user_token` varchar(255) NOT NULL,
  `traffic` bigint(20) NOT NULL DEFAULT '0',
  `datacenter_server_id` smallint(6) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1',
  `email` varchar(255) NOT NULL,
  `is_deleted` int(10) NOT NULL,
  PRIMARY KEY (`cloud_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `clouds_data`
--

INSERT INTO `clouds_data` (`cloud_id`, `username`, `password`, `cloud_name`, `cloud_name_prefix`, `user_token`, `traffic`, `datacenter_server_id`, `is_active`, `email`, `is_deleted`) VALUES
(1, NULL, NULL, 'cloud', '', 'e4afbe64c2bd384b87a33db2184a625d', 0, 0, 1, 'subratar19@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `controllers_data`
--

CREATE TABLE IF NOT EXISTS `controllers_data` (
  `controller_id` int(11) NOT NULL AUTO_INCREMENT,
  `non_prefix_controller_name` varchar(30) NOT NULL,
  `controller_name` varchar(25) NOT NULL,
  `cloud_id` int(11) NOT NULL,
  `controller_subnets` varchar(255) NOT NULL,
  `traffic` bigint(20) NOT NULL,
  `num_servers` int(11) NOT NULL,
  `num_clients` int(11) NOT NULL,
  `customer_id` int(20) NOT NULL,
  `is_deleted` int(10) NOT NULL,
  `last_action` varchar(100) NOT NULL,
  `is_complete_action` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`controller_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `controllers_data`
--

INSERT INTO `controllers_data` (`controller_id`, `non_prefix_controller_name`, `controller_name`, `cloud_id`, `controller_subnets`, `traffic`, `num_servers`, `num_clients`, `customer_id`, `is_deleted`, `last_action`, `is_complete_action`) VALUES
(1, '', 'controller1', 2, '5.5.5.7', 0, 0, 0, 3, 0, '', 0),
(2, '', 'CTRL', 1, '0.255.255.255', 0, 0, 0, 1, 0, '', 0),
(3, '', 'CTRL1', 1, '1.0.0.255', 0, 0, 0, 2, 0, '', 0),
(4, '', 'Controller', 1, '1.0.3.255', 0, 0, 0, 2, 0, '', 0),
(5, '', 'Controller12', 1, '5.5.5.1', 0, 0, 0, 2, 0, '', 0),
(6, '', 'Controller123', 1, '5.5.5.2', 0, 0, 0, 2, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `controller_subnets`
--

CREATE TABLE IF NOT EXISTS `controller_subnets` (
  `cloud_id` int(11) NOT NULL AUTO_INCREMENT,
  `controller_subnets` varchar(18) NOT NULL,
  `used_ips` int(11) NOT NULL DEFAULT '0',
  `full` tinyint(1) NOT NULL,
  `controller_id` int(11) NOT NULL,
  PRIMARY KEY (`cloud_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `controller_subnets`
--

INSERT INTO `controller_subnets` (`cloud_id`, `controller_subnets`, `used_ips`, `full`, `controller_id`) VALUES
(1, '0.255.255.255', 1, 0, 2),
(2, '1.0.0.255', 1, 0, 3),
(3, '1.0.3.255', 1, 0, 4),
(4, '5.5.5.1', 1, 0, 5),
(5, '5.5.5.2', 1, 0, 6),
(6, '5.5.5.3', 0, 0, 2),
(7, '5.5.5.4', 0, 0, 3),
(8, '5.5.5.5', 0, 0, 4),
(9, '5.5.5.6', 0, 0, 5),
(10, '5.5.5.7', 0, 0, 1),
(11, '5.5.5.8', 0, 0, 0),
(12, '5.5.5.9', 0, 0, 0),
(13, '5.5.5.10', 0, 0, 0),
(14, '5.5.5.11', 0, 0, 0),
(15, '5.5.5.12', 0, 0, 0),
(16, '5.5.5.13', 0, 0, 0),
(17, '5.5.5.14', 0, 0, 0),
(18, '5.5.5.15', 0, 0, 0),
(19, '5.5.5.16', 0, 0, 0),
(20, '5.5.5.17', 0, 0, 0),
(21, '5.5.5.18', 0, 0, 0),
(22, '5.5.5.19', 0, 0, 0),
(23, '5.5.5.20', 0, 0, 0),
(24, '5.5.5.21', 0, 0, 0),
(25, '5.5.5.22', 0, 0, 0),
(26, '5.5.5.23', 0, 0, 0),
(27, '5.5.5.24', 0, 0, 0),
(28, '5.5.5.25', 0, 0, 0),
(29, '5.5.5.26', 0, 0, 0),
(30, '5.5.5.27', 0, 0, 0),
(31, '5.5.5.28', 0, 0, 0),
(32, '5.5.5.29', 0, 0, 0),
(33, '5.5.5.30', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers_data`
--

CREATE TABLE IF NOT EXISTS `customers_data` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `remail` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Cash_amount` double NOT NULL,
  `num_clouds` int(11) NOT NULL,
  `num_servers` int(11) NOT NULL,
  `num_clients` int(11) NOT NULL,
  `num_real_ip` int(11) NOT NULL,
  `num_internet_tunnel` int(11) NOT NULL,
  `subscription_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `token` varchar(128) DEFAULT NULL,
  `plan_id` int(10) NOT NULL DEFAULT '1',
  `is_verfied` int(1) NOT NULL DEFAULT '0',
  `is_active` int(1) DEFAULT '0',
  `show_cost` int(10) NOT NULL DEFAULT '1',
  `login_type` varchar(100) NOT NULL DEFAULT 'normal',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `last_checked` bigint(20) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `customers_data`
--

INSERT INTO `customers_data` (`customer_id`, `name`, `phone`, `remail`, `email`, `password`, `Cash_amount`, `num_clouds`, `num_servers`, `num_clients`, `num_real_ip`, `num_internet_tunnel`, `subscription_date`, `token`, `plan_id`, `is_verfied`, `is_active`, `show_cost`, `login_type`, `is_admin`, `last_checked`) VALUES
(1, 'Subrata Roy', '0987654321', '', 'subratar19@gmail.com', '6064fa5a68da4385d867a4eef14d1a0a', 20.906366009645, 0, 0, 0, 0, 0, '2016-03-01 05:54:51', 'e4afbe64c2bd384b87a33db2184a625d', 1, 1, 1, 1, 'normal', 1, 1456811691),
(2, 'Sanjay Roy', '', '', 'sanjay@gmail.com', '6064fa5a68da4385d867a4eef14d1a0a', 29.99889385185, 0, 0, 0, 0, 0, '2016-03-01 05:54:51', 'c3ee6973d2c593d5d18bea5d92c8496b', 1, 1, 1, 1, 'normal', 0, 1456811691),
(4, 'Subrata Roy', '', '', 'sss@mail.com', '6064fa5a68da4385d867a4eef14d1a0a', 90, 0, 0, 0, 0, 0, '2016-03-09 13:50:46', '0139a6e27b6ff4de5fce6209878393ce', 1, 1, 1, 1, 'normal', 0, 0),
(5, 'Subrata Roy', '', '', 'sasa@mail.com', '6064fa5a68da4385d867a4eef14d1a0a', 30, 0, 0, 0, 0, 0, '2016-03-09 13:59:04', '5b716411c99e5f1269ae6b95c56f383d', 1, 1, 1, 1, 'normal', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_user_relations`
--

CREATE TABLE IF NOT EXISTS `customer_user_relations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_token` varchar(255) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniuser` (`user_token`,`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=955 ;

--
-- Dumping data for table `customer_user_relations`
--

INSERT INTO `customer_user_relations` (`id`, `user_token`, `user_id`) VALUES
(1, '1', 1),
(2, '1', 2),
(3, '1', 3),
(9, '1', 4),
(15, '1', 5),
(20, '1', 6),
(23, '1', 7),
(25, '1', 8),
(28, '1', 9),
(40, '1', 10),
(45, '1', 11),
(47, '1', 12),
(48, '1', 13),
(50, '1', 14),
(52, '1', 15),
(56, '1', 16),
(58, '1', 17),
(61, '1', 18),
(63, '1', 19),
(67, '1', 20),
(68, '1', 21),
(69, '1', 22),
(70, '1', 23),
(75, '1', 24),
(78, '1', 25),
(81, '1', 26),
(82, '1', 27),
(87, '1', 28),
(94, '1', 29),
(100, '1', 30),
(101, '1', 31),
(102, '1', 32),
(103, '1', 33),
(108, '1', 34),
(111, '1', 35),
(116, '1', 36),
(117, '1', 37),
(118, '1', 38),
(121, '1', 39),
(128, '1', 40),
(133, '1', 41),
(134, '1', 42),
(144, '1', 43),
(148, '1', 44),
(158, '1', 45),
(163, '1', 46),
(171, '1', 47),
(181, '1', 48),
(185, '1', 49),
(187, '1', 50),
(190, '1', 51),
(191, '1', 52),
(192, '1', 53),
(193, '1', 54),
(201, '1', 55),
(203, '1', 56),
(205, '1', 57),
(206, '1', 58),
(210, '1', 59),
(212, '1', 60),
(217, '1', 61),
(219, '1', 62),
(222, '1', 63),
(226, '1', 64),
(229, '1', 65),
(232, '1', 66),
(237, '1', 67),
(240, '1', 68),
(244, '1', 69),
(247, '1', 70),
(250, '1', 71),
(260, '1', 72),
(261, '1', 73),
(265, '1', 74),
(266, '1', 75),
(269, '1', 76),
(272, '1', 77),
(274, '1', 78),
(278, '1', 79),
(281, '1', 80),
(285, '1', 81),
(502, '2', 10),
(452, '2', 37),
(549, '2', 38),
(477, '2', 40),
(492, '2', 43),
(329, '2', 55),
(358, '2', 66),
(543, '2', 71),
(512, '2', 72),
(289, '2', 82),
(290, '2', 83),
(291, '2', 84),
(292, '2', 85),
(293, '2', 86),
(294, '2', 87),
(295, '2', 88),
(296, '2', 89),
(297, '2', 90),
(298, '2', 91),
(299, '2', 92),
(300, '2', 93),
(301, '2', 94),
(302, '2', 95),
(303, '2', 96),
(304, '2', 97),
(305, '2', 98),
(306, '2', 99),
(307, '2', 100),
(308, '2', 101),
(309, '2', 102),
(310, '2', 103),
(311, '2', 104),
(312, '2', 105),
(313, '2', 106),
(314, '2', 107),
(315, '2', 108),
(316, '2', 109),
(317, '2', 110),
(318, '2', 111),
(319, '2', 112),
(320, '2', 113),
(321, '2', 114),
(322, '2', 115),
(323, '2', 116),
(324, '2', 117),
(325, '2', 118),
(326, '2', 119),
(327, '2', 120),
(328, '2', 121),
(330, '2', 122),
(331, '2', 123),
(332, '2', 124),
(333, '2', 125),
(334, '2', 126),
(335, '2', 127),
(336, '2', 128),
(337, '2', 129),
(338, '2', 130),
(339, '2', 131),
(340, '2', 132),
(341, '2', 133),
(342, '2', 134),
(343, '2', 135),
(344, '2', 136),
(345, '2', 137),
(346, '2', 138),
(347, '2', 139),
(348, '2', 140),
(349, '2', 141),
(350, '2', 142),
(351, '2', 143),
(352, '2', 144),
(353, '2', 145),
(354, '2', 146),
(355, '2', 147),
(356, '2', 148),
(357, '2', 149),
(359, '2', 150),
(360, '2', 151),
(361, '2', 152),
(362, '2', 153),
(363, '2', 154),
(364, '2', 155),
(365, '2', 156),
(366, '2', 157),
(367, '2', 158),
(368, '2', 159),
(369, '2', 160),
(370, '2', 161),
(371, '2', 162),
(372, '2', 163),
(373, '2', 164),
(374, '2', 165),
(375, '2', 166),
(376, '2', 167),
(377, '2', 168),
(378, '2', 169),
(379, '2', 170),
(380, '2', 171),
(381, '2', 172),
(382, '2', 173),
(383, '2', 174),
(384, '2', 175),
(385, '2', 176),
(386, '2', 177),
(387, '2', 178),
(388, '2', 179),
(389, '2', 180),
(390, '2', 181),
(391, '2', 182),
(392, '2', 183),
(393, '2', 184),
(394, '2', 185),
(395, '2', 186),
(396, '2', 187),
(397, '2', 188),
(398, '2', 189),
(399, '2', 190),
(400, '2', 191),
(401, '2', 192),
(402, '2', 193),
(403, '2', 194),
(404, '2', 195),
(405, '2', 196),
(406, '2', 197),
(407, '2', 198),
(408, '2', 199),
(409, '2', 200),
(410, '2', 201),
(411, '2', 202),
(412, '2', 203),
(413, '2', 204),
(414, '2', 205),
(415, '2', 206),
(416, '2', 207),
(417, '2', 208),
(418, '2', 209),
(419, '2', 210),
(420, '2', 211),
(421, '2', 212),
(422, '2', 213),
(423, '2', 214),
(424, '2', 215),
(425, '2', 216),
(426, '2', 217),
(427, '2', 218),
(428, '2', 219),
(429, '2', 220),
(430, '2', 221),
(431, '2', 222),
(432, '2', 223),
(433, '2', 224),
(434, '2', 225),
(435, '2', 226),
(436, '2', 227),
(437, '2', 228),
(438, '2', 229),
(439, '2', 230),
(440, '2', 231),
(441, '2', 232),
(442, '2', 233),
(443, '2', 234),
(444, '2', 235),
(445, '2', 236),
(446, '2', 237),
(447, '2', 238),
(448, '2', 239),
(449, '2', 240),
(450, '2', 241),
(451, '2', 242),
(453, '2', 243),
(454, '2', 244),
(455, '2', 245),
(456, '2', 246),
(457, '2', 247),
(458, '2', 248),
(459, '2', 249),
(460, '2', 250),
(461, '2', 251),
(462, '2', 252),
(463, '2', 253),
(464, '2', 254),
(465, '2', 255),
(466, '2', 256),
(467, '2', 257),
(468, '2', 258),
(469, '2', 259),
(470, '2', 260),
(471, '2', 261),
(472, '2', 262),
(473, '2', 263),
(474, '2', 264),
(475, '2', 265),
(476, '2', 266),
(478, '2', 267),
(479, '2', 268),
(480, '2', 269),
(481, '2', 270),
(482, '2', 271),
(483, '2', 272),
(484, '2', 273),
(485, '2', 274),
(486, '2', 275),
(487, '2', 276),
(488, '2', 277),
(489, '2', 278),
(490, '2', 279),
(491, '2', 280),
(493, '2', 281),
(494, '2', 282),
(495, '2', 283),
(496, '2', 284),
(497, '2', 285),
(498, '2', 286),
(499, '2', 287),
(500, '2', 288),
(501, '2', 289),
(503, '2', 290),
(504, '2', 291),
(505, '2', 292),
(506, '2', 293),
(507, '2', 294),
(508, '2', 295),
(509, '2', 296),
(510, '2', 297),
(511, '2', 298),
(513, '2', 299),
(514, '2', 300),
(515, '2', 301),
(516, '2', 302),
(517, '2', 303),
(518, '2', 304),
(519, '2', 305),
(520, '2', 306),
(521, '2', 307),
(522, '2', 308),
(523, '2', 309),
(524, '2', 310),
(525, '2', 311),
(526, '2', 312),
(527, '2', 313),
(528, '2', 314),
(529, '2', 315),
(530, '2', 316),
(531, '2', 317),
(532, '2', 318),
(533, '2', 319),
(534, '2', 320),
(535, '2', 321),
(536, '2', 322),
(537, '2', 323),
(538, '2', 324),
(539, '2', 325),
(540, '2', 326),
(541, '2', 327),
(542, '2', 328),
(544, '2', 329),
(545, '2', 330),
(546, '2', 331),
(547, '2', 332),
(548, '2', 333),
(550, '2', 334),
(551, '2', 335),
(552, '2', 336),
(553, '2', 337),
(554, '2', 338),
(555, '2', 339),
(556, '2', 340),
(557, '2', 341),
(558, '2', 342),
(559, '2', 343),
(560, '2', 344),
(561, '2', 345),
(562, '2', 346),
(563, '2', 347),
(564, '2', 348),
(565, '2', 349),
(566, '2', 350),
(567, '2', 351),
(568, '2', 352),
(569, '2', 353),
(570, '2', 354),
(571, '2', 355),
(572, '2', 356),
(573, '2', 357),
(574, '2', 358),
(575, '2', 359),
(576, '2', 360),
(577, '2', 361),
(578, '2', 362),
(579, '2', 363),
(580, '2', 364),
(581, '2', 365),
(582, '2', 366),
(583, '2', 367),
(584, '2', 368),
(585, '2', 369),
(586, '2', 370),
(587, '2', 371),
(588, '2', 372),
(589, '2', 373),
(590, '2', 374),
(591, '2', 375),
(592, '2', 376),
(593, '2', 377),
(594, '2', 378),
(595, '2', 379),
(596, '2', 380),
(597, '2', 381),
(598, '2', 382),
(599, '2', 383),
(600, '2', 384),
(601, '2', 385),
(602, '2', 386),
(603, '2', 387),
(604, '2', 388),
(605, '2', 389),
(606, '3', 390),
(806, '5', 74),
(687, '5', 175),
(859, '5', 308),
(703, '5', 326),
(609, '5', 391),
(613, '5', 392),
(614, '5', 393),
(619, '5', 394),
(624, '5', 395),
(637, '5', 396),
(650, '5', 397),
(664, '5', 398),
(667, '5', 399),
(669, '5', 400),
(674, '5', 401),
(710, '5', 402),
(715, '5', 403),
(723, '5', 404),
(724, '5', 405),
(728, '5', 406),
(736, '5', 407),
(738, '5', 408),
(739, '5', 409),
(741, '5', 410),
(755, '5', 411),
(757, '5', 412),
(760, '5', 413),
(763, '5', 414),
(771, '5', 415),
(781, '5', 416),
(782, '5', 417),
(783, '5', 418),
(798, '5', 419),
(800, '5', 420),
(804, '5', 421),
(805, '5', 422),
(808, '5', 423),
(822, '5', 424),
(823, '5', 425),
(830, '5', 426),
(834, '5', 427),
(839, '5', 428),
(846, '5', 429),
(851, '5', 430),
(852, '5', 431),
(857, '5', 432),
(863, '5', 433),
(868, '5', 434),
(875, '5', 435),
(878, '5', 436),
(885, '5', 437),
(888, '5', 438),
(894, '5', 439),
(900, '5', 440),
(906, '5', 441),
(916, '5', 442),
(917, '5', 443),
(920, '5', 444),
(926, '5', 445),
(930, '5', 446),
(938, '5', 447),
(947, '5', 448),
(953, '5', 449),
(954, '5', 450);

-- --------------------------------------------------------

--
-- Table structure for table `c_firewall`
--

CREATE TABLE IF NOT EXISTS `c_firewall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `c_firewall-deny_all` tinyint(1) NOT NULL DEFAULT '0',
  `c_firewall-allow_all` tinyint(1) NOT NULL DEFAULT '0',
  `c_firewall-apps` tinyint(1) NOT NULL DEFAULT '0',
  `c_firewall-ip_port_protoco` tinyint(1) NOT NULL DEFAULT '0',
  `c_firewall-websites` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `c_firewall`
--

INSERT INTO `c_firewall` (`id`, `acl_id`, `c_firewall-deny_all`, `c_firewall-allow_all`, `c_firewall-apps`, `c_firewall-ip_port_protoco`, `c_firewall-websites`) VALUES
(1, 1, 1, 0, 1, 0, 0),
(2, 2, 1, 0, 0, 1, 1),
(3, 3, 0, 0, 1, 1, 0),
(4, 4, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `c_forwarding`
--

CREATE TABLE IF NOT EXISTS `c_forwarding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `c_forwarding-new_dst` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `c_forwarding`
--

INSERT INTO `c_forwarding` (`id`, `acl_id`, `c_forwarding-new_dst`) VALUES
(1, 1, 0),
(2, 2, 1),
(3, 3, 0),
(4, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `c_qos`
--

CREATE TABLE IF NOT EXISTS `c_qos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `c_qos-shaping` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `c_qos`
--

INSERT INTO `c_qos` (`id`, `acl_id`, `c_qos-shaping`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `c_routing`
--

CREATE TABLE IF NOT EXISTS `c_routing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `c_routing-tos_to_gateway` tinyint(1) NOT NULL DEFAULT '0',
  `c_routing-country` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `c_routing`
--

INSERT INTO `c_routing` (`id`, `acl_id`, `c_routing-tos_to_gateway`, `c_routing-country`) VALUES
(1, 1, 1, 0),
(2, 2, 0, 1),
(3, 3, 0, 0),
(4, 4, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `datacenter_servers`
--

CREATE TABLE IF NOT EXISTS `datacenter_servers` (
  `server_id` int(11) NOT NULL,
  `server_name` varchar(30) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `server_ip` varchar(18) NOT NULL,
  PRIMARY KEY (`server_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `destination`
--

CREATE TABLE IF NOT EXISTS `destination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `destination-any` tinyint(1) NOT NULL DEFAULT '0',
  `destination-internet` tinyint(1) NOT NULL DEFAULT '0',
  `destination-groupb` tinyint(1) NOT NULL DEFAULT '0',
  `destination-groupa` tinyint(1) NOT NULL DEFAULT '0',
  `destination-controller1` tinyint(1) NOT NULL DEFAULT '0',
  `destination-server1` tinyint(1) NOT NULL DEFAULT '0',
  `destination-client1` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `destination`
--

INSERT INTO `destination` (`id`, `acl_id`, `destination-any`, `destination-internet`, `destination-groupb`, `destination-groupa`, `destination-controller1`, `destination-server1`, `destination-client1`) VALUES
(1, 1, 0, 0, 0, 1, 1, 0, 0),
(2, 2, 0, 1, 0, 1, 0, 0, 1),
(3, 3, 1, 0, 0, 0, 1, 1, 1),
(4, 4, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `d_forwarding`
--

CREATE TABLE IF NOT EXISTS `d_forwarding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `d_forwarding-new_dst` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `d_forwarding`
--

INSERT INTO `d_forwarding` (`id`, `acl_id`, `d_forwarding-new_dst`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 0),
(4, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `empty_subnets`
--

CREATE TABLE IF NOT EXISTS `empty_subnets` (
  `subnet` varchar(18) NOT NULL,
  `length` smallint(8) NOT NULL,
  `emptyness_data` varchar(17) NOT NULL,
  `full` tinyint(1) NOT NULL,
  `in_use` tinyint(1) NOT NULL,
  PRIMARY KEY (`subnet`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(200) NOT NULL,
  `cloud_id` int(20) NOT NULL,
  `customer_id` int(20) NOT NULL,
  `is_deleted` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group_name`, `cloud_id`, `customer_id`, `is_deleted`) VALUES
(1, 'Group1', 1, 1, 0),
(2, 'Group A', 3, 3, 0),
(3, 'group1', 4, 5, 0),
(4, 'GROUP1', 2, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `internet_routable_reserved_ips`
--

CREATE TABLE IF NOT EXISTS `internet_routable_reserved_ips` (
  `id` int(11) NOT NULL,
  `ip` varchar(18) NOT NULL,
  `subnet` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inuse_subnets`
--

CREATE TABLE IF NOT EXISTS `inuse_subnets` (
  `cloud_id` int(11) NOT NULL,
  `subnet` varchar(18) NOT NULL,
  `type` smallint(6) NOT NULL,
  `used_ips` varchar(16) NOT NULL,
  `full` tinyint(1) NOT NULL,
  PRIMARY KEY (`subnet`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_queue`
--

CREATE TABLE IF NOT EXISTS `job_queue` (
  `job_id` int(10) NOT NULL AUTO_INCREMENT,
  `tunnel_id` int(10) DEFAULT NULL,
  `action` text NOT NULL,
  `new_data` text NOT NULL,
  `old_data` text,
  `remote_server_id` int(11) NOT NULL,
  `is_complete_action` tinyint(1) NOT NULL DEFAULT '0',
  `added_time` datetime NOT NULL,
  `group` text NOT NULL,
  `token` varchar(255) NOT NULL,
  `is_seen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`job_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `job_queue`
--

INSERT INTO `job_queue` (`job_id`, `tunnel_id`, `action`, `new_data`, `old_data`, `remote_server_id`, `is_complete_action`, `added_time`, `group`, `token`, `is_seen`) VALUES
(1, 32, 'group_change', 'a:2:{s:2:"id";s:2:"32";s:5:"value";s:1:"1";}', NULL, 0, 0, '2016-03-10 16:57:31', 'b', 'e4afbe64c2bd384b87a33db2184a625d', 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_queue_temp`
--

CREATE TABLE IF NOT EXISTS `job_queue_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tunnel_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `data` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `job_queue_temp`
--

INSERT INTO `job_queue_temp` (`id`, `tunnel_id`, `token`, `type`, `data`) VALUES
(35, 34, 'e4afbe64c2bd384b87a33db2184a625d', 'group_change', 'a:2:{s:2:"id";s:2:"34";s:5:"value";s:1:"1";}');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `location_name`) VALUES
(1, 'location1'),
(2, 'location2');

-- --------------------------------------------------------

--
-- Table structure for table `package_data`
--

CREATE TABLE IF NOT EXISTS `package_data` (
  `plan_id` int(20) NOT NULL AUTO_INCREMENT,
  `tunnel` int(11) NOT NULL,
  `gateway` int(11) NOT NULL,
  `bidirection` int(11) NOT NULL,
  `realip` int(11) NOT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `package_data`
--

INSERT INTO `package_data` (`plan_id`, `tunnel`, `gateway`, `bidirection`, `realip`) VALUES
(1, 3, 1, 1, 1),
(2, 6, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE IF NOT EXISTS `plans` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `plans` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `plans`) VALUES
(1, 'Basic'),
(2, 'Premium');

-- --------------------------------------------------------

--
-- Table structure for table `property_permission`
--

CREATE TABLE IF NOT EXISTS `property_permission` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `property_id` int(20) NOT NULL,
  `property_type` varchar(10) NOT NULL,
  `property_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `property_id` (`property_id`,`property_type`,`property_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `property_permission`
--

INSERT INTO `property_permission` (`id`, `property_id`, `property_type`, `property_name`) VALUES
(4, 10, 'S', 'gateway'),
(3, 10, 'S', 'status'),
(5, 11, 'S', 'status'),
(1, 13, 'C', 'status'),
(6, 14, 'S', 'status');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_log`
--

CREATE TABLE IF NOT EXISTS `purchase_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(100) NOT NULL,
  `user_token` varchar(255) NOT NULL,
  `add` float NOT NULL,
  `deduct` float NOT NULL,
  `type` smallint(6) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remarks` text NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `purchase_log`
--

INSERT INTO `purchase_log` (`id`, `transaction_id`, `user_token`, `add`, `deduct`, `type`, `date`, `remarks`, `status`) VALUES
(1, 'TRANS1435131928990', '4', 200, 0, 0, '2015-06-24 07:45:28', 'Transaction canceled by user', 'c'),
(2, 'TRANS1446011220247', '1', 200, 0, 0, '2015-10-28 05:47:00', 'Transaction canceled by user', 'c'),
(3, 'TRANS1455697378587', '1', 2000, 0, 0, '2016-02-17 08:22:58', 'Transaction successful with Stripe, email id is abc@mail.com Token id is tok_17fQaJI9bCT4vtilbiwBbceX', 's'),
(4, 'TRANS1455697425813', '1', 2000000000, 0, 0, '2016-02-17 08:23:45', 'Transaction successful with Stripe, email id is abc@mail.com Token id is tok_17fQb4I9bCT4vtilw6l8b6k2', 's');

-- --------------------------------------------------------

--
-- Table structure for table `real_ip_list`
--

CREATE TABLE IF NOT EXISTS `real_ip_list` (
  `real_ip` varchar(20) NOT NULL,
  `in_use` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `server_id` int(11) NOT NULL,
  `last_updated` datetime NOT NULL,
  `no_of_revision` bigint(15) NOT NULL,
  PRIMARY KEY (`real_ip`),
  UNIQUE KEY `real_ip` (`real_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `real_ip_list`
--

INSERT INTO `real_ip_list` (`real_ip`, `in_use`, `is_active`, `server_id`, `last_updated`, `no_of_revision`) VALUES
('0.255.255.255', 1, 1, 166, '2015-07-17 05:43:40', 1),
('1.0.0.255', 1, 0, 35, '2015-08-11 10:27:32', 10),
('1.0.3.255', 1, 1, 248, '2015-08-05 11:32:43', 2),
('1.0.7.255', 1, 0, 36, '2015-08-11 10:27:32', 2),
('1.0.15.255', 1, 0, 265, '2015-08-06 05:59:24', 3),
('1.0.31.255', 1, 1, 37, '2015-08-11 10:27:48', 38),
('1.0.63.255', 1, 1, 0, '2015-08-06 05:35:54', 23),
('1.0.127.255', 0, 1, 38, '2015-08-11 10:27:48', 3),
('1.0.255.255', 0, 1, 254, '2015-08-05 12:05:38', 40),
('1.1.0.255', 0, 1, 39, '2015-08-11 10:27:48', 6),
('1.1.1.255', 0, 1, 256, '2015-07-24 18:06:22', 25),
('1.1.63.255', 0, 1, 32, '2015-07-24 18:09:42', 7),
('1.1.127.255', 0, 1, 33, '2015-08-06 05:35:55', 8),
('1.1.255.255', 0, 1, 34, '2015-07-23 08:28:23', 5),
('1.2.2.255', 0, 1, 40, '2015-07-23 08:33:05', 7),
('1.2.3.255', 0, 1, 41, '2015-08-11 10:27:24', 3),
('1.2.127.255', 0, 1, 42, '2015-08-06 07:30:46', 2),
('1.2.255.255', 0, 1, 43, '2015-07-24 18:15:32', 8),
('1.3.255.255', 0, 1, 44, '2015-08-06 07:40:10', 8),
('1.4.0.255', 0, 1, 45, '2015-08-06 07:40:10', 3),
('1.4.127.255', 0, 1, 46, '2015-08-11 10:27:24', 5),
('1.4.255.255', 0, 1, 0, '2015-08-11 10:27:24', 9),
('1.5.255.255', 0, 1, 10, '2015-07-28 06:10:47', 2),
('1.7.255.255', 0, 1, 0, '2015-08-11 11:52:10', 9),
('1.8.255.255', 0, 1, 0, '2015-08-11 11:52:10', 4),
('1.9.255.255', 0, 1, 0, '2015-08-11 10:27:24', 8),
('1.10.9.255', 0, 1, 0, '2015-08-11 11:52:10', 3),
('1.10.10.255', 0, 1, 0, '2015-08-11 10:27:24', 3),
('1.10.127.255', 0, 1, 194, '2015-07-23 10:45:01', 7),
('1.10.255.255', 0, 1, 195, '2015-07-23 10:50:59', 5),
('1.11.255.255', 0, 1, 0, '2015-08-11 10:27:40', 4),
('1.15.255.255', 0, 1, 0, '2015-08-06 05:35:27', 5),
('1.19.255.255', 0, 1, 0, '2015-08-11 10:27:40', 15),
('1.20.255.255', 0, 1, 153, '2015-07-15 04:53:04', 2),
('1.21.255.255', 0, 1, 154, '2015-07-15 05:31:26', 2),
('1.23.255.255', 0, 1, 0, '2015-06-24 11:45:50', 1),
('1.31.255.255', 0, 1, 0, '2015-06-24 11:45:50', 1),
('1.32.127.255', 0, 1, 0, '2015-06-24 11:45:50', 1),
('1.32.191.255', 0, 1, 0, '2015-06-24 11:45:50', 1),
('1.32.255.255', 0, 1, 0, '2015-06-24 11:45:50', 1),
('1.33.255.255', 0, 1, 0, '2015-06-24 11:45:50', 1),
('1.35.255.255', 0, 1, 162, '2015-06-24 11:45:50', 1),
('1.36.255.255', 0, 1, 0, '2015-06-24 11:45:50', 1),
('1.37.255.255', 0, 1, 0, '2015-06-24 11:45:50', 1),
('1.39.255.255', 0, 1, 0, '2015-06-24 11:45:50', 1),
('1.44.255.255', 0, 1, 0, '2015-06-24 11:45:50', 1),
('1.45.255.255', 0, 1, 0, '2015-06-24 11:45:50', 1),
('1.47.255.255', 0, 1, 0, '2015-06-24 11:45:50', 1),
('1.51.255.255', 0, 1, 0, '2015-06-24 11:45:50', 1),
('1.1.1.0', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.1.10.0', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.1.00.12', 0, 1, 0, '0000-00-00 00:00:00', 0),
('12.12.12.12', 0, 1, 0, '0000-00-00 00:00:00', 0),
('123.123.123.123', 0, 1, 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `remote_server_list`
--

CREATE TABLE IF NOT EXISTS `remote_server_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `remote_ip` varchar(100) NOT NULL,
  `remote_group` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `server_uname` varchar(10) NOT NULL,
  `server_pass` varchar(10) NOT NULL,
  `server_name` varchar(255) NOT NULL,
  `ssh_username` varchar(255) NOT NULL,
  `ssh_password` varchar(255) NOT NULL,
  `is_busy` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `remote_server_list`
--

INSERT INTO `remote_server_list` (`id`, `email`, `remote_ip`, `remote_group`, `is_active`, `server_uname`, `server_pass`, `server_name`, `ssh_username`, `ssh_password`, `is_busy`) VALUES
(14, '', '178.62.206.252', 'a', 0, 'root', 'demovpn@2', 'samit2', '', '', 0),
(15, '', '178.62.212.202', 'b', 0, 'root', 'demovpn@3', 'samit3', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `servers_data`
--

CREATE TABLE IF NOT EXISTS `servers_data` (
  `server_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(30) NOT NULL,
  `group` varchar(30) DEFAULT NULL,
  `cloud_ip` varchar(18) NOT NULL,
  `local_ip` varchar(18) NOT NULL,
  `real_ip` varchar(18) NOT NULL,
  `controller_id` int(11) NOT NULL,
  `cloud_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `traffic` bigint(20) NOT NULL,
  `bidirectional_mode` tinyint(4) NOT NULL,
  `gateway_mode` tinyint(1) NOT NULL,
  `email` varchar(200) NOT NULL,
  `group_id` int(20) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `is_deleted` int(10) NOT NULL,
  `location` varchar(100) NOT NULL,
  `last_updated` datetime NOT NULL,
  `no_of_revision` bigint(15) NOT NULL,
  `IPAlias` varchar(100) NOT NULL,
  `last_action` varchar(100) NOT NULL,
  `is_complete_action` int(10) NOT NULL DEFAULT '0',
  `is_updated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`server_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `servers_data`
--

INSERT INTO `servers_data` (`server_id`, `type`, `username`, `password`, `group`, `cloud_ip`, `local_ip`, `real_ip`, `controller_id`, `cloud_id`, `customer_id`, `status`, `last_login`, `traffic`, `bidirectional_mode`, `gateway_mode`, `email`, `group_id`, `display_name`, `is_deleted`, `location`, `last_updated`, `no_of_revision`, `IPAlias`, `last_action`, `is_complete_action`, `is_updated`) VALUES
(1, 0, 'VPN14435947871193296260S', 'MB1K7G', NULL, '0.255.255.255', '', '0.255.255.255', 2, 1, 1, 0, '2015-09-30 06:33:07', 0, 1, 0, 'amitavads9@gmail.com', 0, 'Amitava Das', 0, '', '0000-00-00 00:00:00', 0, '', 'Change server biderection', 0, 0),
(2, 0, 'VPN1443596250323652638S', 'iycHVI', NULL, '1.0.0.255', '', '1.0.0.255', 2, 1, 1, 0, '2015-09-30 06:57:30', 0, 0, 0, 'k.kanjilal.01@gmail.com', 0, 'Koushik Kanjilal', 0, '', '0000-00-00 00:00:00', 0, '', 'Add new server', -1, 1),
(3, 0, 'VPN1443597639827309955S', '@VIMd9', NULL, '1.0.3.255', '', '1.0.3.255', 2, 1, 1, 1, '2015-09-30 07:20:39', 0, 0, 0, 'chowdhury.bapparoy@gmail.com', 0, 'chowdhury.bapparoy@gmail.com', 0, '', '0000-00-00 00:00:00', 0, '', 'Server status change', -1, 1),
(4, 0, 'VPN14435992531128520400S', 'GblGs1', NULL, '5.5.5.1', '', '1.0.7.255', 2, 1, 1, 0, '2015-09-30 07:47:33', 0, 0, 0, 'surajitroycse@gmail.com', 0, 'Surajit Roy', 0, '', '0000-00-00 00:00:00', 0, '', 'Add new server', -1, 1),
(5, 0, 'VPN1443599253322141740S', '@rpYLT', NULL, '5.5.5.1', '', '1.0.7.255', 2, 1, 1, 0, '2015-09-30 07:47:33', 0, 0, 0, 'rupsena@gmail.com', 0, 'Rupsena Sir-Ejob', 0, '', '0000-00-00 00:00:00', 0, '', 'Add new server', -1, 1),
(6, 0, 'VPN1443608140257752023S', 'OOPITm', NULL, '5.5.5.2', '', '1.0.15.255', 0, 2, 3, 0, '2015-09-30 10:15:40', 0, 1, 0, 'abbadi555@hotmail.com', 0, 'abbadi555@hotmail.com', 0, '', '0000-00-00 00:00:00', 0, '', 'Change server biderection', -1, 1),
(7, 0, 'VPN1444486860928484672S', 'HVMF5A', NULL, '5.5.5.3', '', '1.0.31.255', 0, 9, 2, 0, '2015-10-10 14:21:00', 0, 0, 0, 'chowdhury.bapparoy@gmail.com', 0, 'chowdhury.bapparoy@gmail.com', 0, '', '0000-00-00 00:00:00', 0, '', '', 0, 0),
(8, 0, 'VPN1448355995914049020S', 'aEDVlv', NULL, '5.5.5.3', '', '1.0.31.255', 0, 2, 3, 0, '2015-11-24 09:06:35', 0, 2, 1, 'abbadi555@hotmail.com', 0, 'abbadi555@hotmail.com', 0, '', '0000-00-00 00:00:00', 0, '', '', 0, 0),
(9, 0, 'VPN1448356058921727686S', 'foxtQU', NULL, '5.5.5.3', '', '1.0.31.255', 0, 2, 3, 0, '2015-11-24 09:07:38', 0, 2, 1, 'abbadi555@hotmail.com', 0, 'abbadi555@hotmail.com', 0, '', '0000-00-00 00:00:00', 0, '', '', 0, 0),
(10, 0, 'VPN1448360027825234634S', 'lSTcH3', NULL, '5.5.5.3', '', '1.0.31.255', 0, 1, 1, 0, '2015-11-24 10:13:47', 0, 0, 0, 'tanaychatterjee7@gmail.com', 0, 'Tanay Chatterjee', 0, '', '0000-00-00 00:00:00', 0, '', '', 0, 0),
(11, 0, 'VPN1448360090636578951S', '@Zl9Hg', NULL, '5.5.5.3', '', '1.0.31.255', 0, 1, 1, 0, '2015-11-24 10:14:50', 0, 0, 0, 'ritika.pal2010@gmail.com', 0, 'Ritika Pal', 0, '', '0000-00-00 00:00:00', 0, '', '', 0, 0),
(12, 0, 'VPN14483601542131565982S', 'ao%nGG', NULL, '5.5.5.3', '', '1.0.31.255', 0, 1, 1, 0, '2015-11-24 10:15:54', 0, 0, 0, 'tanaychatterjee7@gmail.com', 0, 'Tanay Chatterjee', 0, '', '0000-00-00 00:00:00', 0, '', '', 0, 0),
(13, 0, 'VPN14483602171987753531S', 'Hei@Ye', NULL, '5.5.5.3', '', '1.0.31.255', 0, 1, 1, 0, '2015-11-24 10:16:57', 0, 0, 0, 'ritika.pal2010@gmail.com', 0, 'Ritika Pal', 0, '', '0000-00-00 00:00:00', 0, '', '', 0, 0),
(14, 0, 'VPN14483608802122173337S', 'gur01H', NULL, '5.5.5.3', '', '1.0.31.255', 0, 1, 1, 0, '2015-11-24 10:28:00', 0, 0, 0, 'tanaychatterjee7@gmail.com', 0, 'Tanay Chatterjee', 0, '', '0000-00-00 00:00:00', 0, '', '', 0, 0),
(15, 0, 'VPN144836094357986095S', '&fENv&', NULL, '5.5.5.3', '', '1.0.31.255', 0, 1, 1, 0, '2015-11-24 10:29:03', 0, 0, 0, 'ritika.pal2010@gmail.com', 0, 'Ritika Pal', 0, '', '0000-00-00 00:00:00', 0, '', '', 0, 0),
(16, 0, 'VPN14483610061308693293S', 'VGLAxG', NULL, '5.5.5.3', '', '1.0.31.255', 0, 1, 1, 0, '2015-11-24 10:30:06', 0, 0, 0, 'tanaychatterjee7@gmail.com', 0, 'Tanay Chatterjee', 0, '', '0000-00-00 00:00:00', 0, '', '', 0, 0),
(17, 0, 'VPN14483610691118538894S', 'zl7ejb', NULL, '5.5.5.3', '', '1.0.31.255', 0, 1, 1, 0, '2015-11-24 10:31:09', 0, 0, 0, 'tanaychatterjee7@gmail.com', 0, 'Tanay Chatterjee', 0, '', '0000-00-00 00:00:00', 0, '', '', 0, 0),
(18, 0, 'VPN14483611351390464079S', '4zc#%8', NULL, '5.5.5.3', '', '1.0.31.255', 0, 1, 1, 0, '2015-11-24 10:32:15', 0, 0, 0, 'tanaychatterjee7@gmail.com', 0, 'Tanay Chatterjee', 0, '', '0000-00-00 00:00:00', 0, '', '', 0, 0),
(19, 0, 'VPN14483612001871246572S', '1DP8V8', NULL, '5.5.5.3', '', '1.0.31.255', 0, 1, 1, 0, '2015-11-24 10:33:20', 0, 0, 0, 'tanaychatterjee7@gmail.com', 0, 'Tanay Chatterjee', 0, '', '0000-00-00 00:00:00', 0, '', '', 0, 0),
(20, 0, 'VPN1448385952700069203S', 'pcmL77', NULL, '5.5.5.3', '', '1.0.31.255', 0, 2, 3, 0, '2015-11-24 17:25:52', 0, 1, 1, 'abbadi555@hotmail.com', 0, 'abbadi555@hotmail.com', 0, '', '0000-00-00 00:00:00', 0, '', '', 0, 0),
(21, 0, 'VPN14508505001737800540S', '9hgXvS', NULL, '5.5.5.3', '', '1.0.31.255', 0, 1, 2, 0, '2015-12-23 06:01:40', 0, 0, 0, 'samitalways4u@gmail.com', 0, 'samitalways4u@gmail.com', 0, '', '0000-00-00 00:00:00', 0, '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `server_subnets`
--

CREATE TABLE IF NOT EXISTS `server_subnets` (
  `cloud_id` int(11) NOT NULL AUTO_INCREMENT,
  `subnet` varchar(20) NOT NULL,
  `used_ips` int(11) NOT NULL DEFAULT '0',
  `full` tinyint(1) NOT NULL,
  `server_id` int(11) NOT NULL,
  `last_updated` datetime NOT NULL,
  `no_of_revision` bigint(15) NOT NULL,
  PRIMARY KEY (`cloud_id`),
  UNIQUE KEY `subnet` (`subnet`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `service_id` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  `individuals_plan_price` float NOT NULL,
  `business_plan_price` float NOT NULL,
  `service_description` varchar(50) NOT NULL,
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `settings_name` varchar(255) DEFAULT NULL,
  `settings_value` text,
  UNIQUE KEY `settings_name` (`settings_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_name`, `settings_value`) VALUES
('default_cash', '30');

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE IF NOT EXISTS `source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `source-any` tinyint(1) NOT NULL DEFAULT '0',
  `source-internet` tinyint(1) NOT NULL DEFAULT '0',
  `source-groupb` tinyint(1) NOT NULL DEFAULT '0',
  `source-groupa` tinyint(1) NOT NULL DEFAULT '0',
  `source-controller1` tinyint(1) NOT NULL DEFAULT '0',
  `source-server1` tinyint(1) NOT NULL DEFAULT '0',
  `source-client1` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `source`
--

INSERT INTO `source` (`id`, `acl_id`, `source-any`, `source-internet`, `source-groupb`, `source-groupa`, `source-controller1`, `source-server1`, `source-client1`) VALUES
(1, 1, 1, 1, 0, 0, 0, 0, 0),
(2, 4, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `s_firewall`
--

CREATE TABLE IF NOT EXISTS `s_firewall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `s_firewall-deny_all` tinyint(1) NOT NULL DEFAULT '0',
  `s_firewall-allow_all` tinyint(1) NOT NULL DEFAULT '0',
  `s_firewall-processes` tinyint(1) NOT NULL DEFAULT '0',
  `s_firewall-apps` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `s_firewall`
--

INSERT INTO `s_firewall` (`id`, `acl_id`, `s_firewall-deny_all`, `s_firewall-allow_all`, `s_firewall-processes`, `s_firewall-apps`) VALUES
(1, 1, 0, 1, 0, 0),
(2, 4, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `s_forwarding`
--

CREATE TABLE IF NOT EXISTS `s_forwarding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `s_forwarding-new_dst` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `s_forwarding`
--

INSERT INTO `s_forwarding` (`id`, `acl_id`, `s_forwarding-new_dst`) VALUES
(1, 1, 0),
(2, 3, 1),
(3, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `s_qos`
--

CREATE TABLE IF NOT EXISTS `s_qos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `s_qos-shaping` tinyint(1) NOT NULL DEFAULT '0',
  `s_qos-priority` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `s_qos`
--

INSERT INTO `s_qos` (`id`, `acl_id`, `s_qos-shaping`, `s_qos-priority`) VALUES
(1, 1, 1, 1),
(2, 2, 0, 0),
(3, 3, 0, 1),
(4, 4, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `s_tos`
--

CREATE TABLE IF NOT EXISTS `s_tos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `s_tos-bind_all` tinyint(1) NOT NULL DEFAULT '0',
  `s_tos-processes` tinyint(1) NOT NULL DEFAULT '0',
  `s_tos-apps` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `s_tos`
--

INSERT INTO `s_tos` (`id`, `acl_id`, `s_tos-bind_all`, `s_tos-processes`, `s_tos-apps`) VALUES
(1, 1, 1, 0, 1),
(2, 3, 1, 0, 0),
(3, 4, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ticket_id` varchar(20) NOT NULL,
  `user_id` int(10) NOT NULL,
  `user_type` enum('customer','user') NOT NULL DEFAULT 'customer',
  `subject` text,
  `ticket_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('open','closed') NOT NULL DEFAULT 'open',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_id` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_conversations`
--

CREATE TABLE IF NOT EXISTS `ticket_conversations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) NOT NULL,
  `sender` enum('admin','user') NOT NULL DEFAULT 'admin',
  `receiver` enum('admin','user') NOT NULL DEFAULT 'user',
  `message` text,
  `message_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tunnels_data`
--

CREATE TABLE IF NOT EXISTS `tunnels_data` (
  `tunnel_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  `group` varchar(30) DEFAULT NULL,
  `cloud_ip` varchar(18) NOT NULL,
  `local_ip` varchar(18) NOT NULL,
  `real_ip` varchar(18) NOT NULL,
  `controller_id` int(11) NOT NULL,
  `cloud_id` int(11) NOT NULL,
  `user_token` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `traffic` bigint(20) NOT NULL,
  `bidirectional_mode` tinyint(4) NOT NULL,
  `gateway_mode` tinyint(1) NOT NULL,
  `email` varchar(200) NOT NULL,
  `group_id` int(20) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `is_deleted` int(10) NOT NULL,
  `tunnel_type` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `no_of_revision` bigint(15) NOT NULL,
  `IPAlias` varchar(100) NOT NULL,
  `internet_tunnel` tinyint(1) NOT NULL,
  `max_simultaneous_login` tinyint(4) NOT NULL,
  `servers_ACL` varchar(128) NOT NULL,
  `internet` tinyint(1) DEFAULT '0',
  `route` tinyint(1) NOT NULL DEFAULT '0',
  `DeV` tinyint(1) NOT NULL DEFAULT '-1',
  `plan_id` tinyint(1) NOT NULL DEFAULT '1',
  `last_action` varchar(100) NOT NULL,
  `is_complete_action` int(10) NOT NULL DEFAULT '0',
  `is_updated` tinyint(1) NOT NULL DEFAULT '0',
  `is_seen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tunnel_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `tunnels_data`
--

INSERT INTO `tunnels_data` (`tunnel_id`, `type`, `username`, `password`, `group`, `cloud_ip`, `local_ip`, `real_ip`, `controller_id`, `cloud_id`, `user_token`, `status`, `last_login`, `traffic`, `bidirectional_mode`, `gateway_mode`, `email`, `group_id`, `display_name`, `is_deleted`, `tunnel_type`, `location`, `country`, `last_updated`, `no_of_revision`, `IPAlias`, `internet_tunnel`, `max_simultaneous_login`, `servers_ACL`, `internet`, `route`, `DeV`, `plan_id`, `last_action`, `is_complete_action`, `is_updated`, `is_seen`) VALUES
(32, 0, NULL, '', NULL, '5.5.5.3', '', '', 0, 1, 'e4afbe64c2bd384b87a33db2184a625d', 0, '2016-01-18 10:14:36', 0, 0, 0, 'tanay.chatterjee7@gmail.com', 0, 'tanay.chatterjee7@gmail.com', 0, 'server', '', NULL, '0000-00-00 00:00:00', 0, '', 0, 0, '', 0, 0, 1, 2, '', 0, 0, 0),
(33, 0, 'VPN1453112076860116824S', 'LUglyO', NULL, '5.5.5.2', '', '', 0, 1, 'c3ee6973d2c593d5d18bea5d92c8496b', 0, '2016-01-18 10:14:36', 0, 0, 0, 'sahaprovat.ee@gmail.com', 0, 'sahaprovat.ee@gmail.com', 0, 'server', '', NULL, '0000-00-00 00:00:00', 0, '', 0, 0, '', 0, 0, 0, 2, '', 0, 0, 0),
(34, 0, NULL, '', NULL, '5.5.5.6', '', '', 0, 1, 'e4afbe64c2bd384b87a33db2184a625d', 0, '2016-01-18 10:14:36', 0, 0, 0, 'anindyab30@gmail.com', 0, 'anindyab30@gmail.com', 0, 'client', '', NULL, '0000-00-00 00:00:00', 0, '', 0, 0, '', 0, 0, 1, 1, '', 0, 0, 0),
(35, 0, 'VPN1453112076283893712S', 'fBMzPR', NULL, '5.5.5.4', '', '1.0.3.255', 0, 1, 'c3ee6973d2c593d5d18bea5d92c8496b', 0, '2016-01-18 10:14:36', 0, 2, 0, 'aparna1@gmail.com', 3, 'aparna0309@gmail.com', 0, 'server', '13', NULL, '0000-00-00 00:00:00', 0, '', 0, 0, '', 0, 0, 0, 2, '', 0, 0, 0),
(36, 0, 'VPN14531223871457739954S', 'V@SjJo', '', '5.5.5.2', '', '', 0, 1, 'e4afbe64c2bd384b87a33db2184a625d', 0, '2016-01-18 13:06:27', 0, 1, 0, 'aparna0309@gmail.com', 3, 'aparna0309@gmail.com', 0, 'client', '', NULL, '2016-01-18 18:36:27', 0, '', 0, 0, '', 0, 0, -1, 1, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tunnel_acl_relation`
--

CREATE TABLE IF NOT EXISTS `tunnel_acl_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tunnel_id` int(11) NOT NULL,
  `creation_time` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tunnel_acl_relation`
--

INSERT INTO `tunnel_acl_relation` (`id`, `tunnel_id`, `creation_time`, `is_active`) VALUES
(1, 32, '0000-00-00 00:00:00', 0),
(2, 34, '0000-00-00 00:00:00', 0),
(3, 36, '0000-00-00 00:00:00', 0),
(4, 32, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_data`
--

CREATE TABLE IF NOT EXISTS `users_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `user_email` varchar(70) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT '0',
  `has_login` int(1) NOT NULL DEFAULT '0',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=451 ;

--
-- Dumping data for table `users_data`
--

INSERT INTO `users_data` (`id`, `name`, `user_email`, `password`, `is_active`, `has_login`, `date_added`) VALUES
(82, 'SANJOY KUMAR PAUL', 'sanjoy.07.01.1983@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(34, 'Tanay Chatterjee', 'tanaychatterjee7@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(36, 'Ritika Pal', 'ritika.pal2010@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(38, '', 'samitalways4u@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(40, '', 'tanay.chatterjee7@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(41, 'Soumen Choudhuri', 'puchaichowdhury@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(42, 'Job Konnect', 'cv@ackgroup.in', NULL, 0, 0, '2015-06-19 19:53:38'),
(43, '', 'sahaprovat.ee@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(44, 'Shuvankar Saha', 'mgcsmindia@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(45, 'Eshita Mazumder', 'eshita.mazumder1992@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(46, 'Pabitra Tarafder', 'pabitra2005@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(47, '', 'jit.biswas1991@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(48, '@runav@ chakraborty', 'sammm4444@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(49, 'jncsm director', 'jncsmdirector@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(50, 'kingsuk halder', 'sanu.kingsuk@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(51, 'Sanjay Roy', 'sanjayroy91@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(52, 'Koushik Kanjilal', 'kanjilalkoushik@yahoo.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(53, '', 'hr@webgrity.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(54, '', 'shrspaul@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(55, 'Anindya Bhattacharya', 'anindyab30@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(56, 'acharjeekeya1', 'acharjeekeya1@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(57, '', 'pritam55paul@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(58, 'mailmesam1990', 'mailmesam1990@rediffmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(59, '', 'subrataroy31@yahoo.in', NULL, 0, 0, '2015-06-19 19:53:38'),
(60, '', 'ssahirul143@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(61, 'SÎ±Î·dÑ”Ñ”Ï Chowdhury', 'sandeep.nbp@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(62, '', 'support@yebhi.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(63, 'ChandraSekhar Roy', 'roy.chandrasekhar@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(64, '', 'manoranjankumer93@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(65, 'Somu Roy', 'roy.somnath18@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(66, 'Suman Dey', 'sumandey121@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(67, 'Comenzar IT Solutions', 'hr@comenzarit.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(68, '', 'placement.02707@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(69, '', 'Prosn.da9@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(70, 'Ayeeta Pal', 'ayeetapal2012@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(71, 'Sudipta Karan', 'sudiptakaran9@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(72, 'Aparna Dutta', 'aparna0309@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(73, '', 'Prosn.das9@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(74, 'Sounak Basu Roy', 'snkbasuroy@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(75, 'I H@TE GIRL$', 'surajit.surajit5@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(76, '', 'shyamaldas198220@yahoo.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(77, 'prajna swain', 'prajna@execonservices.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(78, '', 'Anushkaray121@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(79, '', 'anuppaul2012@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(81, '', 'moumitajanacemk@gmail.com', NULL, 0, 0, '2015-06-19 19:53:38'),
(83, 'Global Informatica - Info', 'info@gittec.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(84, '', 'dasgupta.sohini@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(85, '@niket $en', 'aniketsen1990@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(86, 'Sagi Rorlich', 'rorlich@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(87, 'Partha Dey', 'partha1002@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(88, '', 'web@brainbuxa.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(89, 'khaledhafiz .', 'khaled.hafiz@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(90, 'jaydip samanta', 'jay.samanta011@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(91, '', 'duncan@hayhurst.info', NULL, 0, 0, '2015-06-20 07:11:28'),
(92, 'somenath das', 'somenath.sd@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(93, 'Abdullah Abu Zaid', 'abdullah@knockbook.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(94, 'Marcelo Srougi', 'msrougi@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(95, 'Suvadip Roy', 'suvadip@tailsys.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(96, 'Lingesh Perakasam', 'lingesh.perakasam@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(97, '', 'support@hostgrator.in', NULL, 0, 0, '2015-06-20 07:11:28'),
(98, 'Saikat, maity', 'smaity.gcect@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(99, 'Bhabna chowdhury', 'bhabna.chowdhury@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(100, 'pritam ...', 'roy.pritam725@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(101, '', 'gcect.it2013@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(102, 'Sourav Das Babin', 'sourav.das.babin@inventorsarena.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(103, 'Somin Khanna', 'hello@thesnipers.in', NULL, 0, 0, '2015-06-20 07:11:28'),
(104, 'almohit travel', 'info@m-arabi.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(105, '', 'herraezja@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(106, 'Roel Van den Bergh', 'roel.vandenbergh@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(107, '', 'abdullah.a.abuzaid@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(108, 'Hiren Das', 'mailtoohiren@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(109, 'ranjith nomula', 'Ranjith.nomula531@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(110, '', 'zah.sml@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(111, 'swagatam hazra', 'hazra.swagatam90@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(112, '', 'chirantan.paul.56@facebook.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(113, '', 'shrabani.das01.IVANGEL@tatatel.co.in', NULL, 0, 0, '2015-06-20 07:11:28'),
(114, 'Kayuar Kansara', 'kayuar@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(115, 'Gaurav Gupta', 'webindica@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(116, 'tanmoy kuila', 'kuila.tanmoy@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(117, '', 'kaushikstock@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(118, 'Abhishek Khandelwal', 'abhishek.khandelwal@marswebsolution.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(119, 'Mohsin Khan', 'mohsinattari@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(120, '', 'hansum.rahul@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(121, 'Rich DiMaggio', 'didyouweekend@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(122, 'sumit dey', 'sumitfriends786@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(123, '', 'omar@kora.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(124, 'Soumitra Mondal', 'adimond50@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(125, '', 'anil.dubey@spacecos.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(126, 'BISWAJIT NAYAK', 'biswajit.nayek9@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(127, '', 'prasanta.amstech@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(128, 'Indrajit Guha', 'iguha0@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(129, 'Chahan Bezirjian', 'chahanb@hotmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(130, 'Somdatta Chakravortty', 's_chakravortty@yahoo.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(131, '', 'sales@4your.co.in', NULL, 0, 0, '2015-06-20 07:11:28'),
(132, '', 'pazzosolutions@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(133, 'Joomla Component Creator', 'component-creator@notwebdesign.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(134, 'Lingesh', 'lingesh@sketchursite.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(135, '`kisalay Rakshit', 'kisalay.rakshit@gmail.com', NULL, 0, 0, '2015-06-20 07:11:28'),
(136, '', 'support@hostgator.in', NULL, 0, 0, '2015-06-20 07:11:29'),
(137, 'Robi Customer Service (Email: 123@robi.com.bd)', '123@robi.com.bd', NULL, 0, 0, '2015-06-20 07:11:29'),
(138, '', 'kaushal@digi3.in', NULL, 0, 0, '2015-06-20 07:11:29'),
(139, '', 'rajib317@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(140, 'Arun Yadav', 'yadavarun@hotmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(141, '', 'mail2souravdas@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(142, 'Russian Guy', 'guy.russian@yandex.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(143, 'Jyotirmoy Bardhan', 'jyotirmoy.jb@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(144, '', 'rukmi@dualcube.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(145, 'Dipanwita Ghosh', 'tukon.08@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(146, 'Prithwijit Guha', 'guhap7@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(147, '', 'roy.in.biz@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(148, '', 'technewscable@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(149, 'KongMing Zhang', 'kongming@smticlogic.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(150, '', 'gcectcse13@googlegroups.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(151, '', 'neeraj.kalwani@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(152, 'Kisalay Rakshit', 'raj.raksh1t@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(153, 'Shin Jara', 'webmaster@iamdavidjara.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(154, 'Government College of Engineering & Ceramic Technology', 'gcectwb@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(155, 'Gmail Team', 'mail-noreply@google.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(156, '', 'nicolasmorell@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(157, 'sourabh bapari', 'sourabhbapari@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(158, '', 'ranjit.nomula531@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(159, '', 'djsarkar.1993@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(160, 'Raju ghosh', 'ghosh.raju2008@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(161, 'tarun mondal', 'tarun.mondal91@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(162, 'lucas >> LUCAS.FARIA@RACHEAQUI.COM.BR', 'LUCAS.FARIA@racheaqui.com.br', NULL, 0, 0, '2015-06-20 07:11:29'),
(163, '""Ãâ„Vâ„Ä´""à®‡ à®à¸£tà¹à¸ Ñ” Ï‚à¹là¹” à®  Â«â•¬â™¥3 : 16â™¥â•¬Â«', 'divijbhattacharjee@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(164, '', 'scc@isical.ac.in', NULL, 0, 0, '2015-06-20 07:11:29'),
(165, 'Roel Van den Bergh', 'roel.vandenbergh@lanvert.net', NULL, 0, 0, '2015-06-20 07:11:29'),
(166, '', 'anand.vps@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(167, '', 'karrotgraphics@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(168, 'SUMON DEY', 'dey4su@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(169, '', 'afty@alienics.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(170, 'SOURAV GHOSH', 'svajogato@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(171, '', 'customerservice@citycell.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(172, 'mukules masti', 'mukulesit@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(173, 'Biplab Singh', 'bips.gcect@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(174, '', 'surajbiswas.gcect@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(175, 'Ishtiaque Zafar', 'ishtiaque.zafar92@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(176, '', 'mona.royc@facebook.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(177, '', 'himanshu@thesnipers.in', NULL, 0, 0, '2015-06-20 07:11:29'),
(178, '', 'contact@synapse-tech.in', NULL, 0, 0, '2015-06-20 07:11:29'),
(179, '', 'acutinella@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(180, '', 'sakher_hatem1@yahoo.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(181, 'Upwork Help Center', 'support+id4291578@upwork.zendesk.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(182, 'Ribhu R', 'aray729@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(183, '', 'abspl@alliancekolkata.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(184, '', 'jordan@valley.io', NULL, 0, 0, '2015-06-20 07:11:29'),
(185, 'Shubhankar Ghosh', 'shubha.ghosh89@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(186, 'Aritra Rudra', 'aritrarudra@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(187, '', 'dkghosh74@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(188, 'Marcelo Srougi', 'marcelo.srougi@racheaqui.com.br', NULL, 0, 0, '2015-06-20 07:11:29'),
(189, '', 'samit.saha@inventorsarena.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(190, 'Sumit Dey', 'sumit.dey.035@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(191, 'Ratnodip (Papun)', 'ratnodipsinha@yahoo.co.in', NULL, 0, 0, '2015-06-20 07:11:29'),
(192, 'FlashSms', 'info@flashsms.it', NULL, 0, 0, '2015-06-20 07:11:29'),
(193, 'Najmul kiram', 'kiram.biswas@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(194, 'HR-ADMIN (ACMESYS GLS)', 'hr@acmesysgls.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(195, '', 'mdsheth1@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(196, '', 'zafar@mindshiftinteractive.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(197, 'paramesh mishra', 'paramesh.mishra@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(198, 'Armattan Quads', 'service@armattanquads.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(199, '', 'kayal.deep2@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(200, '', 'debabrata.ghosh@axisbank.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(201, 'Banglalink Customer Care', 'info@banglalinkgsm.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(202, '', 'info@atavo.de', NULL, 0, 0, '2015-06-20 07:11:29'),
(203, '', 'shiladitya.paul92@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(204, '', 'arpitagoswami81@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(205, '', 'derek@smss.co.za', NULL, 0, 0, '2015-06-20 07:11:29'),
(206, 'hassan alsaggaf', 'h.asaggaf@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(207, '', 'support@alliancekolkata.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(208, '', 'amrita.mondal02@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(209, '', 'fitchltd156@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(210, 'Ananya Ghosal', 'ananya.ghosal05@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(211, '', 'nuno74@hotmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(212, '', 'gopal2das@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(213, 'Vijay Kumar Singh', 'digitalvibrancewebdesign@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(214, 'Patrick McCarthy', 'mediatomcat@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(215, '', 'valerymenelas@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(216, 'Partha Pratim Mondal', 'itsppratim@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(217, '', 'salauddin.sk0409@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(218, 'Saibal Pal', 'pal.saibalx2@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(219, 'naren karu', 'narenkaru91@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(220, '', 'gaurav.bhabha47@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(221, '', 'movie12click@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(222, 'Suman Dey', 'sumandeyjob2015@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(223, 'Arpita Roychowdhury', 'webvelocity@yahoo.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(224, '', 'agilamaran@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(225, 'Nithiyananthan Anan', 'kk.nithiyananthan@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(226, '', 'mona.royc@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(227, 'Marco Forconi', 'posta@marcoforconi.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(228, 'Bubai Saha', 'bubaigcect@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(229, '', 'mithe.haoa@facebook.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(230, '', 'account@m-arabi.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(231, 'Rupam Mukherjee', 'rupam04@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(232, 'RAJEN PAL', 'rajenpal033@yahoo.in', NULL, 0, 0, '2015-06-20 07:11:29'),
(233, 'abhik das', 'probal71@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(234, 'ghosh samrat', 'callsamrat@yahoo.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(235, '', 'hello@webdeveloper.im', NULL, 0, 0, '2015-06-20 07:11:29'),
(236, 'Amit Pal', 'pal.raja111@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(237, 'MANNI .', 'manni.chandan@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(238, 'Suman kayal "new motivation of life"', 'sumankayal80@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(239, '', 'alwaysexcited99@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(240, 'Nicholas Vembos', 'nvembos@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(241, 'Marcos AntÃ´nio', 'Marcos.antonio@gripom.com.br', NULL, 0, 0, '2015-06-20 07:11:29'),
(242, 'sms shiv', 'smsnewindia@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(243, 'TUHIN-i m alive', '983634275t@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(244, '', 'benjamim450@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(245, 'Amit Debnath', 'amitdn@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(246, 'Vivek Anand', 'vivek.press2000@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(247, '', 'amitava.rc25@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(248, 'Abhishek More', 'abhishekmore@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(249, 'Victor Zertuche', 'vzert@vzert.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(250, '', 'lozano18a@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(251, '', 'charafihicham@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(252, '', 'garavind1979@yahoo.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(253, 'Ankit Kulkarni', 'ankit.kulkarni@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(254, 'R@N@D!P r@n@d!p', 'ranadip.gcect@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(255, 'sarkar.madhumalati@gmail.com', 'sarkar.madhumalati@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(256, 'Pulak Patra', 'id.pulak@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(257, 'Hirendranath Das', 'hirendranathdas04@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(258, '', 'sidhant.bansal@iiml.org', NULL, 0, 0, '2015-06-20 07:11:29'),
(259, 'Kaushik Adhikary', 'ipenosindia@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(260, 'Mansur Ali', 'm.ali5392@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(261, '', 'info.wholesale@grameenphone.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(262, '', 'support@socialinviter.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(263, '', 'danielrantunes@bsd.com.br', NULL, 0, 0, '2015-06-20 07:11:29'),
(264, 'Sk Salauddin', 'sksalauddin1988@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(265, '', 'noboni.mondal@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(266, 'Arnab Chakraborty', 'arnab.cst@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(267, 'Dhinchak Koushik', 'das.koushik.only@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(268, '', 'rohin9591@rediffmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(269, '', 'nilesh@verity.in', NULL, 0, 0, '2015-06-20 07:11:29'),
(270, 'BIJOY PAUL', 'work.bijoypaul@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(271, 'REGISTRAR, GCECT, Kolkata', 'gcect.registrar@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(272, 'Domain Registrar', 'domain@eis.ernet.in', NULL, 0, 0, '2015-06-20 07:11:29'),
(273, '', 'sammyabhattacharjee@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(274, '', 'AMBIT.TECHNOLOGIES@hotmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(275, '', 'eduphilic@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(276, 'Prithwi Raj', 'prithwi2005@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(277, 'Pulak Patra', 'pulakpatra85@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(278, 'Hailey Richards', 'haileyrich0409@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(279, 'khaled hassan', 'khaledhilton@hotmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(280, '', 'diogo.hartmann@fluxoti.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(281, '', 'ramyzaidan@qatar.net.qa', NULL, 0, 0, '2015-06-20 07:11:29'),
(282, 'Rupam Mukherjee', 'rupammukherjee04@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(283, 'Sariful Islam', 'islam.sariful0@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(284, 'Logeswaran Murugaya', 'logeswaran2115@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(285, 'JoÃ£o Cleber Generoso', 'joao@bestuse.com.br', NULL, 0, 0, '2015-06-20 07:11:29'),
(286, '', 'amitroy.wbut@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(287, '', 'ben.potgieter@viamedia.co.za', NULL, 0, 0, '2015-06-20 07:11:29'),
(288, 'Lingesh', 'lingesh@palsolutions.com.my', NULL, 0, 0, '2015-06-20 07:11:29'),
(289, '', 'prasantasen.2007@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(290, '', 'deon@viamedia.co.za', NULL, 0, 0, '2015-06-20 07:11:29'),
(291, 'SAPTARSHA SAHA', 'rupak.heart@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(292, 'Vibin N', 'vibin@dneers.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(293, 'gourab ghosh', 'gourab.ghosh91@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(294, '', 'prabir@4your.co.in', NULL, 0, 0, '2015-06-20 07:11:29'),
(295, 'Ritwik Mondal', 'ritwik.mondal@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(296, '', 'sdabwahid@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(297, 'Punith Blue Bird Groups', 'punith@bluebirdgroups.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(298, '', 'fitch156@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(299, 'ABHIK DAS', 'www.abhik@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(300, 'Sourav Punchinello', 'coolsouravat11@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(301, '', 'sabbir.khan175@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(302, 'Justin Lawrence', 'justinl@m2north.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(303, 'Rajib Chakraborty', 'chakraborty_rajib@yahoo.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(304, 'AnotherWorld Support', 'anotherworldsupport@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(305, '', 'infosandeeppandey@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(306, 'Pratik Sonar', 'psonar91@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(307, 'Anirban Sinha', 'sinha.anirban3@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(308, 'Anjan Mallick', 'njnmallick@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(309, 'Marco Forconi', 'marcoforconi@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(310, '', 'business@flipkart.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(311, 'Bruno Wiltemburg', 'brunoew@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(312, 'Susanta Barai', 'susanta.barai77@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(313, '', 'klpnsh@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(314, '', 'hrp@hrplacement.in', NULL, 0, 0, '2015-06-20 07:11:29'),
(315, '', 'ozsel19@hotmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(316, 'Aditya Bhowmick', 'aditya.world09@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(317, 'noman firdaus', 'noman.firdaus@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(318, 'Mohammad Jawabreh', 'moe985@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(319, 'omar Ehassanen', 'mielomar@yahoo.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(320, '', 'jayantaroychowdhury3@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(321, 'Controller of Examination, GCECT', 'coe@gcect.ac.in', NULL, 0, 0, '2015-06-20 07:11:29'),
(322, 'Birbal The Don Of GCECT', 'birbalthedon@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(323, '', 'mark@new-media-designs.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(324, 'Shailendra Jha', 'shailendra@scriptadda.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(325, '', 'parna.pal@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(326, 'Subrata Roy', 'subratar19@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(327, '', 'kaustav.diatm@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(328, 'Rajat Pal', 'pal.rajat66@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(329, '', 'arvoredebigode@hotmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(330, 'Antonio Mendes', 'am@ymobiz.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(331, '', 'somnath5233@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(332, '', 'anjan@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(333, 'Bishwarup Das', 'bishwarup.cse.09@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(334, '', 'arpanroy89@ymail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(335, 'jamie.gordon', 'jamie.gordon@northumbria.ac.uk', NULL, 0, 0, '2015-06-20 07:11:29'),
(336, 'subha..... in the way of heaven', 'subha.ash64@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(337, 'Sayan - eccentrically pure', 'writabrato@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(338, 'support 4your', 'support@4your.co.in', NULL, 0, 0, '2015-06-20 07:11:29'),
(339, 'Pankaj Khandelwal', 'microntechnologies.in@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(340, 'somin khanna', 'sominkhanna@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(341, '', 'contact@kindertouch.org', NULL, 0, 0, '2015-06-20 07:11:29'),
(342, 'SONNY LASKAR', 'sonnylaskar@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(343, 'Krishnendu Dutta', 'krish_dutt@yahoo.co.in', NULL, 0, 0, '2015-06-20 07:11:29'),
(344, '', 'sumanta.seth@inventorsarena.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(345, '', 'dlobo@clubsms.com.bo', NULL, 0, 0, '2015-06-20 07:11:29'),
(346, '', 'ilya_golotin@mail.ru', NULL, 0, 0, '2015-06-20 07:11:29'),
(347, '', 'mattmanns@firesoft.com.au', NULL, 0, 0, '2015-06-20 07:11:29'),
(348, 'Sall App', 'contato@sallapp.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(349, 'Sunit Mondal', 'sunit.mondal04@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(350, 'Aritra Mahapatra', 'aritra.mhp@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(351, 'Freelanced Job', 'freelancedjob@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(352, 'Mainak Chakraborty', 'mainak.chakraborty91@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(353, '', 'and1me2i3@yahoo.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(354, 'Nandan Saha', 'nandan.saha1@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(355, '', 'sarvmangalamiit@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(356, 'Debmallya Dutta', 'debmallya92in@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(357, '', 'info@teletalk.com.bd', NULL, 0, 0, '2015-06-20 07:11:29'),
(358, '', 'appu1003@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(359, 'sanchit babbar', 'sanchit_babbar@hotmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(360, '', 'gcect-it-2013@googlegroups.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(361, 'anirban law', 'lawanirban@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(362, '', 'v.i.p@msn.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(363, 'chandu prasad', 'hr.chanduprasad@rediffmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(364, 'sovan das Chakraborty', 'sovandas10@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(365, '', 'audi4avik@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(366, 'Sajib Saha', 'eshaan789@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(367, '', 'fmachado.dev@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(368, '', 'Maherlok@hotmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(369, 'Jareesh Nandi', 'jareesh.clt@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(370, 'BIBHAS MANDAL', 'bmbibsy28@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(371, '', 'muroeker@outlook.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(372, '', 'amc@amc.com.uy', NULL, 0, 0, '2015-06-20 07:11:29'),
(373, '', 'e_ayoub_m@yahoo.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(374, 'praveen kumar', 'sr.pkumar22@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(375, '', 'pf@ymobiz.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(376, '', 'deva.murali@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(377, 'Acronym Solutions', 'acronymsolutions@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(378, 'ARIHANT JAIN', 'lmspt953@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(379, 'Sourav Banerjee', 'srvasn@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(380, 'vibin n', 'vibindneers@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(381, '', 'restores@hostgator.in', NULL, 0, 0, '2015-06-20 07:11:29'),
(382, '', 'grabsocialmarket@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(383, 'Prateep Mukherjee', 'prateep.baban@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(384, '', 'samitalways4u@synapse-tech.in', NULL, 0, 0, '2015-06-20 07:11:29'),
(385, 'sourabh das', 'sourabhdas3592@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(386, 'Essadik Mohammed', 'ek.mohammed11@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(387, 'Tapas Das', 'dastapas93@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(388, '', 'hr@kussoft.net', NULL, 0, 0, '2015-06-20 07:11:29'),
(389, 'saurav das', 'saurav.dstorm@gmail.com', NULL, 0, 0, '2015-06-20 07:11:29'),
(390, NULL, 'abbadi555@hotmail.com', NULL, 0, 0, '2015-06-20 13:19:13'),
(391, 'Saurav taran', '', NULL, 0, 0, '2015-06-23 08:03:55'),
(393, '', 'assignments@ardentcollaborations.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(394, 'Bilas', 'bilas.sarkar08@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(395, 'ARKO BANERJEE', 'marchboy1903@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(396, '', 'anu.gope@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(397, '', 'wtp@ndtv.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(398, '', 'legendster.earthian@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(399, 'Hemant Singh', 'zakeribus.singh@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(400, '', 'oslktm@oslgroup.co.in', NULL, 0, 0, '2015-06-23 08:03:55'),
(401, '', 'master@asavari.amosconnect.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(402, '', 'master.globalspirit@amosconnect.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(403, '', 'sam4u544@yahoo.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(404, '', 'tvfcareers@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(405, '', 'sbroyart@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(406, 'Swarobindo Mukherjee', 'anando.here@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(407, '', 'ilp.support@tcs.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(408, '', 'master@globalspirit.amosconnect.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(409, '', 'isat2010@iist.ac.in', NULL, 0, 0, '2015-06-23 08:03:55'),
(412, '', 'mithunbhuiya@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(413, '', 'students@flipkart.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(414, '', 'Questions.in@support.sonymobile.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(415, 'Pranab m', 'pranab1994@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(416, 'hardeep singh', 'iamrootsh3ll@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(417, '', 'debayanbasu11@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(422, 'Flirt', 'admin@flirt.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(423, 'Biswanath Karmakar', 'bajaj.biswanath@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(424, '', 'reservations@seaclub.in', NULL, 0, 0, '2015-06-23 08:03:55'),
(425, '', 'soumadipghosh2@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(426, '', 'advqos@trai.gov.in', NULL, 0, 0, '2015-06-23 08:03:55'),
(427, 'Aritra Sasmal', 'aritrasasmal@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(428, 'roy.203751@amosconnectcrew.com', 'roy.203751@amosconnectcrew.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(429, 'Oindrila Ghosh', 'mithig03@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(430, '', 'aloghosh.202013@amosconnectcrew.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(431, 'deep ghosh', 'deepghosh.84kgec@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(432, 'Arghya', 'am9101@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(433, 'Subhadeep Pal', 'subhadeepal@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(434, '', 'pal93souvik@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(435, '', 'srashta.goutam@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(436, '', 'roymilner98@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(437, 'Pranab Biswas', 'pranab9994@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(438, '', 'reservation@seaclub.in', NULL, 0, 0, '2015-06-23 08:03:55'),
(439, '', 'netneutralityindia10@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(440, '', '09901001966@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(441, '', 'Sonyindia.care@ap.sony.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(442, '', 'Somc_serviceindia@sonymobile.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(443, '', 'debabrata.chowdhury@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(444, '', 'dipanjan@ardentcollaborations.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(445, '', 'eetpkalyani@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(446, '', 'archisman001@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(447, '', 'subhajitroykgec@yahoo.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(448, 'Ishtiaque Zafar', 'coolhunk.sam5@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(449, '', 'noreply@lockerz.com', NULL, 0, 0, '2015-06-23 08:03:55'),
(450, '', 'anupamkapil.com@gmail.com', NULL, 0, 0, '2015-06-23 08:03:55');

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE IF NOT EXISTS `voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_no` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`id`, `voucher_no`, `is_active`, `customer_id`, `amount`) VALUES
(1, 'vpn1234', 0, 0, 50),
(2, 'vpn12345', 0, 0, 10),
(3, 'V35653I', 0, 0, 200),
(4, 'V78789I', 0, 0, 100),
(5, 'V78789', 1, 0, 10000);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
