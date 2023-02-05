-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2023 at 10:09 AM
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
  `account_type_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `type_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, '', 'AD00002', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-05 06:37:33.641467', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(2, '', 'AD00002', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-05 06:40:50.380835', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge'),
(3, '', 'AD00002', '/login', ' ', '  logged into the System', 'Users Module', '2023-02-05 07:55:57.275960', 'Windows', 'ChromiumEdge', '127.0.0.1', '127.0.0.1,Windows,ChromiumEdge');

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
(33, 'Can add receipt_voucher', 9, 'add_receipt_voucher'),
(34, 'Can change receipt_voucher', 9, 'change_receipt_voucher'),
(35, 'Can delete receipt_voucher', 9, 'delete_receipt_voucher'),
(36, 'Can view receipt_voucher', 9, 'view_receipt_voucher'),
(37, 'Can add account', 10, 'add_account'),
(38, 'Can change account', 10, 'change_account'),
(39, 'Can delete account', 10, 'delete_account'),
(40, 'Can view account', 10, 'view_account'),
(41, 'Can add blood_group', 11, 'add_blood_group'),
(42, 'Can change blood_group', 11, 'change_blood_group'),
(43, 'Can delete blood_group', 11, 'delete_blood_group'),
(44, 'Can view blood_group', 11, 'view_blood_group'),
(45, 'Can add countries', 12, 'add_countries'),
(46, 'Can change countries', 12, 'change_countries'),
(47, 'Can delete countries', 12, 'delete_countries'),
(48, 'Can view countries', 12, 'view_countries'),
(49, 'Can add customer', 13, 'add_customer'),
(50, 'Can change customer', 13, 'change_customer'),
(51, 'Can delete customer', 13, 'delete_customer'),
(52, 'Can view customer', 13, 'view_customer'),
(53, 'Can add federal_state', 14, 'add_federal_state'),
(54, 'Can change federal_state', 14, 'change_federal_state'),
(55, 'Can delete federal_state', 14, 'delete_federal_state'),
(56, 'Can view federal_state', 14, 'view_federal_state'),
(57, 'Can add personal_id_type', 15, 'add_personal_id_type'),
(58, 'Can change personal_id_type', 15, 'change_personal_id_type'),
(59, 'Can delete personal_id_type', 15, 'delete_personal_id_type'),
(60, 'Can view personal_id_type', 15, 'view_personal_id_type'),
(61, 'Can add license', 16, 'add_license'),
(62, 'Can change license', 16, 'change_license'),
(63, 'Can delete license', 16, 'delete_license'),
(64, 'Can view license', 16, 'view_license'),
(65, 'Can add customer_fingers', 17, 'add_customer_fingers'),
(66, 'Can change customer_fingers', 17, 'change_customer_fingers'),
(67, 'Can delete customer_fingers', 17, 'delete_customer_fingers'),
(68, 'Can view customer_fingers', 17, 'view_customer_fingers'),
(69, 'Can add company', 18, 'add_company'),
(70, 'Can change company', 18, 'change_company'),
(71, 'Can delete company', 18, 'delete_company'),
(72, 'Can view company', 18, 'view_company'),
(73, 'Can add color', 19, 'add_color'),
(74, 'Can change color', 19, 'change_color'),
(75, 'Can delete color', 19, 'delete_color'),
(76, 'Can view color', 19, 'view_color'),
(77, 'Can add cylinder', 20, 'add_cylinder'),
(78, 'Can change cylinder', 20, 'change_cylinder'),
(79, 'Can delete cylinder', 20, 'delete_cylinder'),
(80, 'Can view cylinder', 20, 'view_cylinder'),
(81, 'Can add model_brand', 21, 'add_model_brand'),
(82, 'Can change model_brand', 21, 'change_model_brand'),
(83, 'Can delete model_brand', 21, 'delete_model_brand'),
(84, 'Can view model_brand', 21, 'view_model_brand'),
(85, 'Can add vehicle', 22, 'add_vehicle'),
(86, 'Can change vehicle', 22, 'change_vehicle'),
(87, 'Can delete vehicle', 22, 'delete_vehicle'),
(88, 'Can view vehicle', 22, 'view_vehicle'),
(89, 'Can add transfare_vehicles', 23, 'add_transfare_vehicles'),
(90, 'Can change transfare_vehicles', 23, 'change_transfare_vehicles'),
(91, 'Can delete transfare_vehicles', 23, 'delete_transfare_vehicles'),
(92, 'Can view transfare_vehicles', 23, 'view_transfare_vehicles'),
(93, 'Can add plate', 24, 'add_plate'),
(94, 'Can change plate', 24, 'change_plate'),
(95, 'Can delete plate', 24, 'delete_plate'),
(96, 'Can view plate', 24, 'view_plate'),
(97, 'Can add account_types', 25, 'add_account_types'),
(98, 'Can change account_types', 25, 'change_account_types'),
(99, 'Can delete account_types', 25, 'delete_account_types'),
(100, 'Can view account_types', 25, 'view_account_types');

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
  `full_name` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `fourth_name` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(100) DEFAULT NULL,
  `personal_id` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `blood_group_id` int(11) DEFAULT NULL,
  `federal_state_id` int(11) DEFAULT NULL,
  `nationality_id` int(11) NOT NULL,
  `personal_id_type_id` int(11) DEFAULT NULL,
  `reg_user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(11, 'Customers', 'blood_group'),
(18, 'Customers', 'company'),
(12, 'Customers', 'countries'),
(13, 'Customers', 'customer'),
(17, 'Customers', 'customer_fingers'),
(14, 'Customers', 'federal_state'),
(16, 'Customers', 'license'),
(15, 'Customers', 'personal_id_type'),
(10, 'Finance', 'account'),
(25, 'Finance', 'account_types'),
(9, 'Finance', 'receipt_voucher'),
(5, 'sessions', 'session'),
(6, 'Users', 'audittrials'),
(7, 'Users', 'errorlogs'),
(8, 'Users', 'users'),
(19, 'Vehicles', 'color'),
(20, 'Vehicles', 'cylinder'),
(21, 'Vehicles', 'model_brand'),
(24, 'Vehicles', 'plate'),
(23, 'Vehicles', 'transfare_vehicles'),
(22, 'Vehicles', 'vehicle');

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
(1, 'contenttypes', '0001_initial', '2023-02-02 12:11:31.688392'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-02-02 12:11:31.720537'),
(3, 'auth', '0001_initial', '2023-02-02 12:11:31.846672'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-02-02 12:11:31.893529'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-02-02 12:11:31.893529'),
(6, 'auth', '0004_alter_user_username_opts', '2023-02-02 12:11:31.893529'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-02-02 12:11:31.893529'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-02-02 12:11:31.909166'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-02-02 12:11:31.909166'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-02-02 12:11:31.909166'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-02-02 12:11:31.909166'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-02-02 12:11:31.924786'),
(13, 'auth', '0011_update_proxy_permissions', '2023-02-02 12:11:31.924786'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-02-02 12:11:31.924786'),
(15, 'Users', '0001_initial', '2023-02-02 12:11:32.127908'),
(16, 'Customers', '0001_initial', '2023-02-02 12:11:32.518461'),
(17, 'Finance', '0001_initial', '2023-02-02 12:11:32.612285'),
(18, 'Users', '0002_users_federal_state_users_is_state', '2023-02-02 12:11:32.674707'),
(19, 'Vehicles', '0001_initial', '2023-02-02 12:11:33.206333'),
(20, 'admin', '0001_initial', '2023-02-02 12:11:33.268827'),
(21, 'admin', '0002_logentry_remove_auto_add', '2023-02-02 12:11:33.284438'),
(22, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-02 12:11:33.300147'),
(23, 'sessions', '0001_initial', '2023-02-02 12:11:33.315723'),
(24, 'Finance', '0002_account_types_alter_account_account_type', '2023-02-02 12:17:46.330581'),
(25, 'Customers', '0002_license_receipt_voucher', '2023-02-04 11:04:14.544705'),
(26, 'Customers', '0003_alter_personal_id_type_table', '2023-02-05 08:54:41.349408');

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
('pbtacbhdytm1aka861bgxknrelx5jfev', '.eJxVjDkOwyAURO9CHSGzg8v0OQP65kNMFogMrqLcPbbkImmmeG9m3sTD2me_trj4jGQkjJx-2QThHssu8AblWmmopS95onuFHrbRS8X4OB_dv4MZ2rytpUUtklacGT1EJtFxs4UO4ESwyokpSBXByCEl4FyljQyGIzIMSaPYT1tsLdfic8nd9_yMrcPz5cnItFHKSmYVNVoNTny--GVF3w:1pOZzN:-9kyC4CcylAvPs2PmozuTesmRPmT-fVFmJvn9IVg7mM', '2023-02-19 08:03:05.773465'),
('xpa2lj1epjqnzlhbv2rmu3s5qdnc85pj', '.eJxVjDkOwyAURO9CHSGzfnCZPmdAmA8xWSAyuIpy99iSi6SZ4r2ZeRPn1z67tcXFZSQjYeT0yyYf7rHsAm--XCsNtfQlT3Sv0MM2eqkYH-ej-3cw-zZva2lQi6QVZ6CHyCRaDlvo4K0IRlkxBamiBzmk5DlXaSMDcESGIWkU-2mLreVaXC65u56fsXX_fDkyMg1KgWWcUQkgjDWfLz4nRhk:1pOYfh:Gj_4ePeN_ady_05Bh3Zgw0_XUpeFxEaXm9JDHI9k7Uw', '2023-02-19 06:38:41.484397');

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
  `reg_user_id` bigint(20) NOT NULL,
  `receipt_voucher_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `vehicle_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `rv_from_id` int(11) NOT NULL
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
  `modified_at` datetime(6) DEFAULT NULL,
  `federal_state_id` int(11) DEFAULT NULL,
  `is_state` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`, `phone`, `gender`, `avatar`, `is_admin`, `modified_at`, `federal_state_id`, `is_state`) VALUES
