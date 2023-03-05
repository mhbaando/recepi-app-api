-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 05, 2023 at 09:44 AM
-- Server version: 8.0.32-0ubuntu0.22.04.2
-- PHP Version: 8.1.2-1ubuntu2.11
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!40101 SET NAMES utf8mb4 */
;
--
-- Database: `vrls`
--
-- --------------------------------------------------------
--
-- Table structure for table `account`
--
CREATE TABLE `account` (
  `account_id` int NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `account_number` int DEFAULT NULL,
  `amount` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `account_type_id` int NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Table structure for table `account_types`
--
CREATE TABLE `account_types` (
  `type_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `reg_user_id` bigint DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Dumping data for table `account_types`
--
INSERT INTO `account_types` (
    `type_id`,
    `name`,
    `created_at`,
    `modified_at`,
    `reg_user_id`
  )
VALUES (
    1,
    'Vehicle',
    '2023-03-05 08:44:11.744076',
    '2023-03-05 08:44:11.759784',
    NULL
  ),
  (
    2,
    'Liecense',
    '2023-03-05 08:44:11.744076',
    '2023-03-05 08:44:11.759784',
    NULL
  ),
  (
    3,
    'Plate',
    '2023-03-05 08:44:11.744076',
    '2023-03-05 08:44:11.759784',
    NULL
  );
-- --------------------------------------------------------
--
-- Table structure for table `audittrials`
--
CREATE TABLE `audittrials` (
  `id` bigint NOT NULL,
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
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Table structure for table `auth_group`
--
CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Table structure for table `auth_group_permissions`
--
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Table structure for table `auth_permission`
--
CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Dumping data for table `auth_permission`
--
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES (1, 'Can add log entry', 1, 'add_logentry'),
  (2, 'Can change log entry', 1, 'change_logentry'),
  (3, 'Can delete log entry', 1, 'delete_logentry'),
  (4, 'Can view log entry', 1, 'view_logentry'),
  (5, 'Can add permission', 2, 'add_permission'),
  (
    6,
    'Can change permission',
    2,
    'change_permission'
  ),
  (
    7,
    'Can delete permission',
    2,
    'delete_permission'
  ),
  (8, 'Can view permission', 2, 'view_permission'),
  (9, 'Can add group', 3, 'add_group'),
  (10, 'Can change group', 3, 'change_group'),
  (11, 'Can delete group', 3, 'delete_group'),
  (12, 'Can view group', 3, 'view_group'),
  (13, 'Can add content type', 4, 'add_contenttype'),
  (
    14,
    'Can change content type',
    4,
    'change_contenttype'
  ),
  (
    15,
    'Can delete content type',
    4,
    'delete_contenttype'
  ),
  (
    16,
    'Can view content type',
    4,
    'view_contenttype'
  ),
  (17, 'Can add session', 5, 'add_session'),
  (18, 'Can change session', 5, 'change_session'),
  (19, 'Can delete session', 5, 'delete_session'),
  (20, 'Can view session', 5, 'view_session'),
  (21, 'Can add audit trials', 6, 'add_audittrials'),
  (
    22,
    'Can change audit trials',
    6,
    'change_audittrials'
  ),
  (
    23,
    'Can delete audit trials',
    6,
    'delete_audittrials'
  ),
  (
    24,
    'Can view audit trials',
    6,
    'view_audittrials'
  ),
  (25, 'Can add error logs', 7, 'add_errorlogs'),
  (
    26,
    'Can change error logs',
    7,
    'change_errorlogs'
  ),
  (
    27,
    'Can delete error logs',
    7,
    'delete_errorlogs'
  ),
  (28, 'Can view error logs', 7, 'view_errorlogs'),
  (29, 'Can add users', 8, 'add_users'),
  (30, 'Can change users', 8, 'change_users'),
  (31, 'Can delete users', 8, 'delete_users'),
  (32, 'Can view users', 8, 'view_users'),
  (33, 'Can add account', 9, 'add_account'),
  (34, 'Can change account', 9, 'change_account'),
  (35, 'Can delete account', 9, 'delete_account'),
  (36, 'Can view account', 9, 'view_account'),
  (
    37,
    'Can add account_types',
    10,
    'add_account_types'
  ),
  (
    38,
    'Can change account_types',
    10,
    'change_account_types'
  ),
  (
    39,
    'Can delete account_types',
    10,
    'delete_account_types'
  ),
  (
    40,
    'Can view account_types',
    10,
    'view_account_types'
  ),
  (
    41,
    'Can add receipt_voucher',
    11,
    'add_receipt_voucher'
  ),
  (
    42,
    'Can change receipt_voucher',
    11,
    'change_receipt_voucher'
  ),
  (
    43,
    'Can delete receipt_voucher',
    11,
    'delete_receipt_voucher'
  ),
  (
    44,
    'Can view receipt_voucher',
    11,
    'view_receipt_voucher'
  ),
  (45, 'Can add blood_group', 12, 'add_blood_group'),
  (
    46,
    'Can change blood_group',
    12,
    'change_blood_group'
  ),
  (
    47,
    'Can delete blood_group',
    12,
    'delete_blood_group'
  ),
  (
    48,
    'Can view blood_group',
    12,
    'view_blood_group'
  ),
  (49, 'Can add company', 13, 'add_company'),
  (50, 'Can change company', 13, 'change_company'),
  (51, 'Can delete company', 13, 'delete_company'),
  (52, 'Can view company', 13, 'view_company'),
  (53, 'Can add countries', 14, 'add_countries'),
  (
    54,
    'Can change countries',
    14,
    'change_countries'
  ),
  (
    55,
    'Can delete countries',
    14,
    'delete_countries'
  ),
  (56, 'Can view countries', 14, 'view_countries'),
  (57, 'Can add customer', 15, 'add_customer'),
  (58, 'Can change customer', 15, 'change_customer'),
  (59, 'Can delete customer', 15, 'delete_customer'),
  (60, 'Can view customer', 15, 'view_customer'),
  (
    61,
    'Can add customer_fingers',
    16,
    'add_customer_fingers'
  ),
  (
    62,
    'Can change customer_fingers',
    16,
    'change_customer_fingers'
  ),
  (
    63,
    'Can delete customer_fingers',
    16,
    'delete_customer_fingers'
  ),
  (
    64,
    'Can view customer_fingers',
    16,
    'view_customer_fingers'
  ),
  (
    65,
    'Can add federal_state',
    17,
    'add_federal_state'
  ),
  (
    66,
    'Can change federal_state',
    17,
    'change_federal_state'
  ),
  (
    67,
    'Can delete federal_state',
    17,
    'delete_federal_state'
  ),
  (
    68,
    'Can view federal_state',
    17,
    'view_federal_state'
  ),
  (69, 'Can add license', 18, 'add_license'),
  (70, 'Can change license', 18, 'change_license'),
  (71, 'Can delete license', 18, 'delete_license'),
  (72, 'Can view license', 18, 'view_license'),
  (73, 'Can add licensetype', 19, 'add_licensetype'),
  (
    74,
    'Can change licensetype',
    19,
    'change_licensetype'
  ),
  (
    75,
    'Can delete licensetype',
    19,
    'delete_licensetype'
  ),
  (
    76,
    'Can view licensetype',
    19,
    'view_licensetype'
  ),
  (
    77,
    'Can add personal_id_type',
    20,
    'add_personal_id_type'
  ),
  (
    78,
    'Can change personal_id_type',
    20,
    'change_personal_id_type'
  ),
  (
    79,
    'Can delete personal_id_type',
    20,
    'delete_personal_id_type'
  ),
  (
    80,
    'Can view personal_id_type',
    20,
    'view_personal_id_type'
  ),
  (81, 'Can add placeissue', 21, 'add_placeissue'),
  (
    82,
    'Can change placeissue',
    21,
    'change_placeissue'
  ),
  (
    83,
    'Can delete placeissue',
    21,
    'delete_placeissue'
  ),
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
  (
    94,
    'Can change model_brand',
    24,
    'change_model_brand'
  ),
  (
    95,
    'Can delete model_brand',
    24,
    'delete_model_brand'
  ),
  (
    96,
    'Can view model_brand',
    24,
    'view_model_brand'
  ),
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
  (
    109,
    'Can add transfare_vehicles',
    28,
    'add_transfare_vehicles'
  ),
  (
    110,
    'Can change transfare_vehicles',
    28,
    'change_transfare_vehicles'
  ),
  (
    111,
    'Can delete transfare_vehicles',
    28,
    'delete_transfare_vehicles'
  ),
  (
    112,
    'Can view transfare_vehicles',
    28,
    'view_transfare_vehicles'
  ),
  (113, 'Can add code_plate', 29, 'add_code_plate'),
  (
    114,
    'Can change code_plate',
    29,
    'change_code_plate'
  ),
  (
    115,
    'Can delete code_plate',
    29,
    'delete_code_plate'
  ),
  (
    116,
    'Can view code_plate',
    29,
    'view_code_plate'
  );
-- --------------------------------------------------------
--
-- Table structure for table `blood_group`
--
CREATE TABLE `blood_group` (
  `blood_group_id` int NOT NULL,
  `blood_group_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Dumping data for table `blood_group`
--
INSERT INTO `blood_group` (
    `blood_group_id`,
    `blood_group_name`,
    `created_at`,
    `modified_at`
  )
VALUES (
    1,
    'A+',
    '2023-03-05 08:44:11.708834',
    '2023-03-05 08:44:11.722012'
  ),
  (
    2,
    'A-',
    '2023-03-05 08:44:11.708834',
    '2023-03-05 08:44:11.722012'
  ),
  (
    3,
    'O+',
    '2023-03-05 08:44:11.708834',
    '2023-03-05 08:44:11.722012'
  ),
  (
    4,
    'B-',
    '2023-03-05 08:44:11.708834',
    '2023-03-05 08:44:11.722012'
  ),
  (
    5,
    'O-',
    '2023-03-05 08:44:11.708834',
    '2023-03-05 08:44:11.722012'
  ),
  (
    6,
    'AB+',
    '2023-03-05 08:44:11.708834',
    '2023-03-05 08:44:11.722012'
  ),
  (
    7,
    'AB-',
    '2023-03-05 08:44:11.708834',
    '2023-03-05 08:44:11.722012'
  );
-- --------------------------------------------------------
--
-- Table structure for table `code_plate`
--
CREATE TABLE `code_plate` (
  `code_id` int NOT NULL,
  `code_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Dumping data for table `code_plate`
--
INSERT INTO `code_plate` (
    `code_id`,
    `code_name`,
    `created_at`,
    `modified_at`,
    `reg_user_id`
  )
VALUES (
    1,
    'A',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    2
  ),
  (
    2,
    'AA',
    '2023-03-04 14:23:46.091746',
    '2023-03-04 14:24:06.053633',
    2
  ),
  (
    3,
    'AB',
    '2023-03-04 14:24:40.315794',
    '2023-03-04 14:24:40.315794',
    2
  ),
  (
    4,
    'Ac',
    '2023-03-04 14:24:58.541787',
    '2023-03-04 14:24:58.541787',
    2
  ),
  (
    5,
    'AD',
    '2023-03-05 08:59:41.451176',
    '2023-03-05 08:59:41.451176',
    2
  ),
  (
    6,
    'AE',
    '2023-03-05 09:00:00.008244',
    '2023-03-05 09:00:00.008244',
    2
  ),
  (
    7,
    'AF',
    '2023-03-05 09:00:09.407298',
    '2023-03-05 09:00:09.407298',
    2
  ),
  (
    8,
    'AG',
    '2023-03-05 09:00:19.598722',
    '2023-03-05 09:00:19.598722',
    2
  ),
  (
    9,
    'AH',
    '2023-03-05 09:00:33.942555',
    '2023-03-05 09:00:33.942555',
    2
  ),
  (
    10,
    'AI',
    '2023-03-05 09:00:53.735372',
    '2023-03-05 09:00:53.735372',
    2
  ),
  (
    11,
    'AM',
    '2023-03-05 09:01:00.565711',
    '2023-03-05 09:01:00.565711',
    2
  ),
  (
    12,
    'B',
    '2023-03-05 09:01:16.624733',
    '2023-03-05 09:01:16.624733',
    2
  ),
  (
    13,
    'M1A',
    '2023-03-05 09:01:29.887669',
    '2023-03-05 09:01:29.887669',
    2
  ),
  (
    14,
    'M2A',
    '2023-03-05 09:02:00.072583',
    '2023-03-05 09:02:00.072583',
    2
  ),
  (
    15,
    'M3A',
    '2023-03-05 09:02:18.391755',
    '2023-03-05 09:02:18.391755',
    2
  ),
  (
    16,
    'M4A',
    '2023-03-05 09:02:30.991371',
    '2023-03-05 09:02:30.991371',
    2
  ),
  (
    17,
    'M5A',
    '2023-03-05 09:02:49.943728',
    '2023-03-05 09:02:49.943728',
    2
  ),
  (
    18,
    'M6A',
    '2023-03-05 09:03:31.974213',
    '2023-03-05 09:03:31.974213',
    2
  ),
  (
    19,
    'MA',
    '2023-03-05 09:03:48.648617',
    '2023-03-05 09:03:48.648617',
    2
  ),
  (
    20,
    'MA1-',
    '2023-03-05 09:04:07.846544',
    '2023-03-05 09:04:07.846544',
    2
  ),
  (
    21,
    'MB',
    '2023-03-05 09:04:26.367695',
    '2023-03-05 09:04:26.367695',
    2
  ),
  (
    22,
    'MC',
    '2023-03-05 09:04:35.120778',
    '2023-03-05 09:04:35.120778',
    2
  ),
  (
    23,
    'MD',
    '2023-03-05 09:06:43.335074',
    '2023-03-05 09:06:43.335074',
    2
  ),
  (
    24,
    'ME',
    '2023-03-05 09:07:10.815568',
    '2023-03-05 09:07:10.815568',
    2
  ),
  (
    25,
    'MF',
    '2023-03-05 09:07:17.607185',
    '2023-03-05 09:07:17.607185',
    2
  ),
  (
    26,
    'MG',
    '2023-03-05 09:07:24.640323',
    '2023-03-05 09:07:24.640323',
    2
  ),
  (
    27,
    'MH',
    '2023-03-05 09:07:32.431371',
    '2023-03-05 09:07:32.431371',
    2
  ),
  (
    28,
    'MJ',
    '2023-03-05 09:07:56.815287',
    '2023-03-05 09:07:56.815287',
    2
  ),
  (
    29,
    'Mk',
    '2023-03-05 09:08:02.983240',
    '2023-03-05 09:08:02.984243',
    2
  ),
  (
    30,
    'ML',
    '2023-03-05 09:09:15.150475',
    '2023-03-05 09:09:24.702962',
    2
  ),
  (
    31,
    'MM',
    '2023-03-05 09:09:43.202809',
    '2023-03-05 09:09:43.202809',
    2
  ),
  (
    32,
    'MO',
    '2023-03-05 09:09:51.621689',
    '2023-03-05 09:09:51.622688',
    2
  ),
  (
    33,
    'MP',
    '2023-03-05 09:12:01.919065',
    '2023-03-05 09:12:01.919065',
    2
  ),
  (
    34,
    'MQ',
    '2023-03-05 09:12:10.311534',
    '2023-03-05 09:12:10.311534',
    2
  ),
  (
    35,
    'MR',
    '2023-03-05 09:12:17.655426',
    '2023-03-05 09:12:17.655426',
    2
  ),
  (
    36,
    'MS',
    '2023-03-05 09:12:58.223248',
    '2023-03-05 09:12:58.223248',
    2
  ),
  (
    37,
    'MT',
    '2023-03-05 09:13:05.494146',
    '2023-03-05 09:13:05.494146',
    2
  ),
  (
    38,
    'MW',
    '2023-03-05 09:13:18.877422',
    '2023-03-05 09:13:18.877422',
    2
  ),
  (
    39,
    'MX',
    '2023-03-05 09:13:25.443235',
    '2023-03-05 09:13:25.443235',
    2
  ),
  (
    40,
    'MY',
    '2023-03-05 09:13:34.510484',
    '2023-03-05 09:13:34.510484',
    2
  ),
  (
    41,
    'MZ',
    '2023-03-05 09:13:43.429957',
    '2023-03-05 09:13:54.867007',
    2
  );
-- --------------------------------------------------------
--
-- Table structure for table `color`
--
CREATE TABLE `color` (
  `color_id` int NOT NULL,
  `color_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Dumping data for table `color`
--
INSERT INTO `color` (
    `color_id`,
    `color_name`,
    `created_at`,
    `modified_at`,
    `reg_user_id`
  )
VALUES (
    213,
    'Black',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    214,
    'Graphite Black',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    215,
    'Black Steal',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    216,
    'Dark Silver',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    217,
    'Silver',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    218,
    'Blue Silver',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    219,
    'Steel Gray',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    220,
    'Shadow Silver',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    221,
    'Stone Silver',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    222,
    'Midnight Silver',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    223,
    'Gun Metal',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    224,
    'Anthracite Grey',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    225,
    'Matte Gray',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    226,
    'Matte Light Grey',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    227,
    'Util Black Poly',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    228,
    'Util Dark silver',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    229,
    'Util Silver',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    230,
    'Util Gun Metal',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    231,
    'Util Shadow Silver',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    232,
    'Graphite',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    233,
    'Silver Grey',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    234,
    'Silver',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    235,
    'Blue Silver',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    236,
    'Shadow Silver',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    237,
    'Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    238,
    'Torino Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    239,
    'Formula Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    240,
    'Blaze Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    241,
    'Graceful Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    242,
    'Garnet Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    243,
    'Desert Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    244,
    'Cabernet Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    245,
    'Candy Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    246,
    'Sunrise Orange',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    247,
    'Classic Gold',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    248,
    'Orange',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    249,
    'Dark Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    250,
    'Matte Yellow',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    251,
    'Bright Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    252,
    'Garnet Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    253,
    'Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    254,
    'Golden Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    255,
    'Dark Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    256,
    'Dark Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    257,
    'Racing Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    258,
    'Sea Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    259,
    'Olive Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    260,
    'Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    261,
    'Gasoline Blue Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    262,
    'Lime Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    263,
    'Dark Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    264,
    'Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    265,
    'Dark Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    266,
    'Worn Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    267,
    'Sea Wash',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    268,
    'Midnight Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    269,
    'Dark Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    270,
    'Saxony Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    271,
    'Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    272,
    'Mariner Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    273,
    'Harbor Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    274,
    'Diamond Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    275,
    'Surf Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    276,
    'Nautical Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    277,
    'Bright Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    278,
    'Purple Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    279,
    'Spinnaker Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    280,
    'Ultra Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    281,
    'Bright Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    282,
    'Dark Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    283,
    'Midnight Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    284,
    'Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    285,
    'Sea Foam Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    286,
    'Lightning blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    287,
    'Maui Blue Poly',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    288,
    'Util Bright Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    289,
    'Matte Dark Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    290,
    'Matte Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    291,
    'Matte Midnight Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    292,
    'Light blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    293,
    'Taxi Yellow',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    294,
    'Race Yellow',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    295,
    ' Bronze',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    296,
    'Yellow Bird',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    297,
    'Lime',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    298,
    'Champagne',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    299,
    'Pueblo Beige',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    300,
    'Dark Ivory',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    301,
    'Choco Brown',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    302,
    'Golden Brown',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    303,
    'Light Brown',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    304,
    'Straw Beige',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    305,
    'Moss Brown',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    306,
    'Biston Brown',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    307,
    'Beechwood',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    308,
    'Dark Beechwood',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    309,
    'Choco Orange',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    310,
    ' Beach Sand',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    311,
    'Sun Bleeched Sand',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    312,
    'Cream',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    313,
    'Brown',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    314,
    'Medium Brown',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    315,
    'Light Brown',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    316,
    'White',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    317,
    'Frost White',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    318,
    'Honey Beige',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    319,
    'Brown',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    320,
    'Dark Brown',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    321,
    'straw beige',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    322,
    'Steel',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    323,
    'Black steel',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    324,
    'Brushed Aluminium',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    325,
    'Chrome',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    326,
    'Worn Off White',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    327,
    'Util Off White',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    328,
    'Light Orange',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    329,
    'Securicor Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    330,
    'Taxi Yellow',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    331,
    'police car blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    332,
    'Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    333,
    'Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    334,
    'Olive Army Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    335,
    'Hot Pink',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    336,
    'Salmon pink',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    337,
    'Vermillion Pink',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    338,
    'Orange',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    339,
    'Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    340,
    'Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    341,
    'Black Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    342,
    'Purple',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    343,
    'Black Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    344,
    'hunter green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    345,
    'Purple',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    346,
    'V Dark Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    347,
    'MODSHOP BLACK1',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    348,
    'Purple',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    349,
    'Dark Purple',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    350,
    'Lava Red',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    351,
    'Desert Tan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    352,
    'Foilage Green',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    353,
    'DEFAULT ALLOY COLOR',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    354,
    'Epsilon Blue',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    355,
    'Gold',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    356,
    'Brushed Gold',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  );
-- --------------------------------------------------------
--
-- Table structure for table `company`
--
CREATE TABLE `company` (
  `company_id` int NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `reg_no` longtext,
  `document` varchar(80) DEFAULT NULL,
  `description` longtext,
  `is_blocked` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `federal_state_id` int DEFAULT NULL,
  `owner_id` int NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Table structure for table `countries`
--
CREATE TABLE `countries` (
  `country_id` int NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Dumping data for table `countries`
--
INSERT INTO `countries` (
    `country_id`,
    `country_name`,
    `created_at`,
    `modified_at`
  )
VALUES (
    2,
    'Afghanistan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    3,
    'Albania',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    4,
    'Algeria',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    5,
    'Andorra',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    6,
    'Angola',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    7,
    'Antigua and Barbuda',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    8,
    'Argentina',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    9,
    'Armenia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    10,
    'Australia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    11,
    'Austria',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    12,
    'Azerbaijan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    13,
    'Bahamas',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    14,
    'Bahrain',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    15,
    'Bangladesh',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    16,
    'Barbados',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    17,
    'Belarus',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    18,
    'Belgium',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    19,
    'Belize',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    20,
    'Benin',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    21,
    'Bhutan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    22,
    'Bolivia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    23,
    'Bosnia and Herzegovina',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    24,
    'Botswana',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    25,
    'Brazil',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    26,
    'Brunei',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    27,
    'Bulgaria',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    28,
    'Burkina Faso',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    29,
    'Burundi',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    30,
    'Cape Verde',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    31,
    'Cambodia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    32,
    'Cameroon',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    33,
    'Canada',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    34,
    'Central African Republic',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    35,
    'Chad',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    36,
    'Chile',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    37,
    'China',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    38,
    'Colombia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    39,
    'Comoros',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    40,
    'Congo, Democratic Republic',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    41,
    'Congo',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    42,
    'Costa Rica',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    43,
    'Cote D\'Ivoire',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    44,
    'Croatia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    45,
    'Cuba',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    46,
    'Cyprus',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    47,
    'Czech Republic',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    48,
    'Denmark',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    49,
    'Djibouti',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    50,
    'Dominica',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    51,
    'Dominican Republic',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    52,
    'Ecuador',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    53,
    'Egypt',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    54,
    'El Salvador',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    55,
    'Equatorial Guinea',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    56,
    'Eritrea',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    57,
    'Estonia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    58,
    'Eswatini',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    59,
    'Ethiopia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    60,
    'Fiji',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    61,
    'Finland',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    62,
    'France',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    63,
    'Gabon',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    64,
    'Gambia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    65,
    'Georgia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    66,
    'Germany',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    67,
    'Ghana',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    68,
    'Greece',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    69,
    'Grenada',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    70,
    'Guatemala',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    71,
    'Guinea',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    72,
    'Guinea-Bissau',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    73,
    'Guyana',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    74,
    'Greenland',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    75,
    'Haiti',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    76,
    'Honduras',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    77,
    'Hungary',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    78,
    'Iceland',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    79,
    'India',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    80,
    'Indonesia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    81,
    'Iran',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    82,
    'Iraq',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    83,
    'Ireland',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    84,
    'Italy',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    85,
    'Jamaica',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    86,
    'Japan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    87,
    'Jordan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    88,
    'Kazakhstan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    89,
    'Kenya',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    90,
    'Kiribati',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    91,
    'Kosovo',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    92,
    'Kuwait',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    93,
    'Kyrgyzstan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    94,
    'Laos',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    95,
    'Latvia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    96,
    'Lebanon',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    97,
    'Lesotho',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    98,
    'Liberia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    99,
    'Libyan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    100,
    'Liechtenstein',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    101,
    'Lithuania',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    102,
    'Luxembourg',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    103,
    'Madagascar',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    104,
    'Malawi',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    105,
    'Malaysia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    106,
    'Maldives',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    107,
    'Mali',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    108,
    'Malta',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    109,
    'Marshall Islands',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    110,
    'Mauritania',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    111,
    'Mauritius',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    112,
    'Mexico',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    113,
    'Micronesia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    114,
    'Moldova',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    115,
    'Monaco',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    116,
    'Mongolia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    117,
    'Montenegro',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    118,
    'Morocco',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    119,
    'Mozambique',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    120,
    'Myanmar',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    121,
    'Macedonia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    122,
    'Namibia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    123,
    'Nauru',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    124,
    'Nepal',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    125,
    'Netherlands',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    126,
    'New Zealand',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    127,
    'Nicaragua',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    128,
    'Niger',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    129,
    'Nigeria',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    130,
    'North Korea',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    131,
    'Norway',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    132,
    'Oman',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    133,
    'Pakistan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    134,
    'Palau',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    135,
    'Palestine',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    136,
    'Panama',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    137,
    'Papua New Guinea',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    138,
    'Paraguay',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    139,
    'Peru',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    140,
    'Philippines',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    141,
    'Poland',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    142,
    'Portugal',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    143,
    'Puerto Rico',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    144,
    'Qatar',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    145,
    'Romania',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    146,
    'Russia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    147,
    'Rwanda',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    148,
    'St. Kitts & Nevis',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    149,
    'St. Lucia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    150,
    'St. Vincent & Grenadines',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    151,
    'Samoa',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    152,
    'San Marino',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    153,
    'Sao Tome and Principe',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    154,
    'Saudi Arabia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    155,
    'Senegal',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    156,
    'Serbia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    157,
    'Seychelles',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    158,
    'Sierra Leone',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    159,
    'Singapore',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    160,
    'Slovakia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    161,
    'Slovenia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    162,
    'Solomon Islands',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    163,
    'Somalia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    164,
    'South Africa',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    165,
    'South Korea',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    166,
    'South Sudan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    167,
    'Spain',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    168,
    'Sri Lanka',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    169,
    'Sudan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    170,
    'Suriname',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    171,
    'Swaziland',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    172,
    'Sweden',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    173,
    'Switzerland',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    174,
    'Syria',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    175,
    'Taiwan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    176,
    'Tajikistan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    177,
    'Tanzania',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    178,
    'Thailand',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    179,
    'Togo',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    180,
    'Tonga',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    181,
    'Trinidad and Tobago',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    182,
    'Tunisia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    183,
    'Turkey',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    184,
    'Turkmenistan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    185,
    'Tuvalu',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    186,
    'Uganda',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    187,
    'Ukraine',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    188,
    'United Arab Emirates',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    189,
    'United Kingdom',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    190,
    'Uruguay',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    191,
    'Uzbekistan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    192,
    'Vanuatu',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    193,
    'Vatican City',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    194,
    'Venezuela',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    195,
    'Vietnam',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    196,
    'Zambia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  ),
  (
    197,
    'Zimbabwe',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629'
  );
-- --------------------------------------------------------
--
-- Table structure for table `customers`
--
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
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
  `description` longtext,
  `modified_at` datetime(6) NOT NULL,
  `blood_group_id` int DEFAULT NULL,
  `federal_state_id` int DEFAULT NULL,
  `nationality_id` int NOT NULL,
  `personal_id_type_id` int DEFAULT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Table structure for table `cylinder`
--
CREATE TABLE `cylinder` (
  `cylinder_id` int NOT NULL,
  `cylinder_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Dumping data for table `cylinder`
--
INSERT INTO `cylinder` (
    `cylinder_id`,
    `cylinder_name`,
    `created_at`,
    `modified_at`,
    `reg_user_id`
  )
VALUES (
    2,
    '3',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    3,
    '4',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    4,
    '5',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    5,
    '6',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    6,
    '8',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    7,
    '10',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    8,
    '12',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    9,
    '16',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  );
-- --------------------------------------------------------
--
-- Table structure for table `django_admin_log`
--
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL
);
-- --------------------------------------------------------
--
-- Table structure for table `django_content_type`
--
CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Dumping data for table `django_content_type`
--
INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES (1, 'admin', 'logentry'),
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
  (28, 'Vehicles', 'transfare_vehicles'),
  (27, 'Vehicles', 'type'),
  (26, 'Vehicles', 'vehicle');
-- --------------------------------------------------------
--
-- Table structure for table `django_migrations`
--
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Dumping data for table `django_migrations`
--
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES (
    1,
    'contenttypes',
    '0001_initial',
    '2023-03-05 09:36:20.837650'
  ),
  (
    2,
    'contenttypes',
    '0002_remove_content_type_name',
    '2023-03-05 09:36:20.934211'
  ),
  (
    3,
    'auth',
    '0001_initial',
    '2023-03-05 09:36:21.306773'
  ),
  (
    4,
    'auth',
    '0002_alter_permission_name_max_length',
    '2023-03-05 09:36:21.377073'
  ),
  (
    5,
    'auth',
    '0003_alter_user_email_max_length',
    '2023-03-05 09:36:21.389973'
  ),
  (
    6,
    'auth',
    '0004_alter_user_username_opts',
    '2023-03-05 09:36:21.403146'
  ),
  (
    7,
    'auth',
    '0005_alter_user_last_login_null',
    '2023-03-05 09:36:21.420116'
  ),
  (
    8,
    'auth',
    '0006_require_contenttypes_0002',
    '2023-03-05 09:36:21.430538'
  ),
  (
    9,
    'auth',
    '0007_alter_validators_add_error_messages',
    '2023-03-05 09:36:21.444939'
  ),
  (
    10,
    'auth',
    '0008_alter_user_username_max_length',
    '2023-03-05 09:36:21.457523'
  ),
  (
    11,
    'auth',
    '0009_alter_user_last_name_max_length',
    '2023-03-05 09:36:21.466776'
  ),
  (
    12,
    'auth',
    '0010_alter_group_name_max_length',
    '2023-03-05 09:36:21.491159'
  ),
  (
    13,
    'auth',
    '0011_update_proxy_permissions',
    '2023-03-05 09:36:21.505096'
  ),
  (
    14,
    'auth',
    '0012_alter_user_first_name_max_length',
    '2023-03-05 09:36:21.519470'
  ),
  (
    15,
    'Customers',
    '0001_initial',
    '2023-03-05 09:36:21.854238'
  ),
  (
    16,
    'Users',
    '0001_initial',
    '2023-03-05 09:36:22.541811'
  ),
  (
    17,
    'Finance',
    '0001_initial',
    '2023-03-05 09:36:22.642748'
  ),
  (
    18,
    'Customers',
    '0002_initial',
    '2023-03-05 09:36:24.176867'
  ),
  (
    19,
    'Finance',
    '0002_initial',
    '2023-03-05 09:36:24.582642'
  ),
  (
    20,
    'Vehicles',
    '0001_initial',
    '2023-03-05 09:36:26.343894'
  ),
  (
    21,
    'admin',
    '0001_initial',
    '2023-03-05 09:36:26.570019'
  ),
  (
    22,
    'admin',
    '0002_logentry_remove_auto_add',
    '2023-03-05 09:36:26.593812'
  ),
  (
    23,
    'admin',
    '0003_logentry_add_action_flag_choices',
    '2023-03-05 09:36:26.609407'
  ),
  (
    24,
    'sessions',
    '0001_initial',
    '2023-03-05 09:36:26.668008'
  );
-- --------------------------------------------------------
--
-- Table structure for table `django_session`
--
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Table structure for table `errorlogs`
--
CREATE TABLE `errorlogs` (
  `id` bigint NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Name` varchar(500) NOT NULL,
  `Expected_error` varchar(500) NOT NULL,
  `field_error` varchar(500) NOT NULL,
  `trace_back` longtext NOT NULL,
  `line_number` int NOT NULL,
  `date_recorded` datetime(6) NOT NULL,
  `browser` varchar(500) NOT NULL,
  `ip_address` varchar(500) NOT NULL,
  `user_agent` longtext NOT NULL,
  `Avatar` varchar(100) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Table structure for table `federal_state`
--
CREATE TABLE `federal_state` (
  `state_id` int NOT NULL,
  `state_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Dumping data for table `federal_state`
--
INSERT INTO `federal_state` (
    `state_id`,
    `state_name`,
    `created_at`,
    `modified_at`
  )
VALUES (
    1,
    'Banaadir',
    '2023-02-05 10:38:37.000000',
    '2023-02-05 10:38:37.000000'
  ),
  (
    2,
    'Hirshabeelle',
    '2023-02-05 10:38:37.000000',
    '2023-02-05 10:38:37.000000'
  ),
  (
    3,
    'Koonfur Galbeed',
    '2023-02-05 10:39:28.000000',
    '2023-02-05 10:39:28.000000'
  ),
  (
    4,
    'Galmudug',
    '2023-02-05 10:39:49.000000',
    '2023-02-05 10:39:49.000000'
  ),
  (
    5,
    'Puntland',
    '2023-02-05 10:40:07.000000',
    '2023-02-05 10:40:07.000000'
  ),
  (
    6,
    'Jubba land',
    '2023-02-05 10:40:21.000000',
    '2023-02-05 10:40:21.000000'
  ),
  (
    7,
    'Somali land',
    '2023-02-05 10:40:31.000000',
    '2023-02-05 10:40:31.000000'
  );
-- --------------------------------------------------------
--
-- Table structure for table `fingerprints`
--
CREATE TABLE `fingerprints` (
  `id` bigint NOT NULL,
  `finger_print_template` longtext,
  `finger_print_image` longtext,
  `customer_id` int DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Table structure for table `license`
--
CREATE TABLE `license` (
  `license_id` int NOT NULL,
  `expired_date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `reg_no` longtext,
  `document` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `federal_state_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `place_of_issue_id` int DEFAULT NULL,
  `receipt_voucher_id` int DEFAULT NULL,
  `reg_user_id` bigint NOT NULL,
  `type_id` int DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Table structure for table `licensetype`
--
CREATE TABLE `licensetype` (
  `type_id` int NOT NULL,
  `type` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Dumping data for table `licensetype`
--
INSERT INTO `licensetype` (
    `type_id`,
    `type`,
    `created_at`,
    `modified_at`,
    `reg_user_id`
  )
VALUES (
    1,
    'A',
    '2023-02-18 12:49:52.828991',
    '2023-02-18 12:49:52.828991',
    1
  ),
  (
    2,
    'A1',
    '2023-02-18 12:50:00.278278',
    '2023-02-18 12:50:00.278278',
    1
  ),
  (
    3,
    'B',
    '2023-02-18 12:50:07.154556',
    '2023-02-18 12:50:07.154556',
    1
  ),
  (
    4,
    'C',
    '2023-02-18 14:26:12.396299',
    '2023-02-18 14:26:12.396299',
    1
  ),
  (
    5,
    'C1',
    '2023-02-18 14:26:19.999697',
    '2023-02-18 14:26:19.999697',
    1
  ),
  (
    6,
    'D',
    '2023-02-18 14:26:26.849524',
    '2023-02-18 14:26:26.849524',
    1
  ),
  (
    7,
    'E',
    '2023-02-18 14:26:33.500030',
    '2023-02-18 14:26:33.500030',
    1
  ),
  (
    8,
    'F',
    '2023-02-18 14:26:44.906484',
    '2023-02-18 14:26:44.906484',
    1
  ),
  (
    9,
    'G',
    '2023-02-18 14:26:57.484768',
    '2023-02-18 14:26:57.484768',
    1
  );
-- --------------------------------------------------------
--
-- Table structure for table `model_brand`
--
CREATE TABLE `model_brand` (
  `brand_id` int NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Dumping data for table `model_brand`
--
INSERT INTO `model_brand` (
    `brand_id`,
    `brand_name`,
    `created_at`,
    `modified_at`,
    `reg_user_id`
  )
VALUES (
    1,
    'Abarth',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    2,
    'Alfa Romeo',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    3,
    'Aston Martin',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    4,
    'Audi',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    5,
    'Bentley',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    6,
    'BMW',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    7,
    'Bugatti',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    8,
    'Cadillac',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    9,
    'Chevrolet',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    10,
    'Chrysler',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    11,
    'Citroën',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    12,
    'Dacia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    13,
    'Daewoo',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    14,
    'Daihatsu',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    15,
    'Dodge',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    16,
    'Donkervoort',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    17,
    'DS',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    18,
    'Ferrari',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    19,
    'Fiat',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    20,
    'Fisker',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    21,
    'Ford',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    22,
    'Honda',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    23,
    'Hummer',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    24,
    'Hyundai',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    25,
    'Infiniti',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    26,
    'Iveco',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    27,
    'Jaguar',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    28,
    'Jeep',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    29,
    'Kia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    30,
    'KTM',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    31,
    'Lamborghini',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    32,
    'Lancia',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    33,
    'Land Rover',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    34,
    'Landwind',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    35,
    'Lexus',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    36,
    'Lotus',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    37,
    'Maserati',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    38,
    'Maybach',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    39,
    'Mazda',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    40,
    'McLaren',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    41,
    'Mercedes-Benz',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    42,
    'MG',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    43,
    'Mini',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    44,
    'Mitsubishi',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    45,
    'Morgan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    46,
    'Nissan',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    47,
    'Opel',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    48,
    'Peugeot',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    49,
    'Porsche',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    50,
    'Renault',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    51,
    'Rolls-Royce',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    52,
    'Rover',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    53,
    'Saab',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    54,
    'Seat',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    55,
    'Skoda',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    56,
    'Smart',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    57,
    'SsangYong',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    58,
    'Subaru',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    59,
    'Suzuki',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    60,
    'Tesla',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    61,
    'Toyota',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    62,
    'Volkswagen',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  ),
  (
    63,
    'Volvo',
    '2023-03-04 14:23:35.387629',
    '2023-03-04 14:23:35.387629',
    0
  );
-- --------------------------------------------------------
--
-- Table structure for table `personal_id_type`
--
CREATE TABLE `personal_id_type` (
  `personal_id` int NOT NULL,
  `personal_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Dumping data for table `personal_id_type`
--
INSERT INTO `personal_id_type` (
    `personal_id`,
    `personal_name`,
    `created_at`,
    `modified_at`
  )
VALUES (
    1,
    'Passport',
    '2023-02-05 11:55:16.000000',
    '2023-02-05 11:55:16.000000'
  ),
  (
    2,
    'License',
    '2023-02-05 11:55:16.000000',
    '2023-02-05 11:55:16.000000'
  ),
  (
    3,
    'Dhalasho & Sugnaan',
    '2023-02-05 11:55:16.000000',
    '2023-02-05 11:55:16.000000'
  );
-- --------------------------------------------------------
--
-- Table structure for table `place_issue`
--
CREATE TABLE `place_issue` (
  `place_id` int NOT NULL,
  `place_name` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `reg_user_id` bigint DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Dumping data for table `place_issue`
--
INSERT INTO `place_issue` (
    `place_id`,
    `place_name`,
    `created_at`,
    `modified_at`,
    `reg_user_id`
  )
VALUES (
    1,
    'Mogadishu',
    '2023-02-28 12:14:47.222861',
    '2023-02-28 12:14:47.222861',
    2
  ),
  (
    3,
    'Jowhar',
    '2023-02-28 16:05:04.500852',
    '2023-02-28 16:05:04.500852',
    2
  ),
  (
    4,
    'Baydhabo',
    '2023-02-28 16:05:12.634662',
    '2023-02-28 16:05:12.634662',
    2
  ),
  (
    5,
    'Dhusamareb',
    '2023-02-28 16:05:21.682784',
    '2023-02-28 16:05:21.682784',
    2
  ),
  (
    6,
    'Garowe',
    '2023-02-28 16:05:30.252599',
    '2023-02-28 16:05:30.252599',
    2
  ),
  (
    7,
    'Kismayo',
    '2023-02-28 16:05:37.299666',
    '2023-02-28 16:05:37.299666',
    2
  ),
  (
    8,
    'Hargeisa',
    '2023-02-28 16:05:53.927490',
    '2023-02-28 16:05:53.927490',
    2
  );
-- --------------------------------------------------------
--
-- Table structure for table `plate`
--
CREATE TABLE `plate` (
  `plate_id` int NOT NULL,
  `plate_code` varchar(100) NOT NULL,
  `plate_no` varchar(100) DEFAULT NULL,
  `year` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint NOT NULL,
  `state_id` int NOT NULL,
  `type_id` int DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Table structure for table `receipt_voucher`
--
CREATE TABLE `receipt_voucher` (
  `rv_id` int NOT NULL,
  `rv_number` varchar(100) NOT NULL,
  `rv_amount` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `reason` varchar(250) DEFAULT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint NOT NULL,
  `rv_from_id` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Table structure for table `type`
--
CREATE TABLE `type` (
  `type_id` int NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `reg_user_id` bigint NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
--
-- Dumping data for table `type`
--
INSERT INTO `type` (
    `type_id`,
    `type_name`,
    `created_at`,
    `modified_at`,
    `reg_user_id`
  )
VALUES (
    1,
    'MIL',
    '2023-03-01 09:38:28.098572',
    '2023-03-01 09:38:28.098572',
    2
  ),
  (
    2,
    'Gov',
    '2023-03-01 09:38:37.848207',
    '2023-03-01 09:38:37.848207',
    2
  ),
  (
    3,
    'MUN',
    '2023-03-01 09:38:44.472839',
    '2023-03-01 09:38:44.473828',
    2
  ),
  (
    4,
    'OAU',
    '2023-03-01 09:38:51.872944',
    '2023-03-01 09:38:51.872944',
    2
  ),
  (
    5,
    'POL',
    '2023-03-01 09:38:59.039620',
    '2023-03-01 09:38:59.039620',
    2
  ),
  (
    6,
    'AU',
    '2023-03-01 09:39:06.768981',
    '2023-03-01 09:39:06.768981',
    2
  );
-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` bigint NOT NULL,
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
  `is_place_issue` tinyint(1) NOT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `federal_state_id` int DEFAULT NULL,
  `place_issues_id` int DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Table structure for table `users_groups`
--
CREATE TABLE `users_groups` (
  `id` bigint NOT NULL,
  `users_id` bigint NOT NULL,
  `group_id` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Table structure for table `users_user_permissions`
--
CREATE TABLE `users_user_permissions` (
  `id` bigint NOT NULL,
  `users_id` bigint NOT NULL,
  `permission_id` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Table structure for table `vehicle`
--
CREATE TABLE `vehicle` (
  `vehicle_id` int NOT NULL,
  `year` date DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `hp` varchar(100) DEFAULT NULL,
  `pessenger_seat` longtext,
  `vin` varchar(100) DEFAULT NULL,
  `enginer_no` varchar(100) DEFAULT NULL,
  `rv_number` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `color_id` int NOT NULL,
  `cylinder_id` int NOT NULL,
  `origin_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `plate_no_id` int DEFAULT NULL,
  `reg_user_id` bigint NOT NULL,
  `vehicle_model_id` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- --------------------------------------------------------
--
-- Table structure for table `Vehicles_transfare_vehicles`
--
CREATE TABLE `Vehicles_transfare_vehicles` (
  `transfare_id` int NOT NULL,
  `rv_number` varchar(50) NOT NULL,
  `document` varchar(100) DEFAULT NULL,
  `description` longtext,
  `transfare_reason` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `new_owner_id` int NOT NULL,
  `old_owner_id` int NOT NULL,
  `reg_user_id` bigint NOT NULL,
  `vehicle_id` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
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
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`, `permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);
--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`, `codename`);
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
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`, `model`);
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
  ADD KEY `place_issue_reg_user_id_5f0f51cf_fk_users_id` (`reg_user_id`);
--
-- Indexes for table `plate`
--
ALTER TABLE `plate`
ADD PRIMARY KEY (`plate_id`),
  ADD KEY `plate_type_id_ae5aca22_fk_type_type_id` (`type_id`),
  ADD KEY `plate_reg_user_id_744c09e8_fk_users_id` (`reg_user_id`),
  ADD KEY `plate_state_id_3b014cea_fk_federal_state_state_id` (`state_id`);
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
  ADD UNIQUE KEY `users_groups_users_id_group_id_83a49e68_uniq` (`users_id`, `group_id`),
  ADD KEY `users_groups_group_id_2f3517aa_fk_auth_group_id` (`group_id`);
--
-- Indexes for table `users_user_permissions`
--
ALTER TABLE `users_user_permissions`
ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_permissions_users_id_permission_id_d7a00931_uniq` (`users_id`, `permission_id`),
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
MODIFY `account_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
MODIFY `type_id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;
--
-- AUTO_INCREMENT for table `audittrials`
--
ALTER TABLE `audittrials`
MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
MODIFY `id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
MODIFY `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 117;
--
-- AUTO_INCREMENT for table `blood_group`
--
ALTER TABLE `blood_group`
MODIFY `blood_group_id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 8;
--
-- AUTO_INCREMENT for table `code_plate`
--
ALTER TABLE `code_plate`
MODIFY `code_id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 42;
--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
MODIFY `color_id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 357;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
MODIFY `company_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
MODIFY `country_id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 198;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
MODIFY `customer_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cylinder`
--
ALTER TABLE `cylinder`
MODIFY `cylinder_id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 10;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
MODIFY `id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
MODIFY `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 30;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
MODIFY `id` bigint NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 25;
--
-- AUTO_INCREMENT for table `errorlogs`
--
ALTER TABLE `errorlogs`
MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `federal_state`
--
ALTER TABLE `federal_state`
MODIFY `state_id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 8;
--
-- AUTO_INCREMENT for table `fingerprints`
--
ALTER TABLE `fingerprints`
MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `license`
--
ALTER TABLE `license`
MODIFY `license_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `licensetype`
--
ALTER TABLE `licensetype`
MODIFY `type_id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 10;
--
-- AUTO_INCREMENT for table `model_brand`
--
ALTER TABLE `model_brand`
MODIFY `brand_id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 64;
--
-- AUTO_INCREMENT for table `personal_id_type`
--
ALTER TABLE `personal_id_type`
MODIFY `personal_id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;
--
-- AUTO_INCREMENT for table `place_issue`
--
ALTER TABLE `place_issue`
MODIFY `place_id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 9;
--
-- AUTO_INCREMENT for table `plate`
--
ALTER TABLE `plate`
MODIFY `plate_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `receipt_voucher`
--
ALTER TABLE `receipt_voucher`
MODIFY `rv_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
MODIFY `type_id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_user_permissions`
--
ALTER TABLE `users_user_permissions`
MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
MODIFY `vehicle_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Vehicles_transfare_vehicles`
--
ALTER TABLE `Vehicles_transfare_vehicles`
MODIFY `transfare_id` int NOT NULL AUTO_INCREMENT;
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
ADD CONSTRAINT `place_issue_reg_user_id_5f0f51cf_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);
--
-- Constraints for table `plate`
--
ALTER TABLE `plate`
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
-- Constraints for table `Vehicles_transfare_vehicles`
--
ALTER TABLE `Vehicles_transfare_vehicles`
ADD CONSTRAINT `Vehicles_transfare_v_new_owner_id_a8719238_fk_customers` FOREIGN KEY (`new_owner_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `Vehicles_transfare_v_old_owner_id_7cee99c1_fk_customers` FOREIGN KEY (`old_owner_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `Vehicles_transfare_v_vehicle_id_bdf6795e_fk_vehicle_v` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`),
  ADD CONSTRAINT `Vehicles_transfare_vehicles_reg_user_id_4a859d12_fk_users_id` FOREIGN KEY (`reg_user_id`) REFERENCES `users` (`id`);
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;