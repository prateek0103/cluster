-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 28, 2016 at 07:50 PM
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
(1, '0.255.255.255', 0, 0, 0, '0000-00-00 00:00:00', 0),
(2, '1.0.0.255', 0, 0, 0, '0000-00-00 00:00:00', 0),
(3, '1.0.3.255', 0, 0, 0, '0000-00-00 00:00:00', 0),
(4, '5.5.5.1', 0, 0, 0, '0000-00-00 00:00:00', 0),
(5, '5.5.5.2', 0, 0, 0, '0000-00-00 00:00:00', 0),
(6, '5.5.5.3', 0, 0, 0, '0000-00-00 00:00:00', 0),
(7, '5.5.5.4', 0, 0, 0, '0000-00-00 00:00:00', 0),
(8, '5.5.5.5', 0, 0, 0, '0000-00-00 00:00:00', 0),
(9, '5.5.5.6', 0, 0, 0, '0000-00-00 00:00:00', 0),
(10, '5.5.5.7', 0, 0, 0, '0000-00-00 00:00:00', 0),
(11, '5.5.5.8', 0, 0, 0, '0000-00-00 00:00:00', 0),
(12, '5.5.5.9', 0, 0, 0, '0000-00-00 00:00:00', 0),
(13, '5.5.5.10', 0, 0, 0, '0000-00-00 00:00:00', 0),
(14, '5.5.5.11', 0, 0, 0, '0000-00-00 00:00:00', 0),
(15, '5.5.5.12', 0, 0, 0, '0000-00-00 00:00:00', 0),
(16, '5.5.5.13', 0, 0, 0, '0000-00-00 00:00:00', 0),
(17, '5.5.5.14', 0, 0, 0, '0000-00-00 00:00:00', 0),
(18, '5.5.5.15', 0, 0, 0, '0000-00-00 00:00:00', 0),
(19, '5.5.5.16', 0, 0, 0, '0000-00-00 00:00:00', 0),
(20, '5.5.5.17', 0, 0, 0, '0000-00-00 00:00:00', 0),
(21, '5.5.5.18', 0, 0, 0, '0000-00-00 00:00:00', 0),
(22, '5.5.5.19', 0, 0, 0, '0000-00-00 00:00:00', 0),
(23, '5.5.5.20', 0, 0, 0, '0000-00-00 00:00:00', 0),
(24, '5.5.5.21', 0, 0, 0, '0000-00-00 00:00:00', 0),
(25, '5.5.5.22', 0, 0, 0, '0000-00-00 00:00:00', 0),
(26, '5.5.5.23', 0, 0, 0, '0000-00-00 00:00:00', 0),
(27, '5.5.5.24', 0, 0, 0, '0000-00-00 00:00:00', 0),
(28, '5.5.5.25', 0, 0, 0, '0000-00-00 00:00:00', 0),
(29, '5.5.5.26', 0, 0, 0, '0000-00-00 00:00:00', 0),
(30, '5.5.5.27', 0, 0, 0, '0000-00-00 00:00:00', 0),
(31, '5.5.5.28', 0, 0, 0, '0000-00-00 00:00:00', 0),
(32, '5.5.5.29', 0, 0, 0, '0000-00-00 00:00:00', 0),
(33, '5.5.5.30', 0, 0, 0, '0000-00-00 00:00:00', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `clouds_data`
--

INSERT INTO `clouds_data` (`cloud_id`, `username`, `password`, `cloud_name`, `cloud_name_prefix`, `user_token`, `traffic`, `datacenter_server_id`, `is_active`, `email`, `is_deleted`) VALUES
(1, NULL, NULL, 'test', '', '37c1c8b32de36e2ef70b16815971f2d1', 0, 0, 1, 'samit@mail.com', 0),
(2, NULL, NULL, 'Cloud1', '', '37a1219b90be9ad8f8741535f79c00e6', 0, 0, 1, 'abdo@gmail.com', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `customers_data`
--

INSERT INTO `customers_data` (`customer_id`, `name`, `phone`, `remail`, `email`, `password`, `Cash_amount`, `num_clouds`, `num_servers`, `num_clients`, `num_real_ip`, `num_internet_tunnel`, `subscription_date`, `token`, `plan_id`, `is_verfied`, `is_active`, `show_cost`, `login_type`, `is_admin`, `last_checked`) VALUES
(1, 'Samit', '', '', 'samit@mail.com', '6064fa5a68da4385d867a4eef14d1a0a', 29.397627314921, 0, 0, 0, 0, 0, '2016-03-18 11:45:01', '37c1c8b32de36e2ef70b16815971f2d1', 1, 1, 1, 1, 'normal', 0, 1458301501),
(2, 'abdo', '', '', 'abdo@gmail.com', '6064fa5a68da4385d867a4eef14d1a0a', 29.891012731409, 0, 0, 0, 0, 0, '2016-03-18 11:45:01', '37a1219b90be9ad8f8741535f79c00e6', 1, 1, 1, 1, 'normal', 0, 1458301501);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `c_firewall`
--

CREATE TABLE IF NOT EXISTS `c_firewall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `c_firewall-deny_all` varchar(255) NOT NULL DEFAULT '0',
  `c_firewall-allow_all` varchar(255) NOT NULL DEFAULT '0',
  `c_firewall-apps` varchar(255) NOT NULL DEFAULT '0',
  `c_firewall-ip_port_protoco` varchar(255) NOT NULL DEFAULT '0',
  `c_firewall-websites` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `c_firewall`
--

INSERT INTO `c_firewall` (`id`, `acl_id`, `c_firewall-deny_all`, `c_firewall-allow_all`, `c_firewall-apps`, `c_firewall-ip_port_protoco`, `c_firewall-websites`) VALUES
(1, 1, '0', '0', '0', '0', '0'),
(2, 2, '0', '0', '0', '0', '0'),
(3, 3, '0', '0', '0', '0', '0'),
(4, 4, '0', '0', '0', '0', '0'),
(5, 5, '0', '0', '0', '0', '0'),
(6, 6, '0', '0', '0', '0', '0'),
(7, 7, '0', '0', '0', '0', '0'),
(8, 8, '0', '0', '0', '0', '0'),
(9, 9, '0', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `c_forwarding`
--

CREATE TABLE IF NOT EXISTS `c_forwarding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `c_forwarding-new_dst` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `c_forwarding`
--

INSERT INTO `c_forwarding` (`id`, `acl_id`, `c_forwarding-new_dst`) VALUES
(1, 1, 'df'),
(2, 2, '0'),
(3, 3, '0'),
(4, 4, '0'),
(5, 5, '0'),
(6, 6, '0'),
(7, 7, '0'),
(8, 8, '0'),
(9, 9, '0');

-- --------------------------------------------------------

--
-- Table structure for table `c_qos`
--

CREATE TABLE IF NOT EXISTS `c_qos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `c_qos-shaping` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `c_qos`
--

INSERT INTO `c_qos` (`id`, `acl_id`, `c_qos-shaping`) VALUES
(1, 1, '0'),
(2, 2, '0'),
(3, 3, '0'),
(4, 4, '0'),
(5, 5, '0'),
(6, 6, '0'),
(7, 7, '0'),
(8, 8, '0'),
(9, 9, '0');

-- --------------------------------------------------------

--
-- Table structure for table `c_routing`
--

CREATE TABLE IF NOT EXISTS `c_routing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `c_routing-tos_to_gateway` varchar(255) NOT NULL DEFAULT '0',
  `c_routing-country` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `c_routing`
--

INSERT INTO `c_routing` (`id`, `acl_id`, `c_routing-tos_to_gateway`, `c_routing-country`) VALUES
(1, 1, '0', '0'),
(2, 2, '0', '0'),
(3, 3, '0', '0'),
(4, 4, '0', '0'),
(5, 5, '0', '0'),
(6, 6, '0', '0'),
(7, 7, '0', '0'),
(8, 8, '0', '0'),
(9, 9, '0', '0');

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
  `destination-any` varchar(255) NOT NULL DEFAULT '0',
  `destination-internet` varchar(255) NOT NULL DEFAULT '0',
  `destination-specific_tunnel` varchar(255) NOT NULL DEFAULT '0',
  `destination-specific_group` varchar(255) NOT NULL DEFAULT '0',
  `destination-my_cloud` varchar(255) NOT NULL DEFAULT '0',
  `destination-my_clouds` varchar(255) NOT NULL DEFAULT '0',
  `destination-every_cloud` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `destination`
--

INSERT INTO `destination` (`id`, `acl_id`, `destination-any`, `destination-internet`, `destination-specific_tunnel`, `destination-specific_group`, `destination-my_cloud`, `destination-my_clouds`, `destination-every_cloud`) VALUES
(1, 1, 'iuhb', 'gdfz', '1', '2', '0', '0', '0'),
(2, 2, '0', '0', '0', '0', '0', '0', '0'),
(3, 3, '0', '0', '0', '0', '0', '0', '0'),
(4, 4, '0', '0', '0', '0', '0', '0', '0'),
(5, 5, '0', '0', '0', '0', '0', '0', '0'),
(6, 6, '0', '0', '0', '0', '0', '0', '0'),
(7, 7, '0', '0', '0', '0', '0', '0', '0'),
(8, 8, '0', '0', '0', '0', '0', '0', '0'),
(9, 9, '0', '0', '0', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `d_final`
--

CREATE TABLE IF NOT EXISTS `d_final` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `d_final-ip_port` varchar(255) NOT NULL DEFAULT '0',
  `d_final-process` varchar(255) NOT NULL DEFAULT '0',
  `d_final-app` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `d_final`
--

INSERT INTO `d_final` (`id`, `acl_id`, `d_final-ip_port`, `d_final-process`, `d_final-app`) VALUES
(1, 1, 'po', '0', '0'),
(2, 2, '0', '0', '0'),
(3, 3, '0', '0', '0'),
(4, 4, '0', '0', '0'),
(5, 5, '0', '0', '0'),
(6, 6, '0', '0', '0'),
(7, 7, '0', '0', '0');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `job_queue`
--

INSERT INTO `job_queue` (`job_id`, `tunnel_id`, `action`, `new_data`, `old_data`, `remote_server_id`, `is_complete_action`, `added_time`, `group`, `token`, `is_seen`) VALUES
(1, 0, 'add_new_tunnel', 'a:1:{i:0;a:13:{s:5:"uname";s:24:"VPN14582346711634854018S";s:5:"upass";s:6:"RYDtfx";s:8:"cloud_id";s:1:"1";s:5:"email";s:14:"samit@mail.com";s:12:"display_name";s:4:"abcd";s:18:"bidirectional_mode";s:1:"0";s:12:"gateway_mode";s:1:"0";s:8:"cloud_ip";s:9:"10.10.0.1";s:11:"tunnel_type";s:6:"server";s:8:"group_id";s:1:"0";s:8:"username";s:24:"VPN14582346711634854018S";s:8:"password";s:6:"RYDtfx";s:5:"token";s:32:"37c1c8b32de36e2ef70b16815971f2d1";}}', 'a:1:{i:0;a:14:{s:5:"uname";s:24:"VPN14582346711634854018S";s:5:"upass";s:6:"RYDtfx";s:8:"cloud_id";s:1:"1";s:5:"email";s:14:"samit@mail.com";s:12:"display_name";s:4:"abcd";s:18:"bidirectional_mode";s:1:"0";s:12:"gateway_mode";s:1:"0";s:8:"cloud_ip";s:9:"10.10.0.1";s:11:"tunnel_type";s:6:"server";s:8:"group_id";s:1:"0";s:8:"username";s:24:"VPN14582346711634854018S";s:8:"password";s:6:"RYDtfx";s:5:"token";s:32:"37c1c8b32de36e2ef70b16815971f2d1";s:9:"tunnel_id";i:1;}}', 16, 2, '2016-03-17 13:11:11', 'a', '37c1c8b32de36e2ef70b16815971f2d1', 1),
(2, 0, 'add_new_tunnel', 'a:1:{i:0;a:13:{s:5:"uname";s:24:"VPN14582348261409679207S";s:5:"upass";s:6:"swlP9j";s:8:"cloud_id";s:1:"1";s:5:"email";s:14:"samit@mail.com";s:12:"display_name";s:4:"nnnn";s:18:"bidirectional_mode";s:1:"0";s:12:"gateway_mode";s:1:"0";s:8:"cloud_ip";s:9:"10.10.0.2";s:11:"tunnel_type";s:6:"server";s:8:"group_id";s:1:"0";s:8:"username";s:24:"VPN14582348261409679207S";s:8:"password";s:6:"swlP9j";s:5:"token";s:32:"37c1c8b32de36e2ef70b16815971f2d1";}}', 'a:1:{i:0;a:14:{s:5:"uname";s:24:"VPN14582348261409679207S";s:5:"upass";s:6:"swlP9j";s:8:"cloud_id";s:1:"1";s:5:"email";s:14:"samit@mail.com";s:12:"display_name";s:4:"nnnn";s:18:"bidirectional_mode";s:1:"0";s:12:"gateway_mode";s:1:"0";s:8:"cloud_ip";s:9:"10.10.0.2";s:11:"tunnel_type";s:6:"server";s:8:"group_id";s:1:"0";s:8:"username";s:24:"VPN14582348261409679207S";s:8:"password";s:6:"swlP9j";s:5:"token";s:32:"37c1c8b32de36e2ef70b16815971f2d1";s:9:"tunnel_id";i:2;}}', 16, 2, '2016-03-17 13:13:46', 'a', '37c1c8b32de36e2ef70b16815971f2d1', 1),
(3, 0, 'add_new_tunnel', 'a:1:{i:0;a:13:{s:5:"uname";s:24:"VPN14582450161917249230S";s:5:"upass";s:6:"6yI19v";s:8:"cloud_id";s:1:"2";s:5:"email";s:14:"abdo@gmail.com";s:12:"display_name";s:14:"abdo@gmail.com";s:18:"bidirectional_mode";s:1:"0";s:12:"gateway_mode";s:1:"0";s:8:"cloud_ip";s:9:"10.10.0.3";s:11:"tunnel_type";s:6:"server";s:8:"group_id";s:1:"0";s:8:"username";s:24:"VPN14582450161917249230S";s:8:"password";s:6:"6yI19v";s:5:"token";s:32:"37a1219b90be9ad8f8741535f79c00e6";}}', 'a:1:{i:0;a:14:{s:5:"uname";s:24:"VPN14582450161917249230S";s:5:"upass";s:6:"6yI19v";s:8:"cloud_id";s:1:"2";s:5:"email";s:14:"abdo@gmail.com";s:12:"display_name";s:14:"abdo@gmail.com";s:18:"bidirectional_mode";s:1:"0";s:12:"gateway_mode";s:1:"0";s:8:"cloud_ip";s:9:"10.10.0.3";s:11:"tunnel_type";s:6:"server";s:8:"group_id";s:1:"0";s:8:"username";s:24:"VPN14582450161917249230S";s:8:"password";s:6:"6yI19v";s:5:"token";s:32:"37a1219b90be9ad8f8741535f79c00e6";s:9:"tunnel_id";i:3;}}', 16, 2, '2016-03-17 16:03:36', 'a', '37a1219b90be9ad8f8741535f79c00e6', 1),
(4, 0, 'add_new_tunnel', 'a:1:{i:0;a:13:{s:5:"uname";s:23:"VPN1458301369982440035S";s:5:"upass";s:6:"RZV4bt";s:8:"cloud_id";s:1:"1";s:5:"email";s:14:"samit@mail.com";s:12:"display_name";s:4:"acaf";s:18:"bidirectional_mode";s:1:"0";s:12:"gateway_mode";s:1:"0";s:8:"cloud_ip";s:9:"10.10.0.4";s:11:"tunnel_type";s:6:"server";s:8:"group_id";s:1:"0";s:8:"username";s:23:"VPN1458301369982440035S";s:8:"password";s:6:"RZV4bt";s:5:"token";s:32:"37c1c8b32de36e2ef70b16815971f2d1";}}', 'a:1:{i:0;a:14:{s:5:"uname";s:23:"VPN1458301369982440035S";s:5:"upass";s:6:"RZV4bt";s:8:"cloud_id";s:1:"1";s:5:"email";s:14:"samit@mail.com";s:12:"display_name";s:4:"acaf";s:18:"bidirectional_mode";s:1:"0";s:12:"gateway_mode";s:1:"0";s:8:"cloud_ip";s:9:"10.10.0.4";s:11:"tunnel_type";s:6:"server";s:8:"group_id";s:1:"0";s:8:"username";s:23:"VPN1458301369982440035S";s:8:"password";s:6:"RZV4bt";s:5:"token";s:32:"37c1c8b32de36e2ef70b16815971f2d1";s:9:"tunnel_id";i:4;}}', 16, 2, '2016-03-18 07:42:49', 'a', '37c1c8b32de36e2ef70b16815971f2d1', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
('0.255.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.0.0.255', 0, 0, 0, '0000-00-00 00:00:00', 0),
('1.0.3.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.0.7.255', 0, 0, 0, '0000-00-00 00:00:00', 0),
('1.0.15.255', 0, 0, 0, '0000-00-00 00:00:00', 0),
('1.0.31.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.0.63.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.0.127.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.0.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.1.0.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.1.1.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.1.63.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.1.127.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.1.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.2.2.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.2.3.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.2.127.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.2.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.3.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.4.0.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.4.127.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.4.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.5.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.7.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.8.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.9.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.10.9.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.10.10.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.10.127.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.10.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.11.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.15.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.19.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.20.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.21.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.23.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.31.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.32.127.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.32.191.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.32.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.33.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.35.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.36.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.37.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.39.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.44.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.45.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.47.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.51.255.255', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.1.1.0', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.1.10.0', 0, 1, 0, '0000-00-00 00:00:00', 0),
('1.1.00.12', 0, 1, 0, '0000-00-00 00:00:00', 0),
('12.12.12.12', 0, 1, 0, '0000-00-00 00:00:00', 0),
('123.123.123.123', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.1', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.2', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.3', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.4', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.5', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.6', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.7', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.8', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.9', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.10', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.11', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.12', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.13', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.14', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.15', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.16', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.17', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.18', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.19', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.20', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.21', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.22', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.23', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.24', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.25', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.26', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.27', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.28', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.29', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.30', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.31', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.32', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.33', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.34', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.35', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.36', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.37', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.38', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.39', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.40', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.41', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.42', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.43', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.44', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.45', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.46', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.47', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.48', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.49', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.50', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.51', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.52', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.53', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.54', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.55', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.56', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.57', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.58', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.59', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.60', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.61', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.62', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.63', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.64', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.65', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.66', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.67', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.68', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.69', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.70', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.71', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.72', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.73', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.74', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.75', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.76', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.77', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.78', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.79', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.80', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.81', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.82', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.83', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.84', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.85', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.86', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.87', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.88', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.89', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.90', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.91', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.92', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.93', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.94', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.95', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.96', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.97', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.98', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.99', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.100', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.101', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.102', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.103', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.104', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.105', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.106', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.107', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.108', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.109', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.110', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.111', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.112', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.113', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.114', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.115', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.116', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.117', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.118', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.119', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.120', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.121', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.122', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.123', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.124', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.125', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.126', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.127', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.128', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.129', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.130', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.131', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.132', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.133', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.134', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.135', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.136', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.137', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.138', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.139', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.140', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.141', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.142', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.143', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.144', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.145', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.146', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.147', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.148', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.149', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.150', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.151', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.152', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.153', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.154', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.155', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.156', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.157', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.158', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.159', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.160', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.161', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.162', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.163', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.164', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.165', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.166', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.167', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.168', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.169', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.170', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.171', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.172', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.173', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.174', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.175', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.176', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.177', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.178', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.179', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.180', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.181', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.182', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.183', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.184', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.185', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.186', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.187', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.188', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.189', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.190', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.191', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.192', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.193', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.194', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.195', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.196', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.197', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.198', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.199', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.200', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.201', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.202', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.203', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.204', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.205', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.206', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.207', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.208', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.209', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.210', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.211', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.212', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.213', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.214', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.215', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.216', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.217', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.218', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.219', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.220', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.221', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.222', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.223', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.224', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.225', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.226', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.227', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.228', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.229', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.230', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.231', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.232', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.233', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.234', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.235', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.236', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.237', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.238', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.239', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.240', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.241', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.242', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.243', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.244', 0, 1, 0, '0000-00-00 00:00:00', 0),
('10.10.0.245', 0, 1, 0, '0000-00-00 00:00:00', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `remote_server_list`
--

INSERT INTO `remote_server_list` (`id`, `email`, `remote_ip`, `remote_group`, `is_active`, `server_uname`, `server_pass`, `server_name`, `ssh_username`, `ssh_password`, `is_busy`) VALUES
(18, 'bla@g.com', '188.166.20.219', 'b', 0, 'admin', 'admin', 'samit3', '', '', 0),
(16, 'bla@g.com', '188.166.19.109', 'a', 0, 'admin', 'admin', 'samit1', '', '', 0),
(17, 'bla@g.com', '188.166.15.166', 'a', 0, 'root', 'admin', 'samit2', '', '', 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=756 ;

--
-- Dumping data for table `server_subnets`
--

INSERT INTO `server_subnets` (`cloud_id`, `subnet`, `used_ips`, `full`, `server_id`, `last_updated`, `no_of_revision`) VALUES
(1, '10.10.0.1', 1, 0, 0, '0000-00-00 00:00:00', 0),
(2, '10.10.0.2', 1, 0, 0, '0000-00-00 00:00:00', 0),
(3, '10.10.0.3', 1, 0, 0, '0000-00-00 00:00:00', 0),
(4, '10.10.0.4', 1, 0, 0, '0000-00-00 00:00:00', 0),
(5, '10.10.0.5', 0, 0, 0, '0000-00-00 00:00:00', 0),
(6, '10.10.0.6', 0, 0, 0, '0000-00-00 00:00:00', 0),
(7, '10.10.0.7', 0, 0, 0, '0000-00-00 00:00:00', 0),
(8, '10.10.0.8', 0, 0, 0, '0000-00-00 00:00:00', 0),
(9, '10.10.0.9', 0, 0, 0, '0000-00-00 00:00:00', 0),
(10, '10.10.0.10', 0, 0, 0, '0000-00-00 00:00:00', 0),
(11, '10.10.0.11', 0, 0, 0, '0000-00-00 00:00:00', 0),
(12, '10.10.0.12', 0, 0, 0, '0000-00-00 00:00:00', 0),
(13, '10.10.0.13', 0, 0, 0, '0000-00-00 00:00:00', 0),
(14, '10.10.0.14', 0, 0, 0, '0000-00-00 00:00:00', 0),
(15, '10.10.0.15', 0, 0, 0, '0000-00-00 00:00:00', 0),
(16, '10.10.0.16', 0, 0, 0, '0000-00-00 00:00:00', 0),
(17, '10.10.0.17', 0, 0, 0, '0000-00-00 00:00:00', 0),
(18, '10.10.0.18', 0, 0, 0, '0000-00-00 00:00:00', 0),
(19, '10.10.0.19', 0, 0, 0, '0000-00-00 00:00:00', 0),
(20, '10.10.0.20', 0, 0, 0, '0000-00-00 00:00:00', 0),
(21, '10.10.0.21', 0, 0, 0, '0000-00-00 00:00:00', 0),
(22, '10.10.0.22', 0, 0, 0, '0000-00-00 00:00:00', 0),
(23, '10.10.0.23', 0, 0, 0, '0000-00-00 00:00:00', 0),
(24, '10.10.0.24', 0, 0, 0, '0000-00-00 00:00:00', 0),
(25, '10.10.0.25', 0, 0, 0, '0000-00-00 00:00:00', 0),
(26, '10.10.0.26', 0, 0, 0, '0000-00-00 00:00:00', 0),
(27, '10.10.0.27', 0, 0, 0, '0000-00-00 00:00:00', 0),
(28, '10.10.0.28', 0, 0, 0, '0000-00-00 00:00:00', 0),
(29, '10.10.0.29', 0, 0, 0, '0000-00-00 00:00:00', 0),
(30, '10.10.0.30', 0, 0, 0, '0000-00-00 00:00:00', 0),
(31, '10.10.0.31', 0, 0, 0, '0000-00-00 00:00:00', 0),
(32, '10.10.0.32', 0, 0, 0, '0000-00-00 00:00:00', 0),
(33, '10.10.0.33', 0, 0, 0, '0000-00-00 00:00:00', 0),
(34, '10.10.0.34', 0, 0, 0, '0000-00-00 00:00:00', 0),
(35, '10.10.0.35', 0, 0, 0, '0000-00-00 00:00:00', 0),
(36, '10.10.0.36', 0, 0, 0, '0000-00-00 00:00:00', 0),
(37, '10.10.0.37', 0, 0, 0, '0000-00-00 00:00:00', 0),
(38, '10.10.0.38', 0, 0, 0, '0000-00-00 00:00:00', 0),
(39, '10.10.0.39', 0, 0, 0, '0000-00-00 00:00:00', 0),
(40, '10.10.0.40', 0, 0, 0, '0000-00-00 00:00:00', 0),
(41, '10.10.0.41', 0, 0, 0, '0000-00-00 00:00:00', 0),
(42, '10.10.0.42', 0, 0, 0, '0000-00-00 00:00:00', 0),
(43, '10.10.0.43', 0, 0, 0, '0000-00-00 00:00:00', 0),
(44, '10.10.0.44', 0, 0, 0, '0000-00-00 00:00:00', 0),
(45, '10.10.0.45', 0, 0, 0, '0000-00-00 00:00:00', 0),
(46, '10.10.0.46', 0, 0, 0, '0000-00-00 00:00:00', 0),
(47, '10.10.0.47', 0, 0, 0, '0000-00-00 00:00:00', 0),
(48, '10.10.0.48', 0, 0, 0, '0000-00-00 00:00:00', 0),
(49, '10.10.0.49', 0, 0, 0, '0000-00-00 00:00:00', 0),
(50, '10.10.0.50', 0, 0, 0, '0000-00-00 00:00:00', 0),
(51, '10.10.0.51', 0, 0, 0, '0000-00-00 00:00:00', 0),
(52, '10.10.0.52', 0, 0, 0, '0000-00-00 00:00:00', 0),
(53, '10.10.0.53', 0, 0, 0, '0000-00-00 00:00:00', 0),
(54, '10.10.0.54', 0, 0, 0, '0000-00-00 00:00:00', 0),
(55, '10.10.0.55', 0, 0, 0, '0000-00-00 00:00:00', 0),
(56, '10.10.0.56', 0, 0, 0, '0000-00-00 00:00:00', 0),
(57, '10.10.0.57', 0, 0, 0, '0000-00-00 00:00:00', 0),
(58, '10.10.0.58', 0, 0, 0, '0000-00-00 00:00:00', 0),
(59, '10.10.0.59', 0, 0, 0, '0000-00-00 00:00:00', 0),
(60, '10.10.0.60', 0, 0, 0, '0000-00-00 00:00:00', 0),
(61, '10.10.0.61', 0, 0, 0, '0000-00-00 00:00:00', 0),
(62, '10.10.0.62', 0, 0, 0, '0000-00-00 00:00:00', 0),
(63, '10.10.0.63', 0, 0, 0, '0000-00-00 00:00:00', 0),
(64, '10.10.0.64', 0, 0, 0, '0000-00-00 00:00:00', 0),
(65, '10.10.0.65', 0, 0, 0, '0000-00-00 00:00:00', 0),
(66, '10.10.0.66', 0, 0, 0, '0000-00-00 00:00:00', 0),
(67, '10.10.0.67', 0, 0, 0, '0000-00-00 00:00:00', 0),
(68, '10.10.0.68', 0, 0, 0, '0000-00-00 00:00:00', 0),
(69, '10.10.0.69', 0, 0, 0, '0000-00-00 00:00:00', 0),
(70, '10.10.0.70', 0, 0, 0, '0000-00-00 00:00:00', 0),
(71, '10.10.0.71', 0, 0, 0, '0000-00-00 00:00:00', 0),
(72, '10.10.0.72', 0, 0, 0, '0000-00-00 00:00:00', 0),
(73, '10.10.0.73', 0, 0, 0, '0000-00-00 00:00:00', 0),
(74, '10.10.0.74', 0, 0, 0, '0000-00-00 00:00:00', 0),
(75, '10.10.0.75', 0, 0, 0, '0000-00-00 00:00:00', 0),
(76, '10.10.0.76', 0, 0, 0, '0000-00-00 00:00:00', 0),
(77, '10.10.0.77', 0, 0, 0, '0000-00-00 00:00:00', 0),
(78, '10.10.0.78', 0, 0, 0, '0000-00-00 00:00:00', 0),
(79, '10.10.0.79', 0, 0, 0, '0000-00-00 00:00:00', 0),
(80, '10.10.0.80', 0, 0, 0, '0000-00-00 00:00:00', 0),
(81, '10.10.0.81', 0, 0, 0, '0000-00-00 00:00:00', 0),
(82, '10.10.0.82', 0, 0, 0, '0000-00-00 00:00:00', 0),
(83, '10.10.0.83', 0, 0, 0, '0000-00-00 00:00:00', 0),
(84, '10.10.0.84', 0, 0, 0, '0000-00-00 00:00:00', 0),
(85, '10.10.0.85', 0, 0, 0, '0000-00-00 00:00:00', 0),
(86, '10.10.0.86', 0, 0, 0, '0000-00-00 00:00:00', 0),
(87, '10.10.0.87', 0, 0, 0, '0000-00-00 00:00:00', 0),
(88, '10.10.0.88', 0, 0, 0, '0000-00-00 00:00:00', 0),
(89, '10.10.0.89', 0, 0, 0, '0000-00-00 00:00:00', 0),
(90, '10.10.0.90', 0, 0, 0, '0000-00-00 00:00:00', 0),
(91, '10.10.0.91', 0, 0, 0, '0000-00-00 00:00:00', 0),
(92, '10.10.0.92', 0, 0, 0, '0000-00-00 00:00:00', 0),
(93, '10.10.0.93', 0, 0, 0, '0000-00-00 00:00:00', 0),
(94, '10.10.0.94', 0, 0, 0, '0000-00-00 00:00:00', 0),
(95, '10.10.0.95', 0, 0, 0, '0000-00-00 00:00:00', 0),
(96, '10.10.0.96', 0, 0, 0, '0000-00-00 00:00:00', 0),
(97, '10.10.0.97', 0, 0, 0, '0000-00-00 00:00:00', 0),
(98, '10.10.0.98', 0, 0, 0, '0000-00-00 00:00:00', 0),
(99, '10.10.0.99', 0, 0, 0, '0000-00-00 00:00:00', 0),
(100, '10.10.0.100', 0, 0, 0, '0000-00-00 00:00:00', 0),
(101, '10.10.0.101', 0, 0, 0, '0000-00-00 00:00:00', 0),
(102, '10.10.0.102', 0, 0, 0, '0000-00-00 00:00:00', 0),
(103, '10.10.0.103', 0, 0, 0, '0000-00-00 00:00:00', 0),
(104, '10.10.0.104', 0, 0, 0, '0000-00-00 00:00:00', 0),
(105, '10.10.0.105', 0, 0, 0, '0000-00-00 00:00:00', 0),
(106, '10.10.0.106', 0, 0, 0, '0000-00-00 00:00:00', 0),
(107, '10.10.0.107', 0, 0, 0, '0000-00-00 00:00:00', 0),
(108, '10.10.0.108', 0, 0, 0, '0000-00-00 00:00:00', 0),
(109, '10.10.0.109', 0, 0, 0, '0000-00-00 00:00:00', 0),
(110, '10.10.0.110', 0, 0, 0, '0000-00-00 00:00:00', 0),
(111, '10.10.0.111', 0, 0, 0, '0000-00-00 00:00:00', 0),
(112, '10.10.0.112', 0, 0, 0, '0000-00-00 00:00:00', 0),
(113, '10.10.0.113', 0, 0, 0, '0000-00-00 00:00:00', 0),
(114, '10.10.0.114', 0, 0, 0, '0000-00-00 00:00:00', 0),
(115, '10.10.0.115', 0, 0, 0, '0000-00-00 00:00:00', 0),
(116, '10.10.0.116', 0, 0, 0, '0000-00-00 00:00:00', 0),
(117, '10.10.0.117', 0, 0, 0, '0000-00-00 00:00:00', 0),
(118, '10.10.0.118', 0, 0, 0, '0000-00-00 00:00:00', 0),
(119, '10.10.0.119', 0, 0, 0, '0000-00-00 00:00:00', 0),
(120, '10.10.0.120', 0, 0, 0, '0000-00-00 00:00:00', 0),
(121, '10.10.0.121', 0, 0, 0, '0000-00-00 00:00:00', 0),
(122, '10.10.0.122', 0, 0, 0, '0000-00-00 00:00:00', 0),
(123, '10.10.0.123', 0, 0, 0, '0000-00-00 00:00:00', 0),
(124, '10.10.0.124', 0, 0, 0, '0000-00-00 00:00:00', 0),
(125, '10.10.0.125', 0, 0, 0, '0000-00-00 00:00:00', 0),
(126, '10.10.0.126', 0, 0, 0, '0000-00-00 00:00:00', 0),
(127, '10.10.0.127', 0, 0, 0, '0000-00-00 00:00:00', 0),
(128, '10.10.0.128', 0, 0, 0, '0000-00-00 00:00:00', 0),
(129, '10.10.0.129', 0, 0, 0, '0000-00-00 00:00:00', 0),
(130, '10.10.0.130', 0, 0, 0, '0000-00-00 00:00:00', 0),
(131, '10.10.0.131', 0, 0, 0, '0000-00-00 00:00:00', 0),
(132, '10.10.0.132', 0, 0, 0, '0000-00-00 00:00:00', 0),
(133, '10.10.0.133', 0, 0, 0, '0000-00-00 00:00:00', 0),
(134, '10.10.0.134', 0, 0, 0, '0000-00-00 00:00:00', 0),
(135, '10.10.0.135', 0, 0, 0, '0000-00-00 00:00:00', 0),
(136, '10.10.0.136', 0, 0, 0, '0000-00-00 00:00:00', 0),
(137, '10.10.0.137', 0, 0, 0, '0000-00-00 00:00:00', 0),
(138, '10.10.0.138', 0, 0, 0, '0000-00-00 00:00:00', 0),
(139, '10.10.0.139', 0, 0, 0, '0000-00-00 00:00:00', 0),
(140, '10.10.0.140', 0, 0, 0, '0000-00-00 00:00:00', 0),
(141, '10.10.0.141', 0, 0, 0, '0000-00-00 00:00:00', 0),
(142, '10.10.0.142', 0, 0, 0, '0000-00-00 00:00:00', 0),
(143, '10.10.0.143', 0, 0, 0, '0000-00-00 00:00:00', 0),
(144, '10.10.0.144', 0, 0, 0, '0000-00-00 00:00:00', 0),
(145, '10.10.0.145', 0, 0, 0, '0000-00-00 00:00:00', 0),
(146, '10.10.0.146', 0, 0, 0, '0000-00-00 00:00:00', 0),
(147, '10.10.0.147', 0, 0, 0, '0000-00-00 00:00:00', 0),
(148, '10.10.0.148', 0, 0, 0, '0000-00-00 00:00:00', 0),
(149, '10.10.0.149', 0, 0, 0, '0000-00-00 00:00:00', 0),
(150, '10.10.0.150', 0, 0, 0, '0000-00-00 00:00:00', 0),
(151, '10.10.0.151', 0, 0, 0, '0000-00-00 00:00:00', 0),
(152, '10.10.0.152', 0, 0, 0, '0000-00-00 00:00:00', 0),
(153, '10.10.0.153', 0, 0, 0, '0000-00-00 00:00:00', 0),
(154, '10.10.0.154', 0, 0, 0, '0000-00-00 00:00:00', 0),
(155, '10.10.0.155', 0, 0, 0, '0000-00-00 00:00:00', 0),
(156, '10.10.0.156', 0, 0, 0, '0000-00-00 00:00:00', 0),
(157, '10.10.0.157', 0, 0, 0, '0000-00-00 00:00:00', 0),
(158, '10.10.0.158', 0, 0, 0, '0000-00-00 00:00:00', 0),
(159, '10.10.0.159', 0, 0, 0, '0000-00-00 00:00:00', 0),
(160, '10.10.0.160', 0, 0, 0, '0000-00-00 00:00:00', 0),
(161, '10.10.0.161', 0, 0, 0, '0000-00-00 00:00:00', 0),
(162, '10.10.0.162', 0, 0, 0, '0000-00-00 00:00:00', 0),
(163, '10.10.0.163', 0, 0, 0, '0000-00-00 00:00:00', 0),
(164, '10.10.0.164', 0, 0, 0, '0000-00-00 00:00:00', 0),
(165, '10.10.0.165', 0, 0, 0, '0000-00-00 00:00:00', 0),
(166, '10.10.0.166', 0, 0, 0, '0000-00-00 00:00:00', 0),
(167, '10.10.0.167', 0, 0, 0, '0000-00-00 00:00:00', 0),
(168, '10.10.0.168', 0, 0, 0, '0000-00-00 00:00:00', 0),
(169, '10.10.0.169', 0, 0, 0, '0000-00-00 00:00:00', 0),
(170, '10.10.0.170', 0, 0, 0, '0000-00-00 00:00:00', 0),
(171, '10.10.0.171', 0, 0, 0, '0000-00-00 00:00:00', 0),
(172, '10.10.0.172', 0, 0, 0, '0000-00-00 00:00:00', 0),
(173, '10.10.0.173', 0, 0, 0, '0000-00-00 00:00:00', 0),
(174, '10.10.0.174', 0, 0, 0, '0000-00-00 00:00:00', 0),
(175, '10.10.0.175', 0, 0, 0, '0000-00-00 00:00:00', 0),
(176, '10.10.0.176', 0, 0, 0, '0000-00-00 00:00:00', 0),
(177, '10.10.0.177', 0, 0, 0, '0000-00-00 00:00:00', 0),
(178, '10.10.0.178', 0, 0, 0, '0000-00-00 00:00:00', 0),
(179, '10.10.0.179', 0, 0, 0, '0000-00-00 00:00:00', 0),
(180, '10.10.0.180', 0, 0, 0, '0000-00-00 00:00:00', 0),
(181, '10.10.0.181', 0, 0, 0, '0000-00-00 00:00:00', 0),
(182, '10.10.0.182', 0, 0, 0, '0000-00-00 00:00:00', 0),
(183, '10.10.0.183', 0, 0, 0, '0000-00-00 00:00:00', 0),
(184, '10.10.0.184', 0, 0, 0, '0000-00-00 00:00:00', 0),
(185, '10.10.0.185', 0, 0, 0, '0000-00-00 00:00:00', 0),
(186, '10.10.0.186', 0, 0, 0, '0000-00-00 00:00:00', 0),
(187, '10.10.0.187', 0, 0, 0, '0000-00-00 00:00:00', 0),
(188, '10.10.0.188', 0, 0, 0, '0000-00-00 00:00:00', 0),
(189, '10.10.0.189', 0, 0, 0, '0000-00-00 00:00:00', 0),
(190, '10.10.0.190', 0, 0, 0, '0000-00-00 00:00:00', 0),
(191, '10.10.0.191', 0, 0, 0, '0000-00-00 00:00:00', 0),
(192, '10.10.0.192', 0, 0, 0, '0000-00-00 00:00:00', 0),
(193, '10.10.0.193', 0, 0, 0, '0000-00-00 00:00:00', 0),
(194, '10.10.0.194', 0, 0, 0, '0000-00-00 00:00:00', 0),
(195, '10.10.0.195', 0, 0, 0, '0000-00-00 00:00:00', 0),
(196, '10.10.0.196', 0, 0, 0, '0000-00-00 00:00:00', 0),
(197, '10.10.0.197', 0, 0, 0, '0000-00-00 00:00:00', 0),
(198, '10.10.0.198', 0, 0, 0, '0000-00-00 00:00:00', 0),
(199, '10.10.0.199', 0, 0, 0, '0000-00-00 00:00:00', 0),
(200, '10.10.0.200', 0, 0, 0, '0000-00-00 00:00:00', 0),
(201, '10.10.0.201', 0, 0, 0, '0000-00-00 00:00:00', 0),
(202, '10.10.0.202', 0, 0, 0, '0000-00-00 00:00:00', 0),
(203, '10.10.0.203', 0, 0, 0, '0000-00-00 00:00:00', 0),
(204, '10.10.0.204', 0, 0, 0, '0000-00-00 00:00:00', 0),
(205, '10.10.0.205', 0, 0, 0, '0000-00-00 00:00:00', 0),
(206, '10.10.0.206', 0, 0, 0, '0000-00-00 00:00:00', 0),
(207, '10.10.0.207', 0, 0, 0, '0000-00-00 00:00:00', 0),
(208, '10.10.0.208', 0, 0, 0, '0000-00-00 00:00:00', 0),
(209, '10.10.0.209', 0, 0, 0, '0000-00-00 00:00:00', 0),
(210, '10.10.0.210', 0, 0, 0, '0000-00-00 00:00:00', 0),
(211, '10.10.0.211', 0, 0, 0, '0000-00-00 00:00:00', 0),
(212, '10.10.0.212', 0, 0, 0, '0000-00-00 00:00:00', 0),
(213, '10.10.0.213', 0, 0, 0, '0000-00-00 00:00:00', 0),
(214, '10.10.0.214', 0, 0, 0, '0000-00-00 00:00:00', 0),
(215, '10.10.0.215', 0, 0, 0, '0000-00-00 00:00:00', 0),
(216, '10.10.0.216', 0, 0, 0, '0000-00-00 00:00:00', 0),
(217, '10.10.0.217', 0, 0, 0, '0000-00-00 00:00:00', 0),
(218, '10.10.0.218', 0, 0, 0, '0000-00-00 00:00:00', 0),
(219, '10.10.0.219', 0, 0, 0, '0000-00-00 00:00:00', 0),
(220, '10.10.0.220', 0, 0, 0, '0000-00-00 00:00:00', 0),
(221, '10.10.0.221', 0, 0, 0, '0000-00-00 00:00:00', 0),
(222, '10.10.0.222', 0, 0, 0, '0000-00-00 00:00:00', 0),
(223, '10.10.0.223', 0, 0, 0, '0000-00-00 00:00:00', 0),
(224, '10.10.0.224', 0, 0, 0, '0000-00-00 00:00:00', 0),
(225, '10.10.0.225', 0, 0, 0, '0000-00-00 00:00:00', 0),
(226, '10.10.0.226', 0, 0, 0, '0000-00-00 00:00:00', 0),
(227, '10.10.0.227', 0, 0, 0, '0000-00-00 00:00:00', 0),
(228, '10.10.0.228', 0, 0, 0, '0000-00-00 00:00:00', 0),
(229, '10.10.0.229', 0, 0, 0, '0000-00-00 00:00:00', 0),
(230, '10.10.0.230', 0, 0, 0, '0000-00-00 00:00:00', 0),
(231, '10.10.0.231', 0, 0, 0, '0000-00-00 00:00:00', 0),
(232, '10.10.0.232', 0, 0, 0, '0000-00-00 00:00:00', 0),
(233, '10.10.0.233', 0, 0, 0, '0000-00-00 00:00:00', 0),
(234, '10.10.0.234', 0, 0, 0, '0000-00-00 00:00:00', 0),
(235, '10.10.0.235', 0, 0, 0, '0000-00-00 00:00:00', 0),
(236, '10.10.0.236', 0, 0, 0, '0000-00-00 00:00:00', 0),
(237, '10.10.0.237', 0, 0, 0, '0000-00-00 00:00:00', 0),
(238, '10.10.0.238', 0, 0, 0, '0000-00-00 00:00:00', 0),
(239, '10.10.0.239', 0, 0, 0, '0000-00-00 00:00:00', 0),
(240, '10.10.0.240', 0, 0, 0, '0000-00-00 00:00:00', 0),
(241, '10.10.0.241', 0, 0, 0, '0000-00-00 00:00:00', 0),
(242, '10.10.0.242', 0, 0, 0, '0000-00-00 00:00:00', 0),
(243, '10.10.0.243', 0, 0, 0, '0000-00-00 00:00:00', 0),
(244, '10.10.0.244', 0, 0, 0, '0000-00-00 00:00:00', 0),
(245, '10.10.0.245', 0, 0, 0, '0000-00-00 00:00:00', 0),
(246, '1.1.1.1', 0, 0, 0, '0000-00-00 00:00:00', 0),
(247, '1.1.1.2', 0, 0, 0, '0000-00-00 00:00:00', 0),
(248, '1.1.1.3', 0, 0, 0, '0000-00-00 00:00:00', 0),
(249, '1.1.1.4', 0, 0, 0, '0000-00-00 00:00:00', 0),
(250, '1.1.1.5', 0, 0, 0, '0000-00-00 00:00:00', 0),
(251, '1.1.1.6', 0, 0, 0, '0000-00-00 00:00:00', 0),
(252, '1.1.1.7', 0, 0, 0, '0000-00-00 00:00:00', 0),
(253, '1.1.1.8', 0, 0, 0, '0000-00-00 00:00:00', 0),
(254, '1.1.1.9', 0, 0, 0, '0000-00-00 00:00:00', 0),
(255, '1.1.1.10', 0, 0, 0, '0000-00-00 00:00:00', 0),
(256, '1.1.1.11', 0, 0, 0, '0000-00-00 00:00:00', 0),
(257, '1.1.1.12', 0, 0, 0, '0000-00-00 00:00:00', 0),
(258, '1.1.1.13', 0, 0, 0, '0000-00-00 00:00:00', 0),
(259, '1.1.1.14', 0, 0, 0, '0000-00-00 00:00:00', 0),
(260, '1.1.1.15', 0, 0, 0, '0000-00-00 00:00:00', 0),
(261, '1.1.1.16', 0, 0, 0, '0000-00-00 00:00:00', 0),
(262, '1.1.1.17', 0, 0, 0, '0000-00-00 00:00:00', 0),
(263, '1.1.1.18', 0, 0, 0, '0000-00-00 00:00:00', 0),
(264, '1.1.1.19', 0, 0, 0, '0000-00-00 00:00:00', 0),
(265, '1.1.1.20', 0, 0, 0, '0000-00-00 00:00:00', 0),
(266, '1.1.1.21', 0, 0, 0, '0000-00-00 00:00:00', 0),
(267, '1.1.1.22', 0, 0, 0, '0000-00-00 00:00:00', 0),
(268, '1.1.1.23', 0, 0, 0, '0000-00-00 00:00:00', 0),
(269, '1.1.1.24', 0, 0, 0, '0000-00-00 00:00:00', 0),
(270, '1.1.1.25', 0, 0, 0, '0000-00-00 00:00:00', 0),
(271, '1.1.1.26', 0, 0, 0, '0000-00-00 00:00:00', 0),
(272, '1.1.1.27', 0, 0, 0, '0000-00-00 00:00:00', 0),
(273, '1.1.1.28', 0, 0, 0, '0000-00-00 00:00:00', 0),
(274, '1.1.1.29', 0, 0, 0, '0000-00-00 00:00:00', 0),
(275, '1.1.1.30', 0, 0, 0, '0000-00-00 00:00:00', 0),
(276, '1.1.1.31', 0, 0, 0, '0000-00-00 00:00:00', 0),
(277, '1.1.1.32', 0, 0, 0, '0000-00-00 00:00:00', 0),
(278, '1.1.1.33', 0, 0, 0, '0000-00-00 00:00:00', 0),
(279, '1.1.1.34', 0, 0, 0, '0000-00-00 00:00:00', 0),
(280, '1.1.1.35', 0, 0, 0, '0000-00-00 00:00:00', 0),
(281, '1.1.1.36', 0, 0, 0, '0000-00-00 00:00:00', 0),
(282, '1.1.1.37', 0, 0, 0, '0000-00-00 00:00:00', 0),
(283, '1.1.1.38', 0, 0, 0, '0000-00-00 00:00:00', 0),
(284, '1.1.1.39', 0, 0, 0, '0000-00-00 00:00:00', 0),
(285, '1.1.1.40', 0, 0, 0, '0000-00-00 00:00:00', 0),
(286, '1.1.1.41', 0, 0, 0, '0000-00-00 00:00:00', 0),
(287, '1.1.1.42', 0, 0, 0, '0000-00-00 00:00:00', 0),
(288, '1.1.1.43', 0, 0, 0, '0000-00-00 00:00:00', 0),
(289, '1.1.1.44', 0, 0, 0, '0000-00-00 00:00:00', 0),
(290, '1.1.1.45', 0, 0, 0, '0000-00-00 00:00:00', 0),
(291, '1.1.1.46', 0, 0, 0, '0000-00-00 00:00:00', 0),
(292, '1.1.1.47', 0, 0, 0, '0000-00-00 00:00:00', 0),
(293, '1.1.1.48', 0, 0, 0, '0000-00-00 00:00:00', 0),
(294, '1.1.1.49', 0, 0, 0, '0000-00-00 00:00:00', 0),
(295, '1.1.1.50', 0, 0, 0, '0000-00-00 00:00:00', 0),
(296, '1.1.1.51', 0, 0, 0, '0000-00-00 00:00:00', 0),
(297, '1.1.1.52', 0, 0, 0, '0000-00-00 00:00:00', 0),
(298, '1.1.1.53', 0, 0, 0, '0000-00-00 00:00:00', 0),
(299, '1.1.1.54', 0, 0, 0, '0000-00-00 00:00:00', 0),
(300, '1.1.1.55', 0, 0, 0, '0000-00-00 00:00:00', 0),
(301, '1.1.1.56', 0, 0, 0, '0000-00-00 00:00:00', 0),
(302, '1.1.1.57', 0, 0, 0, '0000-00-00 00:00:00', 0),
(303, '1.1.1.58', 0, 0, 0, '0000-00-00 00:00:00', 0),
(304, '1.1.1.59', 0, 0, 0, '0000-00-00 00:00:00', 0),
(305, '1.1.1.60', 0, 0, 0, '0000-00-00 00:00:00', 0),
(306, '1.1.1.61', 0, 0, 0, '0000-00-00 00:00:00', 0),
(307, '1.1.1.62', 0, 0, 0, '0000-00-00 00:00:00', 0),
(308, '1.1.1.63', 0, 0, 0, '0000-00-00 00:00:00', 0),
(309, '1.1.1.64', 0, 0, 0, '0000-00-00 00:00:00', 0),
(310, '1.1.1.65', 0, 0, 0, '0000-00-00 00:00:00', 0),
(311, '1.1.1.66', 0, 0, 0, '0000-00-00 00:00:00', 0),
(312, '1.1.1.67', 0, 0, 0, '0000-00-00 00:00:00', 0),
(313, '1.1.1.68', 0, 0, 0, '0000-00-00 00:00:00', 0),
(314, '1.1.1.69', 0, 0, 0, '0000-00-00 00:00:00', 0),
(315, '1.1.1.70', 0, 0, 0, '0000-00-00 00:00:00', 0),
(316, '1.1.1.71', 0, 0, 0, '0000-00-00 00:00:00', 0),
(317, '1.1.1.72', 0, 0, 0, '0000-00-00 00:00:00', 0),
(318, '1.1.1.73', 0, 0, 0, '0000-00-00 00:00:00', 0),
(319, '1.1.1.74', 0, 0, 0, '0000-00-00 00:00:00', 0),
(320, '1.1.1.75', 0, 0, 0, '0000-00-00 00:00:00', 0),
(321, '1.1.1.76', 0, 0, 0, '0000-00-00 00:00:00', 0),
(322, '1.1.1.77', 0, 0, 0, '0000-00-00 00:00:00', 0),
(323, '1.1.1.78', 0, 0, 0, '0000-00-00 00:00:00', 0),
(324, '1.1.1.79', 0, 0, 0, '0000-00-00 00:00:00', 0),
(325, '1.1.1.80', 0, 0, 0, '0000-00-00 00:00:00', 0),
(326, '1.1.1.81', 0, 0, 0, '0000-00-00 00:00:00', 0),
(327, '1.1.1.82', 0, 0, 0, '0000-00-00 00:00:00', 0),
(328, '1.1.1.83', 0, 0, 0, '0000-00-00 00:00:00', 0),
(329, '1.1.1.84', 0, 0, 0, '0000-00-00 00:00:00', 0),
(330, '1.1.1.85', 0, 0, 0, '0000-00-00 00:00:00', 0),
(331, '1.1.1.86', 0, 0, 0, '0000-00-00 00:00:00', 0),
(332, '1.1.1.87', 0, 0, 0, '0000-00-00 00:00:00', 0),
(333, '1.1.1.88', 0, 0, 0, '0000-00-00 00:00:00', 0),
(334, '1.1.1.89', 0, 0, 0, '0000-00-00 00:00:00', 0),
(335, '1.1.1.90', 0, 0, 0, '0000-00-00 00:00:00', 0),
(336, '1.1.1.91', 0, 0, 0, '0000-00-00 00:00:00', 0),
(337, '1.1.1.92', 0, 0, 0, '0000-00-00 00:00:00', 0),
(338, '1.1.1.93', 0, 0, 0, '0000-00-00 00:00:00', 0),
(339, '1.1.1.94', 0, 0, 0, '0000-00-00 00:00:00', 0),
(340, '1.1.1.95', 0, 0, 0, '0000-00-00 00:00:00', 0),
(341, '1.1.1.96', 0, 0, 0, '0000-00-00 00:00:00', 0),
(342, '1.1.1.97', 0, 0, 0, '0000-00-00 00:00:00', 0),
(343, '1.1.1.98', 0, 0, 0, '0000-00-00 00:00:00', 0),
(344, '1.1.1.99', 0, 0, 0, '0000-00-00 00:00:00', 0),
(345, '1.1.1.100', 0, 0, 0, '0000-00-00 00:00:00', 0),
(346, '1.1.1.101', 0, 0, 0, '0000-00-00 00:00:00', 0),
(347, '1.1.1.102', 0, 0, 0, '0000-00-00 00:00:00', 0),
(348, '1.1.1.103', 0, 0, 0, '0000-00-00 00:00:00', 0),
(349, '1.1.1.104', 0, 0, 0, '0000-00-00 00:00:00', 0),
(350, '1.1.1.105', 0, 0, 0, '0000-00-00 00:00:00', 0),
(351, '1.1.1.106', 0, 0, 0, '0000-00-00 00:00:00', 0),
(352, '1.1.1.107', 0, 0, 0, '0000-00-00 00:00:00', 0),
(353, '1.1.1.108', 0, 0, 0, '0000-00-00 00:00:00', 0),
(354, '1.1.1.109', 0, 0, 0, '0000-00-00 00:00:00', 0),
(355, '1.1.1.110', 0, 0, 0, '0000-00-00 00:00:00', 0),
(356, '1.1.1.111', 0, 0, 0, '0000-00-00 00:00:00', 0),
(357, '1.1.1.112', 0, 0, 0, '0000-00-00 00:00:00', 0),
(358, '1.1.1.113', 0, 0, 0, '0000-00-00 00:00:00', 0),
(359, '1.1.1.114', 0, 0, 0, '0000-00-00 00:00:00', 0),
(360, '1.1.1.115', 0, 0, 0, '0000-00-00 00:00:00', 0),
(361, '1.1.1.116', 0, 0, 0, '0000-00-00 00:00:00', 0),
(362, '1.1.1.117', 0, 0, 0, '0000-00-00 00:00:00', 0),
(363, '1.1.1.118', 0, 0, 0, '0000-00-00 00:00:00', 0),
(364, '1.1.1.119', 0, 0, 0, '0000-00-00 00:00:00', 0),
(365, '1.1.1.120', 0, 0, 0, '0000-00-00 00:00:00', 0),
(366, '1.1.1.121', 0, 0, 0, '0000-00-00 00:00:00', 0),
(367, '1.1.1.122', 0, 0, 0, '0000-00-00 00:00:00', 0),
(368, '1.1.1.123', 0, 0, 0, '0000-00-00 00:00:00', 0),
(369, '1.1.1.124', 0, 0, 0, '0000-00-00 00:00:00', 0),
(370, '1.1.1.125', 0, 0, 0, '0000-00-00 00:00:00', 0),
(371, '1.1.1.126', 0, 0, 0, '0000-00-00 00:00:00', 0),
(372, '1.1.1.127', 0, 0, 0, '0000-00-00 00:00:00', 0),
(373, '1.1.1.128', 0, 0, 0, '0000-00-00 00:00:00', 0),
(374, '1.1.1.129', 0, 0, 0, '0000-00-00 00:00:00', 0),
(375, '1.1.1.130', 0, 0, 0, '0000-00-00 00:00:00', 0),
(376, '1.1.1.131', 0, 0, 0, '0000-00-00 00:00:00', 0),
(377, '1.1.1.132', 0, 0, 0, '0000-00-00 00:00:00', 0),
(378, '1.1.1.133', 0, 0, 0, '0000-00-00 00:00:00', 0),
(379, '1.1.1.134', 0, 0, 0, '0000-00-00 00:00:00', 0),
(380, '1.1.1.135', 0, 0, 0, '0000-00-00 00:00:00', 0),
(381, '1.1.1.136', 0, 0, 0, '0000-00-00 00:00:00', 0),
(382, '1.1.1.137', 0, 0, 0, '0000-00-00 00:00:00', 0),
(383, '1.1.1.138', 0, 0, 0, '0000-00-00 00:00:00', 0),
(384, '1.1.1.139', 0, 0, 0, '0000-00-00 00:00:00', 0),
(385, '1.1.1.140', 0, 0, 0, '0000-00-00 00:00:00', 0),
(386, '1.1.1.141', 0, 0, 0, '0000-00-00 00:00:00', 0),
(387, '1.1.1.142', 0, 0, 0, '0000-00-00 00:00:00', 0),
(388, '1.1.1.143', 0, 0, 0, '0000-00-00 00:00:00', 0),
(389, '1.1.1.144', 0, 0, 0, '0000-00-00 00:00:00', 0),
(390, '1.1.1.145', 0, 0, 0, '0000-00-00 00:00:00', 0),
(391, '1.1.1.146', 0, 0, 0, '0000-00-00 00:00:00', 0),
(392, '1.1.1.147', 0, 0, 0, '0000-00-00 00:00:00', 0),
(393, '1.1.1.148', 0, 0, 0, '0000-00-00 00:00:00', 0),
(394, '1.1.1.149', 0, 0, 0, '0000-00-00 00:00:00', 0),
(395, '1.1.1.150', 0, 0, 0, '0000-00-00 00:00:00', 0),
(396, '1.1.1.151', 0, 0, 0, '0000-00-00 00:00:00', 0),
(397, '1.1.1.152', 0, 0, 0, '0000-00-00 00:00:00', 0),
(398, '1.1.1.153', 0, 0, 0, '0000-00-00 00:00:00', 0),
(399, '1.1.1.154', 0, 0, 0, '0000-00-00 00:00:00', 0),
(400, '1.1.1.155', 0, 0, 0, '0000-00-00 00:00:00', 0),
(401, '1.1.1.156', 0, 0, 0, '0000-00-00 00:00:00', 0),
(402, '1.1.1.157', 0, 0, 0, '0000-00-00 00:00:00', 0),
(403, '1.1.1.158', 0, 0, 0, '0000-00-00 00:00:00', 0),
(404, '1.1.1.159', 0, 0, 0, '0000-00-00 00:00:00', 0),
(405, '1.1.1.160', 0, 0, 0, '0000-00-00 00:00:00', 0),
(406, '1.1.1.161', 0, 0, 0, '0000-00-00 00:00:00', 0),
(407, '1.1.1.162', 0, 0, 0, '0000-00-00 00:00:00', 0),
(408, '1.1.1.163', 0, 0, 0, '0000-00-00 00:00:00', 0),
(409, '1.1.1.164', 0, 0, 0, '0000-00-00 00:00:00', 0),
(410, '1.1.1.165', 0, 0, 0, '0000-00-00 00:00:00', 0),
(411, '1.1.1.166', 0, 0, 0, '0000-00-00 00:00:00', 0),
(412, '1.1.1.167', 0, 0, 0, '0000-00-00 00:00:00', 0),
(413, '1.1.1.168', 0, 0, 0, '0000-00-00 00:00:00', 0),
(414, '1.1.1.169', 0, 0, 0, '0000-00-00 00:00:00', 0),
(415, '1.1.1.170', 0, 0, 0, '0000-00-00 00:00:00', 0),
(416, '1.1.1.171', 0, 0, 0, '0000-00-00 00:00:00', 0),
(417, '1.1.1.172', 0, 0, 0, '0000-00-00 00:00:00', 0),
(418, '1.1.1.173', 0, 0, 0, '0000-00-00 00:00:00', 0),
(419, '1.1.1.174', 0, 0, 0, '0000-00-00 00:00:00', 0),
(420, '1.1.1.175', 0, 0, 0, '0000-00-00 00:00:00', 0),
(421, '1.1.1.176', 0, 0, 0, '0000-00-00 00:00:00', 0),
(422, '1.1.1.177', 0, 0, 0, '0000-00-00 00:00:00', 0),
(423, '1.1.1.178', 0, 0, 0, '0000-00-00 00:00:00', 0),
(424, '1.1.1.179', 0, 0, 0, '0000-00-00 00:00:00', 0),
(425, '1.1.1.180', 0, 0, 0, '0000-00-00 00:00:00', 0),
(426, '1.1.1.181', 0, 0, 0, '0000-00-00 00:00:00', 0),
(427, '1.1.1.182', 0, 0, 0, '0000-00-00 00:00:00', 0),
(428, '1.1.1.183', 0, 0, 0, '0000-00-00 00:00:00', 0),
(429, '1.1.1.184', 0, 0, 0, '0000-00-00 00:00:00', 0),
(430, '1.1.1.185', 0, 0, 0, '0000-00-00 00:00:00', 0),
(431, '1.1.1.186', 0, 0, 0, '0000-00-00 00:00:00', 0),
(432, '1.1.1.187', 0, 0, 0, '0000-00-00 00:00:00', 0),
(433, '1.1.1.188', 0, 0, 0, '0000-00-00 00:00:00', 0),
(434, '1.1.1.189', 0, 0, 0, '0000-00-00 00:00:00', 0),
(435, '1.1.1.190', 0, 0, 0, '0000-00-00 00:00:00', 0),
(436, '1.1.1.191', 0, 0, 0, '0000-00-00 00:00:00', 0),
(437, '1.1.1.192', 0, 0, 0, '0000-00-00 00:00:00', 0),
(438, '1.1.1.193', 0, 0, 0, '0000-00-00 00:00:00', 0),
(439, '1.1.1.194', 0, 0, 0, '0000-00-00 00:00:00', 0),
(440, '1.1.1.195', 0, 0, 0, '0000-00-00 00:00:00', 0),
(441, '1.1.1.196', 0, 0, 0, '0000-00-00 00:00:00', 0),
(442, '1.1.1.197', 0, 0, 0, '0000-00-00 00:00:00', 0),
(443, '1.1.1.198', 0, 0, 0, '0000-00-00 00:00:00', 0),
(444, '1.1.1.199', 0, 0, 0, '0000-00-00 00:00:00', 0),
(445, '1.1.1.200', 0, 0, 0, '0000-00-00 00:00:00', 0),
(446, '1.1.1.201', 0, 0, 0, '0000-00-00 00:00:00', 0),
(447, '1.1.1.202', 0, 0, 0, '0000-00-00 00:00:00', 0),
(448, '1.1.1.203', 0, 0, 0, '0000-00-00 00:00:00', 0),
(449, '1.1.1.204', 0, 0, 0, '0000-00-00 00:00:00', 0),
(450, '1.1.1.205', 0, 0, 0, '0000-00-00 00:00:00', 0),
(451, '1.1.1.206', 0, 0, 0, '0000-00-00 00:00:00', 0),
(452, '1.1.1.207', 0, 0, 0, '0000-00-00 00:00:00', 0),
(453, '1.1.1.208', 0, 0, 0, '0000-00-00 00:00:00', 0),
(454, '1.1.1.209', 0, 0, 0, '0000-00-00 00:00:00', 0),
(455, '1.1.1.210', 0, 0, 0, '0000-00-00 00:00:00', 0),
(456, '1.1.1.211', 0, 0, 0, '0000-00-00 00:00:00', 0),
(457, '1.1.1.212', 0, 0, 0, '0000-00-00 00:00:00', 0),
(458, '1.1.1.213', 0, 0, 0, '0000-00-00 00:00:00', 0),
(459, '1.1.1.214', 0, 0, 0, '0000-00-00 00:00:00', 0),
(460, '1.1.1.215', 0, 0, 0, '0000-00-00 00:00:00', 0),
(461, '1.1.1.216', 0, 0, 0, '0000-00-00 00:00:00', 0),
(462, '1.1.1.217', 0, 0, 0, '0000-00-00 00:00:00', 0),
(463, '1.1.1.218', 0, 0, 0, '0000-00-00 00:00:00', 0),
(464, '1.1.1.219', 0, 0, 0, '0000-00-00 00:00:00', 0),
(465, '1.1.1.220', 0, 0, 0, '0000-00-00 00:00:00', 0),
(466, '1.1.1.221', 0, 0, 0, '0000-00-00 00:00:00', 0),
(467, '1.1.1.222', 0, 0, 0, '0000-00-00 00:00:00', 0),
(468, '1.1.1.223', 0, 0, 0, '0000-00-00 00:00:00', 0),
(469, '1.1.1.224', 0, 0, 0, '0000-00-00 00:00:00', 0),
(470, '1.1.1.225', 0, 0, 0, '0000-00-00 00:00:00', 0),
(471, '1.1.1.226', 0, 0, 0, '0000-00-00 00:00:00', 0),
(472, '1.1.1.227', 0, 0, 0, '0000-00-00 00:00:00', 0),
(473, '1.1.1.228', 0, 0, 0, '0000-00-00 00:00:00', 0),
(474, '1.1.1.229', 0, 0, 0, '0000-00-00 00:00:00', 0),
(475, '1.1.1.230', 0, 0, 0, '0000-00-00 00:00:00', 0),
(476, '1.1.1.231', 0, 0, 0, '0000-00-00 00:00:00', 0),
(477, '1.1.1.232', 0, 0, 0, '0000-00-00 00:00:00', 0),
(478, '1.1.1.233', 0, 0, 0, '0000-00-00 00:00:00', 0),
(479, '1.1.1.234', 0, 0, 0, '0000-00-00 00:00:00', 0),
(480, '1.1.1.235', 0, 0, 0, '0000-00-00 00:00:00', 0),
(481, '1.1.1.236', 0, 0, 0, '0000-00-00 00:00:00', 0),
(482, '1.1.1.237', 0, 0, 0, '0000-00-00 00:00:00', 0),
(483, '1.1.1.238', 0, 0, 0, '0000-00-00 00:00:00', 0),
(484, '1.1.1.239', 0, 0, 0, '0000-00-00 00:00:00', 0),
(485, '1.1.1.240', 0, 0, 0, '0000-00-00 00:00:00', 0),
(486, '1.1.1.241', 0, 0, 0, '0000-00-00 00:00:00', 0),
(487, '1.1.1.242', 0, 0, 0, '0000-00-00 00:00:00', 0),
(488, '1.1.1.243', 0, 0, 0, '0000-00-00 00:00:00', 0),
(489, '1.1.1.244', 0, 0, 0, '0000-00-00 00:00:00', 0),
(490, '1.1.1.245', 0, 0, 0, '0000-00-00 00:00:00', 0),
(491, '1.1.1.246', 0, 0, 0, '0000-00-00 00:00:00', 0),
(492, '1.1.1.247', 0, 0, 0, '0000-00-00 00:00:00', 0),
(493, '1.1.1.248', 0, 0, 0, '0000-00-00 00:00:00', 0),
(494, '1.1.1.249', 0, 0, 0, '0000-00-00 00:00:00', 0),
(495, '1.1.1.250', 0, 0, 0, '0000-00-00 00:00:00', 0),
(496, '1.1.1.251', 0, 0, 0, '0000-00-00 00:00:00', 0),
(497, '1.1.1.252', 0, 0, 0, '0000-00-00 00:00:00', 0),
(498, '1.1.1.253', 0, 0, 0, '0000-00-00 00:00:00', 0),
(499, '1.1.1.254', 0, 0, 0, '0000-00-00 00:00:00', 0),
(500, '1.1.1.255', 0, 0, 0, '0000-00-00 00:00:00', 0),
(501, '1.1.2.0', 0, 0, 0, '0000-00-00 00:00:00', 0),
(502, '1.1.2.1', 0, 0, 0, '0000-00-00 00:00:00', 0),
(503, '1.1.2.2', 0, 0, 0, '0000-00-00 00:00:00', 0),
(504, '1.1.2.3', 0, 0, 0, '0000-00-00 00:00:00', 0),
(505, '1.1.2.4', 0, 0, 0, '0000-00-00 00:00:00', 0),
(506, '1.1.2.5', 0, 0, 0, '0000-00-00 00:00:00', 0),
(507, '1.1.2.6', 0, 0, 0, '0000-00-00 00:00:00', 0),
(508, '1.1.2.7', 0, 0, 0, '0000-00-00 00:00:00', 0),
(509, '1.1.2.8', 0, 0, 0, '0000-00-00 00:00:00', 0),
(510, '1.1.2.9', 0, 0, 0, '0000-00-00 00:00:00', 0),
(511, '1.1.2.10', 0, 0, 0, '0000-00-00 00:00:00', 0),
(512, '1.1.2.11', 0, 0, 0, '0000-00-00 00:00:00', 0),
(513, '1.1.2.12', 0, 0, 0, '0000-00-00 00:00:00', 0),
(514, '1.1.2.13', 0, 0, 0, '0000-00-00 00:00:00', 0),
(515, '1.1.2.14', 0, 0, 0, '0000-00-00 00:00:00', 0),
(516, '1.1.2.15', 0, 0, 0, '0000-00-00 00:00:00', 0),
(517, '1.1.2.16', 0, 0, 0, '0000-00-00 00:00:00', 0),
(518, '1.1.2.17', 0, 0, 0, '0000-00-00 00:00:00', 0),
(519, '1.1.2.18', 0, 0, 0, '0000-00-00 00:00:00', 0),
(520, '1.1.2.19', 0, 0, 0, '0000-00-00 00:00:00', 0),
(521, '1.1.2.20', 0, 0, 0, '0000-00-00 00:00:00', 0),
(522, '1.1.2.21', 0, 0, 0, '0000-00-00 00:00:00', 0),
(523, '1.1.2.22', 0, 0, 0, '0000-00-00 00:00:00', 0),
(524, '1.1.2.23', 0, 0, 0, '0000-00-00 00:00:00', 0),
(525, '1.1.2.24', 0, 0, 0, '0000-00-00 00:00:00', 0),
(526, '1.1.2.25', 0, 0, 0, '0000-00-00 00:00:00', 0),
(527, '1.1.2.26', 0, 0, 0, '0000-00-00 00:00:00', 0),
(528, '1.1.2.27', 0, 0, 0, '0000-00-00 00:00:00', 0),
(529, '1.1.2.28', 0, 0, 0, '0000-00-00 00:00:00', 0),
(530, '1.1.2.29', 0, 0, 0, '0000-00-00 00:00:00', 0),
(531, '1.1.2.30', 0, 0, 0, '0000-00-00 00:00:00', 0),
(532, '1.1.2.31', 0, 0, 0, '0000-00-00 00:00:00', 0),
(533, '1.1.2.32', 0, 0, 0, '0000-00-00 00:00:00', 0),
(534, '1.1.2.33', 0, 0, 0, '0000-00-00 00:00:00', 0),
(535, '1.1.2.34', 0, 0, 0, '0000-00-00 00:00:00', 0),
(536, '1.1.2.35', 0, 0, 0, '0000-00-00 00:00:00', 0),
(537, '1.1.2.36', 0, 0, 0, '0000-00-00 00:00:00', 0),
(538, '1.1.2.37', 0, 0, 0, '0000-00-00 00:00:00', 0),
(539, '1.1.2.38', 0, 0, 0, '0000-00-00 00:00:00', 0),
(540, '1.1.2.39', 0, 0, 0, '0000-00-00 00:00:00', 0),
(541, '1.1.2.40', 0, 0, 0, '0000-00-00 00:00:00', 0),
(542, '1.1.2.41', 0, 0, 0, '0000-00-00 00:00:00', 0),
(543, '1.1.2.42', 0, 0, 0, '0000-00-00 00:00:00', 0),
(544, '1.1.2.43', 0, 0, 0, '0000-00-00 00:00:00', 0),
(545, '1.1.2.44', 0, 0, 0, '0000-00-00 00:00:00', 0),
(546, '1.1.2.45', 0, 0, 0, '0000-00-00 00:00:00', 0),
(547, '1.1.2.46', 0, 0, 0, '0000-00-00 00:00:00', 0),
(548, '1.1.2.47', 0, 0, 0, '0000-00-00 00:00:00', 0),
(549, '1.1.2.48', 0, 0, 0, '0000-00-00 00:00:00', 0),
(550, '1.1.2.49', 0, 0, 0, '0000-00-00 00:00:00', 0),
(551, '1.1.2.50', 0, 0, 0, '0000-00-00 00:00:00', 0),
(552, '1.1.2.51', 0, 0, 0, '0000-00-00 00:00:00', 0),
(553, '1.1.2.52', 0, 0, 0, '0000-00-00 00:00:00', 0),
(554, '1.1.2.53', 0, 0, 0, '0000-00-00 00:00:00', 0),
(555, '1.1.2.54', 0, 0, 0, '0000-00-00 00:00:00', 0),
(556, '1.1.2.55', 0, 0, 0, '0000-00-00 00:00:00', 0),
(557, '1.1.2.56', 0, 0, 0, '0000-00-00 00:00:00', 0),
(558, '1.1.2.57', 0, 0, 0, '0000-00-00 00:00:00', 0),
(559, '1.1.2.58', 0, 0, 0, '0000-00-00 00:00:00', 0),
(560, '1.1.2.59', 0, 0, 0, '0000-00-00 00:00:00', 0),
(561, '1.1.2.60', 0, 0, 0, '0000-00-00 00:00:00', 0),
(562, '1.1.2.61', 0, 0, 0, '0000-00-00 00:00:00', 0),
(563, '1.1.2.62', 0, 0, 0, '0000-00-00 00:00:00', 0),
(564, '1.1.2.63', 0, 0, 0, '0000-00-00 00:00:00', 0),
(565, '1.1.2.64', 0, 0, 0, '0000-00-00 00:00:00', 0),
(566, '1.1.2.65', 0, 0, 0, '0000-00-00 00:00:00', 0),
(567, '1.1.2.66', 0, 0, 0, '0000-00-00 00:00:00', 0),
(568, '1.1.2.67', 0, 0, 0, '0000-00-00 00:00:00', 0),
(569, '1.1.2.68', 0, 0, 0, '0000-00-00 00:00:00', 0),
(570, '1.1.2.69', 0, 0, 0, '0000-00-00 00:00:00', 0),
(571, '1.1.2.70', 0, 0, 0, '0000-00-00 00:00:00', 0),
(572, '1.1.2.71', 0, 0, 0, '0000-00-00 00:00:00', 0),
(573, '1.1.2.72', 0, 0, 0, '0000-00-00 00:00:00', 0),
(574, '1.1.2.73', 0, 0, 0, '0000-00-00 00:00:00', 0),
(575, '1.1.2.74', 0, 0, 0, '0000-00-00 00:00:00', 0),
(576, '1.1.2.75', 0, 0, 0, '0000-00-00 00:00:00', 0),
(577, '1.1.2.76', 0, 0, 0, '0000-00-00 00:00:00', 0),
(578, '1.1.2.77', 0, 0, 0, '0000-00-00 00:00:00', 0),
(579, '1.1.2.78', 0, 0, 0, '0000-00-00 00:00:00', 0),
(580, '1.1.2.79', 0, 0, 0, '0000-00-00 00:00:00', 0),
(581, '1.1.2.80', 0, 0, 0, '0000-00-00 00:00:00', 0),
(582, '1.1.2.81', 0, 0, 0, '0000-00-00 00:00:00', 0),
(583, '1.1.2.82', 0, 0, 0, '0000-00-00 00:00:00', 0),
(584, '1.1.2.83', 0, 0, 0, '0000-00-00 00:00:00', 0),
(585, '1.1.2.84', 0, 0, 0, '0000-00-00 00:00:00', 0),
(586, '1.1.2.85', 0, 0, 0, '0000-00-00 00:00:00', 0),
(587, '1.1.2.86', 0, 0, 0, '0000-00-00 00:00:00', 0),
(588, '1.1.2.87', 0, 0, 0, '0000-00-00 00:00:00', 0),
(589, '1.1.2.88', 0, 0, 0, '0000-00-00 00:00:00', 0),
(590, '1.1.2.89', 0, 0, 0, '0000-00-00 00:00:00', 0),
(591, '1.1.2.90', 0, 0, 0, '0000-00-00 00:00:00', 0),
(592, '1.1.2.91', 0, 0, 0, '0000-00-00 00:00:00', 0),
(593, '1.1.2.92', 0, 0, 0, '0000-00-00 00:00:00', 0),
(594, '1.1.2.93', 0, 0, 0, '0000-00-00 00:00:00', 0),
(595, '1.1.2.94', 0, 0, 0, '0000-00-00 00:00:00', 0),
(596, '1.1.2.95', 0, 0, 0, '0000-00-00 00:00:00', 0),
(597, '1.1.2.96', 0, 0, 0, '0000-00-00 00:00:00', 0),
(598, '1.1.2.97', 0, 0, 0, '0000-00-00 00:00:00', 0),
(599, '1.1.2.98', 0, 0, 0, '0000-00-00 00:00:00', 0),
(600, '1.1.2.99', 0, 0, 0, '0000-00-00 00:00:00', 0),
(601, '1.1.2.100', 0, 0, 0, '0000-00-00 00:00:00', 0),
(602, '1.1.2.101', 0, 0, 0, '0000-00-00 00:00:00', 0),
(603, '1.1.2.102', 0, 0, 0, '0000-00-00 00:00:00', 0),
(604, '1.1.2.103', 0, 0, 0, '0000-00-00 00:00:00', 0),
(605, '1.1.2.104', 0, 0, 0, '0000-00-00 00:00:00', 0),
(606, '1.1.2.105', 0, 0, 0, '0000-00-00 00:00:00', 0),
(607, '1.1.2.106', 0, 0, 0, '0000-00-00 00:00:00', 0),
(608, '1.1.2.107', 0, 0, 0, '0000-00-00 00:00:00', 0),
(609, '1.1.2.108', 0, 0, 0, '0000-00-00 00:00:00', 0),
(610, '1.1.2.109', 0, 0, 0, '0000-00-00 00:00:00', 0),
(611, '1.1.2.110', 0, 0, 0, '0000-00-00 00:00:00', 0),
(612, '1.1.2.111', 0, 0, 0, '0000-00-00 00:00:00', 0),
(613, '1.1.2.112', 0, 0, 0, '0000-00-00 00:00:00', 0),
(614, '1.1.2.113', 0, 0, 0, '0000-00-00 00:00:00', 0),
(615, '1.1.2.114', 0, 0, 0, '0000-00-00 00:00:00', 0),
(616, '1.1.2.115', 0, 0, 0, '0000-00-00 00:00:00', 0),
(617, '1.1.2.116', 0, 0, 0, '0000-00-00 00:00:00', 0),
(618, '1.1.2.117', 0, 0, 0, '0000-00-00 00:00:00', 0),
(619, '1.1.2.118', 0, 0, 0, '0000-00-00 00:00:00', 0),
(620, '1.1.2.119', 0, 0, 0, '0000-00-00 00:00:00', 0),
(621, '1.1.2.120', 0, 0, 0, '0000-00-00 00:00:00', 0),
(622, '1.1.2.121', 0, 0, 0, '0000-00-00 00:00:00', 0),
(623, '1.1.2.122', 0, 0, 0, '0000-00-00 00:00:00', 0),
(624, '1.1.2.123', 0, 0, 0, '0000-00-00 00:00:00', 0),
(625, '1.1.2.124', 0, 0, 0, '0000-00-00 00:00:00', 0),
(626, '1.1.2.125', 0, 0, 0, '0000-00-00 00:00:00', 0),
(627, '1.1.2.126', 0, 0, 0, '0000-00-00 00:00:00', 0),
(628, '1.1.2.127', 0, 0, 0, '0000-00-00 00:00:00', 0),
(629, '1.1.2.128', 0, 0, 0, '0000-00-00 00:00:00', 0),
(630, '1.1.2.129', 0, 0, 0, '0000-00-00 00:00:00', 0),
(631, '1.1.2.130', 0, 0, 0, '0000-00-00 00:00:00', 0),
(632, '1.1.2.131', 0, 0, 0, '0000-00-00 00:00:00', 0),
(633, '1.1.2.132', 0, 0, 0, '0000-00-00 00:00:00', 0),
(634, '1.1.2.133', 0, 0, 0, '0000-00-00 00:00:00', 0),
(635, '1.1.2.134', 0, 0, 0, '0000-00-00 00:00:00', 0),
(636, '1.1.2.135', 0, 0, 0, '0000-00-00 00:00:00', 0),
(637, '1.1.2.136', 0, 0, 0, '0000-00-00 00:00:00', 0),
(638, '1.1.2.137', 0, 0, 0, '0000-00-00 00:00:00', 0),
(639, '1.1.2.138', 0, 0, 0, '0000-00-00 00:00:00', 0),
(640, '1.1.2.139', 0, 0, 0, '0000-00-00 00:00:00', 0),
(641, '1.1.2.140', 0, 0, 0, '0000-00-00 00:00:00', 0),
(642, '1.1.2.141', 0, 0, 0, '0000-00-00 00:00:00', 0),
(643, '1.1.2.142', 0, 0, 0, '0000-00-00 00:00:00', 0),
(644, '1.1.2.143', 0, 0, 0, '0000-00-00 00:00:00', 0),
(645, '1.1.2.144', 0, 0, 0, '0000-00-00 00:00:00', 0),
(646, '1.1.2.145', 0, 0, 0, '0000-00-00 00:00:00', 0),
(647, '1.1.2.146', 0, 0, 0, '0000-00-00 00:00:00', 0),
(648, '1.1.2.147', 0, 0, 0, '0000-00-00 00:00:00', 0),
(649, '1.1.2.148', 0, 0, 0, '0000-00-00 00:00:00', 0),
(650, '1.1.2.149', 0, 0, 0, '0000-00-00 00:00:00', 0),
(651, '1.1.2.150', 0, 0, 0, '0000-00-00 00:00:00', 0),
(652, '1.1.2.151', 0, 0, 0, '0000-00-00 00:00:00', 0),
(653, '1.1.2.152', 0, 0, 0, '0000-00-00 00:00:00', 0),
(654, '1.1.2.153', 0, 0, 0, '0000-00-00 00:00:00', 0),
(655, '1.1.2.154', 0, 0, 0, '0000-00-00 00:00:00', 0),
(656, '1.1.2.155', 0, 0, 0, '0000-00-00 00:00:00', 0),
(657, '1.1.2.156', 0, 0, 0, '0000-00-00 00:00:00', 0),
(658, '1.1.2.157', 0, 0, 0, '0000-00-00 00:00:00', 0),
(659, '1.1.2.158', 0, 0, 0, '0000-00-00 00:00:00', 0),
(660, '1.1.2.159', 0, 0, 0, '0000-00-00 00:00:00', 0),
(661, '1.1.2.160', 0, 0, 0, '0000-00-00 00:00:00', 0),
(662, '1.1.2.161', 0, 0, 0, '0000-00-00 00:00:00', 0),
(663, '1.1.2.162', 0, 0, 0, '0000-00-00 00:00:00', 0),
(664, '1.1.2.163', 0, 0, 0, '0000-00-00 00:00:00', 0),
(665, '1.1.2.164', 0, 0, 0, '0000-00-00 00:00:00', 0),
(666, '1.1.2.165', 0, 0, 0, '0000-00-00 00:00:00', 0),
(667, '1.1.2.166', 0, 0, 0, '0000-00-00 00:00:00', 0),
(668, '1.1.2.167', 0, 0, 0, '0000-00-00 00:00:00', 0),
(669, '1.1.2.168', 0, 0, 0, '0000-00-00 00:00:00', 0),
(670, '1.1.2.169', 0, 0, 0, '0000-00-00 00:00:00', 0),
(671, '1.1.2.170', 0, 0, 0, '0000-00-00 00:00:00', 0),
(672, '1.1.2.171', 0, 0, 0, '0000-00-00 00:00:00', 0),
(673, '1.1.2.172', 0, 0, 0, '0000-00-00 00:00:00', 0),
(674, '1.1.2.173', 0, 0, 0, '0000-00-00 00:00:00', 0),
(675, '1.1.2.174', 0, 0, 0, '0000-00-00 00:00:00', 0),
(676, '1.1.2.175', 0, 0, 0, '0000-00-00 00:00:00', 0),
(677, '1.1.2.176', 0, 0, 0, '0000-00-00 00:00:00', 0),
(678, '1.1.2.177', 0, 0, 0, '0000-00-00 00:00:00', 0),
(679, '1.1.2.178', 0, 0, 0, '0000-00-00 00:00:00', 0),
(680, '1.1.2.179', 0, 0, 0, '0000-00-00 00:00:00', 0),
(681, '1.1.2.180', 0, 0, 0, '0000-00-00 00:00:00', 0),
(682, '1.1.2.181', 0, 0, 0, '0000-00-00 00:00:00', 0),
(683, '1.1.2.182', 0, 0, 0, '0000-00-00 00:00:00', 0),
(684, '1.1.2.183', 0, 0, 0, '0000-00-00 00:00:00', 0),
(685, '1.1.2.184', 0, 0, 0, '0000-00-00 00:00:00', 0),
(686, '1.1.2.185', 0, 0, 0, '0000-00-00 00:00:00', 0),
(687, '1.1.2.186', 0, 0, 0, '0000-00-00 00:00:00', 0),
(688, '1.1.2.187', 0, 0, 0, '0000-00-00 00:00:00', 0),
(689, '1.1.2.188', 0, 0, 0, '0000-00-00 00:00:00', 0),
(690, '1.1.2.189', 0, 0, 0, '0000-00-00 00:00:00', 0),
(691, '1.1.2.190', 0, 0, 0, '0000-00-00 00:00:00', 0),
(692, '1.1.2.191', 0, 0, 0, '0000-00-00 00:00:00', 0),
(693, '1.1.2.192', 0, 0, 0, '0000-00-00 00:00:00', 0),
(694, '1.1.2.193', 0, 0, 0, '0000-00-00 00:00:00', 0),
(695, '1.1.2.194', 0, 0, 0, '0000-00-00 00:00:00', 0),
(696, '1.1.2.195', 0, 0, 0, '0000-00-00 00:00:00', 0),
(697, '1.1.2.196', 0, 0, 0, '0000-00-00 00:00:00', 0),
(698, '1.1.2.197', 0, 0, 0, '0000-00-00 00:00:00', 0),
(699, '1.1.2.198', 0, 0, 0, '0000-00-00 00:00:00', 0),
(700, '1.1.2.199', 0, 0, 0, '0000-00-00 00:00:00', 0),
(701, '1.1.2.200', 0, 0, 0, '0000-00-00 00:00:00', 0),
(702, '1.1.2.201', 0, 0, 0, '0000-00-00 00:00:00', 0),
(703, '1.1.2.202', 0, 0, 0, '0000-00-00 00:00:00', 0),
(704, '1.1.2.203', 0, 0, 0, '0000-00-00 00:00:00', 0),
(705, '1.1.2.204', 0, 0, 0, '0000-00-00 00:00:00', 0),
(706, '1.1.2.205', 0, 0, 0, '0000-00-00 00:00:00', 0),
(707, '1.1.2.206', 0, 0, 0, '0000-00-00 00:00:00', 0),
(708, '1.1.2.207', 0, 0, 0, '0000-00-00 00:00:00', 0),
(709, '1.1.2.208', 0, 0, 0, '0000-00-00 00:00:00', 0),
(710, '1.1.2.209', 0, 0, 0, '0000-00-00 00:00:00', 0),
(711, '1.1.2.210', 0, 0, 0, '0000-00-00 00:00:00', 0),
(712, '1.1.2.211', 0, 0, 0, '0000-00-00 00:00:00', 0),
(713, '1.1.2.212', 0, 0, 0, '0000-00-00 00:00:00', 0),
(714, '1.1.2.213', 0, 0, 0, '0000-00-00 00:00:00', 0),
(715, '1.1.2.214', 0, 0, 0, '0000-00-00 00:00:00', 0),
(716, '1.1.2.215', 0, 0, 0, '0000-00-00 00:00:00', 0),
(717, '1.1.2.216', 0, 0, 0, '0000-00-00 00:00:00', 0),
(718, '1.1.2.217', 0, 0, 0, '0000-00-00 00:00:00', 0),
(719, '1.1.2.218', 0, 0, 0, '0000-00-00 00:00:00', 0),
(720, '1.1.2.219', 0, 0, 0, '0000-00-00 00:00:00', 0),
(721, '1.1.2.220', 0, 0, 0, '0000-00-00 00:00:00', 0),
(722, '1.1.2.221', 0, 0, 0, '0000-00-00 00:00:00', 0),
(723, '1.1.2.222', 0, 0, 0, '0000-00-00 00:00:00', 0),
(724, '1.1.2.223', 0, 0, 0, '0000-00-00 00:00:00', 0),
(725, '1.1.2.224', 0, 0, 0, '0000-00-00 00:00:00', 0),
(726, '1.1.2.225', 0, 0, 0, '0000-00-00 00:00:00', 0),
(727, '1.1.2.226', 0, 0, 0, '0000-00-00 00:00:00', 0),
(728, '1.1.2.227', 0, 0, 0, '0000-00-00 00:00:00', 0),
(729, '1.1.2.228', 0, 0, 0, '0000-00-00 00:00:00', 0),
(730, '1.1.2.229', 0, 0, 0, '0000-00-00 00:00:00', 0),
(731, '1.1.2.230', 0, 0, 0, '0000-00-00 00:00:00', 0),
(732, '1.1.2.231', 0, 0, 0, '0000-00-00 00:00:00', 0),
(733, '1.1.2.232', 0, 0, 0, '0000-00-00 00:00:00', 0),
(734, '1.1.2.233', 0, 0, 0, '0000-00-00 00:00:00', 0),
(735, '1.1.2.234', 0, 0, 0, '0000-00-00 00:00:00', 0),
(736, '1.1.2.235', 0, 0, 0, '0000-00-00 00:00:00', 0),
(737, '1.1.2.236', 0, 0, 0, '0000-00-00 00:00:00', 0),
(738, '1.1.2.237', 0, 0, 0, '0000-00-00 00:00:00', 0),
(739, '1.1.2.238', 0, 0, 0, '0000-00-00 00:00:00', 0),
(740, '1.1.2.239', 0, 0, 0, '0000-00-00 00:00:00', 0),
(741, '1.1.2.240', 0, 0, 0, '0000-00-00 00:00:00', 0),
(742, '1.1.2.241', 0, 0, 0, '0000-00-00 00:00:00', 0),
(743, '1.1.2.242', 0, 0, 0, '0000-00-00 00:00:00', 0),
(744, '1.1.2.243', 0, 0, 0, '0000-00-00 00:00:00', 0),
(745, '1.1.2.244', 0, 0, 0, '0000-00-00 00:00:00', 0),
(746, '1.1.2.245', 0, 0, 0, '0000-00-00 00:00:00', 0),
(747, '1.1.2.246', 0, 0, 0, '0000-00-00 00:00:00', 0),
(748, '1.1.2.247', 0, 0, 0, '0000-00-00 00:00:00', 0),
(749, '1.1.2.248', 0, 0, 0, '0000-00-00 00:00:00', 0),
(750, '1.1.2.249', 0, 0, 0, '0000-00-00 00:00:00', 0),
(751, '1.1.2.250', 0, 0, 0, '0000-00-00 00:00:00', 0),
(752, '1.1.2.251', 0, 0, 0, '0000-00-00 00:00:00', 0),
(753, '1.1.2.252', 0, 0, 0, '0000-00-00 00:00:00', 0),
(754, '1.1.2.253', 0, 0, 0, '0000-00-00 00:00:00', 0),
(755, '1.1.2.254', 0, 0, 0, '0000-00-00 00:00:00', 0);

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
  `source-any` varchar(255) NOT NULL DEFAULT '0',
  `source-internet` varchar(255) NOT NULL DEFAULT '0',
  `source-specific_tunnel` varchar(255) NOT NULL DEFAULT '0',
  `source-specific_group` varchar(255) NOT NULL DEFAULT '0',
  `source-my_cloud` varchar(255) NOT NULL DEFAULT '0',
  `source-my_clouds` varchar(255) NOT NULL DEFAULT '0',
  `source-every_cloud` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `source`
--

INSERT INTO `source` (`id`, `acl_id`, `source-any`, `source-internet`, `source-specific_tunnel`, `source-specific_group`, `source-my_cloud`, `source-my_clouds`, `source-every_cloud`) VALUES
(1, 1, '0', '0', '0', '1', '0', '0', '0'),
(2, 2, '0', '0', '0', '0', '0', '0', '0'),
(3, 3, '0', '0', '0', '0', '0', '0', '0'),
(4, 4, '0', '0', '0', '0', '0', '0', '0'),
(5, 5, '0', '0', '0', '0', '0', '0', '0'),
(6, 6, '0', '0', '0', '0', '0', '0', '0'),
(7, 7, '0', '0', '0', '0', '0', '0', '0'),
(8, 8, '0', '0', '0', '0', '0', '0', '0'),
(9, 9, '0', '0', '0', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `s_aliasing`
--

CREATE TABLE IF NOT EXISTS `s_aliasing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `s_aliasing-new_dst` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `s_aliasing`
--

INSERT INTO `s_aliasing` (`id`, `acl_id`, `s_aliasing-new_dst`) VALUES
(1, 1, '0'),
(2, 2, '0'),
(3, 3, '0'),
(4, 4, '0'),
(5, 5, '0'),
(6, 6, '0'),
(7, 7, '0');

-- --------------------------------------------------------

--
-- Table structure for table `s_firewall`
--

CREATE TABLE IF NOT EXISTS `s_firewall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `s_firewall-deny_all` varchar(255) NOT NULL DEFAULT '0',
  `s_firewall-allow_all` varchar(255) NOT NULL DEFAULT '0',
  `s_firewall-processes` varchar(255) NOT NULL DEFAULT '0',
  `s_firewall-apps` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `s_firewall`
--

INSERT INTO `s_firewall` (`id`, `acl_id`, `s_firewall-deny_all`, `s_firewall-allow_all`, `s_firewall-processes`, `s_firewall-apps`) VALUES
(1, 1, '0', '0', '0', '0'),
(2, 2, '0', '0', '0', '0'),
(3, 3, '0', '0', '0', '0'),
(4, 4, '0', '0', '0', '0'),
(5, 5, '0', '0', '0', '0'),
(6, 6, '0', '0', '0', '0'),
(7, 7, '0', '0', '0', '0'),
(8, 8, '0', '0', '0', '0'),
(9, 9, '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `s_qos`
--

CREATE TABLE IF NOT EXISTS `s_qos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `s_qos-shaping` varchar(255) NOT NULL DEFAULT '0',
  `s_qos-priority` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `s_qos`
--

INSERT INTO `s_qos` (`id`, `acl_id`, `s_qos-shaping`, `s_qos-priority`) VALUES
(1, 1, '0', '0'),
(2, 2, '0', '0'),
(3, 3, '0', '0'),
(4, 4, '0', '0'),
(5, 5, '0', '0'),
(6, 6, '0', '0'),
(7, 7, '0', '0'),
(8, 8, '0', '0'),
(9, 9, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `s_tos`
--

CREATE TABLE IF NOT EXISTS `s_tos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `s_tos-bind_all` varchar(255) NOT NULL DEFAULT '0',
  `s_tos-processes` varchar(255) NOT NULL DEFAULT '0',
  `s_tos-apps` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `s_tos`
--

INSERT INTO `s_tos` (`id`, `acl_id`, `s_tos-bind_all`, `s_tos-processes`, `s_tos-apps`) VALUES
(1, 1, '0', '0', '0'),
(2, 2, '0', '0', '0'),
(3, 3, '0', '0', '0'),
(4, 4, '0', '0', '0'),
(5, 5, '0', '0', '0'),
(6, 6, '0', '0', '0'),
(7, 7, '0', '0', '0'),
(8, 8, '0', '0', '0'),
(9, 9, '0', '0', '0');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tunnels_data`
--

INSERT INTO `tunnels_data` (`tunnel_id`, `type`, `username`, `password`, `group`, `cloud_ip`, `local_ip`, `real_ip`, `controller_id`, `cloud_id`, `user_token`, `status`, `last_login`, `traffic`, `bidirectional_mode`, `gateway_mode`, `email`, `group_id`, `display_name`, `is_deleted`, `tunnel_type`, `location`, `country`, `last_updated`, `no_of_revision`, `IPAlias`, `internet_tunnel`, `max_simultaneous_login`, `servers_ACL`, `internet`, `route`, `DeV`, `plan_id`, `last_action`, `is_complete_action`, `is_updated`, `is_seen`) VALUES
(1, 0, 'VPN14582346711634854018S', 'RYDtfx', NULL, '10.10.0.1', '', '', 0, 1, '37c1c8b32de36e2ef70b16815971f2d1', 0, '2016-03-17 17:11:11', 0, 0, 0, 'samit@mail.com', 0, 'abcd', 0, 'server', '', NULL, '0000-00-00 00:00:00', 0, '', 0, 0, '', 0, 0, -1, 1, '', 0, 0, 0),
(2, 0, 'VPN14582348261409679207S', 'swlP9j', NULL, '10.10.0.2', '', '', 0, 1, '37c1c8b32de36e2ef70b16815971f2d1', 0, '2016-03-17 17:13:46', 0, 0, 0, 'samit@mail.com', 0, 'nnnn', 0, 'server', '', NULL, '0000-00-00 00:00:00', 0, '', 0, 0, '', 0, 0, -1, 1, '', 0, 0, 0),
(3, 0, 'VPN14582450161917249230S', '6yI19v', NULL, '10.10.0.3', '', '', 0, 2, '37a1219b90be9ad8f8741535f79c00e6', 0, '2016-03-17 20:03:36', 0, 0, 0, 'abdo@gmail.com', 0, 'abdo@gmail.com', 0, 'server', '', NULL, '0000-00-00 00:00:00', 0, '', 0, 0, '', 0, 0, -1, 1, '', 0, 0, 0),
(4, 0, 'VPN1458301369982440035S', 'RZV4bt', NULL, '10.10.0.4', '', '', 0, 1, '37c1c8b32de36e2ef70b16815971f2d1', 0, '2016-03-18 11:42:49', 0, 0, 0, 'samit@mail.com', 2, 'acaf', 0, 'server', '', NULL, '0000-00-00 00:00:00', 0, '', 0, 0, '', 0, 0, -1, 1, '', 0, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tunnel_acl_relation`
--

INSERT INTO `tunnel_acl_relation` (`id`, `tunnel_id`, `creation_time`, `is_active`) VALUES
(1, 1, '0000-00-00 00:00:00', 1),
(2, 2, '0000-00-00 00:00:00', 1),
(3, 3, '0000-00-00 00:00:00', 1),
(4, 3, '0000-00-00 00:00:00', 1),
(5, 4, '0000-00-00 00:00:00', 1),
(6, 2, '0000-00-00 00:00:00', 1),
(7, 2, '0000-00-00 00:00:00', 1),
(8, 1, '0000-00-00 00:00:00', 1),
(9, 1, '0000-00-00 00:00:00', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