(1, 'pbkdf2_sha256$390000$ebQQsOG9GRkAUvPKmTMr3z$bUSd+dRO5rmmPSOHFTZEvuETHKxVT2db2APp6FOiO6w=', '2023-02-05 07:55:57.273460', 1, 'AD00002', '', '', 1, 1, '2023-02-05 06:37:12.364771', 'mo@nisa.com', '', NULL, '', 0, '2023-02-05 06:37:12.470694', NULL, 0);

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
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `account_reg_user_id_f7e09af6_fk_users_id` (`reg_user_id`),
  ADD KEY `account_account_type_id_e4045757` (`account_type_id`);

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
  ADD KEY `customers_federal_state_id_6038d4df_fk_federal_state_state_id` (`federal_state_id`),
  ADD KEY `customers_nationality_id_ae515b28_fk_countries_country_id` (`nationality_id`),
  ADD KEY `customers_personal_id_type_id_71309a38_fk_personal_` (`personal_id_type_id`),
  ADD KEY `customers_reg_user_id_eeb8baac_fk_users_id` (`reg_user_id`),
  ADD KEY `customers_blood_group_id_a8459ea3_fk_blood_group_blood_group_id` (`blood_group_id`);

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
  ADD KEY `license_reg_user_id_946be48d_fk_users_id` (`reg_user_id`),
  ADD KEY `license_receipt_voucher_id_4942b888_fk_receipt_voucher_rv_id` (`receipt_voucher_id`);

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
  ADD KEY `plate_vehicle_id_8ac47235_fk_vehicle_vehicle_id` (`vehicle_id`);

