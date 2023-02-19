-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2023 at 06:52 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

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
  `account_id` int(11) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `account_type_id` int(11) NOT NULL,
  `reg_user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `account_name`, `amount`, `created_at`, `modified_at`, `account_type_id`, `reg_user_id`) VALUES
(1, 'New License', 45, '2023-02-18 12:51:23.526754', '2023-02-18 12:51:23.526754', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `type_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`type_id`, `name`) VALUES
(1, 'Vehicle'),
(2, 'Liecense'),
(3, 'Plate');

-- --------------------------------------------------------

--
-- Table structure for table `audittrials`
--

CREATE TABLE `audittrials` (
  `id` bigint(20) NOT NULL,
  `Avatar` varchar(100) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `path` varchar(60) DEFAULT NULL,
  `Name` varchar(200) NOT NULL,
  `Actions` varchar(400) NOT NULL,
  `Module` varchar(400) NOT NULL,
  `date_of_action` datetime(6) NOT NULL,
  `operating_system` varchar(200) NOT NULL,
  `browser` varchar(200) NOT NULL,
  `ip_address` varchar(200) NOT NULL,
  `user_agent` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audittrials`
--

INSERT INTO `audittrials` (`id`, `Avatar`, `Username`, `path`, `Name`, `Actions`, `Module`, `date_of_action`, `operating_system`, `browser`, `ip_address`, `user_agent`) VALUES
(1, '', 'admin', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-11 11:58:36.878453', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(2, '', 'admin', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-11 12:09:30.210679', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(3, '', 'admin', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-12 06:02:42.108436', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(4, '', 'admin', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-12 06:34:11.702720', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(5, '', 'admin', '/customer/', ' ', 'Registered A Customer', 'Customer / Register', '2023-02-12 06:36:07.442179', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(6, '', 'admin', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-12 10:22:44.701850', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(7, '', 'admin', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-13 05:44:09.072011', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(8, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-13 07:08:20.371662', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(9, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/customer/', ' ', 'Registered A Customer', 'Customer / Register', '2023-02-13 07:23:30.249287', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(10, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/customer/', ' ', 'Registered A Customer', 'Customer / Register', '2023-02-13 07:43:37.234742', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(11, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/customer/', ' ', 'Registered A Customer', 'Customer / Register', '2023-02-13 07:45:34.303377', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(12, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/customer/', ' ', 'Registered A Customer', 'Customer / Register', '2023-02-13 07:46:47.302234', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(13, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-13 08:18:11.036520', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(14, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/customer/', ' ', 'Registered A Customer', 'Customer / Register', '2023-02-13 08:33:28.813782', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(15, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/logout/', ' ', '  Logged out the System', 'Users Module', '2023-02-13 08:39:43.072694', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(16, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-13 08:39:47.791668', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(17, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-13 09:28:04.517758', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(18, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-13 10:10:45.679851', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(19, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-13 10:28:20.915629', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(20, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-13 11:53:15.191844', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(21, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/customer/activate', ' ', 'Activated A Customer Maxamed Ali Maxamed Maxamuud', 'Customer / Activate', '2023-02-13 11:53:32.175337', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(22, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-14 06:42:24.339367', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(23, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-14 10:46:44.962803', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(24, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-14 12:08:06.453699', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(25, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-15 07:13:37.363144', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(26, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-15 10:51:00.596635', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(27, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-15 12:55:30.973051', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(28, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-16 11:42:51.628480', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(29, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-16 11:59:05.518381', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(30, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-18 06:06:48.461544', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(31, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-18 07:15:21.791621', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(32, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-18 10:38:43.370839', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(33, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-18 11:50:45.092697', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(34, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/customer/updatecustomer/', ' ', 'Updated A Customer Xasen Ali Jaamac Axmed', 'Customer / Update', '2023-02-18 11:54:56.191988', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(35, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/customer/updatecustomer/', ' ', 'Updated A Customer Xasen Ali Jaamac Axmed', 'Customer / Update', '2023-02-18 11:58:44.699828', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(36, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/customer/updatecustomer/', ' ', 'Updated A Customer Xalima Axmed Liban Farayare', 'Customer / Update', '2023-02-18 12:03:05.698844', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(37, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/customer/updatecustomer/', ' ', 'Updated A Customer Xalima Axmed Liban Cabdi', 'Customer / Update', '2023-02-18 12:07:51.929056', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(38, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/customer/updatecustomer/', ' ', 'Updated A Customer Xalima Axmed Liban Cabdi', 'Customer / Update', '2023-02-18 12:08:19.462905', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(39, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/customer/updatecustomer/', ' ', 'Updated A Customer Xalima Axmed Liban Cabdi', 'Customer / Update', '2023-02-18 12:12:34.355896', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(40, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/customer/updatecustomer/', ' ', 'Updated A Customer Xalima Axmed Liban Cabdi', 'Customer / Update', '2023-02-18 12:13:56.789811', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(41, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-18 12:47:33.849225', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(42, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-18 13:21:20.957681', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(43, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/customer/activate', ' ', 'Activated A Customer Ahmed Jaamac Geedi Jaamac', 'Customer / Activate', '2023-02-18 13:30:42.333621', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(44, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-18 13:52:38.444344', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(45, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-18 15:20:18.579328', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(46, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-18 16:04:15.907838', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(47, 'Avatars/7309681-removebg-preview.png', 'AD00001', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-19 08:43:58.224397', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(69, 'Can add personal_id_type', 18, 'add_personal_id_type'),
(70, 'Can change personal_id_type', 18, 'change_personal_id_type'),
(71, 'Can delete personal_id_type', 18, 'delete_personal_id_type'),
(72, 'Can view personal_id_type', 18, 'view_personal_id_type'),
(73, 'Can add license', 19, 'add_license'),
(74, 'Can change license', 19, 'change_license'),
(75, 'Can delete license', 19, 'delete_license'),
(76, 'Can view license', 19, 'view_license'),
(77, 'Can add color', 20, 'add_color'),
(78, 'Can change color', 20, 'change_color'),
(79, 'Can delete color', 20, 'delete_color'),
(80, 'Can view color', 20, 'view_color'),
(81, 'Can add cylinder', 21, 'add_cylinder'),
(82, 'Can change cylinder', 21, 'change_cylinder'),
(83, 'Can delete cylinder', 21, 'delete_cylinder'),
(84, 'Can view cylinder', 21, 'view_cylinder'),
(85, 'Can add model_brand', 22, 'add_model_brand'),
(86, 'Can change model_brand', 22, 'change_model_brand'),
(87, 'Can delete model_brand', 22, 'delete_model_brand'),
(88, 'Can view model_brand', 22, 'view_model_brand'),
(89, 'Can add vehicle', 23, 'add_vehicle'),
(90, 'Can change vehicle', 23, 'change_vehicle'),
(91, 'Can delete vehicle', 23, 'delete_vehicle'),
(92, 'Can view vehicle', 23, 'view_vehicle'),
(93, 'Can add transfare_vehicles', 24, 'add_transfare_vehicles'),
(94, 'Can change transfare_vehicles', 24, 'change_transfare_vehicles'),
(95, 'Can delete transfare_vehicles', 24, 'delete_transfare_vehicles'),
(96, 'Can view transfare_vehicles', 24, 'view_transfare_vehicles'),
(97, 'Can add plate', 25, 'add_plate'),
(98, 'Can change plate', 25, 'change_plate'),
(99, 'Can delete plate', 25, 'delete_plate'),
(100, 'Can view plate', 25, 'view_plate'),
(101, 'Can add type', 26, 'add_type'),
(102, 'Can change type', 26, 'change_type'),
(103, 'Can delete type', 26, 'delete_type'),
(104, 'Can view type', 26, 'view_type'),
(105, 'Can add licensetype', 27, 'add_licensetype'),
(106, 'Can change licensetype', 27, 'change_licensetype'),
(107, 'Can delete licensetype', 27, 'delete_licensetype'),
(108, 'Can view licensetype', 27, 'view_licensetype');

-- --------------------------------------------------------

--
-- Table structure for table `blood_group`
--

CREATE TABLE `blood_group` (
  `blood_group_id` int(11) NOT NULL,
  `blood_group_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_group`
--

INSERT INTO `blood_group` (`blood_group_id`, `blood_group_name`, `created_at`, `modified_at`) VALUES
(1, 'A+', '2023-02-05 10:35:13.000000', '2023-02-05 10:35:13.000000'),
(2, 'A-', '2023-02-05 10:35:13.000000', '2023-02-05 10:35:13.000000'),
(3, 'O+', '2023-02-05 10:36:15.000000', '2023-02-05 10:36:15.000000'),
(4, 'B-', '2023-02-05 10:36:15.000000', '2023-02-05 10:36:15.000000'),
(5, 'O-', '2023-02-05 10:37:15.000000', '2023-02-05 10:37:15.000000'),
(6, 'AB+', '2023-02-05 10:37:32.000000', '2023-02-05 10:37:32.000000'),
(7, 'AB-', '2023-02-05 10:37:47.000000', '2023-02-05 10:37:47.000000');

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `color_id` int(11) NOT NULL,
  `color_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`color_id`, `color_name`, `created_at`, `modified_at`, `reg_user_id`) VALUES
