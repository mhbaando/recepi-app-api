-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 18, 2023 at 08:35 AM
-- Server version: 8.0.32-0ubuntu0.22.04.2
-- PHP Version: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vrls`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` int NOT NULL,
  `account_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` int DEFAULT NULL,
  `amount` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `account_type_id` int NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `account_name`, `account_number`, `amount`, `created_at`, `modified_at`, `account_type_id`, `reg_user_id`) VALUES
(1, 'New Vehicle', 1, 120, '2023-03-06 09:17:15.278436', '2023-03-13 11:53:08.066557', 1, 1),
(2, 'New License', 2, 200, '2023-03-06 09:17:43.102080', '2023-03-06 09:17:43.102115', 2, 1),
(3, 'New Plate', 3, 252, '2023-03-06 09:17:59.682049', '2023-03-06 09:17:59.682076', 3, 1),
(4, 'Renew License', 4, 120, '2023-03-06 09:18:14.324521', '2023-03-13 11:21:10.472528', 2, 1),
(5, 'Transfer Vehicle', 5, 250, '2023-03-14 08:53:02.054951', '2023-03-14 10:29:02.839418', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `type_id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `reg_user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`type_id`, `name`, `created_at`, `modified_at`, `reg_user_id`) VALUES
(1, 'Vehicle', '2023-03-05 08:44:11.744076', '2023-03-05 08:44:11.759784', NULL),
(2, 'Liecense', '2023-03-05 08:44:11.744076', '2023-03-05 08:44:11.759784', NULL),
(3, 'Plate', '2023-03-05 08:44:11.744076', '2023-03-05 08:44:11.759784', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `audittrials`
--

CREATE TABLE `audittrials` (
  `id` bigint NOT NULL,
  `Avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Actions` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Module` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_action` datetime(6) NOT NULL,
  `operating_system` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audittrials`
--

INSERT INTO `audittrials` (`id`, `Avatar`, `Username`, `path`, `Name`, `Actions`, `Module`, `date_of_action`, `operating_system`, `browser`, `ip_address`, `user_agent`) VALUES
(1, '', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-03-05 10:25:57.168347', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(2, '', 'AD00001', '/customer/', ' ', 'Registered A Customer', 'Customer / Register', '2023-03-05 10:28:45.306850', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(3, 'Avatars/th.jpeg', 'AD00001', '/logout/', 'Mohamud Abshir', 'Mohamud Abshir Logged out the System', 'Users Module', '2023-03-05 11:54:15.039658', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(4, 'Avatars/th.jpeg', 'AD00001', '/login', 'Mohamud Abshir', 'Mohamud Abshir logged into the System', 'Users Module', '2023-03-05 11:54:16.853380', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(5, 'Avatars/th_IaXsnHT.jpeg', 'AD00001', '/login', 'Mohamud Abshir', 'Mohamud Abshir logged into the System', 'Users Module', '2023-03-05 13:26:10.460686', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(6, 'Avatars/th_IaXsnHT.jpeg', 'AD00001', '/manage_users/AddNewUser', 'Mohamud Abshir', 'Created new admin name of Halima Hussein', 'Users Module / users Table', '2023-03-05 14:09:35.990297', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(7, 'Avatars/th_IaXsnHT.jpeg', 'AD00001', '/manage_users/AddNewUser', 'Mohamud Abshir', 'Created new admin name of Halima Hussein', 'Users Module / users Table', '2023-03-05 14:28:12.472548', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(8, 'Avatars/th_IaXsnHT.jpeg', 'AD00001', '/manage_users/AddNewUser', 'Mohamud Abshir', 'Created new superuser name of Aziza Raage', 'Users Module / users Table', '2023-03-05 14:36:21.605624', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(9, 'Avatars/th_IaXsnHT.jpeg', 'AD00001', '/login', 'Mohamud Abshir', 'Mohamud Abshir logged into the System', 'Users Module', '2023-03-05 15:10:02.658776', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(10, 'Avatars/th_IaXsnHT.jpeg', 'AD00001', '/customer/company/', 'Mohamud Abshir', 'Registered A Company Baalgoray General Trading Co. at 2023-03-05 15:30:02.358572', 'Customer / Register', '2023-03-05 15:30:02.358900', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(11, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-05 16:06:17.762806', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(12, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-06 09:14:55.215777', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(13, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/updatecustomer/', 'Xassen Abshir', 'Updated A Customer Axmed Jaamac Geedi Cilmi', 'Customer / Update', '2023-03-06 09:15:35.883119', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(14, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Registered A Vehicle Tesla at 2023-03-06 09:24:34.206810', 'Vehicle / Register', '2023-03-06 09:24:34.207635', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(15, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Registered A Vehicle Abarth at 2023-03-06 09:56:08.484952', 'Vehicle / Register', '2023-03-06 09:56:08.485395', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(16, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-06 10:10:52.185316', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(17, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-06 11:11:30.731897', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(18, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-06 13:54:19.689352', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(19, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-06 14:20:51.939510', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(20, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-06 14:42:31.624045', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(21, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-07 09:20:18.466227', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(22, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/', 'Xassen Abshir', 'Registered A Customer', 'Customer / Register', '2023-03-07 11:11:45.339333', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(23, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/logout/', 'Xassen Abshir', 'Xassen Abshir Logged out the System', 'Users Module', '2023-03-07 11:17:02.261096', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(24, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-07 11:17:04.940567', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(25, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/logout/', 'Xassen Abshir', 'Xassen Abshir Logged out the System', 'Users Module', '2023-03-07 11:17:08.338116', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(26, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-07 11:18:01.751963', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(27, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/logout/', 'Xassen Abshir', 'Xassen Abshir Logged out the System', 'Users Module', '2023-03-07 11:18:10.752369', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(28, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-07 11:18:14.780844', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(29, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-07 12:10:11.084871', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(30, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-07 12:17:50.838682', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(31, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/logout/', 'Aziza Raage', 'Aziza Raage Logged out the System', 'Users Module', '2023-03-07 12:19:57.998173', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(32, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-07 12:19:59.725605', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(33, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/logout/', 'Aziza Raage', 'Aziza Raage Logged out the System', 'Users Module', '2023-03-07 12:20:17.329850', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(34, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-07 12:20:20.032822', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(35, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/logout/', 'Xassen Abshir', 'Xassen Abshir Logged out the System', 'Users Module', '2023-03-07 12:36:36.109444', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(36, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-07 12:36:38.664687', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(37, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-07 12:36:57.776999', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(38, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/logout/', 'Aziza Raage', 'Aziza Raage Logged out the System', 'Users Module', '2023-03-07 12:37:00.629610', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(39, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-07 12:37:03.473807', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(40, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/logout/', 'Xassen Abshir', 'Xassen Abshir Logged out the System', 'Users Module', '2023-03-07 12:37:12.074374', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(41, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-07 12:37:15.395985', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(42, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-07 13:29:17.104244', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(43, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/logout/', 'Aziza Raage', 'Aziza Raage Logged out the System', 'Users Module', '2023-03-07 13:30:24.099092', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(44, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-07 13:30:26.850740', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(45, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-07 15:53:46.044926', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(46, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-07 16:20:21.972303', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(47, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/logout/', 'Xassen Abshir', 'Xassen Abshir Logged out the System', 'Users Module', '2023-03-07 16:20:55.464726', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(48, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-07 16:20:57.688836', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(49, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-08 10:15:29.820113', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(50, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/0', 'Xassen Abshir', 'Added new Group with Name of:_Admin', 'Users-Permission Module', '2023-03-08 10:15:57.020029', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(51, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/0', 'Xassen Abshir', 'Added new Group with Name of:_State', 'Users-Permission Module', '2023-03-08 10:17:16.163459', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(52, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_logentry Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:17:47.486741', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(53, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_logentry Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:19:49.379954', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(54, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_logentry removed from the group of Admin', 'Users-Permission Module', '2023-03-08 10:19:52.598441', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(55, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_group Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:20:25.251805', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(56, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_permission Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:20:43.660335', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(57, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_permission Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:20:54.560847', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(58, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_contenttype Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:04.457603', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(59, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_contenttype Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:06.396539', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(60, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_contenttype Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:08.244850', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(61, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_users Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:17.084860', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(62, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_users Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:18.797684', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(63, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_users Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:20.746653', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(64, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_errorlogs Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:26.012844', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(65, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_audittrials Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:28.227804', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(66, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_account Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:35.533701', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(67, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_account_types Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:37.613140', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(68, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_receipt_voucher Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:39.291113', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(69, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_account Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:41.586015', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(70, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_account_types Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:43.321128', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(71, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_receipt_voucher Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:45.378920', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(72, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_account Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:48.057324', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(73, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_account_types Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:49.763476', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(74, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_receipt_voucher Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:21:51.103991', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(75, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_blood_group Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:02.943158', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(76, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_blood_group Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:05.674211', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(77, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_company Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:09.810925', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(78, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_company Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:11.431751', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(79, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_company Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:13.230718', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(80, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_countries Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:20.269002', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(81, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_countries Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:22.536597', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(82, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_countries Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:25.746488', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(83, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_customer Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:32.795820', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(84, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_customer Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:34.397639', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(85, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_customer Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:36.212604', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(86, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_customer_fingers Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:41.219316', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(87, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_customer_fingers Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:43.166882', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(88, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_customer_fingers Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:45.018577', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(89, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_federal_state Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:48.957285', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(90, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_federal_state Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:51.138312', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(91, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_federal_state Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:52.805879', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(92, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_license Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:56.235762', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(93, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_license Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:58.276284', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(94, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_license Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:22:59.886865', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(95, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_licensetype Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:05.723867', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(96, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_licensetype Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:07.548254', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(97, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_licensetype Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:09.292715', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(98, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_personal_id_type Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:13.070711', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(99, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_personal_id_type Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:15.050330', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(100, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_personal_id_type Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:16.895302', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(101, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_placeissue Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:25.882875', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(102, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_placeissue Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:28.663214', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(103, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_placeissue Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:30.861228', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(104, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_color Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:47.439677', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(105, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_color Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:49.998668', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(106, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_cylinder Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:51.797426', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(107, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_cylinder Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:53.667924', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(108, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_model_brand Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:54.925703', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(109, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_model_brand Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:57.041722', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(110, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_plate Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:58.357076', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(111, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_plate Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:23:59.861011', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(112, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_vehicle Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:24:01.290199', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(113, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_vehicle Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:24:02.764499', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(114, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_type Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:24:04.009833', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(115, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_type Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:24:05.661796', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(116, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_transfare_vehicles Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:24:07.353684', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(117, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_transfare_vehicles Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:24:08.813756', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(118, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'add_code_plate Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:24:10.268449', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(119, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_code_plate Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:24:11.707586', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(120, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_color Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:24:13.510072', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(121, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_cylinder Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:24:14.948126', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(122, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_model_brand Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:24:15.916292', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(123, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_plate Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:24:16.961184', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(124, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_vehicle Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:24:17.923299', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(125, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_type Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:24:18.877676', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(126, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_transfare_vehicles Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:24:20.026858', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(127, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'view_code_plate Added to the group of Admin', 'Users-Permission Module', '2023-03-08 10:24:21.043596', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(128, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_account Added to the group of State', 'Users-Permission Module', '2023-03-08 10:24:39.738986', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(129, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_account Added to the group of State', 'Users-Permission Module', '2023-03-08 10:24:41.786469', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(130, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_account_types Added to the group of State', 'Users-Permission Module', '2023-03-08 10:24:45.153766', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(131, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_account_types Added to the group of State', 'Users-Permission Module', '2023-03-08 10:24:47.162496', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(132, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_receipt_voucher Added to the group of State', 'Users-Permission Module', '2023-03-08 10:24:48.704867', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(133, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_receipt_voucher Added to the group of State', 'Users-Permission Module', '2023-03-08 10:24:50.743022', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(134, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'change_receipt_voucher Added to the group of State', 'Users-Permission Module', '2023-03-08 10:24:55.239506', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(135, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_blood_group Added to the group of State', 'Users-Permission Module', '2023-03-08 10:25:16.109935', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(136, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_company Added to the group of State', 'Users-Permission Module', '2023-03-08 10:25:19.845351', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(137, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_company Added to the group of State', 'Users-Permission Module', '2023-03-08 10:25:21.520814', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(138, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_countries Added to the group of State', 'Users-Permission Module', '2023-03-08 10:25:44.727959', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(139, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_countries Added to the group of State', 'Users-Permission Module', '2023-03-08 10:25:47.694719', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(140, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_customer Added to the group of State', 'Users-Permission Module', '2023-03-08 10:25:51.771089', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(141, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_customer Added to the group of State', 'Users-Permission Module', '2023-03-08 10:25:53.816863', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(142, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'change_customer Added to the group of State', 'Users-Permission Module', '2023-03-08 10:25:55.696682', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(143, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'change_customer removed from the group of State', 'Users-Permission Module', '2023-03-08 10:25:58.020037', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(144, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_customer_fingers Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:01.219751', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(145, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_customer_fingers Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:03.364409', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(146, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_federal_state Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:06.948214', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(147, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_license Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:10.896701', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(148, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_license Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:12.450287', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(149, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_licensetype Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:16.328136', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(150, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_licensetype Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:19.120912', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(151, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_personal_id_type Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:22.652757', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(152, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_personal_id_type Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:24.488911', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(153, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_placeissue Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:28.154545', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(154, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_placeissue Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:29.950402', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(155, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_color Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:36.619746', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(156, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_cylinder Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:40.452151', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(157, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_model_brand Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:45.502952', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(158, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_plate Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:48.787147', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(159, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_vehicle Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:52.128663', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(160, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_type Added to the group of State', 'Users-Permission Module', '2023-03-08 10:26:56.575939', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(161, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_transfare_vehicles Added to the group of State', 'Users-Permission Module', '2023-03-08 10:27:00.585679', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(162, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_transfare_vehicles Added to the group of State', 'Users-Permission Module', '2023-03-08 10:27:02.686217', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(163, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_vehicle Added to the group of State', 'Users-Permission Module', '2023-03-08 10:27:09.031829', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(164, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_plate Added to the group of State', 'Users-Permission Module', '2023-03-08 10:27:12.648921', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(165, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_code_plate Added to the group of State', 'Users-Permission Module', '2023-03-08 10:27:33.205630', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(166, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group_permission/0/0', 'Xassen Abshir', 'User with username of:_AD00002 added group of Admin', 'Users-Permission Module', '2023-03-08 10:29:01.969828', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(167, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group_permission/0/0', 'Xassen Abshir', 'User with username of:_AD00003 added group of State', 'Users-Permission Module', '2023-03-08 10:29:11.346682', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(168, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-08 10:29:30.860248', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(169, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group_permission/0/0', 'Xassen Abshir', 'User with username of:_AD00003 removed group of State', 'Users-Permission Module', '2023-03-08 10:50:56.403953', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(170, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_permission/0', 'Xassen Abshir', 'Granted Permission to_view_customer With username of AD00003', 'Users-Permission Module', '2023-03-08 10:54:37.175550', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(171, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-08 11:09:46.664228', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(172, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 11:09:46.691313', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(173, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 11:09:50.597721', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(174, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-08 11:38:47.723720', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(175, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 11:38:47.745711', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(176, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-08 11:42:29.059956', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(177, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 11:42:29.077180', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(178, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/logout/', 'Xassen Abshir', 'Xassen Abshir Logged out the System', 'Users Module', '2023-03-08 11:43:44.427803', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(179, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-08 11:43:47.521270', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(180, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/user_lists', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday User List Page', 'Users / Login', '2023-03-08 11:45:57.727868', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(181, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group_permission/0/0', 'Xassen Abshir', 'User with username of:_AD00003 added group of State', 'Users-Permission Module', '2023-03-08 11:46:18.443792', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(182, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 11:49:19.818796', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(183, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/', 'Aziza Raage', 'Registered A Customer', 'Customer / Register', '2023-03-08 11:50:37.473083', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(184, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'activate_customer Added to the group of Admin', 'Users-Permission Module', '2023-03-08 11:58:00.449347', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(185, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'change_customer Added to the group of State', 'Users-Permission Module', '2023-03-08 11:58:19.865386', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(186, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-08 12:14:34.084102', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(187, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 12:14:34.101315', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(188, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Customer Registration', 'Customer / Register', '2023-03-08 12:14:36.062897', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(189, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Customer Registration', 'Customer / Register', '2023-03-08 12:14:38.610354', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(190, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:19:23.657848', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(191, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:19:24.581912', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(192, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-08 12:19:36.662380', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(193, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 12:19:36.692378', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(194, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:19:38.288470', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(195, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:21:47.857187', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(196, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:22:06.853852', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(197, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:23:35.340935', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(198, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:25:21.904396', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(199, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:25:27.198911', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(200, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:27:52.512373', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(201, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:28:24.556646', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(202, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:29:36.274624', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(203, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:29:38.722416', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge');
INSERT INTO `audittrials` (`id`, `Avatar`, `Username`, `path`, `Name`, `Actions`, `Module`, `date_of_action`, `operating_system`, `browser`, `ip_address`, `user_agent`) VALUES
(204, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:29:41.027669', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(205, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:29:42.754482', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(206, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 12:29:49.389403', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(207, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:29:51.496444', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(208, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 12:30:02.142971', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(209, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 12:31:29.067827', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(210, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:31:30.509439', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(211, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:31:43.151563', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(212, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:32:26.980996', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(213, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:32:30.851856', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(214, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:43:04.786246', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(215, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 12:43:06.149930', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(216, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:43:13.004217', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(217, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/2', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Cali  Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 12:43:14.107001', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(218, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:43:16.790593', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(219, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-08 12:43:17.666860', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(220, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Customer Registration', 'Customer / Register', '2023-03-08 12:43:20.264076', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(221, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:43:20.792216', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(222, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/2', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Cali  Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 12:43:21.811071', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(223, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 12:44:31.220603', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(224, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 12:44:31.614969', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(225, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 12:44:31.853364', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(226, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 12:44:32.017098', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(227, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 12:44:43.761306', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(228, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/2', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Cali  Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 12:47:13.143576', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(229, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 12:47:31.035935', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(230, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 12:47:31.351394', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(231, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 12:47:31.542805', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(232, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 12:47:31.750986', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(233, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:47:32.396516', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(234, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 12:47:34.018509', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(235, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 12:51:51.646302', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(236, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 12:51:52.794517', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(237, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-08 13:26:21.144733', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(238, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:26:21.161139', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(239, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 13:26:25.039640', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(240, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:26:26.122622', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(241, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:26:43.763296', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(242, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:27:16.005020', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(243, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/findcustomer/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:27:16.867595', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(244, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-08 13:27:32.688826', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(245, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:27:32.707962', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(246, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 13:27:34.534376', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(247, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:27:35.820829', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(248, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:27:37.018884', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(249, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:27:41.138761', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(250, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:28:30.998533', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(251, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/findcustomer/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:28:31.897340', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(252, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:28:33.794222', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(253, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:28:34.049755', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(254, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:28:34.217012', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(255, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:28:34.430285', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(256, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:28:34.609765', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(257, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:28:34.818112', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(258, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:28:34.969832', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(259, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/findcustomer/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:28:35.682018', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(260, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:28:40.946853', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(261, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:28:41.733367', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(262, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:29:29.211549', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(263, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:29:30.270019', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(264, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:29:37.717860', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(265, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:29:38.435333', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(266, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:31:07.412938', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(267, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:31:08.199464', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(268, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:31:09.831164', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(269, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/updatecustomer/', 'Aziza Raage', 'Aziza Raage Waxa uu update greyay Mohamud Maxamed Xassen Afrax', 'Customer / Update', '2023-03-08 13:31:10.673314', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(270, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-08 13:31:12.814664', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(271, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:31:13.623816', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(272, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/updatecustomer/', 'Aziza Raage', 'Aziza Raage Waxa uu update greyay Mohamud Maxamed Xassen Cali', 'Customer / Update', '2023-03-08 13:31:18.019434', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(273, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:31:19.272172', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(274, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'change_customer removed from the group of State', 'Users-Permission Module', '2023-03-08 13:32:04.566568', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(275, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:32:12.584916', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(276, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:32:14.818152', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(277, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:32:17.572210', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(278, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:32:19.295601', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(279, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:32:19.805274', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(280, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:32:20.108360', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(281, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:32:20.358667', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(282, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:32:20.517647', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(283, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:32:20.649743', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(284, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:32:21.883928', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(285, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:32:27.891216', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(286, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:32:32.209492', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(287, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:32:53.350230', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(288, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:32:55.667841', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(289, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:33:01.544643', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(290, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:33:11.964725', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(291, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:34:30.209297', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(292, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:34:31.366939', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(293, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:34:31.610431', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(294, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:34:31.723221', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(295, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:34:33.408687', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(296, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:34:41.493649', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(297, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:34:48.449855', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(298, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/logout/', 'Aziza Raage', 'Aziza Raage Logged out the System', 'Users Module', '2023-03-08 13:34:51.175340', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(299, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-08 13:34:54.019720', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(300, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:34:54.039903', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(301, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 13:34:55.860411', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(302, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:34:57.810833', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(303, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:34:58.524885', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(304, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:35:34.031140', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(305, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:35:34.907402', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(306, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:35:35.168069', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(307, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:35:35.307187', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(308, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:35:36.552322', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(309, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:35:49.573533', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(310, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:35:50.702429', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(311, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:36:22.562840', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(312, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:39:48.751199', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(313, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:39:52.041225', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(314, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:41:44.899340', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(315, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:41:46.771983', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(316, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:42:12.099407', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(317, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:42:12.717519', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(318, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:42:13.003497', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(319, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:42:41.188842', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(320, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:42:41.897290', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(321, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:42:42.090009', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(322, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:42:42.249139', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(323, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:42:42.424271', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(324, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:42:42.570350', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(325, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:42:43.671491', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(326, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_customer removed from the group of State', 'Users-Permission Module', '2023-03-08 13:43:06.083847', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(327, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:43:12.573353', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(328, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:43:14.460244', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(329, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:43:14.729627', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(330, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:43:14.927612', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(331, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:43:15.181844', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(332, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/user_lists', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday User List Page', 'Users / Login', '2023-03-08 13:43:25.494234', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(333, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group_permission/0/0', 'Xassen Abshir', 'User with username of:_AD00003 removed group of State', 'Users-Permission Module', '2023-03-08 13:44:00.840999', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(334, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 13:44:11.143846', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(335, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 13:44:36.030669', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(336, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 13:44:36.391713', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(337, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 13:44:45.051588', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(338, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:44:46.296590', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(339, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:44:47.585676', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(340, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 13:44:51.735992', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(341, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 13:44:55.428128', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(342, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_permission/0', 'Xassen Abshir', 'Permission Denied to_view_customer With username of AD00003', 'Users-Permission Module', '2023-03-08 13:45:30.909867', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(343, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:46:04.895835', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(344, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:46:53.841143', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(345, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:46:53.994398', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(346, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:46:54.138085', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(347, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group_permission/0/0', 'Xassen Abshir', 'User with username of:_AD00003 added group of State', 'Users-Permission Module', '2023-03-08 13:48:40.755386', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(348, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_customer Added to the group of State', 'Users-Permission Module', '2023-03-08 13:49:52.356692', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(349, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'change_customer Added to the group of State', 'Users-Permission Module', '2023-03-08 13:49:57.041941', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(350, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:50:03.259246', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(351, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:50:03.994295', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(352, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:50:04.270446', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(353, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:50:04.751838', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(354, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:50:04.974820', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(355, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 13:50:08.420447', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(356, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:50:10.242557', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(357, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:50:19.250410', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(358, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 13:50:21.397185', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(359, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:50:22.657061', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(360, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:50:23.591878', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(361, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:53:47.851529', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(362, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:53:48.614027', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(363, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:54:03.695733', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(364, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:54:05.154268', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(365, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:54:05.313489', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(366, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/', 'Aziza Raage', 'Aziza Raage waxa uu boqday Customer Registration', 'Customer / Register', '2023-03-08 13:54:08.890074', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(367, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 13:54:09.734263', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(368, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:54:11.187123', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(369, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 13:56:14.124178', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(370, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:56:19.480867', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(371, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:57:04.760886', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(372, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:57:06.137982', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(373, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:57:06.300628', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(374, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:57:06.456685', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(375, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:57:06.594668', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(376, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:57:06.841703', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(377, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'change_customer removed from the group of State', 'Users-Permission Module', '2023-03-08 13:57:31.078485', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(378, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:57:34.491783', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(379, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'change_customer Added to the group of State', 'Users-Permission Module', '2023-03-08 13:57:39.308721', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(380, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-08 13:57:41.361503', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(381, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/findcustomer/3', 'Aziza Raage', 'Aziza Raage waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-08 13:57:43.441949', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(382, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 13:57:52.827990', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(383, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/', 'Aziza Raage', 'Aziza Raage waxa uu boqday Customer Registration', 'Customer / Register', '2023-03-08 13:57:53.543749', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(384, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 13:57:54.477759', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(385, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 13:57:55.394798', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(386, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:10:46.499596', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(387, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 14:11:03.967502', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(388, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:11:07.281336', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(389, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:12:35.465358', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(390, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:12:53.645429', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(391, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:13:35.851584', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(392, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:14:52.819507', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(393, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:15:35.942644', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(394, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:16:44.474677', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(395, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:16:57.490216', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(396, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:17:04.656940', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(397, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:18:44.245321', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(398, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:18:46.210802', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(399, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:18:46.454727', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge');
INSERT INTO `audittrials` (`id`, `Avatar`, `Username`, `path`, `Name`, `Actions`, `Module`, `date_of_action`, `operating_system`, `browser`, `ip_address`, `user_agent`) VALUES
(400, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:18:46.613039', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(401, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:18:46.802382', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(402, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:18:47.070965', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(403, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/', 'Aziza Raage', 'Aziza Raage waxa uu boqday Customer Registration', 'Customer / Register', '2023-03-08 14:19:05.825828', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(404, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 14:19:06.593680', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(405, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-08 14:22:03.612877', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(406, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:22:03.633500', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(407, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/user_lists', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday User List Page', 'Users / Login', '2023-03-08 14:22:06.887552', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(408, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/user_lists', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday User List Page', 'Users / Login', '2023-03-08 14:22:19.220189', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(409, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/user_lists', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday User List Page', 'Users / Login', '2023-03-08 14:22:30.230776', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(410, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/user_lists', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday User List Page', 'Users / Login', '2023-03-08 14:22:37.688991', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(411, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/user_lists', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday User List Page', 'Users / Login', '2023-03-08 14:22:47.314666', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(412, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/user_lists', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday User List Page', 'Users / Login', '2023-03-08 14:22:54.721346', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(413, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_vehicle removed from the group of State', 'Users-Permission Module', '2023-03-08 14:23:54.722278', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(414, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'view_vehicle Added to the group of State', 'Users-Permission Module', '2023-03-08 14:25:05.666144', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(415, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_vehicle removed from the group of State', 'Users-Permission Module', '2023-03-08 14:25:09.072947', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(416, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:25:14.362909', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(417, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:25:15.349426', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(418, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:25:15.724975', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(419, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:25:15.929204', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(420, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-08 14:25:16.137783', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(421, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'change_vehicle Added to the group of State', 'Users-Permission Module', '2023-03-08 14:26:00.423664', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(422, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_vehicle Added to the group of State', 'Users-Permission Module', '2023-03-08 14:26:02.146026', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(423, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'add_code_plate Added to the group of State', 'Users-Permission Module', '2023-03-08 14:26:25.500148', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(424, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/vehicles/codeplate/', 'Aziza Raage', 'Registered A New Code Plate AK at 2023-03-08 14:26:53.612558', 'Vehicle / Register', '2023-03-08 14:26:53.612963', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(425, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/', 'Aziza Raage', 'Aziza Raage waxa uu boqday Customer Registration', 'Customer / Register', '2023-03-08 14:27:18.796416', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(426, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-08 14:27:19.333598', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(427, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-09 09:11:31.144859', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(428, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-09 09:11:31.174636', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(429, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-09 09:11:53.907804', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(430, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-09 09:11:53.936529', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(431, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-09 09:12:12.463397', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(432, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-09 09:12:17.280964', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(433, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-09 09:12:28.431273', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(434, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/user_lists', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday User List Page', 'Users / Login', '2023-03-09 09:12:54.694846', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(435, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-09 09:13:11.896993', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(436, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-09 09:15:40.795138', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(437, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-09 09:16:25.835721', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(438, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-09 09:17:15.378598', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(439, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-11 09:33:02.818835', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(440, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 09:33:02.849177', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(441, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 09:34:05.373163', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(442, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 09:34:22.169949', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(443, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 09:34:23.059507', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(444, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 09:34:23.930819', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(445, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 09:34:24.492198', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(446, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 09:34:24.669878', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(447, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-11 09:52:07.408819', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(448, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 09:52:07.430722', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(449, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 09:52:28.919053', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(450, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 09:52:52.075814', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(451, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 09:53:42.934288', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(452, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 09:54:56.093113', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(453, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 09:55:19.617202', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(454, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 09:55:23.636806', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(455, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 09:55:24.650190', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(456, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 10:00:15.965255', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(457, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-11 10:22:41.591900', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(458, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 10:22:41.609294', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(459, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Customer Registration', 'Customer / Register', '2023-03-11 10:57:12.706403', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(460, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-11 10:57:15.370119', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(461, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 11:06:23.418432', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(462, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 11:07:10.071638', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(463, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-11 13:29:43.889650', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(464, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 13:29:43.916597', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(465, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 13:35:08.895382', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(466, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-11 16:28:06.947216', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(467, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-11 16:28:06.966904', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(468, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-12 09:18:37.504813', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(469, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-12 09:18:37.525861', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(470, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/company-views/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday company List', 'Company / List ', '2023-03-12 09:34:15.036858', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(471, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-12 09:40:11.938580', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(472, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-12 09:40:13.546284', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(473, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-12 09:40:18.481737', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(474, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-12 09:40:19.395469', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(475, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/findcustomer/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiyay customerka leh 1 gaan', 'Customer / Find', '2023-03-12 09:44:40.155739', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(476, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/updatecustomer/', 'Xassen Abshir', 'Xassen Abshir Waxa uu update greyay Axmed Jaamac Geedi Cilmi', 'Customer / Update', '2023-03-12 09:44:47.879135', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(477, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-12 09:44:50.572927', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(478, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/findcustomer/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiyay customerka leh 1 gaan', 'Customer / Find', '2023-03-12 09:44:59.496816', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(479, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/updatecustomer/', 'Xassen Abshir', 'Xassen Abshir Waxa uu update greyay Axmed Jaamac Geedi Cilmi', 'Customer / Update', '2023-03-12 09:45:09.287034', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(480, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-12 09:45:11.084310', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(481, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-12 09:45:22.420457', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(482, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-12 09:51:00.126288', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(483, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Customer Registration', 'Customer / Register', '2023-03-12 09:51:01.493068', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(484, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-12 09:51:16.929793', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(485, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-12 10:33:26.620686', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(486, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-12 10:33:29.305851', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(487, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/company-views/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday company List', 'Company / List ', '2023-03-12 10:47:41.500173', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(488, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-12 11:06:56.691983', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(489, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-12 11:06:56.711393', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(490, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay Cali  Maxamed Xassen Afrax', 'Report / Customer', '2023-03-12 11:07:38.478651', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(491, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay Cali  Maxamed Xassen Afrax', 'Report / Customer', '2023-03-12 11:08:11.865853', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(492, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay Mohamud Maxamed Xassen Cali', 'Report / Customer', '2023-03-12 11:09:07.360578', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(493, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay Cali  Maxamed Xassen Afrax', 'Report / Customer', '2023-03-12 11:09:31.819687', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(494, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay Cali  Maxamed Xassen Afrax', 'Report / Customer', '2023-03-12 11:11:49.945329', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(495, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay Cali  Maxamed Xassen Afrax', 'Report / Customer', '2023-03-12 11:12:08.774669', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(496, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay Cali  Maxamed Xassen Afrax', 'Report / Customer', '2023-03-12 11:12:47.247433', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(497, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay Cali  Maxamed Xassen Afrax', 'Report / Customer', '2023-03-12 11:13:09.650000', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(498, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay Cali  Maxamed Xassen Afrax', 'Report / Customer', '2023-03-12 11:14:00.470673', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(499, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay Cali  Maxamed Xassen Afrax', 'Report / Customer', '2023-03-12 11:14:24.312024', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(500, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:17:07.954018', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(501, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:20:49.093271', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(502, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:22:23.854791', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(503, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:22:56.660992', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(504, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:23:14.517563', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(505, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:23:52.130283', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(506, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:28:49.273993', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(507, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 11:29:22.096836', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(508, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:30:50.247486', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(509, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:34:09.745274', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(510, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:34:43.938148', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(511, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:35:15.170376', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(512, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:35:42.017378', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(513, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:36:21.532436', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(514, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:37:02.675840', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(515, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:37:22.765881', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(516, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:41:54.548192', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(517, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:42:11.110380', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(518, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:42:46.375951', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(519, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:43:16.130452', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(520, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:44:21.067262', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(521, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:44:54.330110', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(522, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:45:13.342431', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(523, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:46:58.019037', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(524, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:48:32.963693', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(525, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:48:57.677147', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(526, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:50:24.194546', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(527, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:56:39.333825', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(528, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:57:13.744045', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(529, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 11:58:39.321749', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(530, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:00:19.373693', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(531, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:01:06.144006', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(532, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:01:31.979281', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(533, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:03:42.183767', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(534, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:04:16.356895', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(535, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:04:40.363103', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(536, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:05:14.489691', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(537, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:05:52.061754', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(538, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:06:12.229729', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(539, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:07:53.853831', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(540, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:08:18.137156', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(541, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 12:13:20.172753', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(542, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 12:13:50.590229', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(543, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 12:14:29.911856', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(544, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 12:14:51.677402', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(545, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:15:49.858499', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(546, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:16:11.587674', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(547, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 12:16:35.109730', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(548, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-12 12:31:20.203519', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(549, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-12 12:31:20.221014', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(550, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:31:27.673772', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(551, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-12 12:31:44.004448', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(552, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-12 12:31:45.877932', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(553, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-12 12:31:48.601482', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(554, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/2', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Cali  Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-12 12:31:49.426037', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(555, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-12 12:31:51.781133', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(556, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-12 12:31:53.065694', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(557, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-12 12:32:12.103389', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(558, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-12 12:32:13.801249', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(559, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-12 12:32:32.069778', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(560, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-12 12:32:34.885679', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(561, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/2', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Cali  Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-12 12:32:36.252195', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(562, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:32:51.124457', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(563, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:33:25.742548', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(564, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-12 12:33:41.157281', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(565, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/2', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Cali  Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-12 12:33:43.232159', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(566, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:33:52.956773', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(567, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:34:29.499029', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(568, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:35:50.306665', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(569, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:36:03.662447', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(570, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:36:35.860477', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(571, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:39:20.165662', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(572, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:39:40.875464', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(573, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:40:13.973485', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(574, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 12:41:29.059497', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(575, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 12:45:12.009815', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(576, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:45:25.230574', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(577, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:45:44.988334', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(578, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 12:45:49.844294', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(579, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:46:07.150558', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(580, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 12:46:16.786659', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(581, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:46:39.649865', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(582, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 12:46:45.165403', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(583, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 12:46:58.682239', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(584, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 12:47:08.362529', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(585, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:47:39.336386', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(586, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 12:47:43.982055', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(587, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/logout/', 'Xassen Abshir', 'Xassen Abshir Logged out the System', 'Users Module', '2023-03-12 12:48:02.977598', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(588, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-12 12:48:04.797765', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(589, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-12 12:48:04.813476', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(590, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 12:48:10.350975', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(591, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:48:17.123082', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(592, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 12:48:21.352801', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge');
INSERT INTO `audittrials` (`id`, `Avatar`, `Username`, `path`, `Name`, `Actions`, `Module`, `date_of_action`, `operating_system`, `browser`, `ip_address`, `user_agent`) VALUES
(593, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:49:10.198624', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(594, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-12 12:49:14.731947', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(595, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-12 12:51:09.723114', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(596, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/2', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Cali  Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-12 12:51:11.819852', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(597, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-12 12:51:23.638077', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(598, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-12 12:51:25.653609', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(599, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 12:51:42.447617', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(600, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-12 12:51:45.162408', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(601, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/2', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Cali  Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-12 12:51:46.804865', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(602, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-12 13:33:53.856101', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(603, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-12 13:33:53.873262', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(604, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 13:34:15.410514', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(605, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 13:42:58.916424', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(606, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 13:43:50.696022', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(607, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 13:44:25.034686', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(608, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 13:44:54.718873', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(609, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 13:46:07.774534', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(610, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 13:48:07.421881', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(611, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 13:48:48.231024', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(612, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 13:52:37.871437', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(613, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 13:57:27.479021', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(614, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 13:59:46.358822', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(615, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:00:24.366370', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(616, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:00:41.901280', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(617, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:00:56.910708', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(618, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:01:33.859827', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(619, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:01:48.933816', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(620, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 1 gaan', 'Report / Customer', '2023-03-12 14:08:04.075790', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(621, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:08:25.250560', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(622, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:09:18.874566', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(623, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:11:24.566322', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(624, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:11:45.236822', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(625, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:12:32.948576', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(626, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:13:08.094709', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(627, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:13:22.461281', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(628, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:13:49.852054', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(629, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:14:21.080150', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(630, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:15:55.755288', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(631, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:16:14.087476', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(632, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:16:46.818999', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(633, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:17:37.445910', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(634, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:18:01.026975', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(635, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:19:04.777707', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(636, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:19:30.914701', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(637, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-12 14:36:10.573647', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(638, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-12 14:36:10.592970', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(639, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:36:16.540642', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(640, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:37:21.655038', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(641, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:38:34.150109', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(642, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:39:36.250372', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(643, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:40:11.484866', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(644, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:40:34.269693', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(645, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:40:57.133849', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(646, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:41:18.173152', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(647, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:41:36.379677', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(648, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:42:08.198137', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(649, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:42:59.312777', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(650, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:43:17.491399', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(651, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:44:40.337952', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(652, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:44:54.191002', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(653, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:45:58.558251', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(654, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:46:21.059120', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(655, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:47:25.613136', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(656, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:47:40.588154', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(657, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 14:48:24.091844', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(658, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-12 15:06:27.313330', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(659, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-12 15:06:27.335386', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(660, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 15:06:32.873128', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(661, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 15:07:25.502341', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(662, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 15:08:57.779107', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(663, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 15:09:21.313694', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(664, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 15:09:59.504933', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(665, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 15:11:17.305699', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(666, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 15:11:32.273427', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(667, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 15:11:56.232430', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(668, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 15:13:25.789318', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(669, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-12 15:35:29.214782', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(670, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-12 15:35:29.234693', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(671, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 15:35:40.257508', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(672, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 15:36:08.714017', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(673, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 15:38:37.447027', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(674, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 15:40:11.356990', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(675, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 15:40:54.782561', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(676, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 15:41:38.396647', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(677, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 15:42:27.985768', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(678, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-12 16:37:17.386545', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(679, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-12 16:37:17.405660', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(680, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 16:41:52.549122', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(681, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 16:43:53.378538', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(682, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 16:44:46.973433', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(683, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-12 16:47:40.254101', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(684, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-12 16:47:44.924026', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(685, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-13 10:00:56.470168', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(686, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-13 10:00:56.503703', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(687, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-13 10:01:02.033800', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(688, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:02:32.722975', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(689, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-13 10:02:38.472414', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(690, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 1 gaan', 'Report / Customer', '2023-03-13 10:02:50.102567', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(691, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 1 gaan', 'Report / Customer', '2023-03-13 10:09:11.421250', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(692, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Vehicle Registration', 'Vehicle / Register', '2023-03-13 10:09:24.399702', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(693, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-13 10:10:16.577351', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(694, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:10:18.680240', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(695, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Vehicle Registration', 'Vehicle / Register', '2023-03-13 10:10:23.987885', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(696, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:10:35.858324', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(697, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-13 10:10:37.568565', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(698, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:10:59.426437', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(699, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:12:45.281646', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(700, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:14:30.441131', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(701, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:15:11.836181', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(702, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:15:16.830599', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(703, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-13 10:15:59.289874', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(704, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:19:40.537828', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(705, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:21:12.080702', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(706, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:21:12.800350', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(707, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:21:13.120913', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(708, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:21:13.341605', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(709, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:21:13.472101', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(710, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:21:13.627159', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(711, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:21:13.824018', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(712, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:21:14.034160', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(713, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:23:23.995173', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(714, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/activate', 'Xassen Abshir', 'Xassen Abshir waxa uu active greyay Axmed Jaamac Geedi Cilmi', 'Cusomer / Active ', '2023-03-13 10:23:29.931052', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(715, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:23:32.051251', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(716, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:24:28.083223', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(717, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-13 10:24:32.579090', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(718, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:25:00.294416', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(719, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/activate', 'Xassen Abshir', 'Xassen Abshir waxa uu active greyay Axmed Jaamac Geedi Cilmi', 'Cusomer / Active ', '2023-03-13 10:25:07.829616', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(720, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:25:08.821444', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(721, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:27:22.380267', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(722, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:35:57.916126', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(723, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:35:59.433775', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(724, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:36:20.954069', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(725, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:38:38.516904', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(726, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:40:32.050043', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(727, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:41:11.360541', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(728, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/activate', 'Xassen Abshir', 'Xassen Abshir waxa uu active greyay Axmed Jaamac Geedi Cilmi', 'Cusomer / Active ', '2023-03-13 10:43:42.870279', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(729, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:43:44.018114', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(730, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:44:00.271404', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(731, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/activate', 'Xassen Abshir', 'Xassen Abshir waxa uu active greyay Axmed Jaamac Geedi Cilmi', 'Cusomer / Active ', '2023-03-13 10:44:12.879090', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(732, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:44:13.832911', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(733, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Vehicle Registration', 'Vehicle / Register', '2023-03-13 10:48:32.983466', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(734, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Vehicle Registration', 'Vehicle / Register', '2023-03-13 10:52:17.815622', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(735, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-13 10:54:39.141424', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(736, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:54:40.945908', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(737, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:54:42.046477', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(738, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/activate', 'Xassen Abshir', 'Xassen Abshir waxa uu active greyay Cali  Maxamed Xassen Afrax', 'Cusomer / Active ', '2023-03-13 10:54:48.885220', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(739, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:54:51.141848', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(740, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:54:52.616583', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(741, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:54:53.538747', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(742, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:55:05.948239', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(743, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/activate', 'Xassen Abshir', 'Xassen Abshir waxa uu active greyay Axmed Jaamac Geedi Cilmi', 'Cusomer / Active ', '2023-03-13 10:55:12.658827', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(744, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:55:13.606753', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(745, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 10:57:21.623379', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(746, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Vehicle Registration', 'Vehicle / Register', '2023-03-13 11:00:54.407160', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(747, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-13 11:01:50.237282', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(748, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 1 gaan', 'Report / Customer', '2023-03-13 11:02:22.634886', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(749, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Vehicle Registration', 'Vehicle / Register', '2023-03-13 11:02:58.258244', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(750, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 1 gaan', 'Report / Customer', '2023-03-13 11:03:42.131977', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(751, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Vehicle Registration', 'Vehicle / Register', '2023-03-13 11:07:14.543309', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(752, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 11:07:37.748941', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(753, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/finance/update_account/', 'Xassen Abshir', 'updated a accontRenew License', 'Finance / update', '2023-03-13 11:20:58.743517', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(754, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/finance/update_account/', 'Xassen Abshir', 'updated a accontRenew License', 'Finance / update', '2023-03-13 11:21:03.632192', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(755, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/finance/update_account/', 'Xassen Abshir', 'updated a accontRenew License', 'Finance / update', '2023-03-13 11:21:10.479947', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(756, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 11:29:27.927115', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(757, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 11:31:36.180847', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(758, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/activate', 'Xassen Abshir', 'Xassen Abshir waxa uu active greyay Cali  Maxamed Xassen Afrax', 'Cusomer / Active ', '2023-03-13 11:31:48.397155', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(759, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-13 11:31:53.897128', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(760, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-13 11:32:59.354971', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(761, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/user_lists', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday User List Page', 'Users / Login', '2023-03-13 11:50:31.307071', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(762, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/add_users', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Add User Page', 'Users / Login', '2023-03-13 11:50:32.468663', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(763, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/finance/update_account/', 'Xassen Abshir', 'updated a accontNew Vehicle', 'Finance / update', '2023-03-13 11:53:08.072570', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(764, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-13 11:53:28.434500', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(765, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/add_users', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Add User Page', 'Users / Login', '2023-03-13 11:57:24.240005', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(766, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/user_lists', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday User List Page', 'Users / Login', '2023-03-13 12:16:05.549379', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(767, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/logout/', 'Xassen Abshir', 'Xassen Abshir Logged out the System', 'Users Module', '2023-03-13 12:16:11.404638', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(768, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-13 12:16:14.192863', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(769, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-13 12:16:14.226124', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(770, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-13 12:28:34.949819', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(771, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/logout/', 'Xassen Abshir', 'Xassen Abshir Logged out the System', 'Users Module', '2023-03-13 12:34:57.924688', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(772, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-13 12:35:06.855641', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(773, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-13 12:35:06.875437', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(774, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-13 13:35:35.333273', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(775, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-13 13:35:35.349300', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(776, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-13 13:38:38.972532', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(777, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/company-views/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday company List', 'Company / List ', '2023-03-13 13:38:45.292932', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(778, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/company-views/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday company List', 'Company / List ', '2023-03-13 13:38:49.328770', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(779, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 1 gaan', 'Report / Customer', '2023-03-13 13:39:36.050096', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(780, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-14 08:36:29.260262', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(781, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 08:36:29.306998', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(782, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/company-views/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday company List', 'Company / List ', '2023-03-14 08:36:34.636805', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(783, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/comreport/company_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay company leh 1 gaan', 'Report / Company', '2023-03-14 08:36:43.512036', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(784, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 1 gaan', 'Report / Customer', '2023-03-14 08:37:25.485072', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge');
INSERT INTO `audittrials` (`id`, `Avatar`, `Username`, `path`, `Name`, `Actions`, `Module`, `date_of_action`, `operating_system`, `browser`, `ip_address`, `user_agent`) VALUES
(785, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/reports/vehicle-report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay vehicleka leh 2 gaan', 'Report / Vehicle', '2023-03-14 08:37:54.478003', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(786, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 1 gaan', 'Report / Customer', '2023-03-14 08:39:21.770463', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(787, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/comreport/company_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay company leh 1 gaan', 'Report / Company', '2023-03-14 08:40:13.107303', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(788, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 1 gaan', 'Report / Customer', '2023-03-14 08:40:21.633512', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(789, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 1 gaan', 'Report / Customer', '2023-03-14 08:45:13.793388', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(790, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 1 gaan', 'Report / Customer', '2023-03-14 08:50:04.593160', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(791, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/reports/vehicle-report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay vehicleka leh 2 gaan', 'Report / Vehicle', '2023-03-14 08:51:05.833247', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(792, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/comreport/company_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay company leh 1 gaan', 'Report / Company', '2023-03-14 08:51:13.831631', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(793, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Vehicle Registration', 'Vehicle / Register', '2023-03-14 08:52:02.276343', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(794, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 08:52:18.001478', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(795, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-14 08:52:22.300170', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(796, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 08:53:10.667212', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(797, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/2', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Cali  Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-14 08:53:13.751253', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(798, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-14 09:20:24.141255', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(799, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 09:20:24.159183', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(800, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 09:20:53.823479', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(801, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-14 09:20:56.031646', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(802, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-14 09:24:51.865753', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(803, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-14 09:25:23.491883', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(804, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-14 09:25:37.972600', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(805, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 09:26:32.278272', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(806, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-14 09:26:34.241212', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(807, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 1 gaan', 'Report / Customer', '2023-03-14 09:26:51.443491', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(808, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Vehicle Registration', 'Vehicle / Register', '2023-03-14 09:28:03.125002', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(809, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 09:28:15.545014', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(810, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-14 09:28:18.099709', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(811, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 09:29:14.190968', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(812, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 09:29:14.591932', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(813, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/register-tranfer/', 'Xassen Abshir', 'Xassen Abshir Waxa uu gaari kawarejiyay Axmed Jaamac Geedi Cilmi kuna wareejiyay Cali  Maxamed Xassen Afrax', 'Vehicles / Register', '2023-03-14 09:48:25.052560', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(814, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 09:48:54.997520', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(815, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-14 09:48:56.742868', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(816, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 09:48:59.839713', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(817, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/2', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Cali  Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-14 09:49:01.538549', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(818, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/reports/vehicle-report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay vehicleka leh 2 gaan', 'Report / Vehicle', '2023-03-14 09:49:16.987238', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(819, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 09:56:10.191679', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(820, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Vehicle Registration', 'Vehicle / Register', '2023-03-14 10:05:28.146221', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(821, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 10:05:40.725368', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(822, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/finance/updatereciept/5', 'Xassen Abshir', 'updated a reciept 5', 'finance / update', '2023-03-14 10:07:44.023293', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(823, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/finance/updatereciept/5', 'Xassen Abshir', 'updated a reciept 5', 'finance / update', '2023-03-14 10:08:02.218110', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(824, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/finance/updatereciept/5', 'Xassen Abshir', 'updated a reciept 5', 'finance / update', '2023-03-14 10:08:19.275516', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(825, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Vehicle Registration', 'Vehicle / Register', '2023-03-14 10:09:26.769296', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(826, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Xassen Abshir Waxa uu gaari udiiwangaliyay Cali  Maxamed Xassen Afrax', 'Vehicles / Register', '2023-03-14 10:10:17.266205', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(827, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-14 10:19:23.185046', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(828, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-14 10:19:29.788100', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(829, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 10:19:36.617887', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(830, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-14 10:19:39.319483', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(831, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 1 gaan', 'Report / Customer', '2023-03-14 10:19:53.420431', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(832, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-14 10:20:16.971831', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(833, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 10:20:47.285266', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(834, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-14 10:20:49.031800', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(835, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/company-views/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday company List', 'Company / List ', '2023-03-14 10:21:12.322927', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(836, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 10:21:21.280695', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(837, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-14 10:21:22.726211', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(838, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 10:22:03.488150', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(839, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/company-views/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday company List', 'Company / List ', '2023-03-14 10:28:47.428893', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(840, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Vehicle Registration', 'Vehicle / Register', '2023-03-14 10:28:50.370901', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(841, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Vehicle Registration', 'Vehicle / Register', '2023-03-14 10:28:52.721311', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(842, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/finance/update_account/', 'Xassen Abshir', 'updated a accontTransfer Vehicle', 'Finance / update', '2023-03-14 10:29:02.845387', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(843, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-14 11:02:59.852835', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(844, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 11:02:59.875090', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(845, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/assignplate/', 'Xassen Abshir', 'Registered A plate 2 at 2023-03-14 11:22:08.300018', 'Vehicle / View Vehicle', '2023-03-14 11:22:08.300343', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(846, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 11:29:07.671334', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(847, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 11:29:10.235672', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(848, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Vehicle Registration', 'Vehicle / Register', '2023-03-14 11:29:24.502657', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(849, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/assignplate/', 'Xassen Abshir', 'Registered A plate 41 at 2023-03-14 11:30:32.375320', 'Vehicle / View Vehicle', '2023-03-14 11:30:32.375831', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(850, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/assignplate/', 'Xassen Abshir', 'Registered A plate 41 at 2023-03-14 11:34:10.393083', 'Vehicle / View Vehicle', '2023-03-14 11:34:10.393643', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(851, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/assignplate/', 'Xassen Abshir', 'Registered A plate 41 at 2023-03-14 11:45:33.485494', 'Vehicle / View Vehicle', '2023-03-14 11:45:33.488702', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(852, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/finance/updatereciept/5', 'Xassen Abshir', 'updated a reciept 5', 'finance / update', '2023-03-14 11:46:53.470921', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(853, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/finance/updatereciept/5', 'Xassen Abshir', 'updated a reciept 5', 'finance / update', '2023-03-14 11:47:05.086528', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(854, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/finance/updatereciept/5', 'Xassen Abshir', 'updated a reciept 5', 'finance / update', '2023-03-14 11:47:20.796468', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(855, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 11:58:18.253511', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(856, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 11:58:23.776742', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(857, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/finance/updatereciept/5', 'Xassen Abshir', 'updated a reciept 5', 'finance / update', '2023-03-14 12:04:11.569233', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(858, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/finance/updatereciept/5', 'Xassen Abshir', 'updated a reciept 5', 'finance / update', '2023-03-14 12:07:46.259054', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(859, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/finance/updatereciept/5', 'Xassen Abshir', 'updated a reciept 5', 'finance / update', '2023-03-14 12:17:10.333754', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(860, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/finance/updatereciept/5', 'Xassen Abshir', 'updated a reciept 5', 'finance / update', '2023-03-14 12:17:17.766100', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(861, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/logout/', 'Xassen Abshir', 'Xassen Abshir Logged out the System', 'Users Module', '2023-03-14 12:19:10.687028', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(862, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-14 12:19:13.597901', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(863, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 12:19:13.626431', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(864, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/logout/', 'Aziza Raage', 'Aziza Raage Logged out the System', 'Users Module', '2023-03-14 12:19:22.365654', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(865, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-14 12:19:26.180810', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(866, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 12:19:26.202466', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(867, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/2', 'Xassen Abshir', 'change_license Added to the group of State', 'Users-Permission Module', '2023-03-14 12:20:47.237725', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(868, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/manage_group/1', 'Xassen Abshir', 'change_status Added to the group of Admin', 'Users-Permission Module', '2023-03-14 12:23:31.340335', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(869, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/logout/', 'Xassen Abshir', 'Xassen Abshir Logged out the System', 'Users Module', '2023-03-14 12:27:27.329491', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(870, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-14 12:27:29.587695', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(871, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 12:27:29.610782', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(872, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/logout/', 'Aziza Raage', 'Aziza Raage Logged out the System', 'Users Module', '2023-03-14 12:27:43.878709', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(873, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-14 12:27:46.623780', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(874, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 12:27:46.638734', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(875, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/logout/', 'Xassen Abshir', 'Xassen Abshir Logged out the System', 'Users Module', '2023-03-14 12:27:57.307985', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(876, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-14 12:27:59.659782', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(877, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 12:27:59.680313', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(878, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/logout/', 'Aziza Raage', 'Aziza Raage Logged out the System', 'Users Module', '2023-03-14 12:37:36.708158', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(879, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-14 12:37:39.012004', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(880, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 12:37:39.028836', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(881, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/logout/', 'Xassen Abshir', 'Xassen Abshir Logged out the System', 'Users Module', '2023-03-14 12:37:54.142741', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(882, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-14 12:37:56.007530', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(883, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 12:37:56.023243', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(884, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/logout/', 'Xassen Abshir', 'Xassen Abshir Logged out the System', 'Users Module', '2023-03-14 12:38:13.450679', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(885, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-14 12:38:15.909956', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(886, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 12:38:15.932788', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(887, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 12:44:02.202644', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(888, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-14 12:44:03.849207', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(889, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 12:44:10.613324', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(890, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/logout/', 'Aziza Raage', 'Aziza Raage Logged out the System', 'Users Module', '2023-03-14 12:44:26.655198', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(891, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-14 12:44:28.887495', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(892, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 12:44:28.903533', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(893, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 12:44:34.157744', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(894, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-14 12:44:36.752228', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(895, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/findcustomer/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiyay customerka leh 1 gaan', 'Customer / Find', '2023-03-14 12:44:37.556555', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(896, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/updatecustomer/', 'Xassen Abshir', 'Xassen Abshir Waxa uu update greyay Axmed Jaamac Geedi Cilmi', 'Customer / Update', '2023-03-14 12:44:41.730859', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(897, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-14 12:44:42.740388', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(898, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/logout/', 'Xassen Abshir', 'Xassen Abshir Logged out the System', 'Users Module', '2023-03-14 12:44:47.657463', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(899, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/login', 'Aziza Raage', 'Aziza Raage logged into the System', 'Users Module', '2023-03-14 12:44:50.533185', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(900, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/', 'Aziza Raage', 'Aziza Raage waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 12:44:50.551222', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(901, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 12:44:52.722517', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(902, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/3', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-14 12:44:54.009698', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(903, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 12:44:56.846043', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(904, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/profile/1', 'Aziza Raage', 'Aziza Raage Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-14 12:44:58.965222', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(905, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/list', 'Aziza Raage', 'Aziza Raage waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-14 12:45:34.238643', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(906, 'Avatars/th_W2mnufr.jpeg', 'AD00003', '/customer/company-views/', 'Aziza Raage', 'Aziza Raage waxa uu booqday company List', 'Company / List ', '2023-03-14 12:45:36.932381', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(907, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-14 13:39:28.086228', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(908, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 13:39:28.103824', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(909, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 13:48:32.453497', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(910, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-14 13:49:36.558025', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(911, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-14 13:50:02.818064', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(912, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-14 13:51:03.780414', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(913, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-14 13:51:45.356053', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(914, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-14 13:51:54.820349', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(915, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-14 13:53:52.121577', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(916, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-15 08:23:48.682528', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(917, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:23:48.708951', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(918, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:24:27.408618', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(919, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:24:28.991885', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(920, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:24:29.167905', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(921, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:25:20.677931', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(922, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:31:28.811358', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(923, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:32:43.175429', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(924, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:32:45.051682', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(925, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:32:45.275309', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(926, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:32:45.520117', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(927, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:32:45.709102', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(928, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:32:45.894270', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(929, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:32:46.059117', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(930, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:41:42.044445', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(931, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:41:43.625206', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(932, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:42:28.170234', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(933, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:44:09.996708', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(934, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:47:06.397729', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(935, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 08:47:47.688696', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(936, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-15 09:21:52.192861', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(937, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 09:21:52.211242', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(938, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-15 09:52:02.665403', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(939, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 09:52:02.690737', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(940, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:02:04.823249', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(941, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:05:04.830020', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(942, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:05:35.059016', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(943, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:05:36.176754', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(944, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:07:32.274568', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(945, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:07:32.542193', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(946, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:07:32.677278', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(947, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:16:04.300874', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(948, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:25:21.090440', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(949, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:25:38.408599', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(950, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:25:40.142698', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(951, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:25:49.736032', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(952, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:25:50.167359', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(953, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:25:50.405106', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(954, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:25:50.590625', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(955, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:25:50.772772', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(956, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:25:56.038826', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(957, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:26:29.891955', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(958, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:26:35.350117', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(959, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:26:37.135558', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(960, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:30:35.485726', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(961, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-15 10:31:45.316858', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(962, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:31:45.337725', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(963, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:32:33.820194', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(964, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/company-views/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday company List', 'Company / List ', '2023-03-15 10:32:36.232353', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(965, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-15 10:32:49.567393', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(966, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/reports/vehicle-report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay vehicleka leh 2 gaan', 'Report / Vehicle', '2023-03-15 10:34:10.813265', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(967, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/company-views/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday company List', 'Company / List ', '2023-03-15 10:34:22.987903', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(968, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/comreport/company_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay company leh 1 gaan', 'Report / Company', '2023-03-15 10:34:33.957802', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(969, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/reports/vehicle-report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay vehicleka leh 2 gaan', 'Report / Vehicle', '2023-03-15 10:35:05.521403', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(970, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/reports/vehicle-report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay vehicleka leh 2 gaan', 'Report / Vehicle', '2023-03-15 10:35:46.717044', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(971, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/reports/vehicle-report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay vehicleka leh 2 gaan', 'Report / Vehicle', '2023-03-15 10:35:56.850929', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(972, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/comreport/company_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay company leh 1 gaan', 'Report / Company', '2023-03-15 10:36:40.991888', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(973, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:37:45.921036', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(974, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 10:39:23.444533', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(975, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/comreport/company_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay company leh 1 gaan', 'Report / Company', '2023-03-15 10:39:29.962477', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(976, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/comreport/company_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay company leh 1 gaan', 'Report / Company', '2023-03-15 10:40:06.116440', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(977, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/comreport/company_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay company leh 1 gaan', 'Report / Company', '2023-03-15 10:41:07.451277', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(978, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-15 11:40:42.790257', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(979, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 11:40:42.812710', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(980, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/2', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 2 gaan', 'Report / Customer', '2023-03-15 11:41:18.537465', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(981, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/company-views/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday company List', 'Company / List ', '2023-03-15 11:41:29.395879', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(982, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 11:41:33.413610', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(983, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-15 11:41:34.637091', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(984, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 11:41:38.224652', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(985, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-15 11:41:39.297511', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge');
INSERT INTO `audittrials` (`id`, `Avatar`, `Username`, `path`, `Name`, `Actions`, `Module`, `date_of_action`, `operating_system`, `browser`, `ip_address`, `user_agent`) VALUES
(986, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 11:41:45.762516', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(987, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-15 11:41:46.765453', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(988, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 11:54:10.593055', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(989, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 11:56:00.946889', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(990, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-15 13:36:02.298271', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(991, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 13:36:02.362124', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(992, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Customer Registration', 'Customer / Register', '2023-03-15 13:36:04.851483', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(993, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:49:12.930919', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(994, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/activate', 'Xassen Abshir', 'Xassen Abshir waxa uu active greyay Cali  Maxamed Xassen Afrax', 'Cusomer / Active ', '2023-03-15 13:50:20.487714', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(995, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:50:29.908842', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(996, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:50:36.225143', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(997, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/activate', 'Xassen Abshir', 'Xassen Abshir waxa uu active greyay Cali  Maxamed Xassen Afrax', 'Cusomer / Active ', '2023-03-15 13:50:47.274500', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(998, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:50:48.358557', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(999, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/2', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Cali  Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-15 13:50:49.620500', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1000, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:50:57.624541', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1001, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-15 13:51:01.515474', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1002, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:51:23.374183', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1003, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-15 13:51:33.933261', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1004, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:51:58.431724', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1005, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/1', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Axmed Jaamac Geedi Cilmi', 'Customer / Profile', '2023-03-15 13:51:59.349313', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1006, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:52:35.921608', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1007, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/activate', 'Xassen Abshir', 'Xassen Abshir waxa uu active greyay Cali  Maxamed Xassen Afrax', 'Cusomer / Active ', '2023-03-15 13:52:48.423382', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1008, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:52:55.534932', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1009, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:52:57.423857', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1010, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-15 13:53:44.007553', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1011, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:53:46.180780', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1012, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/activate', 'Xassen Abshir', 'Xassen Abshir waxa uu active greyay Cali  Maxamed Xassen Afrax', 'Cusomer / Active ', '2023-03-15 13:53:53.814089', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1013, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:53:58.086849', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1014, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:54:15.140069', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1015, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/activate', 'Xassen Abshir', 'Xassen Abshir waxa uu active greyay Cali  Maxamed Xassen Afrax', 'Cusomer / Active ', '2023-03-15 13:54:20.485296', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1016, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:55:01.169309', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1017, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/activate', 'Xassen Abshir', 'Xassen Abshir waxa uu active greyay Cali  Maxamed Xassen Afrax', 'Cusomer / Active ', '2023-03-15 13:55:05.905793', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1018, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:55:25.940925', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1019, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/activate', 'Xassen Abshir', 'Xassen Abshir waxa uu active greyay Cali  Maxamed Xassen Afrax', 'Cusomer / Active ', '2023-03-15 13:55:33.702631', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1020, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:56:37.132682', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1021, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/activate', 'Xassen Abshir', 'Xassen Abshir waxa uu active greyay Cali  Maxamed Xassen Afrax', 'Cusomer / Active ', '2023-03-15 13:56:49.686991', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1022, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:57:02.402303', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1023, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-15 13:57:05.164188', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1024, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:57:07.989285', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1025, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/2', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Cali  Maxamed Xassen Afrax', 'Customer / Profile', '2023-03-15 13:57:09.299549', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1026, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:57:13.273923', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1027, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-15 13:57:17.127151', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1028, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/findcustomer/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-15 13:57:18.155731', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1029, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/updatecustomer/', 'Xassen Abshir', 'Xassen Abshir Waxa uu update greyay Mohamud Maxamed Xassen Cali', 'Customer / Update', '2023-03-15 13:57:26.317321', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1030, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-15 13:57:27.214892', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1031, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:57:30.323337', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1032, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/activate', 'Xassen Abshir', 'Xassen Abshir waxa uu active greyay Mohamud Maxamed Xassen Cali', 'Cusomer / Active ', '2023-03-15 13:57:37.245398', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1033, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:57:38.661124', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1034, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-15 13:57:51.232554', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1035, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/findcustomer/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiyay customerka leh 3 gaan', 'Customer / Find', '2023-03-15 13:57:55.882241', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1036, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/updatecustomer/', 'Xassen Abshir', 'Xassen Abshir Waxa uu update greyay Mohamud Maxamed Xassen Cali', 'Customer / Update', '2023-03-15 13:58:03.199891', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1037, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/updatecustomer/', 'Xassen Abshir', 'Xassen Abshir Waxa uu update greyay Mohamud Maxamed Xassen Cali', 'Customer / Update', '2023-03-15 13:58:09.194879', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1038, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/profile/3', 'Xassen Abshir', 'Xassen Abshir Waxa ubooqday profileka Mohamud Maxamed Xassen Cali', 'Customer / Profile', '2023-03-15 13:58:10.181014', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1039, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-15 13:58:11.702562', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1040, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-16 10:21:24.879526', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1041, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-16 10:21:24.902233', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1042, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-16 10:22:02.187343', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1043, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-16 11:12:46.228202', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1044, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-16 11:12:46.248272', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1045, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/company-views/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday company List', 'Company / List ', '2023-03-16 11:18:01.513892', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1046, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/comreport/company_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay company leh 1 gaan', 'Report / Company', '2023-03-16 12:08:13.570210', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1047, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/comreport/company_report/1', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay company leh 1 gaan', 'Report / Company', '2023-03-16 12:08:48.903134', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1048, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-16 13:10:14.381108', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1049, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-16 13:10:14.399574', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1050, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-16 13:14:54.288495', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1051, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-16 13:56:28.169173', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1052, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Customer Registration', 'Customer / Register', '2023-03-16 13:56:29.965694', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1053, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/registervehicle', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday Vehicle Registration', 'Vehicle / Register', '2023-03-16 14:00:08.107280', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1054, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/list', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Customer List', 'Cusomer / List ', '2023-03-16 14:00:55.640849', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1055, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/customer/reports/customer_report/3', 'Xassen Abshir', 'Xassen Abshir waxa uu raadiayay customerka leh 3 gaan', 'Report / Customer', '2023-03-16 14:01:08.615268', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1056, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-16 14:54:58.927207', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1057, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-16 15:04:21.783014', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1058, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-16 15:04:37.324270', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1059, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/vehicles/viewvehicle/', 'Xassen Abshir', 'Xassen Abshir waxa uu boqday View Vehicle', 'Vehicle / Register', '2023-03-16 15:37:40.529474', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1060, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/login', 'Xassen Abshir', 'Xassen Abshir logged into the System', 'Users Module', '2023-03-18 08:31:05.427967', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge'),
(1061, 'Avatars/th_NEt2d7u.jpeg', 'AD00001', '/', 'Xassen Abshir', 'Xassen Abshir waxa uu booqday Dashboardka', 'Customer / Dashboard', '2023-03-18 08:31:05.449724', 'Linux', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'State');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 4),
(5, 1, 5),
(4, 1, 8),
(3, 1, 12),
(8, 1, 13),
(7, 1, 14),
(6, 1, 16),
(13, 1, 24),
(12, 1, 28),
(9, 1, 29),
(10, 1, 30),
(11, 1, 32),
(14, 1, 33),
(20, 1, 34),
(17, 1, 36),
(15, 1, 37),
(21, 1, 38),
(18, 1, 40),
(16, 1, 41),
(22, 1, 42),
(19, 1, 44),
(24, 1, 46),
(23, 1, 48),
(25, 1, 49),
(26, 1, 50),
(27, 1, 52),
(30, 1, 53),
(29, 1, 54),
(28, 1, 56),
(31, 1, 57),
(32, 1, 58),
(33, 1, 60),
(34, 1, 61),
(35, 1, 62),
(36, 1, 64),
(37, 1, 65),
(39, 1, 66),
(38, 1, 68),
(40, 1, 69),
(41, 1, 70),
(42, 1, 72),
(43, 1, 73),
(45, 1, 74),
(44, 1, 76),
(46, 1, 77),
(47, 1, 78),
(48, 1, 80),
(49, 1, 81),
(50, 1, 82),
(51, 1, 84),
(52, 1, 85),
(53, 1, 86),
(68, 1, 88),
(54, 1, 89),
(55, 1, 90),
(69, 1, 92),
(56, 1, 93),
(57, 1, 94),
(70, 1, 96),
(58, 1, 97),
(59, 1, 98),
(71, 1, 100),
(60, 1, 101),
(61, 1, 102),
(72, 1, 104),
(62, 1, 105),
(63, 1, 106),
(73, 1, 108),
(64, 1, 109),
(65, 1, 110),
(74, 1, 112),
(66, 1, 113),
(67, 1, 114),
(75, 1, 116),
(113, 1, 117),
(123, 1, 120),
(77, 2, 33),
(76, 2, 36),
(79, 2, 37),
(78, 2, 40),
(80, 2, 41),
(82, 2, 42),
(81, 2, 44),
(83, 2, 48),
(85, 2, 49),
(84, 2, 52),
(87, 2, 53),
(86, 2, 56),
(89, 2, 57),
(117, 2, 58),
(115, 2, 60),
(92, 2, 61),
(91, 2, 64),
(93, 2, 68),
(95, 2, 69),
(122, 2, 70),
(94, 2, 72),
(97, 2, 73),
(96, 2, 76),
(99, 2, 77),
(98, 2, 80),
(101, 2, 81),
(100, 2, 84),
(102, 2, 88),
(103, 2, 92),
(104, 2, 96),
(111, 2, 97),
(105, 2, 100),
(120, 2, 101),
(119, 2, 102),
(118, 2, 104),
(107, 2, 108),
(109, 2, 109),
(108, 2, 112),
(121, 2, 113),
(112, 2, 116);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add audit trials', 6, 'add_audittrials'),
(22, 'Can change audit trials', 6, 'change_audittrials'),
(23, 'Can delete audit trials', 6, 'delete_audittrials'),
(24, 'Can view audit trials', 6, 'view_audittrials'),
(25, 'Can add error logs', 7, 'add_errorlogs'),
(26, 'Can change error logs', 7, 'change_errorlogs'),
(27, 'Can delete error logs', 7, 'delete_errorlogs'),
(28, 'Can view error logs', 7, 'view_errorlogs'),
(29, 'Can add users', 8, 'add_users'),
(30, 'Can change users', 8, 'change_users'),
(31, 'Can delete users', 8, 'delete_users'),
(32, 'Can view users', 8, 'view_users'),
(33, 'Can add account', 9, 'add_account'),
(34, 'Can change account', 9, 'change_account'),
(35, 'Can delete account', 9, 'delete_account'),
(36, 'Can view account', 9, 'view_account'),
(37, 'Can add account_types', 10, 'add_account_types'),
(38, 'Can change account_types', 10, 'change_account_types'),
(39, 'Can delete account_types', 10, 'delete_account_types'),
(40, 'Can view account_types', 10, 'view_account_types'),
(41, 'Can add receipt_voucher', 11, 'add_receipt_voucher'),
(42, 'Can change receipt_voucher', 11, 'change_receipt_voucher'),
(43, 'Can delete receipt_voucher', 11, 'delete_receipt_voucher'),
(44, 'Can view receipt_voucher', 11, 'view_receipt_voucher'),
(45, 'Can add blood_group', 12, 'add_blood_group'),
(46, 'Can change blood_group', 12, 'change_blood_group'),
(47, 'Can delete blood_group', 12, 'delete_blood_group'),
(48, 'Can view blood_group', 12, 'view_blood_group'),
(49, 'Can add company', 13, 'add_company'),
(50, 'Can change company', 13, 'change_company'),
(51, 'Can delete company', 13, 'delete_company'),
(52, 'Can view company', 13, 'view_company'),
(53, 'Can add countries', 14, 'add_countries'),
(54, 'Can change countries', 14, 'change_countries'),
(55, 'Can delete countries', 14, 'delete_countries'),
(56, 'Can view countries', 14, 'view_countries'),
(57, 'Can add customer', 15, 'add_customer'),
(58, 'Can change customer', 15, 'change_customer'),
(59, 'Can delete customer', 15, 'delete_customer'),
(60, 'Can view customer', 15, 'view_customer'),
(61, 'Can add customer_fingers', 16, 'add_customer_fingers'),
(62, 'Can change customer_fingers', 16, 'change_customer_fingers'),
(63, 'Can delete customer_fingers', 16, 'delete_customer_fingers'),
(64, 'Can view customer_fingers', 16, 'view_customer_fingers'),
(65, 'Can add federal_state', 17, 'add_federal_state'),
(66, 'Can change federal_state', 17, 'change_federal_state'),
(67, 'Can delete federal_state', 17, 'delete_federal_state'),
(68, 'Can view federal_state', 17, 'view_federal_state'),
(69, 'Can add license', 18, 'add_license'),
(70, 'Can change license', 18, 'change_license'),
(71, 'Can delete license', 18, 'delete_license'),
(72, 'Can view license', 18, 'view_license'),
(73, 'Can add licensetype', 19, 'add_licensetype'),
(74, 'Can change licensetype', 19, 'change_licensetype'),
(75, 'Can delete licensetype', 19, 'delete_licensetype'),
(76, 'Can view licensetype', 19, 'view_licensetype'),
(77, 'Can add personal_id_type', 20, 'add_personal_id_type'),
(78, 'Can change personal_id_type', 20, 'change_personal_id_type'),
(79, 'Can delete personal_id_type', 20, 'delete_personal_id_type'),
(80, 'Can view personal_id_type', 20, 'view_personal_id_type'),
(81, 'Can add placeissue', 21, 'add_placeissue'),
(82, 'Can change placeissue', 21, 'change_placeissue'),
(83, 'Can delete placeissue', 21, 'delete_placeissue'),
(84, 'Can view placeissue', 21, 'view_placeissue'),
(85, 'Can add color', 22, 'add_color'),
(86, 'Can change color', 22, 'change_color'),
(87, 'Can delete color', 22, 'delete_color'),
(88, 'Can view color', 22, 'view_color'),
(89, 'Can add cylinder', 23, 'add_cylinder'),
(90, 'Can change cylinder', 23, 'change_cylinder'),
(91, 'Can delete cylinder', 23, 'delete_cylinder'),
(92, 'Can view cylinder', 23, 'view_cylinder'),
(93, 'Can add model_brand', 24, 'add_model_brand'),
(94, 'Can change model_brand', 24, 'change_model_brand'),
(95, 'Can delete model_brand', 24, 'delete_model_brand'),
(96, 'Can view model_brand', 24, 'view_model_brand'),
(97, 'Can add plate', 25, 'add_plate'),
(98, 'Can change plate', 25, 'change_plate'),
(99, 'Can delete plate', 25, 'delete_plate'),
(100, 'Can view plate', 25, 'view_plate'),
(101, 'Can add vehicle', 26, 'add_vehicle'),
(102, 'Can change vehicle', 26, 'change_vehicle'),
(103, 'Can delete vehicle', 26, 'delete_vehicle'),
(104, 'Can view vehicle', 26, 'view_vehicle'),
(105, 'Can add type', 27, 'add_type'),
(106, 'Can change type', 27, 'change_type'),
(107, 'Can delete type', 27, 'delete_type'),
(108, 'Can view type', 27, 'view_type'),
(109, 'Can add transfare_vehicles', 28, 'add_transfare_vehicles'),
(110, 'Can change transfare_vehicles', 28, 'change_transfare_vehicles'),
(111, 'Can delete transfare_vehicles', 28, 'delete_transfare_vehicles'),
(112, 'Can view transfare_vehicles', 28, 'view_transfare_vehicles'),
(113, 'Can add code_plate', 29, 'add_code_plate'),
(114, 'Can change code_plate', 29, 'change_code_plate'),
(115, 'Can delete code_plate', 29, 'delete_code_plate'),
(116, 'Can view code_plate', 29, 'view_code_plate'),
(117, 'Can Activate Customer', 15, 'activate_customer'),
(118, 'Can block Company', 13, 'block_company'),
(119, 'Can unblock company', 13, 'unblock_company'),
(120, 'Can change license status', 18, 'change_status'),
(121, 'Can add test_elements', 30, 'add_test_elements'),
(122, 'Can change test_elements', 30, 'change_test_elements'),
(123, 'Can delete test_elements', 30, 'delete_test_elements'),
(124, 'Can view test_elements', 30, 'view_test_elements'),
(125, 'Can add test', 31, 'add_test'),
(126, 'Can change test', 31, 'change_test'),
(127, 'Can delete test', 31, 'delete_test'),
(128, 'Can view test', 31, 'view_test'),
(129, 'Can add test_category', 32, 'add_test_category'),
(130, 'Can change test_category', 32, 'change_test_category'),
(131, 'Can delete test_category', 32, 'delete_test_category'),
(132, 'Can view test_category', 32, 'view_test_category');

-- --------------------------------------------------------

--
-- Table structure for table `blood_group`
--

CREATE TABLE `blood_group` (
  `blood_group_id` int NOT NULL,
  `blood_group_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blood_group`
--

INSERT INTO `blood_group` (`blood_group_id`, `blood_group_name`, `created_at`, `modified_at`) VALUES
(1, 'A+', '2023-03-05 08:44:11.708834', '2023-03-05 08:44:11.722012'),
(2, 'A-', '2023-03-05 08:44:11.708834', '2023-03-05 08:44:11.722012'),
(3, 'O+', '2023-03-05 08:44:11.708834', '2023-03-05 08:44:11.722012'),
(4, 'B-', '2023-03-05 08:44:11.708834', '2023-03-05 08:44:11.722012'),
(5, 'O-', '2023-03-05 08:44:11.708834', '2023-03-05 08:44:11.722012'),
(6, 'AB+', '2023-03-05 08:44:11.708834', '2023-03-05 08:44:11.722012'),
(7, 'AB-', '2023-03-05 08:44:11.708834', '2023-03-05 08:44:11.722012');

-- --------------------------------------------------------

--
-- Table structure for table `code_plate`
--

CREATE TABLE `code_plate` (
  `code_id` int NOT NULL,
  `code_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `code_plate`
--

INSERT INTO `code_plate` (`code_id`, `code_name`, `created_at`, `modified_at`, `reg_user_id`) VALUES
(1, 'A', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 1),
(2, 'AA', '2023-03-04 14:23:46.091746', '2023-03-04 14:24:06.053633', 1),
(3, 'AB', '2023-03-04 14:24:40.315794', '2023-03-04 14:24:40.315794', 1),
(4, 'Ac', '2023-03-04 14:24:58.541787', '2023-03-04 14:24:58.541787', 1),
(5, 'AD', '2023-03-05 08:59:41.451176', '2023-03-05 08:59:41.451176', 1),
(6, 'AE', '2023-03-05 09:00:00.008244', '2023-03-05 09:00:00.008244', 1),
(7, 'AF', '2023-03-05 09:00:09.407298', '2023-03-05 09:00:09.407298', 1),
(8, 'AG', '2023-03-05 09:00:19.598722', '2023-03-05 09:00:19.598722', 1),
(9, 'AH', '2023-03-05 09:00:33.942555', '2023-03-05 09:00:33.942555', 1),
(10, 'AI', '2023-03-05 09:00:53.735372', '2023-03-05 09:00:53.735372', 1),
(11, 'AM', '2023-03-05 09:01:00.565711', '2023-03-05 09:01:00.565711', 1),
(12, 'B', '2023-03-05 09:01:16.624733', '2023-03-05 09:01:16.624733', 1),
(13, 'M1A', '2023-03-05 09:01:29.887669', '2023-03-05 09:01:29.887669', 1),
(14, 'M2A', '2023-03-05 09:02:00.072583', '2023-03-05 09:02:00.072583', 1),
(15, 'M3A', '2023-03-05 09:02:18.391755', '2023-03-05 09:02:18.391755', 1),
(16, 'M4A', '2023-03-05 09:02:30.991371', '2023-03-05 09:02:30.991371', 1),
(17, 'M5A', '2023-03-05 09:02:49.943728', '2023-03-05 09:02:49.943728', 1),
(18, 'M6A', '2023-03-05 09:03:31.974213', '2023-03-05 09:03:31.974213', 1),
(19, 'MA', '2023-03-05 09:03:48.648617', '2023-03-05 09:03:48.648617', 1),
(20, 'MA1-', '2023-03-05 09:04:07.846544', '2023-03-05 09:04:07.846544', 1),
(21, 'MB', '2023-03-05 09:04:26.367695', '2023-03-05 09:04:26.367695', 1),
(22, 'MC', '2023-03-05 09:04:35.120778', '2023-03-05 09:04:35.120778', 1),
(23, 'MD', '2023-03-05 09:06:43.335074', '2023-03-05 09:06:43.335074', 1),
(24, 'ME', '2023-03-05 09:07:10.815568', '2023-03-05 09:07:10.815568', 1),
(25, 'MF', '2023-03-05 09:07:17.607185', '2023-03-05 09:07:17.607185', 1),
(26, 'MG', '2023-03-05 09:07:24.640323', '2023-03-05 09:07:24.640323', 1),
(27, 'MH', '2023-03-05 09:07:32.431371', '2023-03-05 09:07:32.431371', 1),
(28, 'MJ', '2023-03-05 09:07:56.815287', '2023-03-05 09:07:56.815287', 1),
(29, 'Mk', '2023-03-05 09:08:02.983240', '2023-03-05 09:08:02.984243', 1),
(30, 'ML', '2023-03-05 09:09:15.150475', '2023-03-05 09:09:24.702962', 1),
(31, 'MM', '2023-03-05 09:09:43.202809', '2023-03-05 09:09:43.202809', 1),
(32, 'MO', '2023-03-05 09:09:51.621689', '2023-03-05 09:09:51.622688', 1),
(33, 'MP', '2023-03-05 09:12:01.919065', '2023-03-05 09:12:01.919065', 1),
(34, 'MQ', '2023-03-05 09:12:10.311534', '2023-03-05 09:12:10.311534', 1),
(35, 'MR', '2023-03-05 09:12:17.655426', '2023-03-05 09:12:17.655426', 1),
(36, 'MS', '2023-03-05 09:12:58.223248', '2023-03-05 09:12:58.223248', 1),
(37, 'MT', '2023-03-05 09:13:05.494146', '2023-03-05 09:13:05.494146', 1),
(38, 'MW', '2023-03-05 09:13:18.877422', '2023-03-05 09:13:18.877422', 1),
(39, 'MX', '2023-03-05 09:13:25.443235', '2023-03-05 09:13:25.443235', 1),
(40, 'MY', '2023-03-05 09:13:34.510484', '2023-03-05 09:13:34.510484', 1),
(41, 'MZ', '2023-03-05 09:13:43.429957', '2023-03-05 09:13:54.867007', 1),
(42, 'AK', '2023-03-08 14:26:53.607447', '2023-03-08 14:26:53.607479', 4);

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `color_id` int NOT NULL,
  `color_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`color_id`, `color_name`, `created_at`, `modified_at`, `reg_user_id`) VALUES
(213, 'Black', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(214, 'Graphite Black', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(215, 'Black Steal', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(216, 'Dark Silver', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(217, 'Silver', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(218, 'Blue Silver', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(219, 'Steel Gray', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(220, 'Shadow Silver', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(221, 'Stone Silver', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(222, 'Midnight Silver', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(223, 'Gun Metal', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(224, 'Anthracite Grey', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(225, 'Matte Gray', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(226, 'Matte Light Grey', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(227, 'Util Black Poly', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(228, 'Util Dark silver', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(229, 'Util Silver', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(230, 'Util Gun Metal', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(231, 'Util Shadow Silver', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(232, 'Graphite', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(233, 'Silver Grey', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(234, 'Silver', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(235, 'Blue Silver', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(236, 'Shadow Silver', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(237, 'Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(238, 'Torino Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(239, 'Formula Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(240, 'Blaze Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(241, 'Graceful Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(242, 'Garnet Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(243, 'Desert Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(244, 'Cabernet Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(245, 'Candy Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(246, 'Sunrise Orange', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(247, 'Classic Gold', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(248, 'Orange', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(249, 'Dark Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(250, 'Matte Yellow', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(251, 'Bright Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(252, 'Garnet Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(253, 'Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(254, 'Golden Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(255, 'Dark Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(256, 'Dark Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(257, 'Racing Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(258, 'Sea Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(259, 'Olive Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(260, 'Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(261, 'Gasoline Blue Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(262, 'Lime Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(263, 'Dark Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(264, 'Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(265, 'Dark Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(266, 'Worn Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(267, 'Sea Wash', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(268, 'Midnight Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(269, 'Dark Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(270, 'Saxony Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(271, 'Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(272, 'Mariner Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(273, 'Harbor Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(274, 'Diamond Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(275, 'Surf Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(276, 'Nautical Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(277, 'Bright Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(278, 'Purple Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(279, 'Spinnaker Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(280, 'Ultra Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(281, 'Bright Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(282, 'Dark Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(283, 'Midnight Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(284, 'Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(285, 'Sea Foam Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(286, 'Lightning blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(287, 'Maui Blue Poly', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(288, 'Util Bright Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(289, 'Matte Dark Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(290, 'Matte Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(291, 'Matte Midnight Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(292, 'Light blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(293, 'Taxi Yellow', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(294, 'Race Yellow', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(295, ' Bronze', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(296, 'Yellow Bird', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(297, 'Lime', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(298, 'Champagne', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(299, 'Pueblo Beige', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(300, 'Dark Ivory', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(301, 'Choco Brown', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(302, 'Golden Brown', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(303, 'Light Brown', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(304, 'Straw Beige', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(305, 'Moss Brown', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(306, 'Biston Brown', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(307, 'Beechwood', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(308, 'Dark Beechwood', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(309, 'Choco Orange', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(310, ' Beach Sand', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(311, 'Sun Bleeched Sand', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(312, 'Cream', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(313, 'Brown', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(314, 'Medium Brown', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(315, 'Light Brown', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(316, 'White', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(317, 'Frost White', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(318, 'Honey Beige', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(319, 'Brown', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(320, 'Dark Brown', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(321, 'straw beige', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(322, 'Steel', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(323, 'Black steel', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(324, 'Brushed Aluminium', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(325, 'Chrome', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(326, 'Worn Off White', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(327, 'Util Off White', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(328, 'Light Orange', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(329, 'Securicor Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(330, 'Taxi Yellow', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(331, 'police car blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(332, 'Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(333, 'Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(334, 'Olive Army Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(335, 'Hot Pink', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(336, 'Salmon pink', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(337, 'Vermillion Pink', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(338, 'Orange', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(339, 'Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(340, 'Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(341, 'Black Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(342, 'Purple', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(343, 'Black Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(344, 'hunter green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(345, 'Purple', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(346, 'V Dark Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(347, 'MODSHOP BLACK1', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(348, 'Purple', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(349, 'Dark Purple', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(350, 'Lava Red', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(351, 'Desert Tan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(352, 'Foilage Green', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(353, 'DEFAULT ALLOY COLOR', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(354, 'Epsilon Blue', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(355, 'Gold', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(356, 'Brushed Gold', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int NOT NULL,
  `company_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_no` longtext COLLATE utf8mb4_unicode_ci,
  `document` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `is_blocked` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `federal_state_id` int DEFAULT NULL,
  `owner_id` int NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `email`, `address`, `phone`, `logo`, `website`, `reg_no`, `document`, `description`, `is_blocked`, `created_at`, `modified_at`, `federal_state_id`, `owner_id`, `reg_user_id`) VALUES
(1, 'Baalgoray General Trading Co.', 'info@baalgoray.com', 'Bakaraha Howlwadaag', '615455552', 'company_logo/th.jpeg', 'https://baaalgoray.com', '4785945785', 'comapany_document/Dashboard-VRLS.pdf', 'hello baalgoray', 1, '2023-03-05 15:30:02.354173', '2023-03-14 09:26:27.109796', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int NOT NULL,
  `country_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `modified_at`) VALUES
(2, 'Afghanistan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(3, 'Albania', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(4, 'Algeria', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(5, 'Andorra', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(6, 'Angola', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(7, 'Antigua and Barbuda', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(8, 'Argentina', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(9, 'Armenia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(10, 'Australia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(11, 'Austria', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(12, 'Azerbaijan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(13, 'Bahamas', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(14, 'Bahrain', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(15, 'Bangladesh', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(16, 'Barbados', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(17, 'Belarus', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(18, 'Belgium', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(19, 'Belize', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(20, 'Benin', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(21, 'Bhutan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(22, 'Bolivia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(23, 'Bosnia and Herzegovina', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(24, 'Botswana', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(25, 'Brazil', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(26, 'Brunei', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(27, 'Bulgaria', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(28, 'Burkina Faso', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(29, 'Burundi', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(30, 'Cape Verde', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(31, 'Cambodia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(32, 'Cameroon', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(33, 'Canada', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(34, 'Central African Republic', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(35, 'Chad', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(36, 'Chile', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(37, 'China', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(38, 'Colombia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(39, 'Comoros', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(40, 'Congo, Democratic Republic', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(41, 'Congo', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(42, 'Costa Rica', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(43, 'Cote D\'Ivoire', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(44, 'Croatia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(45, 'Cuba', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(46, 'Cyprus', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(47, 'Czech Republic', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(48, 'Denmark', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(49, 'Djibouti', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(50, 'Dominica', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(51, 'Dominican Republic', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(52, 'Ecuador', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(53, 'Egypt', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(54, 'El Salvador', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(55, 'Equatorial Guinea', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(56, 'Eritrea', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(57, 'Estonia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(58, 'Eswatini', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(59, 'Ethiopia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(60, 'Fiji', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(61, 'Finland', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(62, 'France', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(63, 'Gabon', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(64, 'Gambia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(65, 'Georgia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(66, 'Germany', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(67, 'Ghana', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(68, 'Greece', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(69, 'Grenada', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(70, 'Guatemala', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(71, 'Guinea', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(72, 'Guinea-Bissau', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(73, 'Guyana', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(74, 'Greenland', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(75, 'Haiti', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(76, 'Honduras', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(77, 'Hungary', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(78, 'Iceland', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(79, 'India', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(80, 'Indonesia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(81, 'Iran', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(82, 'Iraq', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(83, 'Ireland', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(84, 'Italy', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(85, 'Jamaica', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(86, 'Japan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(87, 'Jordan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(88, 'Kazakhstan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(89, 'Kenya', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(90, 'Kiribati', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(91, 'Kosovo', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(92, 'Kuwait', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(93, 'Kyrgyzstan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(94, 'Laos', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(95, 'Latvia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(96, 'Lebanon', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(97, 'Lesotho', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(98, 'Liberia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(99, 'Libyan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(100, 'Liechtenstein', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(101, 'Lithuania', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(102, 'Luxembourg', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(103, 'Madagascar', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(104, 'Malawi', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(105, 'Malaysia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(106, 'Maldives', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(107, 'Mali', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(108, 'Malta', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(109, 'Marshall Islands', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(110, 'Mauritania', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(111, 'Mauritius', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(112, 'Mexico', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(113, 'Micronesia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(114, 'Moldova', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(115, 'Monaco', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(116, 'Mongolia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(117, 'Montenegro', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(118, 'Morocco', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(119, 'Mozambique', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(120, 'Myanmar', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(121, 'Macedonia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(122, 'Namibia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(123, 'Nauru', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(124, 'Nepal', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(125, 'Netherlands', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(126, 'New Zealand', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(127, 'Nicaragua', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(128, 'Niger', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(129, 'Nigeria', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(130, 'North Korea', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(131, 'Norway', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(132, 'Oman', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(133, 'Pakistan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(134, 'Palau', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(135, 'Palestine', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(136, 'Panama', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(137, 'Papua New Guinea', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(138, 'Paraguay', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(139, 'Peru', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(140, 'Philippines', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(141, 'Poland', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(142, 'Portugal', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(143, 'Puerto Rico', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(144, 'Qatar', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(145, 'Romania', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(146, 'Russia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(147, 'Rwanda', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(148, 'St. Kitts & Nevis', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(149, 'St. Lucia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(150, 'St. Vincent & Grenadines', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(151, 'Samoa', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(152, 'San Marino', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(153, 'Sao Tome and Principe', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(154, 'Saudi Arabia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(155, 'Senegal', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(156, 'Serbia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(157, 'Seychelles', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(158, 'Sierra Leone', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(159, 'Singapore', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(160, 'Slovakia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(161, 'Slovenia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(162, 'Solomon Islands', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(163, 'Somalia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(164, 'South Africa', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(165, 'South Korea', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(166, 'South Sudan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(167, 'Spain', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(168, 'Sri Lanka', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(169, 'Sudan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(170, 'Suriname', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(171, 'Swaziland', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(172, 'Sweden', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(173, 'Switzerland', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(174, 'Syria', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(175, 'Taiwan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(176, 'Tajikistan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(177, 'Tanzania', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(178, 'Thailand', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(179, 'Togo', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(180, 'Tonga', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(181, 'Trinidad and Tobago', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(182, 'Tunisia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(183, 'Turkey', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(184, 'Turkmenistan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(185, 'Tuvalu', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(186, 'Uganda', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(187, 'Ukraine', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(188, 'United Arab Emirates', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(189, 'United Kingdom', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(190, 'Uruguay', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(191, 'Uzbekistan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(192, 'Vanuatu', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(193, 'Vatican City', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(194, 'Venezuela', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(195, 'Vietnam', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(196, 'Zambia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629'),
(197, 'Zimbabwe', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fourth_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `modified_at` datetime(6) NOT NULL,
  `blood_group_id` int DEFAULT NULL,
  `federal_state_id` int DEFAULT NULL,
  `nationality_id` int NOT NULL,
  `personal_id_type_id` int DEFAULT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `firstname`, `middle_name`, `lastname`, `fourth_name`, `mother_name`, `full_name`, `gender`, `date_of_birth`, `place_of_birth`, `personal_id`, `email`, `address`, `phone`, `photo`, `document`, `is_verified`, `created_at`, `description`, `modified_at`, `blood_group_id`, `federal_state_id`, `nationality_id`, `personal_id_type_id`, `reg_user_id`) VALUES
(1, 'Axmed', 'Jaamac', 'Geedi', 'Cilmi', 'Xadiyo Cali Jaamac', 'Axmed Jaamac Geedi Cilmi', 'Male', '1996-08-07', NULL, 'P00702709', 'mo@nisa.com', 'Gaadiidka CabdiCaziiz', '615478596', 'customer_images/th.jpeg', 'customer_document/VRLS___Reports_2UotDYd.pdf', 1, '2023-03-05 10:28:45.301314', 'cdasd', '2023-03-14 12:44:41.722367', 3, 2, 145, 1, 1),
(2, 'Cali', 'Maxamed', 'Xassen', 'Afrax', 'Haajiro Ismacil Ibrahim', 'Cali  Maxamed Xassen Afrax', 'Male', '1996-08-07', NULL, 'P00702896', 'ca@mot.com', 'Shangaani', '615479685', 'customer_images/OIP.jpeg', 'customer_document/VRLS___Reports_yPuSPQB.pdf', 1, '2023-03-07 11:11:45.335104', 'asasa', '2023-03-15 13:56:49.675230', 3, 1, 163, 1, 1),
(3, 'Mohamud', 'Maxamed', 'Xassen', 'Cali', 'Xadiyo Cali Jaamac', 'Mohamud Maxamed Xassen Cali', 'Male', '2023-03-08', NULL, 'P00703025', 'mo@gmail.com', 'Shangaani', '148454544845', 'customer_images/OIP_UoVrbX0.jpeg', 'customer_document/VRLS___Reports_DoYGn3M.pdf', 0, '2023-03-08 11:50:37.468083', 'hello', '2023-03-15 13:58:09.188992', 3, 2, 5, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `cylinder`
--

CREATE TABLE `cylinder` (
  `cylinder_id` int NOT NULL,
  `cylinder_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cylinder`
--

INSERT INTO `cylinder` (`cylinder_id`, `cylinder_name`, `created_at`, `modified_at`, `reg_user_id`) VALUES
(2, '3', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(3, '4', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(4, '5', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(5, '6', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(6, '8', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(7, '10', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(8, '12', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(9, '16', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-03-05 13:48:09.153721', '1', 'mo@nisa.com', 2, '[]', 8, 1),
(2, '2023-03-05 14:27:17.484689', '2', 'h1@gmail.com', 3, '', 8, 1),
(3, '2023-03-05 16:25:19.023841', '4', 'azuu@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Superuser status\", \"Is admin\", \"Federal state\"]}}]', 8, 1),
(4, '2023-03-06 09:28:55.216308', '1', 'Tesla', 3, '', 26, 1),
(5, '2023-03-06 09:52:14.389150', '1', '1 Axmed Jaamac Geedi Cilmi 1425', 1, '[{\"added\": {}}]', 18, 1),
(6, '2023-03-06 09:55:45.429024', '1', '1 Axmed Jaamac Geedi Cilmi 1425', 3, '', 18, 1),
(7, '2023-03-08 10:28:29.572547', '4', 'azuu@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Is admin\", \"Is state\"]}}]', 8, 1),
(8, '2023-03-08 10:28:48.412183', '3', 'h1@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 8, 1),
(9, '2023-03-12 12:32:28.183768', '2', '2 Cali  Maxamed Xassen Afrax 1425', 2, '[{\"changed\": {\"fields\": [\"Owner\"]}}]', 18, 1),
(10, '2023-03-12 12:39:33.067202', '2', '2 Cali  Maxamed Xassen Afrax 1425', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(11, '2023-03-12 12:39:51.885098', '2', '2 Cali  Maxamed Xassen Afrax 1425', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 18, 1),
(12, '2023-03-12 13:44:17.507667', '1', 'company object (1)', 2, '[{\"changed\": {\"fields\": [\"Owner\"]}}]', 13, 1),
(13, '2023-03-12 14:19:23.194703', '1', 'company object (1)', 2, '[{\"changed\": {\"fields\": [\"Is blocked\"]}}]', 13, 1),
(14, '2023-03-12 14:44:48.417137', '2', 'Abarth', 2, '[{\"changed\": {\"fields\": [\"Owner\"]}}]', 26, 1),
(15, '2023-03-12 14:46:15.552912', '1', 'company object (1)', 2, '[{\"changed\": {\"fields\": [\"Owner\"]}}]', 13, 1),
(16, '2023-03-12 14:47:33.909324', '1', 'company object (1)', 2, '[{\"changed\": {\"fields\": [\"Owner\"]}}]', 13, 1),
(17, '2023-03-12 15:07:09.768458', '1', '1425', 1, '[{\"added\": {}}]', 25, 1),
(18, '2023-03-12 15:07:17.594480', '2', 'Abarth', 2, '[{\"changed\": {\"fields\": [\"Plate no\"]}}]', 26, 1),
(19, '2023-03-12 15:09:49.793857', '1', '10', 2, '[{\"changed\": {\"fields\": [\"Plate no\"]}}]', 25, 1),
(20, '2023-03-13 10:24:54.642662', '1', 'Axmed Jaamac Geedi Cilmi', 2, '[{\"changed\": {\"fields\": [\"Address\", \"Document\", \"Is verified\"]}}]', 15, 1),
(21, '2023-03-13 10:27:19.983899', '1', 'Axmed Jaamac Geedi Cilmi', 2, '[{\"changed\": {\"fields\": [\"Document\", \"Is verified\"]}}]', 15, 1),
(22, '2023-03-13 10:43:53.206677', '1', 'Axmed Jaamac Geedi Cilmi', 2, '[{\"changed\": {\"fields\": [\"Document\", \"Is verified\"]}}]', 15, 1),
(23, '2023-03-13 10:55:03.810691', '1', 'Axmed Jaamac Geedi Cilmi', 2, '[{\"changed\": {\"fields\": [\"Document\", \"Is verified\"]}}]', 15, 1),
(24, '2023-03-13 10:55:21.753684', '2', 'Cali  Maxamed Xassen Afrax', 2, '[{\"changed\": {\"fields\": [\"Firstname\", \"Document\", \"Is verified\"]}}]', 15, 1),
(25, '2023-03-13 11:02:13.124773', '2', 'Abarth', 2, '[{\"changed\": {\"fields\": [\"Owner\"]}}]', 26, 1),
(26, '2023-03-13 11:37:47.399951', '3', '3 Cali  Maxamed Xassen Afrax 1426', 3, '', 18, 1),
(27, '2023-03-13 11:49:26.955266', '2', '2 Cali  Maxamed Xassen Afrax 1426', 2, '[{\"changed\": {\"fields\": [\"Receipt voucher\"]}}]', 18, 1),
(28, '2023-03-13 12:29:06.440536', '9', 'Mogadishu', 1, '[{\"added\": {}}]', 21, 1),
(29, '2023-03-13 12:29:22.731040', '10', 'Jowhar', 1, '[{\"added\": {}}]', 21, 1),
(30, '2023-03-13 12:29:33.616764', '11', 'Garowe', 1, '[{\"added\": {}}]', 21, 1),
(31, '2023-03-13 12:29:45.634689', '12', 'Hargeisa', 1, '[{\"added\": {}}]', 21, 1),
(32, '2023-03-13 12:29:59.800059', '13', 'Kismayo', 1, '[{\"added\": {}}]', 21, 1),
(33, '2023-03-13 12:30:15.151037', '14', 'Baydhabo', 1, '[{\"added\": {}}]', 21, 1),
(34, '2023-03-13 12:31:46.625369', '15', 'Dhuusamareb', 1, '[{\"added\": {}}]', 21, 1),
(35, '2023-03-13 14:19:39.697171', '2', '2 Cali  Maxamed Xassen Afrax 1426', 2, '[{\"changed\": {\"fields\": [\"Place of issue\"]}}]', 18, 1),
(36, '2023-03-14 09:20:50.833122', '2', '2 Axmed Jaamac Geedi Cilmi 1426', 2, '[{\"changed\": {\"fields\": [\"Owner\"]}}]', 18, 1),
(37, '2023-03-14 09:26:27.110736', '1', 'company object (1)', 2, '[{\"changed\": {\"fields\": [\"Owner\"]}}]', 13, 1),
(38, '2023-03-14 10:08:41.714373', '5', '1429', 2, '[{\"changed\": {\"fields\": [\"Rv from\"]}}]', 11, 1),
(39, '2023-03-14 11:16:18.508457', '1', '9999', 2, '[{\"changed\": {\"fields\": [\"Plate no\"]}}]', 25, 1),
(40, '2023-03-14 11:20:28.506347', '1', '9998', 2, '[{\"changed\": {\"fields\": [\"Plate no\"]}}]', 25, 1),
(41, '2023-03-14 11:22:39.315114', '3', 'Ferrari', 2, '[{\"changed\": {\"fields\": [\"Plate no\"]}}]', 26, 1),
(42, '2023-03-14 11:22:46.118618', '2', '', 3, '', 25, 1),
(43, '2023-03-14 11:32:03.664472', '3', 'Ferrari', 2, '[{\"changed\": {\"fields\": [\"Plate no\"]}}]', 26, 1),
(44, '2023-03-14 11:32:08.740668', '3', 'undefined', 3, '', 25, 1),
(45, '2023-03-14 11:38:23.922533', '3', 'Ferrari', 2, '[{\"changed\": {\"fields\": [\"Plate no\"]}}]', 26, 1),
(46, '2023-03-14 11:38:38.139908', '4', '0001', 2, '[{\"changed\": {\"fields\": [\"Plate no\"]}}]', 25, 1),
(47, '2023-03-14 11:43:21.661018', '4', '0001', 3, '', 25, 1),
(48, '2023-03-15 13:51:18.513765', '3', 'Mohamud Maxamed Xassen Cali', 2, '[{\"changed\": {\"fields\": [\"Is verified\"]}}]', 15, 1),
(49, '2023-03-15 13:52:33.607526', '3', 'Mohamud Maxamed Xassen Cali', 2, '[{\"changed\": {\"fields\": [\"Is verified\"]}}]', 15, 1),
(50, '2023-03-15 13:57:44.933480', '3', 'Mohamud Maxamed Xassen Cali', 2, '[{\"changed\": {\"fields\": [\"Is verified\"]}}]', 15, 1),
(51, '2023-03-16 11:38:51.564296', '1', 'Abaatiriinka', 1, '[{\"added\": {}}]', 30, 1),
(52, '2023-03-16 11:39:06.911696', '2', 'Balansiga iyo Isteerinka', 1, '[{\"added\": {}}]', 30, 1),
(53, '2023-03-16 11:39:19.446095', '3', 'Bareega Gaadiidka', 1, '[{\"added\": {}}]', 30, 1),
(54, '2023-03-16 11:39:30.631308', '4', 'Buudiga Gaadiidka', 1, '[{\"added\": {}}]', 30, 1),
(55, '2023-03-16 11:39:39.348119', '5', 'Dabka Gaadiidka', 1, '[{\"added\": {}}]', 30, 1),
(56, '2023-03-16 11:39:54.126327', '6', 'Farasiyaalaha Gaadiidka', 1, '[{\"added\": {}}]', 30, 1),
(57, '2023-03-16 11:40:05.821061', '7', 'Haadadka Gaadiidka', 1, '[{\"added\": {}}]', 30, 1),
(58, '2023-03-16 11:40:21.812747', '8', 'Hobsiyada Gaadiidka', 1, '[{\"added\": {}}]', 30, 1),
(59, '2023-03-16 11:40:29.046566', '9', 'Hoonka', 1, '[{\"added\": {}}]', 30, 1),
(60, '2023-03-16 11:40:42.628695', '10', 'Kaambiyaha Gaadiidka', 1, '[{\"added\": {}}]', 30, 1),
(61, '2023-03-16 11:40:59.253901', '11', 'Kirishtaalaha Gaadiidka', 1, '[{\"added\": {}}]', 30, 1),
(62, '2023-03-16 11:41:05.509496', '12', 'Kuraasta', 1, '[{\"added\": {}}]', 30, 1),
(63, '2023-03-16 11:41:16.536953', '13', 'Laangaroonaha Gaadiidka', 1, '[{\"added\": {}}]', 30, 1),
(64, '2023-03-16 11:41:26.340158', '14', 'Matoorka Gaadiidka', 1, '[{\"added\": {}}]', 30, 1),
(65, '2023-03-16 11:41:41.800785', '15', 'Muraayadaha Gaadiidka', 1, '[{\"added\": {}}]', 30, 1),
(66, '2023-03-16 11:42:22.575775', '16', 'Nalalka Gaadiidka', 1, '[{\"added\": {}}]', 30, 1),
(67, '2023-03-16 11:42:43.546954', '17', 'Taayarada Gaadiidka', 1, '[{\"added\": {}}]', 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(12, 'Customers', 'blood_group'),
(13, 'Customers', 'company'),
(14, 'Customers', 'countries'),
(15, 'Customers', 'customer'),
(16, 'Customers', 'customer_fingers'),
(17, 'Customers', 'federal_state'),
(18, 'Customers', 'license'),
(19, 'Customers', 'licensetype'),
(20, 'Customers', 'personal_id_type'),
(21, 'Customers', 'placeissue'),
(9, 'Finance', 'account'),
(10, 'Finance', 'account_types'),
(11, 'Finance', 'receipt_voucher'),
(5, 'sessions', 'session'),
(6, 'Users', 'audittrials'),
(7, 'Users', 'errorlogs'),
(8, 'Users', 'users'),
(29, 'Vehicles', 'code_plate'),
(22, 'Vehicles', 'color'),
(23, 'Vehicles', 'cylinder'),
(24, 'Vehicles', 'model_brand'),
(25, 'Vehicles', 'plate'),
(31, 'Vehicles', 'test'),
(32, 'Vehicles', 'test_category'),
(30, 'Vehicles', 'test_elements'),
(28, 'Vehicles', 'transfare_vehicles'),
(27, 'Vehicles', 'type'),
(26, 'Vehicles', 'vehicle');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-05 09:36:20.837650'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-03-05 09:36:20.934211'),
(3, 'auth', '0001_initial', '2023-03-05 09:36:21.306773'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-03-05 09:36:21.377073'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-03-05 09:36:21.389973'),
(6, 'auth', '0004_alter_user_username_opts', '2023-03-05 09:36:21.403146'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-03-05 09:36:21.420116'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-03-05 09:36:21.430538'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-03-05 09:36:21.444939'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-03-05 09:36:21.457523'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-03-05 09:36:21.466776'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-03-05 09:36:21.491159'),
(13, 'auth', '0011_update_proxy_permissions', '2023-03-05 09:36:21.505096'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-03-05 09:36:21.519470'),
(15, 'Customers', '0001_initial', '2023-03-05 09:36:21.854238'),
(16, 'Users', '0001_initial', '2023-03-05 09:36:22.541811'),
(17, 'Finance', '0001_initial', '2023-03-05 09:36:22.642748'),
(18, 'Customers', '0002_initial', '2023-03-05 09:36:24.176867'),
(19, 'Finance', '0002_initial', '2023-03-05 09:36:24.582642'),
(20, 'Vehicles', '0001_initial', '2023-03-05 09:36:26.343894'),
(21, 'admin', '0001_initial', '2023-03-05 09:36:26.570019'),
(22, 'admin', '0002_logentry_remove_auto_add', '2023-03-05 09:36:26.593812'),
(23, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-05 09:36:26.609407'),
(24, 'sessions', '0001_initial', '2023-03-05 09:36:26.668008'),
(25, 'Vehicles', '0002_alter_vehicle_year', '2023-03-05 16:24:37.273262'),
(26, 'Vehicles', '0003_alter_plate_plate_code', '2023-03-07 09:28:17.805942'),
(27, 'Customers', '0003_alter_customer_options', '2023-03-08 11:57:24.360287'),
(28, 'Customers', '0004_alter_company_options', '2023-03-11 09:26:27.019166'),
(29, 'Customers', '0005_alter_company_options', '2023-03-12 09:18:25.324354'),
(30, 'Customers', '0006_placeissue_state', '2023-03-13 12:28:09.847813'),
(31, 'Customers', '0007_alter_license_options', '2023-03-14 12:22:53.704530'),
(32, 'Vehicles', '0004_test_elements_test_category_test', '2023-03-16 10:07:24.392769'),
(33, 'Vehicles', '0005_test_elements_test_cat', '2023-03-16 11:38:15.158553'),
(34, 'Vehicles', '0006_remove_test_elements_result_test_result_and_more', '2023-03-16 15:42:37.363711');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9if56kw1371cx4hklj8yptieosnz7aoc', '.eJxVjMEOwiAQRP-FsyGFrrDt0bvfQJayWNRSU-jJ-O-2SQ96m8y8eW_haK2jWwsvLgXRCxCn387T8OC8D-FO-TbLYc51SV7uiDzWIq9z4OflYP8EI5Vxe6NHQw0ZItPaYJAVq2Fghg4DMJBGHyGaTkcbWzgbr0OnWsBOhy2C2qWFS0lzdimn6mqauFSaXk70yljUFlC10jQa4fMF-BxGCQ:1pZrwb:SxocbmlDbmns3s3lS0O-i3-p1hgwM2l1aQ38WrOmYzs', '2023-03-22 14:26:53.618305'),
('ayjqqmw6i5b5lg1wrtfn6o06xuosrmzv', '.eJxVjMEOwiAQRP-FsyFCt3Tp0bvfQJayWNRSU-jJ-O-2SQ96m8y8eW_haK2jWwsvLgXRCxCn387T8OC8D-FO-TbLYc51SV7uiDzWIq9z4OflYP8EI5Vxe6NHQ2cyRKbpgkFWrIaBGSwGYCCNPkI0VscuNtAar4NVDaDVYYugdmnhUtKcXcqpupomLpWmlxO9Mh02oFtsJWpAbD9fPldGSg:1pa9Zh:w5vI53r--qJMk2tG9mmSaBBDYYHCPvVuZP6-Tw2YGU4', '2023-03-23 09:16:25.845416'),
('tuj85qm4dbja3oe9o1l5927ibu5ia1gu', '.eJxVjMsOwiAURP-FtSFcHhfapXu_gUC5WtRSU-jK-O-2SRea2c2cOW_mw9pGv1ZafE6sZ8BOv10Mw4PKPqR7KLeZD3NpS458R_ixVn6ZEz3PB_snGEMdtzc6i0KlLohAqLSTg1IxCFCkUUgXpUQ0CeCKWkQBZgtEOyQdSRgkuUsr1Zrn4nPJzbc8UW1hennWA9oOwBqFvAPtDOjPF_ICROc:1pdPAu:pkDr6MOxOakSxzC6t-FqDhdEfViKoy_rEV8p1qynQ9Q', '2023-04-01 08:32:16.923594');

-- --------------------------------------------------------

--
-- Table structure for table `errorlogs`
--

CREATE TABLE `errorlogs` (
  `id` bigint NOT NULL,
  `Username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Expected_error` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_error` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trace_back` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `line_number` int NOT NULL,
  `date_recorded` datetime(6) NOT NULL,
  `browser` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `errorlogs`
--

INSERT INTO `errorlogs` (`id`, `Username`, `Name`, `Expected_error`, `field_error`, `trace_back`, `line_number`, `date_recorded`, `browser`, `ip_address`, `user_agent`, `Avatar`) VALUES
(1, 'AD00001', 'Mohamud Abshir', '<class \'AttributeError\'>', '\'federal_state\' object has no attribute \'user\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/models.py\", line 78, in create_user\n    Users.save()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/contrib/auth/base_user.py\", line 68, in save\n    super().save(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 812, in save\n    self.save_base(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 863, in save_base\n    updated = self._save_table(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1006, in _save_table\n    results = self._do_insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1047, in _do_insert\n    return manager._insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1791, in _insert\n    return query.get_compiler(using=using).execute_sql(returning_fields)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1659, in execute_sql\n    for sql, params in self.as_sql():\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1583, in as_sql\n    value_rows = [\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1584, in <listcomp>\n    [\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1585, in <listcomp>\n    self.prepare_value(field, self.pre_save_val(field, obj))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1523, in prepare_value\n    value = field.get_db_prep_save(value, connection=self.connection)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 925, in get_db_prep_save\n    return self.get_db_prep_value(value, connection=connection, prepared=False)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 920, in get_db_prep_value\n    value = self.get_prep_value(value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 1093, in get_prep_value\n    return self.to_python(value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 1083, in to_python\n    raise exceptions.ValidationError(\ndjango.core.exceptions.ValidationError: [\"“<WSGIRequest: POST \'/manage_users/AddNewUser\'>” value must be either True or False.\"]\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 516, in ManageUsers\n    response = models.Users.create_user(\n  File \"/home/mhbaando/Documents/gaadiidka/Users/models.py\", line 82, in create_user\n    username = request.user.username\nAttributeError: \'federal_state\' object has no attribute \'user\'\n', 516, '2023-03-05 13:30:25.685661', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_IaXsnHT.jpeg'),
(2, 'AD00001', 'Mohamud Abshir', '<class \'AttributeError\'>', '\'federal_state\' object has no attribute \'user\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/models.py\", line 78, in create_user\n    Users.save()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/contrib/auth/base_user.py\", line 68, in save\n    super().save(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 812, in save\n    self.save_base(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 863, in save_base\n    updated = self._save_table(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1006, in _save_table\n    results = self._do_insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1047, in _do_insert\n    return manager._insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1791, in _insert\n    return query.get_compiler(using=using).execute_sql(returning_fields)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1659, in execute_sql\n    for sql, params in self.as_sql():\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1583, in as_sql\n    value_rows = [\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1584, in <listcomp>\n    [\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1585, in <listcomp>\n    self.prepare_value(field, self.pre_save_val(field, obj))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1523, in prepare_value\n    value = field.get_db_prep_save(value, connection=self.connection)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 925, in get_db_prep_save\n    return self.get_db_prep_value(value, connection=connection, prepared=False)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 920, in get_db_prep_value\n    value = self.get_prep_value(value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 1093, in get_prep_value\n    return self.to_python(value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 1083, in to_python\n    raise exceptions.ValidationError(\ndjango.core.exceptions.ValidationError: [\"“<WSGIRequest: POST \'/manage_users/AddNewUser\'>” value must be either True or False.\"]\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 515, in ManageUsers\n    response = models.Users.create_user(\n  File \"/home/mhbaando/Documents/gaadiidka/Users/models.py\", line 82, in create_user\n    username = request.user.username\nAttributeError: \'federal_state\' object has no attribute \'user\'\n', 515, '2023-03-05 13:37:34.752375', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_IaXsnHT.jpeg'),
(3, 'AD00001', 'Mohamud Abshir', '<class \'AttributeError\'>', '\'int\' object has no attribute \'user\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/models.py\", line 78, in create_user\n    Users.save()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/contrib/auth/base_user.py\", line 68, in save\n    super().save(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 812, in save\n    self.save_base(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 863, in save_base\n    updated = self._save_table(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1006, in _save_table\n    results = self._do_insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1047, in _do_insert\n    return manager._insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1791, in _insert\n    return query.get_compiler(using=using).execute_sql(returning_fields)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1659, in execute_sql\n    for sql, params in self.as_sql():\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1583, in as_sql\n    value_rows = [\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1584, in <listcomp>\n    [\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1585, in <listcomp>\n    self.prepare_value(field, self.pre_save_val(field, obj))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1523, in prepare_value\n    value = field.get_db_prep_save(value, connection=self.connection)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 925, in get_db_prep_save\n    return self.get_db_prep_value(value, connection=connection, prepared=False)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 920, in get_db_prep_value\n    value = self.get_prep_value(value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 1093, in get_prep_value\n    return self.to_python(value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 1083, in to_python\n    raise exceptions.ValidationError(\ndjango.core.exceptions.ValidationError: [\"“<WSGIRequest: POST \'/manage_users/AddNewUser\'>” value must be either True or False.\"]\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 515, in ManageUsers\n    response = models.Users.create_user(\n  File \"/home/mhbaando/Documents/gaadiidka/Users/models.py\", line 82, in create_user\n    username = request.user.username\nAttributeError: \'int\' object has no attribute \'user\'\n', 515, '2023-03-05 13:38:34.875840', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_IaXsnHT.jpeg'),
(4, 'AD00001', 'Mohamud Abshir', '<class \'AttributeError\'>', '\'int\' object has no attribute \'user\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/models.py\", line 78, in create_user\n    Users.save()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/contrib/auth/base_user.py\", line 68, in save\n    super().save(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 812, in save\n    self.save_base(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 863, in save_base\n    updated = self._save_table(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1006, in _save_table\n    results = self._do_insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1047, in _do_insert\n    return manager._insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1791, in _insert\n    return query.get_compiler(using=using).execute_sql(returning_fields)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1659, in execute_sql\n    for sql, params in self.as_sql():\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1583, in as_sql\n    value_rows = [\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1584, in <listcomp>\n    [\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1585, in <listcomp>\n    self.prepare_value(field, self.pre_save_val(field, obj))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1523, in prepare_value\n    value = field.get_db_prep_save(value, connection=self.connection)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 925, in get_db_prep_save\n    return self.get_db_prep_value(value, connection=connection, prepared=False)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 920, in get_db_prep_value\n    value = self.get_prep_value(value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 1093, in get_prep_value\n    return self.to_python(value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 1083, in to_python\n    raise exceptions.ValidationError(\ndjango.core.exceptions.ValidationError: [\"“<WSGIRequest: POST \'/manage_users/AddNewUser\'>” value must be either True or False.\"]\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 515, in ManageUsers\n    response = models.Users.create_user(\n  File \"/home/mhbaando/Documents/gaadiidka/Users/models.py\", line 82, in create_user\n    username = request.user.username\nAttributeError: \'int\' object has no attribute \'user\'\n', 515, '2023-03-05 13:39:50.431813', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_IaXsnHT.jpeg'),
(5, 'AD00001', 'Mohamud Abshir', '<class \'AttributeError\'>', '\'int\' object has no attribute \'user\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/models.py\", line 78, in create_user\n    Users.save()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/contrib/auth/base_user.py\", line 68, in save\n    super().save(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 812, in save\n    self.save_base(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 863, in save_base\n    updated = self._save_table(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1006, in _save_table\n    results = self._do_insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1047, in _do_insert\n    return manager._insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1791, in _insert\n    return query.get_compiler(using=using).execute_sql(returning_fields)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1659, in execute_sql\n    for sql, params in self.as_sql():\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1583, in as_sql\n    value_rows = [\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1584, in <listcomp>\n    [\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1585, in <listcomp>\n    self.prepare_value(field, self.pre_save_val(field, obj))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1523, in prepare_value\n    value = field.get_db_prep_save(value, connection=self.connection)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 925, in get_db_prep_save\n    return self.get_db_prep_value(value, connection=connection, prepared=False)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 920, in get_db_prep_value\n    value = self.get_prep_value(value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 1093, in get_prep_value\n    return self.to_python(value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 1083, in to_python\n    raise exceptions.ValidationError(\ndjango.core.exceptions.ValidationError: [\"“<WSGIRequest: POST \'/manage_users/AddNewUser\'>” value must be either True or False.\"]\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 515, in ManageUsers\n    response = models.Users.create_user(\n  File \"/home/mhbaando/Documents/gaadiidka/Users/models.py\", line 82, in create_user\n    username = request.user.username\nAttributeError: \'int\' object has no attribute \'user\'\n', 515, '2023-03-05 13:44:18.375225', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_IaXsnHT.jpeg'),
(6, 'AD0001', 'Mohamud Abshir', '<class \'AttributeError\'>', '\'int\' object has no attribute \'user\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/models.py\", line 78, in create_user\n    Users.save()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/contrib/auth/base_user.py\", line 68, in save\n    super().save(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 812, in save\n    self.save_base(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 863, in save_base\n    updated = self._save_table(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1006, in _save_table\n    results = self._do_insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1047, in _do_insert\n    return manager._insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1791, in _insert\n    return query.get_compiler(using=using).execute_sql(returning_fields)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1659, in execute_sql\n    for sql, params in self.as_sql():\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1583, in as_sql\n    value_rows = [\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1584, in <listcomp>\n    [\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1585, in <listcomp>\n    self.prepare_value(field, self.pre_save_val(field, obj))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1523, in prepare_value\n    value = field.get_db_prep_save(value, connection=self.connection)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 925, in get_db_prep_save\n    return self.get_db_prep_value(value, connection=connection, prepared=False)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 920, in get_db_prep_value\n    value = self.get_prep_value(value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 1093, in get_prep_value\n    return self.to_python(value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 1083, in to_python\n    raise exceptions.ValidationError(\ndjango.core.exceptions.ValidationError: [\"“<WSGIRequest: POST \'/manage_users/AddNewUser\'>” value must be either True or False.\"]\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 515, in ManageUsers\n    response = models.Users.create_user(\n  File \"/home/mhbaando/Documents/gaadiidka/Users/models.py\", line 82, in create_user\n    username = request.user.username\nAttributeError: \'int\' object has no attribute \'user\'\n', 515, '2023-03-05 13:45:07.768135', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_IaXsnHT.jpeg'),
(7, 'AD00001', 'Mohamud Abshir', '<class \'AttributeError\'>', '\'int\' object has no attribute \'user\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/models.py\", line 78, in create_user\n    Users.save()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/contrib/auth/base_user.py\", line 68, in save\n    super().save(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 812, in save\n    self.save_base(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 863, in save_base\n    updated = self._save_table(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1006, in _save_table\n    results = self._do_insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1047, in _do_insert\n    return manager._insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1791, in _insert\n    return query.get_compiler(using=using).execute_sql(returning_fields)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1659, in execute_sql\n    for sql, params in self.as_sql():\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1583, in as_sql\n    value_rows = [\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1584, in <listcomp>\n    [\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1585, in <listcomp>\n    self.prepare_value(field, self.pre_save_val(field, obj))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1523, in prepare_value\n    value = field.get_db_prep_save(value, connection=self.connection)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 925, in get_db_prep_save\n    return self.get_db_prep_value(value, connection=connection, prepared=False)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 920, in get_db_prep_value\n    value = self.get_prep_value(value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 1093, in get_prep_value\n    return self.to_python(value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 1083, in to_python\n    raise exceptions.ValidationError(\ndjango.core.exceptions.ValidationError: [\"“<WSGIRequest: POST \'/manage_users/AddNewUser\'>” value must be either True or False.\"]\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 515, in ManageUsers\n    response = models.Users.create_user(\n  File \"/home/mhbaando/Documents/gaadiidka/Users/models.py\", line 82, in create_user\n    username = request.user.username\nAttributeError: \'int\' object has no attribute \'user\'\n', 515, '2023-03-05 13:46:34.842977', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_IaXsnHT.jpeg'),
(8, 'AD00001', 'Mohamud Abshir', '<class \'ValueError\'>', 'Field \'state_id\' expected a number but got \'Select State\'.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 2018, in get_prep_value\n    return int(value)\nValueError: invalid literal for int() with base 10: \'Select State\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 356, in ManageUsers\n    federal_state = customer_model.federal_state.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1478, in build_filter\n    condition = self.build_lookup(lookups, col, value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1303, in build_lookup\n    lookup = lookup_class(lhs, rhs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 27, in __init__\n    self.rhs = self.get_prep_lookup()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 341, in get_prep_lookup\n    return super().get_prep_lookup()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 85, in get_prep_lookup\n    return self.lhs.output_field.get_prep_value(self.rhs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 2020, in get_prep_value\n    raise e.__class__(\nValueError: Field \'state_id\' expected a number but got \'Select State\'.\n', 356, '2023-03-05 13:55:36.473455', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_IaXsnHT.jpeg'),
(9, 'AD00001', 'Mohamud Abshir', '<class \'TypeError\'>', 'Users.create_user() missing 1 required positional argument: \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 537, in ManageUsers\n    response = models.Users.create_user(\nTypeError: Users.create_user() missing 1 required positional argument: \'request\'\n', 537, '2023-03-05 13:58:34.816496', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_IaXsnHT.jpeg'),
(10, 'AD00001', 'Mohamud Abshir', '<class \'TypeError\'>', 'Users.create_user() missing 1 required positional argument: \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 537, in ManageUsers\n    response = models.Users.create_user(\nTypeError: Users.create_user() missing 1 required positional argument: \'request\'\n', 537, '2023-03-05 13:59:35.656396', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_IaXsnHT.jpeg'),
(11, 'AD00001', 'Mohamud Abshir', '<class \'AttributeError\'>', '\'federal_state\' object has no attribute \'user\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/models.py\", line 78, in create_user\n    Users.save()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/contrib/auth/base_user.py\", line 68, in save\n    super().save(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 812, in save\n    self.save_base(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 863, in save_base\n    updated = self._save_table(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1006, in _save_table\n    results = self._do_insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1047, in _do_insert\n    return manager._insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1791, in _insert\n    return query.get_compiler(using=using).execute_sql(returning_fields)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1659, in execute_sql\n    for sql, params in self.as_sql():\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1583, in as_sql\n    value_rows = [\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1584, in <listcomp>\n    [\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1585, in <listcomp>\n    self.prepare_value(field, self.pre_save_val(field, obj))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1523, in prepare_value\n    value = field.get_db_prep_save(value, connection=self.connection)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 925, in get_db_prep_save\n    return self.get_db_prep_value(value, connection=connection, prepared=False)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 920, in get_db_prep_value\n    value = self.get_prep_value(value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 1093, in get_prep_value\n    return self.to_python(value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 1083, in to_python\n    raise exceptions.ValidationError(\ndjango.core.exceptions.ValidationError: [\"“<WSGIRequest: POST \'/manage_users/AddNewUser\'>” value must be either True or False.\"]\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 515, in ManageUsers\n    response = models.Users.create_user(\n  File \"/home/mhbaando/Documents/gaadiidka/Users/models.py\", line 82, in create_user\n    username = request.user.username\nAttributeError: \'federal_state\' object has no attribute \'user\'\n', 515, '2023-03-05 14:00:29.523194', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_IaXsnHT.jpeg'),
(12, 'AD00001', 'Mohamud Abshir', '<class \'ValueError\'>', 'Cannot assign \"\'1\'\": \"Users.federal_state\" must be a \"federal_state\" instance.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 517, in ManageUsers\n    User = models.Users(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 541, in __init__\n    _setattr(self, field.name, rel_obj)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/related_descriptors.py\", line 237, in __set__\n    raise ValueError(\nValueError: Cannot assign \"\'1\'\": \"Users.federal_state\" must be a \"federal_state\" instance.\n', 517, '2023-03-05 14:07:03.464524', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_IaXsnHT.jpeg'),
(13, 'AD00001', 'Xassen Abshir', '<class \'django.core.exceptions.FieldError\'>', 'Related Field got invalid lookup: rv_num', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Vehicles/views.py\", line 71, in register_vehicle\n    isvoucer_in_liscence = customer_model.license.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1478, in build_filter\n    condition = self.build_lookup(lookups, col, value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1292, in build_lookup\n    raise FieldError(\ndjango.core.exceptions.FieldError: Related Field got invalid lookup: rv_num\n', 71, '2023-03-06 09:30:07.014310', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(14, 'AD00001', 'Xassen Abshir', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'rv_num\' into field. Choices are: created_at, modified_at, reason, receipt_voucher, reg_user, reg_user_id, rv_amount, rv_from, rv_from_id, rv_id, rv_number', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Vehicles/views.py\", line 59, in register_vehicle\n    found_rv = finance_model.receipt_voucher.objects.filter(Q(rv_num = rv_num)).first()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'rv_num\' into field. Choices are: created_at, modified_at, reason, receipt_voucher, reg_user, reg_user_id, rv_amount, rv_from, rv_from_id, rv_id, rv_number\n', 59, '2023-03-06 09:52:53.877519', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(15, 'AD00001', 'Xassen Abshir', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'rv_num\' into field. Choices are: created_at, modified_at, reason, receipt_voucher, reg_user, reg_user_id, rv_amount, rv_from, rv_from_id, rv_id, rv_number', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Vehicles/views.py\", line 59, in register_vehicle\n    found_rv = finance_model.receipt_voucher.objects.filter(Q(rv_num = rv_num)).first()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'rv_num\' into field. Choices are: created_at, modified_at, reason, receipt_voucher, reg_user, reg_user_id, rv_amount, rv_from, rv_from_id, rv_id, rv_number\n', 59, '2023-03-06 09:53:58.532608', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(16, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'Method\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 21, in register_customer\n    if request.Method == \'GET\':\nAttributeError: \'WSGIRequest\' object has no attribute \'Method\'\n', 21, '2023-03-08 11:38:49.697389', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(17, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'Method\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 21, in register_customer\n    if request.Method == \'GET\':\nAttributeError: \'WSGIRequest\' object has no attribute \'Method\'\n', 21, '2023-03-08 11:39:20.441626', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(18, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'Method\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 21, in register_customer\n    if request.Method == \'GET\':\nAttributeError: \'WSGIRequest\' object has no attribute \'Method\'\n', 21, '2023-03-08 11:39:20.993602', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(19, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'Method\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 21, in register_customer\n    if request.Method == \'GET\':\nAttributeError: \'WSGIRequest\' object has no attribute \'Method\'\n', 21, '2023-03-08 11:39:24.324132', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(20, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'Method\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 21, in register_customer\n    if request.Method == \'GET\':\nAttributeError: \'WSGIRequest\' object has no attribute \'Method\'\n', 21, '2023-03-08 11:39:28.315136', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(21, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'Method\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 21, in register_customer\n    if request.Method == \'GET\':\nAttributeError: \'WSGIRequest\' object has no attribute \'Method\'\n', 21, '2023-03-08 11:39:44.999440', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(22, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'Method\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 22, in register_customer\n    if request.Method == \'GET\':\nAttributeError: \'WSGIRequest\' object has no attribute \'Method\'\n', 22, '2023-03-08 11:41:13.467348', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(23, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'Method\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 22, in register_customer\n    if request.Method == \'GET\':\nAttributeError: \'WSGIRequest\' object has no attribute \'Method\'\n', 22, '2023-03-08 11:41:14.014668', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(24, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'Method\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 22, in register_customer\n    if request.Method == \'GET\':\nAttributeError: \'WSGIRequest\' object has no attribute \'Method\'\n', 22, '2023-03-08 11:41:14.194399', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(25, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'Method\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 22, in register_customer\n    if request.Method == \'GET\':\nAttributeError: \'WSGIRequest\' object has no attribute \'Method\'\n', 22, '2023-03-08 11:41:14.333466', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(26, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'Method\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 22, in register_customer\n    if request.Method == \'GET\':\nAttributeError: \'WSGIRequest\' object has no attribute \'Method\'\n', 22, '2023-03-08 11:41:14.563003', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(27, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'Method\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 22, in register_customer\n    if request.Method == \'GET\':\nAttributeError: \'WSGIRequest\' object has no attribute \'Method\'\n', 22, '2023-03-08 11:41:14.801671', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(28, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'Method\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 22, in register_customer\n    if request.Method == \'GET\':\nAttributeError: \'WSGIRequest\' object has no attribute \'Method\'\n', 22, '2023-03-08 11:41:14.960242', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg');
INSERT INTO `errorlogs` (`id`, `Username`, `Name`, `Expected_error`, `field_error`, `trace_back`, `line_number`, `date_recorded`, `browser`, `ip_address`, `user_agent`, `Avatar`) VALUES
(29, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'Method\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 22, in register_customer\n    if request.Method == \'POST\':\nAttributeError: \'WSGIRequest\' object has no attribute \'Method\'\n', 22, '2023-03-08 11:42:30.707112', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(30, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'QuerySet\' object has no attribute \'full_name\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 423, in find_customer\n    f\'waxa uu raadiyay {customer.full_name}\')\nAttributeError: \'QuerySet\' object has no attribute \'full_name\'\n', 423, '2023-03-08 12:43:07.055792', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(31, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'QuerySet\' object has no attribute \'full_name\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 423, in find_customer\n    f\'waxa uu raadiyay {customer.full_name}\')\nAttributeError: \'QuerySet\' object has no attribute \'full_name\'\n', 423, '2023-03-08 12:43:18.737008', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(32, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'QuerySet\' object has no attribute \'full_name\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 423, in find_customer\n    f\'waxa uu raadiyay {customer.full_name}\')\nAttributeError: \'QuerySet\' object has no attribute \'full_name\'\n', 423, '2023-03-08 12:43:22.969631', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(33, 'AD00003', 'Aziza Raage', '<class \'AttributeError\'>', '\'QuerySet\' object has no attribute \'full_name\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 423, in find_customer\n    f\'waxa uu raadiyay {customer.full_name}\')\nAttributeError: \'QuerySet\' object has no attribute \'full_name\'\n', 423, '2023-03-08 12:44:34.031946', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(34, 'AD00003', 'Aziza Raage', '<class \'AttributeError\'>', '\'QuerySet\' object has no attribute \'full_name\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 423, in find_customer\n    f\'waxa uu raadiyay {customer.full_name}\')\nAttributeError: \'QuerySet\' object has no attribute \'full_name\'\n', 423, '2023-03-08 12:44:46.179083', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(35, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'QuerySet\' object has no attribute \'full_name\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 423, in find_customer\n    f\'waxa uu raadiyay {customer.full_name}\')\nAttributeError: \'QuerySet\' object has no attribute \'full_name\'\n', 423, '2023-03-08 12:47:14.301681', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(36, 'AD00003', 'Aziza Raage', '<class \'AttributeError\'>', '\'QuerySet\' object has no attribute \'full_name\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 423, in find_customer\n    f\'waxa uu raadiyay {customer.full_name}\')\nAttributeError: \'QuerySet\' object has no attribute \'full_name\'\n', 423, '2023-03-08 12:47:35.895932', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(37, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'QuerySet\' object has no attribute \'full_name\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 423, in find_customer\n    f\'waxa uu raadiyay {customer.full_name}\')\nAttributeError: \'QuerySet\' object has no attribute \'full_name\'\n', 423, '2023-03-08 12:51:53.675009', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(38, 'AD00003', 'Aziza Raage', '<class \'AttributeError\'>', '\'NoneType\' object has no attribute \'full_name\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 393, in customer_profile\n    f\'Waxa ubooqday profileka {customer.full_name}\')\nAttributeError: \'NoneType\' object has no attribute \'full_name\'\n', 393, '2023-03-08 13:45:54.198004', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(39, 'AD00003', 'Aziza Raage', '<class \'AttributeError\'>', '\'NoneType\' object has no attribute \'full_name\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 393, in customer_profile\n    f\'Waxa ubooqday profileka {customer.full_name}\')\nAttributeError: \'NoneType\' object has no attribute \'full_name\'\n', 393, '2023-03-08 13:46:00.439276', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(40, 'AD00003', 'Aziza Raage', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 33, in Dashboard\n    vehicle_count = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 33, '2023-03-08 14:08:10.531900', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(41, 'AD00003', 'Aziza Raage', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 33, in Dashboard\n    vehicle_count = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 33, '2023-03-08 14:08:19.082279', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(42, 'AD00003', 'Aziza Raage', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 33, in Dashboard\n    vehicle_count = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 33, '2023-03-08 14:08:21.025840', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(43, 'AD00003', 'Aziza Raage', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 33, in Dashboard\n    vehicle_count = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 33, '2023-03-08 14:08:21.442411', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(44, 'AD00003', 'Aziza Raage', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 33, in Dashboard\n    vehicle_count = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 33, '2023-03-08 14:08:21.594342', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(45, 'AD00003', 'Aziza Raage', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 34, in Dashboard\n    vehicle_count = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 34, '2023-03-08 14:08:54.392679', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(46, 'AD00003', 'Aziza Raage', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 34, in Dashboard\n    vehicle_count = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 34, '2023-03-08 14:08:54.863065', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(47, 'AD00003', 'Aziza Raage', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 34, in Dashboard\n    vehicle_count = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 34, '2023-03-08 14:08:55.056878', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(48, 'AD00003', 'Aziza Raage', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 34, in Dashboard\n    vehicle_count = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 34, '2023-03-08 14:08:55.198897', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(49, 'AD00003', 'Aziza Raage', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 34, in Dashboard\n    vehicle_count = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'federal_state\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 34, '2023-03-08 14:08:55.376453', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(50, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if request.request.has_perm(\'activate_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-12 09:45:42.750258', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(51, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if request.request.has_perm(\'activate_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-12 09:49:15.935247', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(52, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if request.request.has_perm(\'activate_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-12 09:50:06.140196', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(53, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if request.request.has_perm(\'activate_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-13 10:11:11.095138', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(54, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if request.request.has_perm(\'activate_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-13 10:12:57.854082', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(55, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if request.request.has_perm(\'activate_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-13 10:13:08.617662', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(56, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if request.request.has_perm(\'activates_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-13 10:14:38.952557', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(57, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if request.request.has_perm(\'activate_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-13 10:20:08.740615', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(58, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if request.request.has_perm(\'activate_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-13 10:21:26.808251', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(59, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if request.request.has_perm(\'Customers.activate_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-13 10:27:30.674574', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(60, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if not request.request.has_perm(\'Customers.activate_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-13 10:36:06.246859', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(61, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if request.request.has_perm(\'Customerss.activate_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-13 10:36:28.132555', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(62, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if request.request.has_perm(\'Customerss.activate_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-13 10:38:36.389927', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(63, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if request.request.has_perm(\'Customerss.activate_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-13 10:38:44.750238', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(64, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if request.request.has_perm(\'Customerss.activate_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-13 10:40:03.785044', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(65, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if request.request.has_perm(\'Customers.activate_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-13 10:40:57.156310', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(66, 'AD00001', 'Xassen Abshir', '<class \'AttributeError\'>', '\'WSGIRequest\' object has no attribute \'request\'', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/customer.py\", line 163, in activate_customer\n    if request.request.has_perm(\'Customers.activate_customer\'):\nAttributeError: \'WSGIRequest\' object has no attribute \'request\'\n', 163, '2023-03-13 10:41:17.830369', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(67, 'AD00001', 'Xassen Abshir', '<class \'TypeError\'>', '\'int\' object is not callable', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Vehicles/views.py\", line 29, in register_vehicle\n    for i in range(1960, datetime.now().year() + 1):\nTypeError: \'int\' object is not callable\n', 29, '2023-03-13 10:52:11.175200', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg');
INSERT INTO `errorlogs` (`id`, `Username`, `Name`, `Expected_error`, `field_error`, `trace_back`, `line_number`, `date_recorded`, `browser`, `ip_address`, `user_agent`, `Avatar`) VALUES
(68, 'AD00001', 'Xassen Abshir', '<class \'django.db.utils.IntegrityError\'>', '(1048, \"Column \'rv_from_id\' cannot be null\")', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/mysql/base.py\", line 75, in execute\n    return self.cursor.execute(query, args)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/MySQLdb/cursors.py\", line 206, in execute\n    res = self._query(query)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/MySQLdb/cursors.py\", line 319, in _query\n    db.query(q)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/MySQLdb/connections.py\", line 254, in query\n    _mysql.connection.query(self, query)\nMySQLdb.OperationalError: (1048, \"Column \'rv_from_id\' cannot be null\")\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Finance/views.py\", line 509, in savereciept\n    new_reciet.save()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 812, in save\n    self.save_base(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 863, in save_base\n    updated = self._save_table(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1006, in _save_table\n    results = self._do_insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1047, in _do_insert\n    return manager._insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1791, in _insert\n    return query.get_compiler(using=using).execute_sql(returning_fields)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1660, in execute_sql\n    cursor.execute(sql, params)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/utils.py\", line 103, in execute\n    return super().execute(sql, params)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/utils.py\", line 67, in execute\n    return self._execute_with_wrappers(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/utils.py\", line 80, in _execute_with_wrappers\n    return executor(sql, params, many, context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/utils.py\", line 89, in _execute\n    return self.cursor.execute(sql, params)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/mysql/base.py\", line 80, in execute\n    raise IntegrityError(*tuple(e.args))\ndjango.db.utils.IntegrityError: (1048, \"Column \'rv_from_id\' cannot be null\")\n', 509, '2023-03-13 11:18:18.888643', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(69, 'AD00001', 'Xassen Abshir', '<class \'django.db.utils.IntegrityError\'>', '(1048, \"Column \'rv_from_id\' cannot be null\")', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/mysql/base.py\", line 75, in execute\n    return self.cursor.execute(query, args)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/MySQLdb/cursors.py\", line 206, in execute\n    res = self._query(query)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/MySQLdb/cursors.py\", line 319, in _query\n    db.query(q)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/MySQLdb/connections.py\", line 254, in query\n    _mysql.connection.query(self, query)\nMySQLdb.OperationalError: (1048, \"Column \'rv_from_id\' cannot be null\")\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Finance/views.py\", line 509, in savereciept\n    new_reciet.save()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 812, in save\n    self.save_base(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 863, in save_base\n    updated = self._save_table(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1006, in _save_table\n    results = self._do_insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1047, in _do_insert\n    return manager._insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1791, in _insert\n    return query.get_compiler(using=using).execute_sql(returning_fields)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1660, in execute_sql\n    cursor.execute(sql, params)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/utils.py\", line 103, in execute\n    return super().execute(sql, params)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/utils.py\", line 67, in execute\n    return self._execute_with_wrappers(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/utils.py\", line 80, in _execute_with_wrappers\n    return executor(sql, params, many, context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/utils.py\", line 89, in _execute\n    return self.cursor.execute(sql, params)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/mysql/base.py\", line 80, in execute\n    raise IntegrityError(*tuple(e.args))\ndjango.db.utils.IntegrityError: (1048, \"Column \'rv_from_id\' cannot be null\")\n', 509, '2023-03-13 11:18:18.950973', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(70, 'AD00001', 'Xassen Abshir', '<class \'django.db.utils.IntegrityError\'>', '(1048, \"Column \'rv_from_id\' cannot be null\")', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/mysql/base.py\", line 75, in execute\n    return self.cursor.execute(query, args)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/MySQLdb/cursors.py\", line 206, in execute\n    res = self._query(query)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/MySQLdb/cursors.py\", line 319, in _query\n    db.query(q)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/MySQLdb/connections.py\", line 254, in query\n    _mysql.connection.query(self, query)\nMySQLdb.OperationalError: (1048, \"Column \'rv_from_id\' cannot be null\")\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Finance/views.py\", line 509, in savereciept\n    new_reciet.save()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 812, in save\n    self.save_base(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 863, in save_base\n    updated = self._save_table(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1006, in _save_table\n    results = self._do_insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1047, in _do_insert\n    return manager._insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1791, in _insert\n    return query.get_compiler(using=using).execute_sql(returning_fields)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1660, in execute_sql\n    cursor.execute(sql, params)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/utils.py\", line 103, in execute\n    return super().execute(sql, params)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/utils.py\", line 67, in execute\n    return self._execute_with_wrappers(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/utils.py\", line 80, in _execute_with_wrappers\n    return executor(sql, params, many, context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/utils.py\", line 89, in _execute\n    return self.cursor.execute(sql, params)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/mysql/base.py\", line 80, in execute\n    raise IntegrityError(*tuple(e.args))\ndjango.db.utils.IntegrityError: (1048, \"Column \'rv_from_id\' cannot be null\")\n', 509, '2023-03-13 11:18:18.976634', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(71, 'AD00001', 'Xassen Abshir', '<class \'django.db.utils.IntegrityError\'>', '(1048, \"Column \'rv_from_id\' cannot be null\")', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/mysql/base.py\", line 75, in execute\n    return self.cursor.execute(query, args)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/MySQLdb/cursors.py\", line 206, in execute\n    res = self._query(query)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/MySQLdb/cursors.py\", line 319, in _query\n    db.query(q)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/MySQLdb/connections.py\", line 254, in query\n    _mysql.connection.query(self, query)\nMySQLdb.OperationalError: (1048, \"Column \'rv_from_id\' cannot be null\")\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Finance/views.py\", line 509, in savereciept\n    new_reciet.save()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 812, in save\n    self.save_base(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 863, in save_base\n    updated = self._save_table(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1006, in _save_table\n    results = self._do_insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/base.py\", line 1047, in _do_insert\n    return manager._insert(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1791, in _insert\n    return query.get_compiler(using=using).execute_sql(returning_fields)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1660, in execute_sql\n    cursor.execute(sql, params)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/utils.py\", line 103, in execute\n    return super().execute(sql, params)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/utils.py\", line 67, in execute\n    return self._execute_with_wrappers(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/utils.py\", line 80, in _execute_with_wrappers\n    return executor(sql, params, many, context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/utils.py\", line 89, in _execute\n    return self.cursor.execute(sql, params)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/backends/mysql/base.py\", line 80, in execute\n    raise IntegrityError(*tuple(e.args))\ndjango.db.utils.IntegrityError: (1048, \"Column \'rv_from_id\' cannot be null\")\n', 509, '2023-03-13 11:18:19.000185', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(72, 'AD00001', 'Xassen Abshir', '<class \'ValueError\'>', 'Field \'place_id\' expected a number but got \'Select A place\'.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 2018, in get_prep_value\n    return int(value)\nValueError: invalid literal for int() with base 10: \'Select A place\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/license.py\", line 493, in edit_liscence\n    lis_place = customer_model.placeissue.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1478, in build_filter\n    condition = self.build_lookup(lookups, col, value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1303, in build_lookup\n    lookup = lookup_class(lhs, rhs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 27, in __init__\n    self.rhs = self.get_prep_lookup()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 341, in get_prep_lookup\n    return super().get_prep_lookup()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 85, in get_prep_lookup\n    return self.lhs.output_field.get_prep_value(self.rhs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 2020, in get_prep_value\n    raise e.__class__(\nValueError: Field \'place_id\' expected a number but got \'Select A place\'.\n', 493, '2023-03-13 13:45:44.672213', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(73, 'AD00001', 'Xassen Abshir', '<class \'ValueError\'>', 'Field \'customer_id\' expected a number but got \'Cali  Maxamed Xassen Afrax\'.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 2018, in get_prep_value\n    return int(value)\nValueError: invalid literal for int() with base 10: \'Cali  Maxamed Xassen Afrax\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/license.py\", line 512, in edit_liscence\n    lis_owne = customer_model.customer.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1478, in build_filter\n    condition = self.build_lookup(lookups, col, value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1303, in build_lookup\n    lookup = lookup_class(lhs, rhs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 27, in __init__\n    self.rhs = self.get_prep_lookup()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 341, in get_prep_lookup\n    return super().get_prep_lookup()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 85, in get_prep_lookup\n    return self.lhs.output_field.get_prep_value(self.rhs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 2020, in get_prep_value\n    raise e.__class__(\nValueError: Field \'customer_id\' expected a number but got \'Cali  Maxamed Xassen Afrax\'.\n', 512, '2023-03-13 14:34:08.317914', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(74, 'AD00001', 'Xassen Abshir', '<class \'ValueError\'>', 'Field \'customer_id\' expected a number but got \'Cali  Maxamed Xassen Afrax\'.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 2018, in get_prep_value\n    return int(value)\nValueError: invalid literal for int() with base 10: \'Cali  Maxamed Xassen Afrax\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/license.py\", line 512, in edit_liscence\n    lis_owne = customer_model.customer.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1478, in build_filter\n    condition = self.build_lookup(lookups, col, value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1303, in build_lookup\n    lookup = lookup_class(lhs, rhs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 27, in __init__\n    self.rhs = self.get_prep_lookup()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 341, in get_prep_lookup\n    return super().get_prep_lookup()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 85, in get_prep_lookup\n    return self.lhs.output_field.get_prep_value(self.rhs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 2020, in get_prep_value\n    raise e.__class__(\nValueError: Field \'customer_id\' expected a number but got \'Cali  Maxamed Xassen Afrax\'.\n', 512, '2023-03-13 14:36:35.469969', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(75, 'AD00001', 'XassenAbshir', '<class \'ValueError\'>', 'Cannot assign \"\'P00702709\'\": \"receipt_voucher.rv_from\" must be a \"customer\" instance.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Finance/views.py\", line 605, in update_reviept\n    rv.rv_from = rcfrom\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/related_descriptors.py\", line 237, in __set__\n    raise ValueError(\nValueError: Cannot assign \"\'P00702709\'\": \"receipt_voucher.rv_from\" must be a \"customer\" instance.\n', 605, '2023-03-14 12:16:41.048414', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(76, 'AD00003', 'Aziza Raage', '<class \'ValueError\'>', 'Field \'place_id\' expected a number but got \'Select A place\'.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 2018, in get_prep_value\n    return int(value)\nValueError: invalid literal for int() with base 10: \'Select A place\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/license.py\", line 503, in edit_liscence\n    lis_place = customer_model.placeissue.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1478, in build_filter\n    condition = self.build_lookup(lookups, col, value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1303, in build_lookup\n    lookup = lookup_class(lhs, rhs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 27, in __init__\n    self.rhs = self.get_prep_lookup()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 341, in get_prep_lookup\n    return super().get_prep_lookup()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 85, in get_prep_lookup\n    return self.lhs.output_field.get_prep_value(self.rhs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 2020, in get_prep_value\n    raise e.__class__(\nValueError: Field \'place_id\' expected a number but got \'Select A place\'.\n', 503, '2023-03-14 12:37:23.202639', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(77, 'AD00003', 'Aziza Raage', '<class \'ValueError\'>', 'Field \'place_id\' expected a number but got \'Select A place\'.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 2018, in get_prep_value\n    return int(value)\nValueError: invalid literal for int() with base 10: \'Select A place\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/license.py\", line 503, in edit_liscence\n    lis_place = customer_model.placeissue.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1478, in build_filter\n    condition = self.build_lookup(lookups, col, value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1303, in build_lookup\n    lookup = lookup_class(lhs, rhs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 27, in __init__\n    self.rhs = self.get_prep_lookup()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 341, in get_prep_lookup\n    return super().get_prep_lookup()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 85, in get_prep_lookup\n    return self.lhs.output_field.get_prep_value(self.rhs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 2020, in get_prep_value\n    raise e.__class__(\nValueError: Field \'place_id\' expected a number but got \'Select A place\'.\n', 503, '2023-03-14 12:38:26.800057', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(78, 'AD00003', 'Aziza Raage', '<class \'ValueError\'>', 'Field \'place_id\' expected a number but got \'Select A place\'.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 2018, in get_prep_value\n    return int(value)\nValueError: invalid literal for int() with base 10: \'Select A place\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/license.py\", line 503, in edit_liscence\n    lis_place = customer_model.placeissue.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1478, in build_filter\n    condition = self.build_lookup(lookups, col, value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1303, in build_lookup\n    lookup = lookup_class(lhs, rhs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 27, in __init__\n    self.rhs = self.get_prep_lookup()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 341, in get_prep_lookup\n    return super().get_prep_lookup()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 85, in get_prep_lookup\n    return self.lhs.output_field.get_prep_value(self.rhs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 2020, in get_prep_value\n    raise e.__class__(\nValueError: Field \'place_id\' expected a number but got \'Select A place\'.\n', 503, '2023-03-14 12:41:46.945757', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(79, 'AD00003', 'Aziza Raage', '<class \'ValueError\'>', 'Field \'place_id\' expected a number but got \'Select A place\'.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 2018, in get_prep_value\n    return int(value)\nValueError: invalid literal for int() with base 10: \'Select A place\'\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Customers/license.py\", line 503, in edit_liscence\n    lis_place = customer_model.placeissue.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1478, in build_filter\n    condition = self.build_lookup(lookups, col, value)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1303, in build_lookup\n    lookup = lookup_class(lhs, rhs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 27, in __init__\n    self.rhs = self.get_prep_lookup()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 341, in get_prep_lookup\n    return super().get_prep_lookup()\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/lookups.py\", line 85, in get_prep_lookup\n    return self.lhs.output_field.get_prep_value(self.rhs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/fields/__init__.py\", line 2020, in get_prep_value\n    raise e.__class__(\nValueError: Field \'place_id\' expected a number but got \'Select A place\'.\n', 503, '2023-03-14 12:41:52.518942', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_W2mnufr.jpeg'),
(80, 'AD00001', 'Xassen Abshir', '<class \'django.urls.exceptions.NoReverseMatch\'>', 'Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 70, in Dashboard\n    return render(request, \"dashboard.html\", context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/shortcuts.py\", line 24, in render\n    content = loader.render_to_string(template_name, context, request, using=using)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader.py\", line 62, in render_to_string\n    return template.render(context, request)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/backends/django.py\", line 62, in render\n    return self.template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 175, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 157, in render\n    return compiled_parent._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 208, in render\n    return template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 177, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/defaulttags.py\", line 472, in render\n    url = reverse(view_name, args=args, kwargs=kwargs, current_app=current_app)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/base.py\", line 88, in reverse\n    return resolver._reverse_with_prefix(view, prefix, *args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/resolvers.py\", line 828, in _reverse_with_prefix\n    raise NoReverseMatch(msg)\ndjango.urls.exceptions.NoReverseMatch: Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.\n', 70, '2023-03-15 10:25:21.119154', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(81, 'AD00001', 'Xassen Abshir', '<class \'django.urls.exceptions.NoReverseMatch\'>', 'Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 70, in Dashboard\n    return render(request, \"dashboard.html\", context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/shortcuts.py\", line 24, in render\n    content = loader.render_to_string(template_name, context, request, using=using)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader.py\", line 62, in render_to_string\n    return template.render(context, request)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/backends/django.py\", line 62, in render\n    return self.template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 175, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 157, in render\n    return compiled_parent._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 208, in render\n    return template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 177, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/defaulttags.py\", line 472, in render\n    url = reverse(view_name, args=args, kwargs=kwargs, current_app=current_app)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/base.py\", line 88, in reverse\n    return resolver._reverse_with_prefix(view, prefix, *args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/resolvers.py\", line 828, in _reverse_with_prefix\n    raise NoReverseMatch(msg)\ndjango.urls.exceptions.NoReverseMatch: Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.\n', 70, '2023-03-15 10:25:38.440301', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg');
INSERT INTO `errorlogs` (`id`, `Username`, `Name`, `Expected_error`, `field_error`, `trace_back`, `line_number`, `date_recorded`, `browser`, `ip_address`, `user_agent`, `Avatar`) VALUES
(82, 'AD00001', 'Xassen Abshir', '<class \'django.urls.exceptions.NoReverseMatch\'>', 'Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 70, in Dashboard\n    return render(request, \"dashboard.html\", context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/shortcuts.py\", line 24, in render\n    content = loader.render_to_string(template_name, context, request, using=using)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader.py\", line 62, in render_to_string\n    return template.render(context, request)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/backends/django.py\", line 62, in render\n    return self.template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 175, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 157, in render\n    return compiled_parent._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 208, in render\n    return template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 177, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/defaulttags.py\", line 472, in render\n    url = reverse(view_name, args=args, kwargs=kwargs, current_app=current_app)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/base.py\", line 88, in reverse\n    return resolver._reverse_with_prefix(view, prefix, *args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/resolvers.py\", line 828, in _reverse_with_prefix\n    raise NoReverseMatch(msg)\ndjango.urls.exceptions.NoReverseMatch: Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.\n', 70, '2023-03-15 10:25:40.153462', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(83, 'AD00001', 'Xassen Abshir', '<class \'django.urls.exceptions.NoReverseMatch\'>', 'Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 70, in Dashboard\n    return render(request, \"dashboard.html\", context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/shortcuts.py\", line 24, in render\n    content = loader.render_to_string(template_name, context, request, using=using)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader.py\", line 62, in render_to_string\n    return template.render(context, request)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/backends/django.py\", line 62, in render\n    return self.template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 175, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 157, in render\n    return compiled_parent._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 208, in render\n    return template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 177, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/defaulttags.py\", line 472, in render\n    url = reverse(view_name, args=args, kwargs=kwargs, current_app=current_app)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/base.py\", line 88, in reverse\n    return resolver._reverse_with_prefix(view, prefix, *args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/resolvers.py\", line 828, in _reverse_with_prefix\n    raise NoReverseMatch(msg)\ndjango.urls.exceptions.NoReverseMatch: Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.\n', 70, '2023-03-15 10:25:49.747059', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(84, 'AD00001', 'Xassen Abshir', '<class \'django.urls.exceptions.NoReverseMatch\'>', 'Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 70, in Dashboard\n    return render(request, \"dashboard.html\", context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/shortcuts.py\", line 24, in render\n    content = loader.render_to_string(template_name, context, request, using=using)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader.py\", line 62, in render_to_string\n    return template.render(context, request)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/backends/django.py\", line 62, in render\n    return self.template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 175, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 157, in render\n    return compiled_parent._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 208, in render\n    return template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 177, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/defaulttags.py\", line 472, in render\n    url = reverse(view_name, args=args, kwargs=kwargs, current_app=current_app)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/base.py\", line 88, in reverse\n    return resolver._reverse_with_prefix(view, prefix, *args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/resolvers.py\", line 828, in _reverse_with_prefix\n    raise NoReverseMatch(msg)\ndjango.urls.exceptions.NoReverseMatch: Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.\n', 70, '2023-03-15 10:25:50.173616', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(85, 'AD00001', 'Xassen Abshir', '<class \'django.urls.exceptions.NoReverseMatch\'>', 'Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 70, in Dashboard\n    return render(request, \"dashboard.html\", context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/shortcuts.py\", line 24, in render\n    content = loader.render_to_string(template_name, context, request, using=using)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader.py\", line 62, in render_to_string\n    return template.render(context, request)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/backends/django.py\", line 62, in render\n    return self.template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 175, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 157, in render\n    return compiled_parent._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 208, in render\n    return template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 177, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/defaulttags.py\", line 472, in render\n    url = reverse(view_name, args=args, kwargs=kwargs, current_app=current_app)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/base.py\", line 88, in reverse\n    return resolver._reverse_with_prefix(view, prefix, *args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/resolvers.py\", line 828, in _reverse_with_prefix\n    raise NoReverseMatch(msg)\ndjango.urls.exceptions.NoReverseMatch: Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.\n', 70, '2023-03-15 10:25:50.413344', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(86, 'AD00001', 'Xassen Abshir', '<class \'django.urls.exceptions.NoReverseMatch\'>', 'Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 70, in Dashboard\n    return render(request, \"dashboard.html\", context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/shortcuts.py\", line 24, in render\n    content = loader.render_to_string(template_name, context, request, using=using)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader.py\", line 62, in render_to_string\n    return template.render(context, request)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/backends/django.py\", line 62, in render\n    return self.template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 175, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 157, in render\n    return compiled_parent._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 208, in render\n    return template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 177, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/defaulttags.py\", line 472, in render\n    url = reverse(view_name, args=args, kwargs=kwargs, current_app=current_app)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/base.py\", line 88, in reverse\n    return resolver._reverse_with_prefix(view, prefix, *args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/resolvers.py\", line 828, in _reverse_with_prefix\n    raise NoReverseMatch(msg)\ndjango.urls.exceptions.NoReverseMatch: Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.\n', 70, '2023-03-15 10:25:50.602934', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(87, 'AD00001', 'Xassen Abshir', '<class \'django.urls.exceptions.NoReverseMatch\'>', 'Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 70, in Dashboard\n    return render(request, \"dashboard.html\", context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/shortcuts.py\", line 24, in render\n    content = loader.render_to_string(template_name, context, request, using=using)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader.py\", line 62, in render_to_string\n    return template.render(context, request)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/backends/django.py\", line 62, in render\n    return self.template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 175, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 157, in render\n    return compiled_parent._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 208, in render\n    return template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 177, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/defaulttags.py\", line 472, in render\n    url = reverse(view_name, args=args, kwargs=kwargs, current_app=current_app)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/base.py\", line 88, in reverse\n    return resolver._reverse_with_prefix(view, prefix, *args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/resolvers.py\", line 828, in _reverse_with_prefix\n    raise NoReverseMatch(msg)\ndjango.urls.exceptions.NoReverseMatch: Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.\n', 70, '2023-03-15 10:25:50.784801', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(88, 'AD00001', 'Xassen Abshir', '<class \'django.urls.exceptions.NoReverseMatch\'>', 'Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 70, in Dashboard\n    return render(request, \"dashboard.html\", context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/shortcuts.py\", line 24, in render\n    content = loader.render_to_string(template_name, context, request, using=using)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader.py\", line 62, in render_to_string\n    return template.render(context, request)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/backends/django.py\", line 62, in render\n    return self.template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 175, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 157, in render\n    return compiled_parent._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 208, in render\n    return template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 177, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/defaulttags.py\", line 472, in render\n    url = reverse(view_name, args=args, kwargs=kwargs, current_app=current_app)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/base.py\", line 88, in reverse\n    return resolver._reverse_with_prefix(view, prefix, *args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/resolvers.py\", line 828, in _reverse_with_prefix\n    raise NoReverseMatch(msg)\ndjango.urls.exceptions.NoReverseMatch: Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.\n', 70, '2023-03-15 10:25:56.048106', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(89, 'AD00001', 'Xassen Abshir', '<class \'django.urls.exceptions.NoReverseMatch\'>', 'Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 70, in Dashboard\n    return render(request, \"dashboard.html\", context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/shortcuts.py\", line 24, in render\n    content = loader.render_to_string(template_name, context, request, using=using)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader.py\", line 62, in render_to_string\n    return template.render(context, request)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/backends/django.py\", line 62, in render\n    return self.template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 175, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 157, in render\n    return compiled_parent._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 208, in render\n    return template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 177, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/defaulttags.py\", line 472, in render\n    url = reverse(view_name, args=args, kwargs=kwargs, current_app=current_app)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/base.py\", line 88, in reverse\n    return resolver._reverse_with_prefix(view, prefix, *args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/resolvers.py\", line 828, in _reverse_with_prefix\n    raise NoReverseMatch(msg)\ndjango.urls.exceptions.NoReverseMatch: Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.\n', 70, '2023-03-15 10:26:29.925591', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(90, 'AD00001', 'Xassen Abshir', '<class \'django.urls.exceptions.NoReverseMatch\'>', 'Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 70, in Dashboard\n    return render(request, \"dashboard.html\", context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/shortcuts.py\", line 24, in render\n    content = loader.render_to_string(template_name, context, request, using=using)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader.py\", line 62, in render_to_string\n    return template.render(context, request)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/backends/django.py\", line 62, in render\n    return self.template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 175, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 157, in render\n    return compiled_parent._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 208, in render\n    return template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 177, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/defaulttags.py\", line 472, in render\n    url = reverse(view_name, args=args, kwargs=kwargs, current_app=current_app)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/base.py\", line 88, in reverse\n    return resolver._reverse_with_prefix(view, prefix, *args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/resolvers.py\", line 828, in _reverse_with_prefix\n    raise NoReverseMatch(msg)\ndjango.urls.exceptions.NoReverseMatch: Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.\n', 70, '2023-03-15 10:26:35.356839', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(91, 'AD00001', 'Xassen Abshir', '<class \'django.urls.exceptions.NoReverseMatch\'>', 'Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 70, in Dashboard\n    return render(request, \"dashboard.html\", context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/shortcuts.py\", line 24, in render\n    content = loader.render_to_string(template_name, context, request, using=using)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader.py\", line 62, in render_to_string\n    return template.render(context, request)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/backends/django.py\", line 62, in render\n    return self.template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 175, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 157, in render\n    return compiled_parent._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 208, in render\n    return template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 177, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/defaulttags.py\", line 472, in render\n    url = reverse(view_name, args=args, kwargs=kwargs, current_app=current_app)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/base.py\", line 88, in reverse\n    return resolver._reverse_with_prefix(view, prefix, *args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/resolvers.py\", line 828, in _reverse_with_prefix\n    raise NoReverseMatch(msg)\ndjango.urls.exceptions.NoReverseMatch: Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.\n', 70, '2023-03-15 10:26:37.146238', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg');
INSERT INTO `errorlogs` (`id`, `Username`, `Name`, `Expected_error`, `field_error`, `trace_back`, `line_number`, `date_recorded`, `browser`, `ip_address`, `user_agent`, `Avatar`) VALUES
(92, 'AD00001', 'Xassen Abshir', '<class \'django.urls.exceptions.NoReverseMatch\'>', 'Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 70, in Dashboard\n    return render(request, \"dashboard.html\", context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/shortcuts.py\", line 24, in render\n    content = loader.render_to_string(template_name, context, request, using=using)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader.py\", line 62, in render_to_string\n    return template.render(context, request)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/backends/django.py\", line 62, in render\n    return self.template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 175, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 157, in render\n    return compiled_parent._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 208, in render\n    return template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 177, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/defaulttags.py\", line 472, in render\n    url = reverse(view_name, args=args, kwargs=kwargs, current_app=current_app)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/base.py\", line 88, in reverse\n    return resolver._reverse_with_prefix(view, prefix, *args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/resolvers.py\", line 828, in _reverse_with_prefix\n    raise NoReverseMatch(msg)\ndjango.urls.exceptions.NoReverseMatch: Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.\n', 70, '2023-03-15 10:30:35.494048', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(93, 'AD00001', 'Xassen Abshir', '<class \'django.urls.exceptions.NoReverseMatch\'>', 'Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Users/views.py\", line 70, in Dashboard\n    return render(request, \"dashboard.html\", context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/shortcuts.py\", line 24, in render\n    content = loader.render_to_string(template_name, context, request, using=using)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader.py\", line 62, in render_to_string\n    return template.render(context, request)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/backends/django.py\", line 62, in render\n    return self.template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 175, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 157, in render\n    return compiled_parent._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/loader_tags.py\", line 208, in render\n    return template.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 177, in render\n    return self._render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 167, in _render\n    return self.nodelist.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in render\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 1005, in <listcomp>\n    return SafeString(\"\".join([node.render_annotated(context) for node in self]))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/base.py\", line 966, in render_annotated\n    return self.render(context)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/template/defaulttags.py\", line 472, in render\n    url = reverse(view_name, args=args, kwargs=kwargs, current_app=current_app)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/base.py\", line 88, in reverse\n    return resolver._reverse_with_prefix(view, prefix, *args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/urls/resolvers.py\", line 828, in _reverse_with_prefix\n    raise NoReverseMatch(msg)\ndjango.urls.exceptions.NoReverseMatch: Reverse for \'docs\' not found. \'docs\' is not a valid view function or pattern name.\n', 70, '2023-03-15 10:31:45.344504', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(94, 'AD00001', 'Xassen Abshir', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Vehicles/reports.py\", line 24, in Searchvehicle\n    searchQuery = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 24, '2023-03-16 14:00:30.132341', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(95, 'AD00001', 'Xassen Abshir', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Vehicles/reports.py\", line 24, in Searchvehicle\n    searchQuery = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 24, '2023-03-16 14:00:30.414023', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(96, 'AD00001', 'Xassen Abshir', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Vehicles/reports.py\", line 24, in Searchvehicle\n    searchQuery = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 24, '2023-03-16 14:00:30.758154', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(97, 'AD00001', 'Xassen Abshir', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Vehicles/reports.py\", line 24, in Searchvehicle\n    searchQuery = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 24, '2023-03-16 14:00:41.390330', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(98, 'AD00001', 'Xassen Abshir', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Vehicles/reports.py\", line 24, in Searchvehicle\n    searchQuery = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 24, '2023-03-16 14:00:41.672153', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(99, 'AD00001', 'Xassen Abshir', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Vehicles/reports.py\", line 24, in Searchvehicle\n    searchQuery = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 24, '2023-03-16 14:00:41.898360', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(100, 'AD00001', 'Xassen Abshir', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Vehicles/reports.py\", line 24, in Searchvehicle\n    searchQuery = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 24, '2023-03-16 14:00:42.642277', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(101, 'AD00001', 'Xassen Abshir', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Vehicles/reports.py\", line 24, in Searchvehicle\n    searchQuery = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 24, '2023-03-16 14:00:42.994044', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(102, 'AD00001', 'Xassen Abshir', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Vehicles/reports.py\", line 24, in Searchvehicle\n    searchQuery = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 24, '2023-03-16 14:00:43.372892', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(103, 'AD00001', 'Xassen Abshir', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Vehicles/reports.py\", line 24, in Searchvehicle\n    searchQuery = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 24, '2023-03-16 14:17:17.327226', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(104, 'AD00001', 'Xassen Abshir', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Vehicles/reports.py\", line 24, in Searchvehicle\n    searchQuery = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 24, '2023-03-16 14:19:07.783368', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg'),
(105, 'AD00001', 'Xassen Abshir', '<class \'django.core.exceptions.FieldError\'>', 'Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year', 'Traceback (most recent call last):\n  File \"/home/mhbaando/Documents/gaadiidka/Vehicles/reports.py\", line 24, in Searchvehicle\n    searchQuery = vehicle_model.vehicle.objects.filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1421, in filter\n    return self._filter_or_exclude(False, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1439, in _filter_or_exclude\n    clone._filter_or_exclude_inplace(negate, args, kwargs)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/query.py\", line 1446, in _filter_or_exclude_inplace\n    self._query.add_q(Q(*args, **kwargs))\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1532, in add_q\n    clause, _ = self._add_q(q_object, self.used_aliases)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1388, in build_filter\n    return self._add_q(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1562, in _add_q\n    child_clause, needed_inner = self.build_filter(\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1407, in build_filter\n    lookups, parts, reffed_expression = self.solve_lookup_type(arg)\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1217, in solve_lookup_type\n    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta())\n  File \"/home/mhbaando/Documents/gaadiidka/env/lib/python3.10/site-packages/django/db/models/sql/query.py\", line 1709, in names_to_path\n    raise FieldError(\ndjango.core.exceptions.FieldError: Cannot resolve keyword \'plate\' into field. Choices are: color, color_id, created_at, cylinder, cylinder_id, enginer_no, hp, modified_at, origin, origin_id, owner, owner_id, pessenger_seat, plate_no, plate_no_id, reg_user, reg_user_id, rv_number, test, transfare_vehicles, vehicle_id, vehicle_model, vehicle_model_id, vin, weight, year\n', 24, '2023-03-16 14:20:08.370227', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Linux,ChromiumEdge', 'Avatars/th_NEt2d7u.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `federal_state`
--

CREATE TABLE `federal_state` (
  `state_id` int NOT NULL,
  `state_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `federal_state`
--

INSERT INTO `federal_state` (`state_id`, `state_name`, `created_at`, `modified_at`) VALUES
(1, 'Banaadir', '2023-02-05 10:38:37.000000', '2023-02-05 10:38:37.000000'),
(2, 'Hirshabeelle', '2023-02-05 10:38:37.000000', '2023-02-05 10:38:37.000000'),
(3, 'Koonfur Galbeed', '2023-02-05 10:39:28.000000', '2023-02-05 10:39:28.000000'),
(4, 'Galmudug', '2023-02-05 10:39:49.000000', '2023-02-05 10:39:49.000000'),
(5, 'Puntland', '2023-02-05 10:40:07.000000', '2023-02-05 10:40:07.000000'),
(6, 'Jubba land', '2023-02-05 10:40:21.000000', '2023-02-05 10:40:21.000000'),
(7, 'Somali land', '2023-02-05 10:40:31.000000', '2023-02-05 10:40:31.000000');

-- --------------------------------------------------------

--
-- Table structure for table `fingerprints`
--

CREATE TABLE `fingerprints` (
  `id` bigint NOT NULL,
  `finger_print_template` longtext COLLATE utf8mb4_unicode_ci,
  `finger_print_image` longtext COLLATE utf8mb4_unicode_ci,
  `customer_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `license`
--

CREATE TABLE `license` (
  `license_id` int NOT NULL,
  `expired_date` date NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_no` longtext COLLATE utf8mb4_unicode_ci,
  `document` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `federal_state_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `place_of_issue_id` int DEFAULT NULL,
  `receipt_voucher_id` int DEFAULT NULL,
  `reg_user_id` bigint NOT NULL,
  `type_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `license`
--

INSERT INTO `license` (`license_id`, `expired_date`, `status`, `reg_no`, `document`, `created_at`, `modified_at`, `federal_state_id`, `owner_id`, `place_of_issue_id`, `receipt_voucher_id`, `reg_user_id`, `type_id`) VALUES
(2, '2026-03-06', 'Active', '230001', '', '2023-03-06 10:11:02.831000', '2023-03-14 12:43:47.523928', 2, 1, 10, 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `licensetype`
--

CREATE TABLE `licensetype` (
  `type_id` int NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `licensetype`
--

INSERT INTO `licensetype` (`type_id`, `type`, `created_at`, `modified_at`, `reg_user_id`) VALUES
(1, 'A', '2023-02-18 12:49:52.828991', '2023-02-18 12:49:52.828991', 1),
(2, 'A1', '2023-02-18 12:50:00.278278', '2023-02-18 12:50:00.278278', 1),
(3, 'B', '2023-02-18 12:50:07.154556', '2023-02-18 12:50:07.154556', 1),
(4, 'C', '2023-02-18 14:26:12.396299', '2023-02-18 14:26:12.396299', 1),
(5, 'C1', '2023-02-18 14:26:19.999697', '2023-02-18 14:26:19.999697', 1),
(6, 'D', '2023-02-18 14:26:26.849524', '2023-02-18 14:26:26.849524', 1),
(7, 'E', '2023-02-18 14:26:33.500030', '2023-02-18 14:26:33.500030', 1),
(8, 'F', '2023-02-18 14:26:44.906484', '2023-02-18 14:26:44.906484', 1),
(9, 'G', '2023-02-18 14:26:57.484768', '2023-02-18 14:26:57.484768', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_brand`
--

CREATE TABLE `model_brand` (
  `brand_id` int NOT NULL,
  `brand_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_brand`
--

INSERT INTO `model_brand` (`brand_id`, `brand_name`, `created_at`, `modified_at`, `reg_user_id`) VALUES
(1, 'Abarth', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(2, 'Alfa Romeo', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(3, 'Aston Martin', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(4, 'Audi', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(5, 'Bentley', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(6, 'BMW', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(7, 'Bugatti', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(8, 'Cadillac', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(9, 'Chevrolet', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(10, 'Chrysler', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(11, 'Citroën', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(12, 'Dacia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(13, 'Daewoo', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(14, 'Daihatsu', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(15, 'Dodge', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(16, 'Donkervoort', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(17, 'DS', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(18, 'Ferrari', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(19, 'Fiat', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(20, 'Fisker', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(21, 'Ford', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(22, 'Honda', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(23, 'Hummer', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(24, 'Hyundai', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(25, 'Infiniti', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(26, 'Iveco', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(27, 'Jaguar', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(28, 'Jeep', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(29, 'Kia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(30, 'KTM', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(31, 'Lamborghini', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(32, 'Lancia', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(33, 'Land Rover', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(34, 'Landwind', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(35, 'Lexus', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(36, 'Lotus', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(37, 'Maserati', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(38, 'Maybach', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(39, 'Mazda', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(40, 'McLaren', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(41, 'Mercedes-Benz', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(42, 'MG', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(43, 'Mini', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(44, 'Mitsubishi', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(45, 'Morgan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(46, 'Nissan', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(47, 'Opel', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(48, 'Peugeot', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(49, 'Porsche', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(50, 'Renault', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(51, 'Rolls-Royce', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(52, 'Rover', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(53, 'Saab', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(54, 'Seat', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(55, 'Skoda', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(56, 'Smart', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(57, 'SsangYong', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(58, 'Subaru', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(59, 'Suzuki', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(60, 'Tesla', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(61, 'Toyota', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(62, 'Volkswagen', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0),
(63, 'Volvo', '2023-03-04 14:23:35.387629', '2023-03-04 14:23:35.387629', 0);

-- --------------------------------------------------------

--
-- Table structure for table `personal_id_type`
--

CREATE TABLE `personal_id_type` (
  `personal_id` int NOT NULL,
  `personal_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_id_type`
--

INSERT INTO `personal_id_type` (`personal_id`, `personal_name`, `created_at`, `modified_at`) VALUES
(1, 'Passport', '2023-02-05 11:55:16.000000', '2023-02-05 11:55:16.000000'),
(2, 'License', '2023-02-05 11:55:16.000000', '2023-02-05 11:55:16.000000'),
(3, 'Dhalasho & Sugnaan', '2023-02-05 11:55:16.000000', '2023-02-05 11:55:16.000000');

-- --------------------------------------------------------

--
-- Table structure for table `place_issue`
--

CREATE TABLE `place_issue` (
  `place_id` int NOT NULL,
  `place_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `reg_user_id` bigint DEFAULT NULL,
  `federal_state_id` int DEFAULT NULL,
  `state_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `place_issue`
--

INSERT INTO `place_issue` (`place_id`, `place_name`, `created_at`, `modified_at`, `reg_user_id`, `federal_state_id`, `state_id`) VALUES
(9, 'Mogadishu', '2023-03-13 12:29:06.439947', '2023-03-13 12:29:06.439970', 1, NULL, 1),
(10, 'Jowhar', '2023-03-13 12:29:22.729971', '2023-03-13 12:29:22.730006', 1, NULL, 2),
(11, 'Garowe', '2023-03-13 12:29:33.616116', '2023-03-13 12:29:33.616143', 1, NULL, 5),
(12, 'Hargeisa', '2023-03-13 12:29:45.634162', '2023-03-13 12:29:45.634185', 1, NULL, 7),
(13, 'Kismayo', '2023-03-13 12:29:59.799264', '2023-03-13 12:29:59.799295', 1, NULL, 6),
(14, 'Baydhabo', '2023-03-13 12:30:15.150310', '2023-03-13 12:30:15.150340', 1, NULL, 3),
(15, 'Dhuusamareb', '2023-03-13 12:31:46.624800', '2023-03-13 12:31:46.624822', 1, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `plate`
--

CREATE TABLE `plate` (
  `plate_id` int NOT NULL,
  `plate_code_id` int DEFAULT NULL,
  `plate_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint NOT NULL,
  `state_id` int NOT NULL,
  `type_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plate`
--

INSERT INTO `plate` (`plate_id`, `plate_code_id`, `plate_no`, `year`, `created_at`, `modified_at`, `reg_user_id`, `state_id`, `type_id`) VALUES
(1, 2, '9998', 2020, '2023-03-12 15:07:09.767589', '2023-03-14 11:20:28.505573', 4, 3, 1),
(5, 41, '0001', 2023, '2023-03-14 11:45:33.463871', '2023-03-14 11:45:33.463915', 1, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `receipt_voucher`
--

CREATE TABLE `receipt_voucher` (
  `rv_id` int NOT NULL,
  `rv_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rv_amount` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `reason` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint NOT NULL,
  `rv_from_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receipt_voucher`
--

INSERT INTO `receipt_voucher` (`rv_id`, `rv_number`, `rv_amount`, `created_at`, `reason`, `modified_at`, `reg_user_id`, `rv_from_id`) VALUES
(1, '1425', '120', '2023-03-06 09:19:26.506760', 'Baabuur cusub baa lagu diiwaan galin', '2023-03-06 09:19:26.506791', 1, 1),
(2, '1426', '200', '2023-03-13 11:32:21.109653', 'license cusb oo dameer lagu wado aya lo samynoya', '2023-03-13 11:32:21.109678', 1, 2),
(3, '1417', '120', '2023-03-13 11:37:10.205272', 'wxaa kadhacay licenkii damerha uu ku wdayaye', '2023-03-13 11:37:10.205298', 1, 2),
(4, '1428', '250', '2023-03-14 09:28:52.411182', 'Gaari wareejin ', '2023-03-14 09:28:52.411221', 1, 1),
(5, '1430', '250', '2023-03-14 10:05:23.992798', 'gaari wareejinssss', '2023-03-14 12:17:17.761428', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int NOT NULL,
  `type_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_name`, `created_at`, `modified_at`, `reg_user_id`) VALUES
(1, 'MIL', '2023-03-01 09:38:28.098572', '2023-03-01 09:38:28.098572', 1),
(2, 'Gov', '2023-03-01 09:38:37.848207', '2023-03-01 09:38:37.848207', 1),
(3, 'MUN', '2023-03-01 09:38:44.472839', '2023-03-01 09:38:44.473828', 1),
(4, 'OAU', '2023-03-01 09:38:51.872944', '2023-03-01 09:38:51.872944', 1),
(5, 'POL', '2023-03-01 09:38:59.039620', '2023-03-01 09:38:59.039620', 1),
(6, 'AU', '2023-03-01 09:39:06.768981', '2023-03-01 09:39:06.768981', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_state` tinyint(1) NOT NULL,
  `is_place_issue` tinyint(1) NOT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `federal_state_id` int DEFAULT NULL,
  `place_issues_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`, `phone`, `gender`, `avatar`, `is_admin`, `is_state`, `is_place_issue`, `modified_at`, `federal_state_id`, `place_issues_id`) VALUES
(1, 'pbkdf2_sha256$390000$f93JubGe1DTjjKrq8zdQIA$tcxxzzjMSSIefdcYwkW8veV+RkbF5uYYLrfbZVyBQg4=', '2023-03-18 08:31:05.422956', 1, 'AD00001', 'Xassen', 'Abshir', 1, 1, '2023-03-05 10:25:44.000000', 'mo@nisa.com', '615748596', 'Male', 'Avatars/th_NEt2d7u.jpeg', 0, 0, 0, '2023-03-05 15:40:04.660677', NULL, NULL),
(3, 'pbkdf2_sha256$390000$RQiqJGJzMKUDpwtcmpcd37$/7tyR6VGYnrL4IgHOdDnppkAkURg5NVQLjFkNJaGFRA=', NULL, 0, 'AD00002', 'Halima', 'Hussein', 0, 1, '2023-03-05 14:28:12.000000', 'h1@gmail.com', '615428552', 'Female', 'Avatars/th_gYaSYzH.jpeg', 1, 0, 0, '2023-03-08 10:28:48.408789', 1, NULL),
(4, 'pbkdf2_sha256$390000$U4tlFr784YyanizXxaMFSU$tchgpe8ac9wQUjt3343SIxTRuGOPgR/AjVmEjMKNZDw=', '2023-03-14 12:44:50.529209', 0, 'AD00003', 'Aziza', 'Raage', 0, 1, '2023-03-05 14:36:21.000000', 'azuu@gmail.com', '615426396', 'Female', 'Avatars/th_W2mnufr.jpeg', 0, 1, 0, '2023-03-08 14:22:53.335598', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` bigint NOT NULL,
  `users_id` bigint NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `users_id`, `group_id`) VALUES
(1, 3, 1),
(4, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users_user_permissions`
--

CREATE TABLE `users_user_permissions` (
  `id` bigint NOT NULL,
  `users_id` bigint NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `vehicle_id` int NOT NULL,
  `year` int DEFAULT NULL,
  `weight` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pessenger_seat` longtext COLLATE utf8mb4_unicode_ci,
  `vin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enginer_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rv_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `color_id` int NOT NULL,
  `cylinder_id` int NOT NULL,
  `origin_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `plate_no_id` int DEFAULT NULL,
  `reg_user_id` bigint NOT NULL,
  `vehicle_model_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`vehicle_id`, `year`, `weight`, `hp`, `pessenger_seat`, `vin`, `enginer_no`, `rv_number`, `created_at`, `modified_at`, `color_id`, `cylinder_id`, `origin_id`, `owner_id`, `plate_no_id`, `reg_user_id`, `vehicle_model_id`) VALUES
(2, 2022, '1200', '120', '6', '145789967441', '4748591252', '1425', '2023-03-06 09:56:08.480524', '2023-03-14 09:48:25.037507', 214, 3, 3, 2, 1, 1, 1),
(3, 2006, '1200', '120', '6', '145789967431', '4748591251', '1429', '2023-03-14 10:10:17.260756', '2023-03-14 11:45:33.470474', 230, 5, 17, 2, 5, 1, 18);

-- --------------------------------------------------------

--
-- Table structure for table `Vehicles_test`
--

CREATE TABLE `Vehicles_test` (
  `test_id` int NOT NULL,
  `test_meter` bigint NOT NULL,
  `expired_date` date NOT NULL,
  `issue_date` date NOT NULL,
  `created_at` date NOT NULL,
  `reg_user_id` bigint NOT NULL,
  `test_cat_id` int NOT NULL,
  `tested_vehicle_id` int NOT NULL,
  `result` tinyint(1) NOT NULL,
  `tested_el_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Vehicles_test_category`
--

CREATE TABLE `Vehicles_test_category` (
  `cat_id` int NOT NULL,
  `cat_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Vehicles_test_category`
--

INSERT INTO `Vehicles_test_category` (`cat_id`, `cat_name`, `created_at`, `updated_at`, `reg_user_id`) VALUES
(1, 'Habraaca Nidaamka Tijaabinta Gaadiidka', '2023-03-16', '2023-03-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Vehicles_test_elements`
--

CREATE TABLE `Vehicles_test_elements` (
  `el_id` int NOT NULL,
  `el_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `reg_user_id` bigint NOT NULL,
  `test_cat_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Vehicles_test_elements`
--

INSERT INTO `Vehicles_test_elements` (`el_id`, `el_name`, `created_at`, `updated_at`, `reg_user_id`, `test_cat_id`) VALUES
(1, 'Abaatiriinka', '2023-03-16', '2023-03-16', 1, 1),
(2, 'Balansiga iyo Isteerinka', '2023-03-16', '2023-03-16', 1, 1),
(3, 'Bareega Gaadiidka', '2023-03-16', '2023-03-16', 1, 1),
(4, 'Buudiga Gaadiidka', '2023-03-16', '2023-03-16', 1, 1),
(5, 'Dabka Gaadiidka', '2023-03-16', '2023-03-16', 1, 1),
(6, 'Farasiyaalaha Gaadiidka', '2023-03-16', '2023-03-16', 1, 1),
(7, 'Haadadka Gaadiidka', '2023-03-16', '2023-03-16', 1, 1),
(8, 'Hobsiyada Gaadiidka', '2023-03-16', '2023-03-16', 1, 1),
(9, 'Hoonka', '2023-03-16', '2023-03-16', 1, 1),
(10, 'Kaambiyaha Gaadiidka', '2023-03-16', '2023-03-16', 1, 1),
(11, 'Kirishtaalaha Gaadiidka', '2023-03-16', '2023-03-16', 1, 1),
(12, 'Kuraasta', '2023-03-16', '2023-03-16', 1, 1),
(13, 'Laangaroonaha Gaadiidka', '2023-03-16', '2023-03-16', 1, 1),
(14, 'Matoorka Gaadiidka', '2023-03-16', '2023-03-16', 1, 1),
(15, 'Muraayadaha Gaadiidka', '2023-03-16', '2023-03-16', 1, 1),
(16, 'Nalalka Gaadiidka', '2023-03-16', '2023-03-16', 1, 1),
(17, 'Taayarada Gaadiidka', '2023-03-16', '2023-03-16', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Vehicles_transfare_vehicles`
--

CREATE TABLE `Vehicles_transfare_vehicles` (
  `transfare_id` int NOT NULL,
  `rv_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `transfare_reason` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `new_owner_id` int NOT NULL,
  `old_owner_id` int NOT NULL,
  `reg_user_id` bigint NOT NULL,
  `vehicle_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Vehicles_transfare_vehicles`
--

INSERT INTO `Vehicles_transfare_vehicles` (`transfare_id`, `rv_number`, `document`, `description`, `transfare_reason`, `created_at`, `modified_at`, `new_owner_id`, `old_owner_id`, `reg_user_id`, `vehicle_id`) VALUES
(1, '1428', 'transfare_document/VRLS___Reports.pdf', ' ', ' waa uu gatay', '2023-03-14 09:48:25.043938', '2023-03-14 09:48:25.044003', 2, 1, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `account_account_type_id_e4045757_fk_account_types_type_id` (`account_type_id`),
  ADD KEY `account_reg_user_id_f7e09af6_fk_users_id` (`reg_user_id`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `account_types_reg_user_id_356b40e1_fk_users_id` (`reg_user_id`);

--
-- Indexes for table `audittrials`
--
ALTER TABLE `audittrials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `blood_group`
--
ALTER TABLE `blood_group`
  ADD PRIMARY KEY (`blood_group_id`);

--
-- Indexes for table `code_plate`
--
ALTER TABLE `code_plate`
  ADD PRIMARY KEY (`code_id`),
  ADD KEY `code_plate_reg_user_id_85a2a0ab_fk_users_id` (`reg_user_id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_id`),
  ADD KEY `color_reg_user_id_1c6d7693_fk_users_id` (`reg_user_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `company_federal_state_id_7beece58_fk_federal_state_state_id` (`federal_state_id`),
  ADD KEY `company_owner_id_1601a9e2_fk_customers_customer_id` (`owner_id`),
  ADD KEY `company_reg_user_id_3cd998b4_fk_users_id` (`reg_user_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `customers_blood_group_id_a8459ea3_fk_blood_group_blood_group_id` (`blood_group_id`),
  ADD KEY `customers_federal_state_id_6038d4df_fk_federal_state_state_id` (`federal_state_id`),
  ADD KEY `customers_nationality_id_ae515b28_fk_countries_country_id` (`nationality_id`),
  ADD KEY `customers_personal_id_type_id_71309a38_fk_personal_` (`personal_id_type_id`),
  ADD KEY `customers_reg_user_id_eeb8baac_fk_users_id` (`reg_user_id`);

--
-- Indexes for table `cylinder`
--
ALTER TABLE `cylinder`
  ADD PRIMARY KEY (`cylinder_id`),
  ADD KEY `cylinder_reg_user_id_a39988e0_fk_users_id` (`reg_user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `errorlogs`
--
ALTER TABLE `errorlogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `federal_state`
--
ALTER TABLE `federal_state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `fingerprints`
--
ALTER TABLE `fingerprints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fingerprints_customer_id_d56b0163_fk_customers_customer_id` (`customer_id`);

--
-- Indexes for table `license`
--
ALTER TABLE `license`
  ADD PRIMARY KEY (`license_id`),
  ADD KEY `license_federal_state_id_3830e544_fk_federal_state_state_id` (`federal_state_id`),
  ADD KEY `license_owner_id_f487e78c_fk_customers_customer_id` (`owner_id`),
  ADD KEY `license_place_of_issue_id_a5b2f983_fk_place_issue_place_id` (`place_of_issue_id`),
  ADD KEY `license_receipt_voucher_id_4942b888_fk_receipt_voucher_rv_id` (`receipt_voucher_id`),
  ADD KEY `license_reg_user_id_946be48d_fk_users_id` (`reg_user_id`),
  ADD KEY `license_type_id_6aec3442_fk_licensetype_type_id` (`type_id`);

--
-- Indexes for table `licensetype`
--
ALTER TABLE `licensetype`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `licensetype_reg_user_id_a47f077c_fk_users_id` (`reg_user_id`);

--
-- Indexes for table `model_brand`
--
ALTER TABLE `model_brand`
  ADD PRIMARY KEY (`brand_id`),
  ADD KEY `model_brand_reg_user_id_c3636f74_fk_users_id` (`reg_user_id`);

--
-- Indexes for table `personal_id_type`
--
ALTER TABLE `personal_id_type`
  ADD PRIMARY KEY (`personal_id`);

--
-- Indexes for table `place_issue`
--
ALTER TABLE `place_issue`
  ADD PRIMARY KEY (`place_id`),
  ADD KEY `place_issue_reg_user_id_5f0f51cf_fk_users_id` (`reg_user_id`),
  ADD KEY `place_issue_federal_state_id_337d4185_fk_federal_state_state_id` (`federal_state_id`),
  ADD KEY `place_issue_state_id_6cb12368_fk_federal_state_state_id` (`state_id`);

--
-- Indexes for table `plate`
--
ALTER TABLE `plate`
  ADD PRIMARY KEY (`plate_id`),
  ADD KEY `plate_type_id_ae5aca22_fk_type_type_id` (`type_id`),
  ADD KEY `plate_reg_user_id_744c09e8_fk_users_id` (`reg_user_id`),
  ADD KEY `plate_state_id_3b014cea_fk_federal_state_state_id` (`state_id`),
  ADD KEY `plate_plate_code_id_9faa9c90` (`plate_code_id`);

--
-- Indexes for table `receipt_voucher`
--
ALTER TABLE `receipt_voucher`
  ADD PRIMARY KEY (`rv_id`),
  ADD KEY `receipt_voucher_reg_user_id_adade876_fk_users_id` (`reg_user_id`),
  ADD KEY `receipt_voucher_rv_from_id_513e74e5_fk_customers_customer_id` (`rv_from_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `type_reg_user_id_7a63cccd_fk_users_id` (`reg_user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `users_federal_state_id_a5c6fb46_fk_federal_state_state_id` (`federal_state_id`),
  ADD KEY `users_place_issues_id_66a5e082_fk_place_issue_place_id` (`place_issues_id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_groups_users_id_group_id_83a49e68_uniq` (`users_id`,`group_id`),
  ADD KEY `users_groups_group_id_2f3517aa_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `users_user_permissions`
--
ALTER TABLE `users_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_permissions_users_id_permission_id_d7a00931_uniq` (`users_id`,`permission_id`),
  ADD KEY `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD KEY `vehicle_color_id_e8b55c33_fk_color_color_id` (`color_id`),
  ADD KEY `vehicle_cylinder_id_0fb3b025_fk_cylinder_cylinder_id` (`cylinder_id`),
  ADD KEY `vehicle_origin_id_042ff3fe_fk_countries_country_id` (`origin_id`),
  ADD KEY `vehicle_owner_id_9c24cb49_fk_customers_customer_id` (`owner_id`),
  ADD KEY `vehicle_plate_no_id_bf286d14_fk_plate_plate_id` (`plate_no_id`),
  ADD KEY `vehicle_reg_user_id_713ecd80_fk_users_id` (`reg_user_id`),
  ADD KEY `vehicle_vehicle_model_id_2a7997b8_fk_model_brand_brand_id` (`vehicle_model_id`);

--
-- Indexes for table `Vehicles_test`
--
ALTER TABLE `Vehicles_test`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `Vehicles_test_reg_user_id_7804f21d_fk_users_id` (`reg_user_id`),
  ADD KEY `Vehicles_test_test_cat_id_b4f48e71_fk_Vehicles_` (`test_cat_id`),
  ADD KEY `Vehicles_test_tested_vehicle_id_563586fe_fk_vehicle_vehicle_id` (`tested_vehicle_id`),
  ADD KEY `Vehicles_test_tested_el_id_93fb6d29_fk_Vehicles_` (`tested_el_id`);

--
-- Indexes for table `Vehicles_test_category`
--
ALTER TABLE `Vehicles_test_category`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `Vehicles_test_category_reg_user_id_801fa7eb_fk_users_id` (`reg_user_id`);

--
-- Indexes for table `Vehicles_test_elements`
--
ALTER TABLE `Vehicles_test_elements`
  ADD PRIMARY KEY (`el_id`),
  ADD KEY `Vehicles_test_elements_reg_user_id_eeecfd6b_fk_users_id` (`reg_user_id`),
  ADD KEY `Vehicles_test_elemen_test_cat_id_dc184a6b_fk_Vehicles_` (`test_cat_id`);

--
-- Indexes for table `Vehicles_transfare_vehicles`
--
ALTER TABLE `Vehicles_transfare_vehicles`
  ADD PRIMARY KEY (`transfare_id`),
  ADD KEY `Vehicles_transfare_v_new_owner_id_a8719238_fk_customers` (`new_owner_id`),
  ADD KEY `Vehicles_transfare_v_old_owner_id_7cee99c1_fk_customers` (`old_owner_id`),
  ADD KEY `Vehicles_transfare_vehicles_reg_user_id_4a859d12_fk_users_id` (`reg_user_id`),
  ADD KEY `Vehicles_transfare_v_vehicle_id_bdf6795e_fk_vehicle_v` (`vehicle_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `audittrials`
--
ALTER TABLE `audittrials`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1062;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `blood_group`
--
ALTER TABLE `blood_group`
  MODIFY `blood_group_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `code_plate`
--
ALTER TABLE `code_plate`
  MODIFY `code_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `color_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=357;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cylinder`
--
ALTER TABLE `cylinder`
  MODIFY `cylinder_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `errorlogs`
--
ALTER TABLE `errorlogs`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `federal_state`
--
ALTER TABLE `federal_state`
  MODIFY `state_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fingerprints`
--
ALTER TABLE `fingerprints`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `license`
--
ALTER TABLE `license`
  MODIFY `license_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `licensetype`
--
ALTER TABLE `licensetype`
  MODIFY `type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `model_brand`
--
ALTER TABLE `model_brand`
  MODIFY `brand_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `personal_id_type`
--
ALTER TABLE `personal_id_type`
  MODIFY `personal_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `place_issue`
--
ALTER TABLE `place_issue`
  MODIFY `place_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `plate`
--
ALTER TABLE `plate`
  MODIFY `plate_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `receipt_voucher`
--
ALTER TABLE `receipt_voucher`
  MODIFY `rv_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_user_permissions`
--
ALTER TABLE `users_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `vehicle_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Vehicles_test`
--
ALTER TABLE `Vehicles_test`
  MODIFY `test_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Vehicles_test_category`
--
ALTER TABLE `Vehicles_test_category`
  MODIFY `cat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Vehicles_test_elements`
--
ALTER TABLE `Vehicles_test_elements`
  MODIFY `el_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `Vehicles_transfare_vehicles`
--
ALTER TABLE `Vehicles_transfare_vehicles`
  MODIFY `transfare_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_account_type_id_e4045757_fk_account_types_type_id` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`type_id`),
  ADD CONSTRAINT `account_reg_user_id_f7e09af6_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `account_types`
--
ALTER TABLE `account_types`
  ADD CONSTRAINT `account_types_reg_user_id_356b40e1_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `code_plate`
--
ALTER TABLE `code_plate`
  ADD CONSTRAINT `code_plate_reg_user_id_85a2a0ab_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `color`
--
ALTER TABLE `color`
  ADD CONSTRAINT `color_reg_user_id_1c6d7693_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_federal_state_id_7beece58_fk_federal_state_state_id` FOREIGN KEY (`federal_state_id`) REFERENCES `federal_state` (`state_id`),
  ADD CONSTRAINT `company_owner_id_1601a9e2_fk_customers_customer_id` FOREIGN KEY (`owner_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `company_reg_user_id_3cd998b4_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_blood_group_id_a8459ea3_fk_blood_group_blood_group_id` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_group` (`blood_group_id`),
  ADD CONSTRAINT `customers_federal_state_id_6038d4df_fk_federal_state_state_id` FOREIGN KEY (`federal_state_id`) REFERENCES `federal_state` (`state_id`),
  ADD CONSTRAINT `customers_nationality_id_ae515b28_fk_countries_country_id` FOREIGN KEY (`nationality_id`) REFERENCES `countries` (`country_id`),
  ADD CONSTRAINT `customers_personal_id_type_id_71309a38_fk_personal_` FOREIGN KEY (`personal_id_type_id`) REFERENCES `personal_id_type` (`personal_id`),
  ADD CONSTRAINT `customers_reg_user_id_eeb8baac_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cylinder`
--
ALTER TABLE `cylinder`
  ADD CONSTRAINT `cylinder_reg_user_id_a39988e0_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `fingerprints`
--
ALTER TABLE `fingerprints`
  ADD CONSTRAINT `fingerprints_customer_id_d56b0163_fk_customers_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `license`
--
ALTER TABLE `license`
  ADD CONSTRAINT `license_federal_state_id_3830e544_fk_federal_state_state_id` FOREIGN KEY (`federal_state_id`) REFERENCES `federal_state` (`state_id`),
  ADD CONSTRAINT `license_owner_id_f487e78c_fk_customers_customer_id` FOREIGN KEY (`owner_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `license_place_of_issue_id_a5b2f983_fk_place_issue_place_id` FOREIGN KEY (`place_of_issue_id`) REFERENCES `place_issue` (`place_id`),
  ADD CONSTRAINT `license_receipt_voucher_id_4942b888_fk_receipt_voucher_rv_id` FOREIGN KEY (`receipt_voucher_id`) REFERENCES `receipt_voucher` (`rv_id`),
  ADD CONSTRAINT `license_reg_user_id_946be48d_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `license_type_id_6aec3442_fk_licensetype_type_id` FOREIGN KEY (`type_id`) REFERENCES `licensetype` (`type_id`);

--
-- Constraints for table `licensetype`
--
ALTER TABLE `licensetype`
  ADD CONSTRAINT `licensetype_reg_user_id_a47f077c_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `model_brand`
--
ALTER TABLE `model_brand`
  ADD CONSTRAINT `model_brand_reg_user_id_c3636f74_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `place_issue`
--
ALTER TABLE `place_issue`
  ADD CONSTRAINT `place_issue_federal_state_id_337d4185_fk_federal_state_state_id` FOREIGN KEY (`federal_state_id`) REFERENCES `federal_state` (`state_id`),
  ADD CONSTRAINT `place_issue_reg_user_id_5f0f51cf_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `place_issue_state_id_6cb12368_fk_federal_state_state_id` FOREIGN KEY (`state_id`) REFERENCES `federal_state` (`state_id`);

--
-- Constraints for table `plate`
--
ALTER TABLE `plate`
  ADD CONSTRAINT `plate_plate_code_id_9faa9c90_fk_code_plate_code_id` FOREIGN KEY (`plate_code_id`) REFERENCES `code_plate` (`code_id`),
  ADD CONSTRAINT `plate_reg_user_id_744c09e8_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `plate_state_id_3b014cea_fk_federal_state_state_id` FOREIGN KEY (`state_id`) REFERENCES `federal_state` (`state_id`),
  ADD CONSTRAINT `plate_type_id_ae5aca22_fk_type_type_id` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`);

--
-- Constraints for table `receipt_voucher`
--
ALTER TABLE `receipt_voucher`
  ADD CONSTRAINT `receipt_voucher_reg_user_id_adade876_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `receipt_voucher_rv_from_id_513e74e5_fk_customers_customer_id` FOREIGN KEY (`rv_from_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `type`
--
ALTER TABLE `type`
  ADD CONSTRAINT `type_reg_user_id_7a63cccd_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_federal_state_id_a5c6fb46_fk_federal_state_state_id` FOREIGN KEY (`federal_state_id`) REFERENCES `federal_state` (`state_id`),
  ADD CONSTRAINT `users_place_issues_id_66a5e082_fk_place_issue_place_id` FOREIGN KEY (`place_issues_id`) REFERENCES `place_issue` (`place_id`);

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `users_groups_group_id_2f3517aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `users_groups_users_id_1e682706_fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_user_permissions`
--
ALTER TABLE `users_user_permissions`
  ADD CONSTRAINT `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `users_user_permissions_users_id_e1ed60a2_fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_color_id_e8b55c33_fk_color_color_id` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`),
  ADD CONSTRAINT `vehicle_cylinder_id_0fb3b025_fk_cylinder_cylinder_id` FOREIGN KEY (`cylinder_id`) REFERENCES `cylinder` (`cylinder_id`),
  ADD CONSTRAINT `vehicle_origin_id_042ff3fe_fk_countries_country_id` FOREIGN KEY (`origin_id`) REFERENCES `countries` (`country_id`),
  ADD CONSTRAINT `vehicle_owner_id_9c24cb49_fk_customers_customer_id` FOREIGN KEY (`owner_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `vehicle_plate_no_id_bf286d14_fk_plate_plate_id` FOREIGN KEY (`plate_no_id`) REFERENCES `plate` (`plate_id`),
  ADD CONSTRAINT `vehicle_reg_user_id_713ecd80_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `vehicle_vehicle_model_id_2a7997b8_fk_model_brand_brand_id` FOREIGN KEY (`vehicle_model_id`) REFERENCES `model_brand` (`brand_id`);

--
-- Constraints for table `Vehicles_test`
--
ALTER TABLE `Vehicles_test`
  ADD CONSTRAINT `Vehicles_test_reg_user_id_7804f21d_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `Vehicles_test_test_cat_id_b4f48e71_fk_Vehicles_` FOREIGN KEY (`test_cat_id`) REFERENCES `Vehicles_test_category` (`cat_id`),
  ADD CONSTRAINT `Vehicles_test_tested_el_id_93fb6d29_fk_Vehicles_` FOREIGN KEY (`tested_el_id`) REFERENCES `Vehicles_test_elements` (`el_id`),
  ADD CONSTRAINT `Vehicles_test_tested_vehicle_id_563586fe_fk_vehicle_vehicle_id` FOREIGN KEY (`tested_vehicle_id`) REFERENCES `vehicle` (`vehicle_id`);

--
-- Constraints for table `Vehicles_test_category`
--
ALTER TABLE `Vehicles_test_category`
  ADD CONSTRAINT `Vehicles_test_category_reg_user_id_801fa7eb_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `Vehicles_test_elements`
--
ALTER TABLE `Vehicles_test_elements`
  ADD CONSTRAINT `Vehicles_test_elemen_test_cat_id_dc184a6b_fk_Vehicles_` FOREIGN KEY (`test_cat_id`) REFERENCES `Vehicles_test_category` (`cat_id`),
  ADD CONSTRAINT `Vehicles_test_elements_reg_user_id_eeecfd6b_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `Vehicles_transfare_vehicles`
--
ALTER TABLE `Vehicles_transfare_vehicles`
  ADD CONSTRAINT `Vehicles_transfare_v_new_owner_id_a8719238_fk_customers` FOREIGN KEY (`new_owner_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `Vehicles_transfare_v_old_owner_id_7cee99c1_fk_customers` FOREIGN KEY (`old_owner_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `Vehicles_transfare_v_vehicle_id_bdf6795e_fk_vehicle_v` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`),
  ADD CONSTRAINT `Vehicles_transfare_vehicles_reg_user_id_4a859d12_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