--
-- Indexes for table `receipt_voucher`
--
ALTER TABLE `receipt_voucher`
  ADD PRIMARY KEY (`rv_id`),
  ADD KEY `receipt_voucher_reg_user_id_adade876_fk_users_id` (`reg_user_id`),
  ADD KEY `receipt_voucher_rv_from_id_513e74e5_fk_customers_customer_id` (`rv_from_id`);

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
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audittrials`
--
ALTER TABLE `audittrials`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `blood_group`
--
ALTER TABLE `blood_group`
  MODIFY `blood_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cylinder`
--
ALTER TABLE `cylinder`
  MODIFY `cylinder_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `errorlogs`
--
ALTER TABLE `errorlogs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
  MODIFY `license_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `model_brand`
--
ALTER TABLE `model_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_id_type`
--
ALTER TABLE `personal_id_type`
  MODIFY `personal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `plate`
--
ALTER TABLE `plate`
  MODIFY `plate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receipt_voucher`
--
ALTER TABLE `receipt_voucher`
  MODIFY `rv_id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicles_transfare_vehicles`
--
ALTER TABLE `vehicles_transfare_vehicles`
  MODIFY `transfare_id` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `license_reg_user_id_946be48d_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);

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
  ADD CONSTRAINT `plate_vehicle_id_8ac47235_fk_vehicle_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`);

--
-- Constraints for table `receipt_voucher`
--
ALTER TABLE `receipt_voucher`
  ADD CONSTRAINT `receipt_voucher_reg_user_id_adade876_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `receipt_voucher_rv_from_id_513e74e5_fk_customers_customer_id` FOREIGN KEY (`rv_from_id`) REFERENCES `customers` (`customer_id`);

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