(213, 'Black', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(214, 'Graphite Black', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(215, 'Black Steal', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(216, 'Dark Silver', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(217, 'Silver', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(218, 'Blue Silver', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(219, 'Steel Gray', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(220, 'Shadow Silver', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(221, 'Stone Silver', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(222, 'Midnight Silver', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(223, 'Gun Metal', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(224, 'Anthracite Grey', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(225, 'Matte Gray', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(226, 'Matte Light Grey', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(227, 'Util Black Poly', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(228, 'Util Dark silver', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(229, 'Util Silver', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(230, 'Util Gun Metal', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(231, 'Util Shadow Silver', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(232, 'Graphite', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(233, 'Silver Grey', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(234, 'Silver', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(235, 'Blue Silver', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(236, 'Shadow Silver', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(237, 'Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(238, 'Torino Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(239, 'Formula Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(240, 'Blaze Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(241, 'Graceful Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(242, 'Garnet Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(243, 'Desert Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(244, 'Cabernet Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(245, 'Candy Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(246, 'Sunrise Orange', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(247, 'Classic Gold', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(248, 'Orange', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(249, 'Dark Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(250, 'Matte Yellow', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(251, 'Bright Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(252, 'Garnet Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(253, 'Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(254, 'Golden Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(255, 'Dark Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(256, 'Dark Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(257, 'Racing Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(258, 'Sea Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(259, 'Olive Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(260, 'Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(261, 'Gasoline Blue Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(262, 'Lime Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(263, 'Dark Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(264, 'Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(265, 'Dark Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(266, 'Worn Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(267, 'Sea Wash', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(268, 'Midnight Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(269, 'Dark Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(270, 'Saxony Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(271, 'Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(272, 'Mariner Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(273, 'Harbor Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(274, 'Diamond Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(275, 'Surf Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(276, 'Nautical Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(277, 'Bright Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(278, 'Purple Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(279, 'Spinnaker Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(280, 'Ultra Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(281, 'Bright Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(282, 'Dark Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(283, 'Midnight Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(284, 'Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(285, 'Sea Foam Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(286, 'Lightning blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(287, 'Maui Blue Poly', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(288, 'Util Bright Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(289, 'Matte Dark Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(290, 'Matte Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(291, 'Matte Midnight Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(292, 'Light blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(293, 'Taxi Yellow', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(294, 'Race Yellow', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(295, ' Bronze', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(296, 'Yellow Bird', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(297, 'Lime', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(298, 'Champagne', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(299, 'Pueblo Beige', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(300, 'Dark Ivory', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(301, 'Choco Brown', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(302, 'Golden Brown', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(303, 'Light Brown', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(304, 'Straw Beige', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(305, 'Moss Brown', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(306, 'Biston Brown', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(307, 'Beechwood', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(308, 'Dark Beechwood', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(309, 'Choco Orange', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(310, ' Beach Sand', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(311, 'Sun Bleeched Sand', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(312, 'Cream', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(313, 'Brown', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(314, 'Medium Brown', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(315, 'Light Brown', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(316, 'White', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(317, 'Frost White', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(318, 'Honey Beige', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(319, 'Brown', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(320, 'Dark Brown', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(321, 'straw beige', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(322, 'Steel', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(323, 'Black steel', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(324, 'Brushed Aluminium', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(325, 'Chrome', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(326, 'Worn Off White', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(327, 'Util Off White', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(328, 'Light Orange', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(329, 'Securicor Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(330, 'Taxi Yellow', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(331, 'police car blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(332, 'Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(333, 'Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(334, 'Olive Army Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(335, 'Hot Pink', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(336, 'Salmon pink', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(337, 'Vermillion Pink', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(338, 'Orange', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(339, 'Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(340, 'Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(341, 'Black Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(342, 'Purple', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(343, 'Black Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(344, 'hunter green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(345, 'Purple', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(346, 'V Dark Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(347, 'MODSHOP BLACK1', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(348, 'Purple', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(349, 'Dark Purple', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(350, 'Lava Red', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(351, 'Desert Tan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(352, 'Foilage Green', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(353, 'DEFAULT ALLOY COLOR', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(354, 'Epsilon Blue', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(355, 'Gold', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(356, 'Brushed Gold', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `reg_no` longtext DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `is_blocked` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `federal_state_id` int(11) DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `reg_user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `email`, `address`, `phone`, `logo`, `website`, `reg_no`, `document`, `description`, `is_blocked`, `created_at`, `modified_at`, `federal_state_id`, `owner_id`, `reg_user_id`) VALUES
(1, 'Maandhis', 'info@maandhis.com', 'Hodan Talex mogadishu Somalia', '+252634034190', '', 'https://maadhis.com', '478499556', '', 'Maandhis', 0, '2023-02-18 13:36:29.922984', '2023-02-18 13:36:29.922984', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `modified_at`) VALUES
(2, 'Afghanistan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(3, 'Albania', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(4, 'Algeria', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(5, 'Andorra', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(6, 'Angola', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(7, 'Antigua and Barbuda', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(8, 'Argentina', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(9, 'Armenia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(10, 'Australia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(11, 'Austria', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(12, 'Azerbaijan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(13, 'Bahamas', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(14, 'Bahrain', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(15, 'Bangladesh', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(16, 'Barbados', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(17, 'Belarus', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(18, 'Belgium', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(19, 'Belize', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(20, 'Benin', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(21, 'Bhutan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(22, 'Bolivia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(23, 'Bosnia and Herzegovina', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(24, 'Botswana', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(25, 'Brazil', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(26, 'Brunei', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(27, 'Bulgaria', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(28, 'Burkina Faso', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(29, 'Burundi', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(30, 'Cape Verde', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(31, 'Cambodia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(32, 'Cameroon', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(33, 'Canada', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(34, 'Central African Republic', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(35, 'Chad', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(36, 'Chile', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(37, 'China', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(38, 'Colombia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(39, 'Comoros', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(40, 'Congo, Democratic Republic', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(41, 'Congo', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(42, 'Costa Rica', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(43, 'Cote D\'Ivoire', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(44, 'Croatia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(45, 'Cuba', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(46, 'Cyprus', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(47, 'Czech Republic', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(48, 'Denmark', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(49, 'Djibouti', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(50, 'Dominica', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(51, 'Dominican Republic', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(52, 'Ecuador', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(53, 'Egypt', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(54, 'El Salvador', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(55, 'Equatorial Guinea', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(56, 'Eritrea', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(57, 'Estonia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(58, 'Eswatini', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(59, 'Ethiopia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(60, 'Fiji', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(61, 'Finland', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(62, 'France', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(63, 'Gabon', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(64, 'Gambia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(65, 'Georgia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(66, 'Germany', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(67, 'Ghana', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(68, 'Greece', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(69, 'Grenada', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(70, 'Guatemala', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(71, 'Guinea', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(72, 'Guinea-Bissau', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(73, 'Guyana', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(74, 'Greenland', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(75, 'Haiti', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(76, 'Honduras', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(77, 'Hungary', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(78, 'Iceland', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(79, 'India', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(80, 'Indonesia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(81, 'Iran', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(82, 'Iraq', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(83, 'Ireland', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(84, 'Italy', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(85, 'Jamaica', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(86, 'Japan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(87, 'Jordan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(88, 'Kazakhstan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(89, 'Kenya', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(90, 'Kiribati', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(91, 'Kosovo', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(92, 'Kuwait', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(93, 'Kyrgyzstan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(94, 'Laos', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(95, 'Latvia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(96, 'Lebanon', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(97, 'Lesotho', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(98, 'Liberia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(99, 'Libyan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(100, 'Liechtenstein', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(101, 'Lithuania', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(102, 'Luxembourg', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(103, 'Madagascar', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(104, 'Malawi', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(105, 'Malaysia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(106, 'Maldives', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(107, 'Mali', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(108, 'Malta', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(109, 'Marshall Islands', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(110, 'Mauritania', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(111, 'Mauritius', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(112, 'Mexico', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(113, 'Micronesia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(114, 'Moldova', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(115, 'Monaco', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(116, 'Mongolia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(117, 'Montenegro', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(118, 'Morocco', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(119, 'Mozambique', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(120, 'Myanmar', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(121, 'Macedonia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(122, 'Namibia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(123, 'Nauru', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(124, 'Nepal', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(125, 'Netherlands', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(126, 'New Zealand', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(127, 'Nicaragua', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(128, 'Niger', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(129, 'Nigeria', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(130, 'North Korea', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(131, 'Norway', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(132, 'Oman', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(133, 'Pakistan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(134, 'Palau', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(135, 'Palestine', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(136, 'Panama', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(137, 'Papua New Guinea', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(138, 'Paraguay', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(139, 'Peru', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(140, 'Philippines', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(141, 'Poland', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(142, 'Portugal', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(143, 'Puerto Rico', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(144, 'Qatar', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(145, 'Romania', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(146, 'Russia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(147, 'Rwanda', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(148, 'St. Kitts & Nevis', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(149, 'St. Lucia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(150, 'St. Vincent & Grenadines', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(151, 'Samoa', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(152, 'San Marino', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(153, 'Sao Tome and Principe', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(154, 'Saudi Arabia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(155, 'Senegal', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(156, 'Serbia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(157, 'Seychelles', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(158, 'Sierra Leone', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(159, 'Singapore', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(160, 'Slovakia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(161, 'Slovenia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(162, 'Solomon Islands', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(163, 'Somalia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(164, 'South Africa', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(165, 'South Korea', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(166, 'South Sudan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(167, 'Spain', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(168, 'Sri Lanka', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(169, 'Sudan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(170, 'Suriname', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(171, 'Swaziland', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(172, 'Sweden', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(173, 'Switzerland', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(174, 'Syria', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(175, 'Taiwan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(176, 'Tajikistan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(177, 'Tanzania', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(178, 'Thailand', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(179, 'Togo', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(180, 'Tonga', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(181, 'Trinidad and Tobago', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(182, 'Tunisia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(183, 'Turkey', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(184, 'Turkmenistan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(185, 'Tuvalu', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(186, 'Uganda', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(187, 'Ukraine', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(188, 'United Arab Emirates', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(189, 'United Kingdom', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(190, 'Uruguay', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(191, 'Uzbekistan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(192, 'Vanuatu', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(193, 'Vatican City', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(194, 'Venezuela', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(195, 'Vietnam', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(196, 'Zambia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(197, 'Zimbabwe', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `fourth_name` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `full_name` longtext NOT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(100) DEFAULT NULL,
  `personal_id` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `blood_group_id` int(11) DEFAULT NULL,
  `federal_state_id` int(11) DEFAULT NULL,
  `nationality_id` int(11) NOT NULL,
  `personal_id_type_id` int(11) DEFAULT NULL,
  `reg_user_id` bigint(20) NOT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `firstname`, `middle_name`, `lastname`, `fourth_name`, `mother_name`, `full_name`, `gender`, `date_of_birth`, `place_of_birth`, `personal_id`, `email`, `address`, `phone`, `photo`, `document`, `is_verified`, `created_at`, `modified_at`, `blood_group_id`, `federal_state_id`, `nationality_id`, `personal_id_type_id`, `reg_user_id`, `description`) VALUES
(1, 'Ahmed', 'Jaamac', 'Geedi', 'Jaamac', 'Hindi Maxamud Jamac', 'Ahmed Jaamac Geedi Jaamac', 'Male', '2023-02-12', NULL, '458787846693', 'a@me.com', 'Mogadishu', '13243546798', 'customer_images/7309681-removebg-preview_2udf4g7.png', 'customer_document/liiska_lamabarada_a8MnFXm.pdf', 1, '2023-02-12 06:36:07.440182', '2023-02-18 13:30:42.332785', 1, 1, 3, 1, 1, 'verified'),
(2, 'Xalima', 'Axmed', 'Liban', 'Cabdi', 'Marwo Cali Xassen Axmed', 'Xalima Axmed Liban Cabdi', 'Female', '2007-05-20', NULL, 'P0779874577', 'halima@gmail.com', 'Hodan Talex mogadishu Somalia', '615121489', 'customer_images/7309681-removebg-preview_vpAxNkC.png', 'customer_document/printer-test-page-color_UNlZZ4e.pdf', 0, '2023-02-13 07:23:30.249287', '2023-02-18 12:13:56.785912', 3, 1, 163, 1, 1, NULL),
(3, 'Xamid', 'Ali', 'Xasen', 'Raage', 'Aamino Maxamed Cali', 'Xamid Ali Xasen Raage', 'Male', '2023-02-13', NULL, 'P07798745', 'xamdi@gmail.com', 'Hodan Banaadir', '615478596', 'customer_images/7309681-removebg-preview_HFoWPy1.png', '', 0, '2023-02-13 07:43:37.231742', '2023-02-13 07:43:37.231742', 3, 1, 3, 1, 1, NULL),
(4, 'Asad', 'Xalane', 'Abshir', 'Afyare', 'Marwo Cali Xassen Cilmi', 'Asad Xalane Abshir Afyare', 'Male', '2023-02-13', NULL, 'P0777987', 'a@gmain.com', 'Hodan Banaadir', '614253696', 'customer_images/7309681-removebg-preview_FUD9iWg.png', 'printer-test-page-color.pdf', 0, '2023-02-13 07:45:34.300387', '2023-02-13 07:45:34.300387', 2, 1, 2, 1, 1, 'qofkaan wlahubiyay'),
(5, 'Maxamed', 'Ali', 'Maxamed', 'Maxamuud', 'Isniino Ali Abdi', 'Maxamed Ali Maxamed Maxamuud', 'Female', '2023-02-13', NULL, 'P0789696', 'is@gmain.com', 'Hodan Talex', '615478525', 'customer_images/7309681-removebg-preview_XxXTXiM.png', 'customer_document/printer-test-page-color_aQ6MmV5.pdf', 1, '2023-02-13 07:46:47.299805', '2023-02-13 11:53:32.173329', 4, 1, 5, 1, 1, 'sddsfgds'),
(6, 'Xasen', 'Ali', 'Jaamac', 'Axmed', 'Asiyo Jaamac', 'Xasen Ali Jaamac Axmed', 'Male', '2011-02-14', NULL, 'P077984985', 'a@gmain.com', 'Hodan Banaadir Mogadishu Somalia', '64597984', 'customer_images/7309681-removebg-preview_TgSBrgO.png', 'customer_document/liiska_lamabarada.pdf', 1, '2023-02-13 08:33:28.813782', '2023-02-18 11:58:44.695844', 3, 1, 163, 1, 1, 'liiska lamabrada');

-- --------------------------------------------------------

--
-- Table structure for table `cylinder`
--

CREATE TABLE `cylinder` (
  `cylinder_id` int(11) NOT NULL,
  `cylinder_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cylinder`
--

INSERT INTO `cylinder` (`cylinder_id`, `cylinder_name`, `created_at`, `modified_at`, `reg_user_id`) VALUES
(2, '3', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(3, '4', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(4, '5', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(5, '6', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(6, '8', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(7, '10', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(8, '12', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(9, '16', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-02-13 05:58:17.711162', '1', 'mo@nisa.com', 2, '[{\"changed\": {\"fields\": [\"Username\", \"Phone\", \"Avatar\"]}}]', 8, 1),
(2, '2023-02-15 07:14:50.111793', '1', 'Audi', 1, '[{\"added\": {}}]', 23, 1),
(3, '2023-02-15 13:04:45.075515', '1', 'plate object (1)', 1, '[{\"added\": {}}]', 25, 1),
(4, '2023-02-18 12:49:52.829838', '1', 'licensetype object (1)', 1, '[{\"added\": {}}]', 27, 1),
(5, '2023-02-18 12:50:00.278818', '2', 'licensetype object (2)', 1, '[{\"added\": {}}]', 27, 1),
(6, '2023-02-18 12:50:07.155614', '3', 'licensetype object (3)', 1, '[{\"added\": {}}]', 27, 1),
(7, '2023-02-18 12:51:23.528878', '1', 'account object (1)', 1, '[{\"added\": {}}]', 9, 1),
(8, '2023-02-18 12:51:54.161536', '1', 'receipt_voucher object (1)', 1, '[{\"added\": {}}]', 11, 1),
(9, '2023-02-18 12:52:17.417318', '1', 'license object (1)', 1, '[{\"added\": {}}]', 19, 1),
(10, '2023-02-18 13:22:16.340668', '1', 'transfare_vehicles object (1)', 1, '[{\"added\": {}}]', 24, 1),
(11, '2023-02-18 13:36:29.925148', '1', 'company object (1)', 1, '[{\"added\": {}}]', 13, 1),
(12, '2023-02-18 14:09:22.230142', '1', 'receipt_voucher object (1)', 2, '[{\"changed\": {\"fields\": [\"Rv number\"]}}]', 11, 1),
(13, '2023-02-18 14:10:16.869272', '2', 'receipt_voucher object (2)', 1, '[{\"added\": {}}]', 11, 1),
(14, '2023-02-18 14:11:52.040260', '2', 'license object (2)', 2, '[{\"changed\": {\"fields\": [\"Expired date\"]}}]', 19, 1),
(15, '2023-02-18 14:26:12.397275', '4', 'licensetype object (4)', 1, '[{\"added\": {}}]', 27, 1),
(16, '2023-02-18 14:26:20.001182', '5', 'licensetype object (5)', 1, '[{\"added\": {}}]', 27, 1),
(17, '2023-02-18 14:26:26.850904', '6', 'licensetype object (6)', 1, '[{\"added\": {}}]', 27, 1),
(18, '2023-02-18 14:26:33.501485', '7', 'licensetype object (7)', 1, '[{\"added\": {}}]', 27, 1),
(19, '2023-02-18 14:26:44.907258', '8', 'licensetype object (8)', 1, '[{\"added\": {}}]', 27, 1),
(20, '2023-02-18 14:26:57.485954', '9', 'licensetype object (9)', 1, '[{\"added\": {}}]', 27, 1),
(21, '2023-02-18 14:53:16.356988', '3', 'license object (3)', 1, '[{\"added\": {}}]', 19, 1),
(22, '2023-02-19 08:49:39.697818', '4', 'license object (4)', 1, '[{\"added\": {}}]', 19, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(19, 'Customers', 'license'),
(27, 'Customers', 'licensetype'),
(18, 'Customers', 'personal_id_type'),
(9, 'Finance', 'account'),
(10, 'Finance', 'account_types'),
(11, 'Finance', 'receipt_voucher'),
(5, 'sessions', 'session'),
(6, 'Users', 'audittrials'),
(7, 'Users', 'errorlogs'),
(8, 'Users', 'users'),
(20, 'Vehicles', 'color'),
(21, 'Vehicles', 'cylinder'),
(22, 'Vehicles', 'model_brand'),
(25, 'Vehicles', 'plate'),
(24, 'Vehicles', 'transfare_vehicles'),
(26, 'Vehicles', 'type'),
(23, 'Vehicles', 'vehicle');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-02-11 11:51:40.158588'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-02-11 11:51:40.189760'),
(3, 'auth', '0001_initial', '2023-02-11 11:51:40.299122'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-02-11 11:51:40.314735'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-02-11 11:51:40.314735'),
(6, 'auth', '0004_alter_user_username_opts', '2023-02-11 11:51:40.330358'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-02-11 11:51:40.330358'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-02-11 11:51:40.330358'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-02-11 11:51:40.345992'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-02-11 11:51:40.345992'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-02-11 11:51:40.345992'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-02-11 11:51:40.361605'),
(13, 'auth', '0011_update_proxy_permissions', '2023-02-11 11:51:40.361605'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-02-11 11:51:40.361605'),
(15, 'Finance', '0001_initial', '2023-02-11 11:51:40.392851'),
(16, 'Customers', '0001_initial', '2023-02-11 11:51:40.487478'),
(17, 'Customers', '0002_initial', '2023-02-11 11:51:40.519043'),
(18, 'Users', '0001_initial', '2023-02-11 11:51:40.690886'),
(19, 'Customers', '0003_initial', '2023-02-11 11:51:40.983887'),
(20, 'Finance', '0002_initial', '2023-02-11 11:51:41.140037'),
(21, 'Vehicles', '0001_initial', '2023-02-11 11:51:41.608725'),
(22, 'admin', '0001_initial', '2023-02-11 11:51:41.671485'),
(23, 'admin', '0002_logentry_remove_auto_add', '2023-02-11 11:51:41.687505'),
(24, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-11 11:51:41.687505'),
(25, 'sessions', '0001_initial', '2023-02-11 11:51:41.703247'),
(26, 'Customers', '0004_customer_description', '2023-02-13 10:23:48.976605'),
(27, 'Vehicles', '0002_type', '2023-02-18 06:06:21.656903'),
(28, 'Vehicles', '0003_plate_type', '2023-02-18 06:06:21.703801'),
(29, 'Customers', '0005_licensetype_license_type', '2023-02-18 12:47:21.458681'),
(30, 'Finance', '0003_receipt_voucher_reason', '2023-02-18 13:29:22.332128');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('jjskjwceyy9nc2df8yzmi895gbm2w58t', '.eJxVjMsOwiAUBf-FtSG8oV269xvIvYAWtWAKXRn_3TbpQrdnZs6beFj75NeWFp8jGQknp98NITxS2UG8Q7lVGmrpS0a6K_SgjV5qTM_z4f4dTNCmrUYFDIOMRg-BK5a0QMdAqWCdMQ6jgMHp4Sql1dwyFQcDKHm0AYPYFLGfttRarsXnkrvveU6tw_zyZOTGGrvlQlDLpdOSf746u0Wk:1pTccE:r-NDkVOf53d_68w6c4puqsjqEzBUis_DFtW-JtR2qNI', '2023-03-05 08:52:02.713853'),
('zfmfv2uch5c9qf8drlemf1uoxdyv9m20', '.eJxVjMsOwiAUBf-FtSFcyrNL934DuTy0qAVT6Mr477ZJN92emTlf4lpqLdficsnd9Tyn1nH-ODKC0gpAa2moNCBA8AtxuPbJrS0tLkcyEiCnzWN4pbKD-MTyqDTU0pfs6a7QgzZ6qzG9r4d7OpiwTVvtBTIfhqikDSBYktwbhkIEbZQyPnK0Rtr7MGgJmoloFfoBog4-8E3h5PcH-NVFnQ:1pQonO:bQRIQDwH2bLkNsGR2JSelBEOW-8ekxiil1mFCcg9nwQ', '2023-02-25 12:15:58.589394');

-- --------------------------------------------------------

--
-- Table structure for table `errorlogs`
--

CREATE TABLE `errorlogs` (
  `id` bigint(20) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Name` varchar(500) NOT NULL,
  `Expected_error` varchar(500) NOT NULL,
  `field_error` varchar(500) NOT NULL,
  `trace_back` longtext NOT NULL,
  `line_number` int(11) NOT NULL,
  `date_recorded` datetime(6) NOT NULL,
  `browser` varchar(500) NOT NULL,
  `ip_address` varchar(500) NOT NULL,
  `user_agent` longtext NOT NULL,
  `Avatar` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `errorlogs`
--

INSERT INTO `errorlogs` (`id`, `Username`, `Name`, `Expected_error`, `field_error`, `trace_back`, `line_number`, `date_recorded`, `browser`, `ip_address`, `user_agent`, `Avatar`) VALUES
(1, 'AD00001', ' ', '<class \'AttributeError\'>', '\'QuerySet\' object has no attribute \'save\'', 'Traceback (most recent call last):\n  File \"D:\\gaadiidka\\Customers\\views.py\", line 476, in activate_customer\n    customer.save()\n    ^^^^^^^^^^^^^\nAttributeError: \'QuerySet\' object has no attribute \'save\'\n', 476, '2023-02-13 10:28:43.233754', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge', 'Avatars/7309681-removebg-preview.png'),
(2, 'AD00001', ' ', '<class \'AttributeError\'>', '\'NoneType\' object has no attribute \'is_verified\'', 'Traceback (most recent call last):\n  File \"D:\\gaadiidka\\Customers\\views.py\", line 473, in activate_customer\n    customer.is_verified = True\n    ^^^^^^^^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'is_verified\'\n', 473, '2023-02-13 10:29:43.219383', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge', 'Avatars/7309681-removebg-preview.png'),
(3, 'AD00001', ' ', '<class \'AttributeError\'>', '\'NoneType\' object has no attribute \'full_name\'', 'Traceback (most recent call last):\n  File \"D:\\gaadiidka\\Customers\\views.py\", line 473, in activate_customer\n    print(customer.full_name)\n          ^^^^^^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'full_name\'\n', 473, '2023-02-13 10:31:26.373960', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge', 'Avatars/7309681-removebg-preview.png'),
(4, 'AD00001', ' ', '<class \'AttributeError\'>', '\'NoneType\' object has no attribute \'full_name\'', 'Traceback (most recent call last):\n  File \"D:\\gaadiidka\\Customers\\views.py\", line 473, in activate_customer\n    print(customer.full_name)\n          ^^^^^^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'full_name\'\n', 473, '2023-02-13 10:31:52.207236', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge', 'Avatars/7309681-removebg-preview.png'),
(5, 'AD00001', ' ', '<class \'AttributeError\'>', '\'NoneType\' object has no attribute \'full_name\'', 'Traceback (most recent call last):\n  File \"D:\\gaadiidka\\Customers\\views.py\", line 473, in activate_customer\n    print(customer.full_name)\n          ^^^^^^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'full_name\'\n', 473, '2023-02-13 10:32:26.906826', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge', 'Avatars/7309681-removebg-preview.png'),
(6, 'AD00001', ' ', '<class \'AttributeError\'>', '\'NoneType\' object has no attribute \'full_name\'', 'Traceback (most recent call last):\n  File \"D:\\gaadiidka\\Customers\\views.py\", line 473, in activate_customer\n    print(customer.full_name)\n          ^^^^^^^^^^^^^^^^^^\nAttributeError: \'NoneType\' object has no attribute \'full_name\'\n', 473, '2023-02-13 10:40:34.595615', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge', 'Avatars/7309681-removebg-preview.png'),
(7, 'AD00001', ' ', '<class \'AttributeError\'>', '\'QuerySet\' object has no attribute \'full_name\'', 'Traceback (most recent call last):\n  File \"D:\\gaadiidka\\Customers\\views.py\", line 474, in activate_customer\n    print(customer.full_name)\n          ^^^^^^^^^^^^^^^^^^\nAttributeError: \'QuerySet\' object has no attribute \'full_name\'\n', 474, '2023-02-13 10:47:45.508766', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge', 'Avatars/7309681-removebg-preview.png'),
(8, 'AD00001', ' ', '<class \'AttributeError\'>', '\'customer\' object has no attribute \'update\'', 'Traceback (most recent call last):\n  File \"D:\\gaadiidka\\Customers\\views.py\", line 479, in activate_customer\n    customer.update()\n    ^^^^^^^^^^^^^^^\nAttributeError: \'customer\' object has no attribute \'update\'\n', 479, '2023-02-13 10:54:37.339885', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge', 'Avatars/7309681-removebg-preview.png'),
(9, 'AD00001', ' ', '<class \'AttributeError\'>', '\'customer\' object has no attribute \'update\'', 'Traceback (most recent call last):\n  File \"D:\\gaadiidka\\Customers\\views.py\", line 476, in activate_customer\n    customer.update(is_verified=True,\n    ^^^^^^^^^^^^^^^\nAttributeError: \'customer\' object has no attribute \'update\'\n', 476, '2023-02-13 10:59:16.473254', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge', 'Avatars/7309681-removebg-preview.png'),
(10, 'AD00001', ' ', '<class \'AttributeError\'>', '\'customer\' object has no attribute \'update\'', 'Traceback (most recent call last):\n  File \"D:\\gaadiidka\\Customers\\views.py\", line 476, in activate_customer\n    customer.update(is_verified=True,\n    ^^^^^^^^^^^^^^^\nAttributeError: \'customer\' object has no attribute \'update\'\n', 476, '2023-02-13 10:59:44.790552', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge', 'Avatars/7309681-removebg-preview.png'),
(11, 'AD00001', ' ', '<class \'AttributeError\'>', '\'customer\' object has no attribute \'update\'', 'Traceback (most recent call last):\n  File \"D:\\gaadiidka\\Customers\\views.py\", line 476, in activate_customer\n    customer.update(is_verified=True,\n    ^^^^^^^^^^^^^^^\nAttributeError: \'customer\' object has no attribute \'update\'\n', 476, '2023-02-13 10:59:59.514020', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge', 'Avatars/7309681-removebg-preview.png'),
(12, 'AD00001', ' ', '<class \'AttributeError\'>', '\'QuerySet\' object has no attribute \'save\'', 'Traceback (most recent call last):\n  File \"D:\\gaadiidka\\Customers\\views.py\", line 477, in activate_customer\n    customer.save()\n    ^^^^^^^^^^^^^\nAttributeError: \'QuerySet\' object has no attribute \'save\'\n', 477, '2023-02-13 11:26:12.339984', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge', 'Avatars/7309681-removebg-preview.png'),
(13, 'AD00001', ' ', '<class \'ValueError\'>', 'Cannot assign \"<QuerySet [<blood_group: O+>]>\": \"customer.blood_group\" must be a \"blood_group\" instance.', 'Traceback (most recent call last):\n  File \"D:\\gaadiidka\\Customers\\views.py\", line 665, in update_customer\n    customer.blood_group = bload_group\n    ^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\gaadiidka\\env\\Lib\\site-packages\\django\\db\\models\\fields\\related_descriptors.py\", line 237, in __set__\n    raise ValueError(\nValueError: Cannot assign \"<QuerySet [<blood_group: O+>]>\": \"customer.blood_group\" must be a \"blood_group\" instance.\n', 665, '2023-02-18 11:51:02.643659', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge', 'Avatars/7309681-removebg-preview.png');

-- --------------------------------------------------------

--
-- Table structure for table `federal_state`
--

CREATE TABLE `federal_state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `id` bigint(20) NOT NULL,
  `finger_print_template` longtext DEFAULT NULL,
  `finger_print_image` longtext DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `license`
--

CREATE TABLE `license` (
  `license_id` int(11) NOT NULL,
  `place_of_issue` varchar(100) NOT NULL,
  `expired_date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `reg_no` longtext DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `federal_state_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `receipt_voucher_id` int(11) DEFAULT NULL,
  `reg_user_id` bigint(20) NOT NULL,
  `type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `license`
--

INSERT INTO `license` (`license_id`, `place_of_issue`, `expired_date`, `status`, `reg_no`, `document`, `created_at`, `modified_at`, `federal_state_id`, `owner_id`, `receipt_voucher_id`, `reg_user_id`, `type_id`) VALUES
(1, 'Mogadishu', '2023-02-28', 'Active', '1477855474', '', '2023-02-18 12:52:17.416322', '2023-02-18 12:52:17.416322', 1, 1, 1, 1, 1),
(2, 'Banaadir', '2023-02-17', 'Expired', '2355475', '', '2023-02-18 14:10:31.364611', '2023-02-18 14:11:54.311185', 1, 3, 2, 1, 1),
(3, 'Mogadishu', '2023-02-28', 'Active', '12312312312', '', '2023-02-18 14:53:16.354888', '2023-02-18 14:53:16.354888', 1, 3, 2, 1, 6),
(4, 'Banaadir', '2023-02-20', 'Active', '45512012', '', '2023-02-19 08:49:39.696478', '2023-02-19 08:49:39.696478', 1, 3, 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `licensetype`
--

CREATE TABLE `licensetype` (
  `type_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `model_brand`
--

INSERT INTO `model_brand` (`brand_id`, `brand_name`, `created_at`, `modified_at`, `reg_user_id`) VALUES
(1, 'Abarth', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(2, 'Alfa Romeo', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(3, 'Aston Martin', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(4, 'Audi', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(5, 'Bentley', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(6, 'BMW', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(7, 'Bugatti', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(8, 'Cadillac', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(9, 'Chevrolet', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(10, 'Chrysler', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(11, 'Citroën', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(12, 'Dacia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(13, 'Daewoo', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(14, 'Daihatsu', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(15, 'Dodge', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(16, 'Donkervoort', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(17, 'DS', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(18, 'Ferrari', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(19, 'Fiat', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(20, 'Fisker', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(21, 'Ford', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(22, 'Honda', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(23, 'Hummer', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(24, 'Hyundai', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(25, 'Infiniti', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(26, 'Iveco', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(27, 'Jaguar', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(28, 'Jeep', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(29, 'Kia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(30, 'KTM', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(31, 'Lamborghini', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(32, 'Lancia', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(33, 'Land Rover', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(34, 'Landwind', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(35, 'Lexus', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(36, 'Lotus', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(37, 'Maserati', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(38, 'Maybach', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(39, 'Mazda', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(40, 'McLaren', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(41, 'Mercedes-Benz', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(42, 'MG', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(43, 'Mini', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(44, 'Mitsubishi', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(45, 'Morgan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(46, 'Nissan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(47, 'Opel', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(48, 'Peugeot', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(49, 'Porsche', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(50, 'Renault', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(51, 'Rolls-Royce', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(52, 'Rover', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(53, 'Saab', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(54, 'Seat', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(55, 'Skoda', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(56, 'Smart', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(57, 'SsangYong', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(58, 'Subaru', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(59, 'Suzuki', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(60, 'Tesla', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(61, 'Toyota', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(62, 'Volkswagen', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0),
(63, 'Volvo', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `personal_id_type`
--

CREATE TABLE `personal_id_type` (
  `personal_id` int(11) NOT NULL,
  `personal_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personal_id_type`
--

INSERT INTO `personal_id_type` (`personal_id`, `personal_name`, `created_at`, `modified_at`) VALUES
(1, 'Passport', '2023-02-05 11:55:16.000000', '2023-02-05 11:55:16.000000'),
(2, 'License', '2023-02-05 11:55:16.000000', '2023-02-05 11:55:16.000000'),
(3, 'Dhalasho & Sugnaan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `plate`
--

CREATE TABLE `plate` (
  `plate_id` int(11) NOT NULL,
  `plate_code` varchar(100) NOT NULL,
  `plate_no` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint(20) NOT NULL,
  `state_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plate`
--

INSERT INTO `plate` (`plate_id`, `plate_code`, `plate_no`, `year`, `created_at`, `modified_at`, `reg_user_id`, `state_id`, `vehicle_id`, `type_id`) VALUES
(1, 'A', 1, 2022, '2023-02-15 13:04:45.074002', '2023-02-15 13:04:45.074002', 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `receipt_voucher`
--

CREATE TABLE `receipt_voucher` (
  `rv_id` int(11) NOT NULL,
  `rv_number` varchar(100) NOT NULL,
  `rv_amount` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint(20) NOT NULL,
  `rv_from_id` int(11) NOT NULL,
  `reason` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receipt_voucher`
--

INSERT INTO `receipt_voucher` (`rv_id`, `rv_number`, `rv_amount`, `created_at`, `modified_at`, `reg_user_id`, `rv_from_id`, `reason`) VALUES
(1, '14259', '45', '2023-02-18 12:51:54.159618', '2023-02-18 14:09:22.230142', 1, 1, NULL),
(2, '475869', '50', '2023-02-18 14:10:16.867879', '2023-02-18 14:10:16.867879', 1, 3, 'New License');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `avatar` varchar(100) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_state` tinyint(1) NOT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `federal_state_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`, `phone`, `gender`, `avatar`, `is_admin`, `is_state`, `modified_at`, `federal_state_id`) VALUES
(1, 'pbkdf2_sha256$390000$sKaDcWtVLU6KzjGeJ8p6tj$QnKAkFcFuIAhSNg7EOSu9s90br8//2V7CTgPAtU5tP0=', '2023-02-19 08:43:58.218976', 1, 'AD00001', '', '', 1, 1, '2023-02-11 11:58:20.000000', 'mo@nisa.com', 'q121', NULL, 'Avatars/7309681-removebg-preview.png', 0, 0, '2023-02-13 05:58:17.706174', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` bigint(20) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_user_permissions`
--

CREATE TABLE `users_user_permissions` (
  `id` bigint(20) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `vehicle_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `hp` varchar(100) DEFAULT NULL,
  `pessenger_seat` varchar(100) DEFAULT NULL,
  `vin` varchar(100) DEFAULT NULL,
  `enginer_no` varchar(100) DEFAULT NULL,
  `rv_number` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `color_id` int(11) NOT NULL,
  `cylinder_id` int(11) NOT NULL,
  `origin_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `reg_user_id` bigint(20) NOT NULL,
  `vehicle_model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`vehicle_id`, `year`, `weight`, `hp`, `pessenger_seat`, `vin`, `enginer_no`, `rv_number`, `created_at`, `modified_at`, `color_id`, `cylinder_id`, `origin_id`, `owner_id`, `reg_user_id`, `vehicle_model_id`) VALUES
(1, 2020, '1500', '12000', '4', '4789562', '78499647466', '412536', '2023-02-15 07:14:50.109798', '2023-02-15 07:14:50.109798', 213, 5, 2, 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles_transfare_vehicles`
--

CREATE TABLE `vehicles_transfare_vehicles` (
  `transfare_id` int(11) NOT NULL,
  `rv_number` varchar(50) NOT NULL,
  `document` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `transfare_reason` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `new_owner_id` int(11) NOT NULL,
  `old_owner_id` int(11) NOT NULL,
  `reg_user_id` bigint(20) NOT NULL,
  `vehicle_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles_transfare_vehicles`
--

INSERT INTO `vehicles_transfare_vehicles` (`transfare_id`, `rv_number`, `document`, `description`, `transfare_reason`, `created_at`, `modified_at`, `new_owner_id`, `old_owner_id`, `reg_user_id`, `vehicle_id`) VALUES
(1, 'RV14259', '', 'walakala wrejjiyaay', 'wuu iska gaday', '2023-02-18 13:22:16.338445', '2023-02-18 13:22:16.338445', 2, 1, 1, 1);

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
  ADD PRIMARY KEY (`type_id`);

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
-- Indexes for table `plate`
--
ALTER TABLE `plate`
  ADD PRIMARY KEY (`plate_id`),
  ADD KEY `plate_reg_user_id_744c09e8_fk_users_id` (`reg_user_id`),
  ADD KEY `plate_state_id_3b014cea_fk_federal_state_state_id` (`state_id`),
  ADD KEY `plate_vehicle_id_8ac47235_fk_vehicle_vehicle_id` (`vehicle_id`),
  ADD KEY `plate_type_id_ae5aca22_fk_type_type_id` (`type_id`);

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
  ADD KEY `users_federal_state_id_a5c6fb46_fk_federal_state_state_id` (`federal_state_id`);

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
  ADD KEY `vehicle_reg_user_id_713ecd80_fk_users_id` (`reg_user_id`),
  ADD KEY `vehicle_vehicle_model_id_2a7997b8_fk_model_brand_brand_id` (`vehicle_model_id`);

--
-- Indexes for table `vehicles_transfare_vehicles`
--
ALTER TABLE `vehicles_transfare_vehicles`
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
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `audittrials`
--
ALTER TABLE `audittrials`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `blood_group`
--
ALTER TABLE `blood_group`
  MODIFY `blood_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=357;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cylinder`
--
ALTER TABLE `cylinder`
  MODIFY `cylinder_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `errorlogs`
--
ALTER TABLE `errorlogs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `federal_state`
--
ALTER TABLE `federal_state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fingerprints`
--
ALTER TABLE `fingerprints`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `license`
--
ALTER TABLE `license`
  MODIFY `license_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `licensetype`
--
ALTER TABLE `licensetype`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `model_brand`
--
ALTER TABLE `model_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `personal_id_type`
--
ALTER TABLE `personal_id_type`
  MODIFY `personal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `plate`
--
ALTER TABLE `plate`
  MODIFY `plate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `receipt_voucher`
--
ALTER TABLE `receipt_voucher`
  MODIFY `rv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_user_permissions`
--
ALTER TABLE `users_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehicles_transfare_vehicles`
--
ALTER TABLE `vehicles_transfare_vehicles`
  MODIFY `transfare_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Constraints for table `plate`
--
ALTER TABLE `plate`
  ADD CONSTRAINT `plate_reg_user_id_744c09e8_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `plate_state_id_3b014cea_fk_federal_state_state_id` FOREIGN KEY (`state_id`) REFERENCES `federal_state` (`state_id`),
  ADD CONSTRAINT `plate_type_id_ae5aca22_fk_type_type_id` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`),
  ADD CONSTRAINT `plate_vehicle_id_8ac47235_fk_vehicle_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`);

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
  ADD CONSTRAINT `users_federal_state_id_a5c6fb46_fk_federal_state_state_id` FOREIGN KEY (`federal_state_id`) REFERENCES `federal_state` (`state_id`);

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
  ADD CONSTRAINT `vehicle_reg_user_id_713ecd80_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `vehicle_vehicle_model_id_2a7997b8_fk_model_brand_brand_id` FOREIGN KEY (`vehicle_model_id`) REFERENCES `model_brand` (`brand_id`);

--
-- Constraints for table `vehicles_transfare_vehicles`
--
ALTER TABLE `vehicles_transfare_vehicles`
  ADD CONSTRAINT `Vehicles_transfare_v_new_owner_id_a8719238_fk_customers` FOREIGN KEY (`new_owner_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `Vehicles_transfare_v_old_owner_id_7cee99c1_fk_customers` FOREIGN KEY (`old_owner_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `Vehicles_transfare_v_vehicle_id_bdf6795e_fk_vehicle_v` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`),
  ADD CONSTRAINT `Vehicles_transfare_vehicles_reg_user_id_4a859d12_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
