-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2023 at 08:25 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dmc`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_task`
--

CREATE TABLE `api_task` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `completed` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `api_task`
--

INSERT INTO `api_task` (`id`, `title`, `completed`) VALUES
(1, '1 Product', 0),
(2, '2 Product', 0),
(3, '3 Product', 0);

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
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add employee', 7, 'add_employee'),
(26, 'Can change employee', 7, 'change_employee'),
(27, 'Can delete employee', 7, 'delete_employee'),
(28, 'Can view employee', 7, 'view_employee'),
(29, 'Can add task', 8, 'add_task'),
(30, 'Can change task', 8, 'change_task'),
(31, 'Can delete task', 8, 'delete_task'),
(32, 'Can view task', 8, 'view_task'),
(33, 'Can add task', 9, 'add_task'),
(34, 'Can change task', 9, 'change_task'),
(35, 'Can delete task', 9, 'delete_task'),
(36, 'Can view task', 9, 'view_task'),
(37, 'Can add department', 10, 'add_department'),
(38, 'Can change department', 10, 'change_department'),
(39, 'Can delete department', 10, 'delete_department'),
(40, 'Can view department', 10, 'view_department'),
(41, 'Can add designation', 11, 'add_designation'),
(42, 'Can change designation', 11, 'change_designation'),
(43, 'Can delete designation', 11, 'delete_designation'),
(44, 'Can view designation', 11, 'view_designation'),
(45, 'Can add group', 12, 'add_group'),
(46, 'Can change group', 12, 'change_group'),
(47, 'Can delete group', 12, 'delete_group'),
(48, 'Can view group', 12, 'view_group'),
(49, 'Can add device', 13, 'add_device'),
(50, 'Can change device', 13, 'change_device'),
(51, 'Can delete device', 13, 'delete_device'),
(52, 'Can view device', 13, 'view_device'),
(53, 'Can add role', 14, 'add_role'),
(54, 'Can change role', 14, 'change_role'),
(55, 'Can delete role', 14, 'delete_role'),
(56, 'Can view role', 14, 'view_role'),
(57, 'Can add employee files', 15, 'add_employeefiles'),
(58, 'Can change employee files', 15, 'change_employeefiles'),
(59, 'Can delete employee files', 15, 'delete_employeefiles'),
(60, 'Can view employee files', 15, 'view_employeefiles'),
(61, 'Can add group by device', 16, 'add_groupbydevice'),
(62, 'Can change group by device', 16, 'change_groupbydevice'),
(63, 'Can delete group by device', 16, 'delete_groupbydevice'),
(64, 'Can view group by device', 16, 'view_groupbydevice'),
(65, 'Can add group device', 17, 'add_groupdevice'),
(66, 'Can change group device', 17, 'change_groupdevice'),
(67, 'Can delete group device', 17, 'delete_groupdevice'),
(68, 'Can view group device', 17, 'view_groupdevice'),
(69, 'Can add employee group device', 18, 'add_employeegroupdevice'),
(70, 'Can change employee group device', 18, 'change_employeegroupdevice'),
(71, 'Can delete employee group device', 18, 'delete_employeegroupdevice'),
(72, 'Can view employee group device', 18, 'view_employeegroupdevice'),
(73, 'Can add employee permission', 19, 'add_employeepermission'),
(74, 'Can change employee permission', 19, 'change_employeepermission'),
(75, 'Can delete employee permission', 19, 'delete_employeepermission'),
(76, 'Can view employee permission', 19, 'view_employeepermission'),
(77, 'Can add employee group', 20, 'add_employeegroup'),
(78, 'Can change employee group', 20, 'change_employeegroup'),
(79, 'Can delete employee group', 20, 'delete_employeegroup'),
(80, 'Can view employee group', 20, 'view_employeegroup'),
(81, 'Can add log', 21, 'add_log'),
(82, 'Can change log', 21, 'change_log'),
(83, 'Can delete log', 21, 'delete_log'),
(84, 'Can view log', 21, 'view_log');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department_department`
--

CREATE TABLE `department_department` (
  `id` int(11) NOT NULL,
  `department` varchar(100) NOT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department_department`
--

INSERT INTO `department_department` (`id`, `department`, `description`) VALUES
(1, 'Surgery', 'this department is for surgery'),
(2, 'orthopedic', 'this department is for orthopedic surgery and other orthopedic works');

-- --------------------------------------------------------

--
-- Table structure for table `designation_designation`
--

CREATE TABLE `designation_designation` (
  `id` int(11) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designation_designation`
--

INSERT INTO `designation_designation` (`id`, `designation`, `description`) VALUES
(1, 'Vetenary', '-'),
(2, '-', '-'),
(4, 'Surgeon', '-'),
(5, 'Burn Unit', '-'),
(6, 'Burn Unit', '-');

-- --------------------------------------------------------

--
-- Table structure for table `device_device`
--

CREATE TABLE `device_device` (
  `device_id` varchar(100) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `group_id_id` int(11) DEFAULT NULL,
  `device_ip` varchar(100) DEFAULT NULL,
  `active_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `device_device`
--

INSERT INTO `device_device` (`device_id`, `device_name`, `location`, `group_id_id`, `device_ip`, `active_status`) VALUES
('Dmc10101', 'Gate Number 2', '-', NULL, '192.168.10.26', 'inactive'),
('DMCfront200', 'BurnUnitDevice 111', '-', NULL, '192.168.0.13', 'inactive'),
('DmcGate1', 'Gate1', '-', NULL, '10.10.20.133', 'active'),
('DmcGate10', 'Gate10', '-', NULL, '192.168.10.3', 'inactive'),
('DmcGate11', 'Gate11', '-', NULL, '192.168.10.4', 'inactive'),
('DmcGate12', 'Gate12', '-', NULL, '192.168.10.5', 'inactive'),
('DmcGate2', 'Gate2', '-', NULL, '192.168.10.6', 'inactive'),
('DmcGate3', 'Gate3', '-', NULL, '192.168.10.7', 'inactive'),
('DmcGate4', 'Gate4', '-', NULL, '192.168.10.8', 'inactive'),
('DmcGate5', 'Gate5', '-', NULL, '192.168.10.9', 'inactive'),
('DmcGate6', 'Gate6', '-', NULL, '192.168.10.10', 'inactive'),
('DmcGate7', 'Gate7', '-', NULL, '192.168.10.11', 'inactive'),
('DmcGate8', 'Gate8', '-', NULL, '192.168.10.12', 'inactive'),
('DmcGate9', 'Gate9', '-', NULL, '192.168.10.13', 'inactive');

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
  `user_id` int(11) NOT NULL
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
(9, 'api', 'task'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(10, 'department', 'department'),
(11, 'designation', 'designation'),
(13, 'device', 'device'),
(15, 'empfiles', 'employeefiles'),
(12, 'empgrp', 'group'),
(16, 'empgrpdev', 'groupbydevice'),
(7, 'employee', 'employee'),
(20, 'employee', 'employeegroup'),
(18, 'employee', 'employeegroupdevice'),
(19, 'employee', 'employeepermission'),
(8, 'employee', 'task'),
(17, 'grpdev', 'groupdevice'),
(21, 'log', 'log'),
(14, 'role', 'role'),
(6, 'sessions', 'session');

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
(1, 'contenttypes', '0001_initial', '2023-11-08 09:39:08.464184'),
(2, 'auth', '0001_initial', '2023-11-08 09:39:18.382918'),
(3, 'admin', '0001_initial', '2023-11-08 09:39:20.093824'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-11-08 09:39:20.137822'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-08 09:39:20.183822'),
(6, 'api', '0001_initial', '2023-11-08 09:39:20.360819'),
(7, 'contenttypes', '0002_remove_content_type_name', '2023-11-08 09:39:20.994820'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-11-08 09:39:21.616115'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-11-08 09:39:22.017161'),
(10, 'auth', '0004_alter_user_username_opts', '2023-11-08 09:39:22.079161'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-11-08 09:39:23.717162'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-11-08 09:39:23.793159'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-11-08 09:39:23.936159'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-11-08 09:39:24.441791'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-11-08 09:39:24.696846'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-11-08 09:39:24.905790'),
(17, 'auth', '0011_update_proxy_permissions', '2023-11-08 09:39:24.933790'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-11-08 09:39:25.015789'),
(19, 'employee', '0001_initial', '2023-11-08 09:39:25.437968'),
(20, 'sessions', '0001_initial', '2023-11-08 09:39:25.816968'),
(21, 'employee', '0002_delete_task', '2023-11-08 10:09:10.824376'),
(22, 'employee', '0003_alter_employee_image_location_and_more', '2023-11-08 10:26:24.555158'),
(23, 'department', '0001_initial', '2023-11-09 05:24:04.383279'),
(24, 'designation', '0001_initial', '2023-11-09 06:14:03.220407'),
(25, 'designation', '0002_alter_designation_designation', '2023-11-09 06:44:05.427684'),
(26, 'empgrp', '0001_initial', '2023-11-09 07:48:59.021245'),
(27, 'device', '0001_initial', '2023-11-09 07:49:59.155041'),
(28, 'device', '0002_alter_device_group_name', '2023-11-09 08:19:17.042795'),
(29, 'device', '0003_rename_group_name_device_group_id', '2023-11-09 08:21:45.207891'),
(30, 'device', '0004_alter_device_device_id', '2023-11-09 08:30:57.363837'),
(31, 'role', '0001_initial', '2023-11-12 05:28:33.677774'),
(32, 'role', '0002_alter_role_role_description', '2023-11-12 06:17:50.735846'),
(33, 'role', '0003_alter_role_role', '2023-11-12 06:22:37.786243'),
(34, 'employee', '0004_employee_image', '2023-11-12 09:17:33.593975'),
(35, 'empfiles', '0001_initial', '2023-11-12 11:06:40.358787'),
(36, 'empfiles', '0002_alter_employeefiles_file', '2023-11-13 09:38:59.188817'),
(37, 'empfiles', '0003_alter_employeefiles_file', '2023-11-13 09:52:00.461239'),
(38, 'empgrpdev', '0001_initial', '2023-11-14 04:56:28.289323'),
(39, 'employee', '0005_employee_group_id', '2023-11-14 05:05:22.399548'),
(40, 'employee', '0006_alter_employee_group_id', '2023-11-14 05:05:22.565521'),
(41, 'device', '0005_device_device_ip', '2023-11-14 05:57:34.567352'),
(42, 'empgrpdev', '0002_groupbydevice_device_ip_and_more', '2023-11-14 05:57:35.618298'),
(43, 'empgrpdev', '0003_groupbydevice_group_name_and_more', '2023-11-14 07:04:34.862737'),
(44, 'empgrpdev', '0004_remove_groupbydevice_group_id_and_more', '2023-11-14 08:32:36.856722'),
(45, 'grpdev', '0001_initial', '2023-11-14 08:32:38.750572'),
(46, 'grpdev', '0002_alter_groupdevice_group_id', '2023-11-14 08:33:34.553359'),
(47, 'grpdev', '0003_auto_20231114_1433', '2023-11-14 08:33:34.604812'),
(48, 'employee', '0007_employeegroupdevice', '2023-11-14 09:39:08.312129'),
(49, 'employee', '0008_auto_20231114_1538', '2023-11-14 09:39:08.346149'),
(50, 'employee', '0009_auto_20231115_1028', '2023-11-15 04:28:47.512244'),
(51, 'employee', '0010_alter_employee_options_alter_employee_managers_and_more', '2023-11-16 08:34:35.161808'),
(52, 'employee', '0011_auto_20231116_1434', '2023-11-16 08:34:35.240861'),
(53, 'employee', '0012_auto_20231116_1456', '2023-11-16 08:56:28.380809'),
(54, 'employee', '0013_auto_20231116_1708', '2023-11-16 11:08:16.016476'),
(55, 'employee', '0014_remove_employee_first_name_remove_employee_last_name_and_more', '2023-11-19 07:37:45.503751'),
(56, 'employee', '0015_auto_20231119_1337', '2023-11-19 07:37:45.576764'),
(57, 'employee', '0016_auto_20231120_1206', '2023-11-20 06:06:35.757957'),
(58, 'employee', '0017_auto_20231120_1208', '2023-11-20 06:08:47.737314'),
(59, 'employee', '0018_auto_20231120_1217', '2023-11-20 06:17:57.443593'),
(60, 'employee', '0019_auto_20231120_1220', '2023-11-20 06:20:21.166048'),
(61, 'employee', '0020_auto_20231120_1224', '2023-11-20 06:24:11.088851'),
(62, 'employee', '0021_auto_20231120_1227', '2023-11-20 06:27:36.808000'),
(63, 'employee', '0022_auto_20231120_1228', '2023-11-20 06:28:04.822827'),
(64, 'employee', '0023_auto_20231120_1228', '2023-11-20 06:29:01.767396'),
(65, 'employee', '0024_auto_20231120_1322', '2023-11-20 07:22:52.709351'),
(66, 'employee', '0025_auto_20231120_1333', '2023-11-20 07:33:13.302158'),
(67, 'employee', '0026_auto_20231120_1340', '2023-11-20 07:40:45.930617'),
(68, 'employee', '0027_auto_20231120_1344', '2023-11-20 07:45:01.381116'),
(69, 'employee', '0028_auto_20231120_1347', '2023-11-20 07:47:17.836935'),
(70, 'empgrpdev', '0005_remove_groupbydevice_device_id_and_more', '2023-11-20 08:41:37.661844'),
(71, 'employee', '0029_auto_20231120_1447', '2023-11-20 08:48:01.341159'),
(72, 'employee', '0030_auto_20231120_1449', '2023-11-20 08:53:00.244865'),
(73, 'employee', '0031_auto_20231120_1526', '2023-11-20 09:26:13.230562'),
(74, 'employee', '0015_auto_20231120_1539', '2023-11-20 09:39:40.258425'),
(75, 'empgrpdev', '0002_alter_groupbydevice_device_id', '2023-11-20 10:17:51.535947'),
(76, 'employee', '0016_employee_uniquecardnumber', '2023-11-20 10:59:58.303673'),
(77, 'employee', '0017_employee_cardno', '2023-11-21 05:46:57.797360'),
(78, 'log', '0001_initial', '2023-11-26 06:11:54.779137'),
(79, 'device', '0006_device_active_status', '2023-11-26 10:26:35.971436'),
(80, 'employee', '0018_alter_employee_cardno', '2023-11-28 07:14:09.763124');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empfiles_employeefiles`
--

CREATE TABLE `empfiles_employeefiles` (
  `id` bigint(20) NOT NULL,
  `file` varchar(100) NOT NULL,
  `file_description` varchar(200) DEFAULT NULL,
  `employee_id_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empfiles_employeefiles`
--

INSERT INTO `empfiles_employeefiles` (`id`, `file`, `file_description`, `employee_id_id`) VALUES
(1, 'Shamim/files/Graph_algorithms.pdf', 'This is the first file', 'DMC10173203');

-- --------------------------------------------------------

--
-- Table structure for table `empgrpdev_groupbydevice`
--

CREATE TABLE `empgrpdev_groupbydevice` (
  `id` int(11) NOT NULL,
  `device_ip_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empgrpdev_groupbydevice`
--

INSERT INTO `empgrpdev_groupbydevice` (`id`, `device_ip_id`) VALUES
(1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `empgrp_group`
--

CREATE TABLE `empgrp_group` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `Remaks` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empgrp_group`
--

INSERT INTO `empgrp_group` (`group_id`, `group_name`, `Remaks`) VALUES
(2, 'surgeons', '-'),
(4, 'advisers', '-');

-- --------------------------------------------------------

--
-- Table structure for table `employee_employee`
--

CREATE TABLE `employee_employee` (
  `employee_id` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `image_location` varchar(100) DEFAULT NULL,
  `in_time` time(6) NOT NULL,
  `out_time` time(6) NOT NULL,
  `registration_date` date DEFAULT NULL,
  `validity_date` varchar(100) DEFAULT NULL,
  `employee_type` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `group_id_id` int(11) DEFAULT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `UniqueCardNumber` datetime(6) NOT NULL,
  `cardNo` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_employee`
--

INSERT INTO `employee_employee` (`employee_id`, `username`, `email`, `password`, `phone_number`, `image_location`, `in_time`, `out_time`, `registration_date`, `validity_date`, `employee_type`, `image`, `group_id_id`, `date_joined`, `is_active`, `is_staff`, `is_superuser`, `last_login`, `UniqueCardNumber`, `cardNo`) VALUES
('\"DMC1010320\"', 'Shamim Hasnat Ripon', '-', 'bcrypt_sha256$$2b$12$wRzc8rQ.I4cL2vBBNry/ye9GT0.HFl1gmRXfCpXMWH/Pt5ybArqEy', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-12', '2028-11-10', 'user', 'images/Shamim Hasnat Ripon/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('\"DMC101090\"', '\"Shamim Hasnat Ripon\"', '-', 'bcrypt_sha256$$2b$12$xNJQKbMcgu49ZIl8NM4eJ.qkITL2VcY2jg0.CMV6gonf5AVc8LeNy', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-12', '2028-11-10', 'user', '', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('\"DMC1017320\"', 'Shamim Hasnat Ripon', '-', 'bcrypt_sha256$$2b$12$HEVtou.35CcnSfhw8CwGj.LdVpmqMVkn/.R7SXKG/YnKepMj8mcJK', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-12', '2028-11-10', 'user', 'images/Shamim Hasnat Ripon/Md_Saiful_Alam_L9rx8RS.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('45345', 'Shamim Hasnat Ripon', '-', 'bcrypt_sha256$$2b$12$TTGZ1x/6wATqQhdNWGMl3OH5vmK9ob.cpBIf8Et0otjFhTTj6PWwO', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-12', '2028-11-10', 'user', 'images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DM,C101018', 'saiful alam', '-', 'bcrypt_sha256$$2b$12$91e9uoFMNSJR5Fyw6Arr0ePd9HLqpSEstfdbPk4/tIv/DO81wxgAW', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-08', '2028-11-06', 'user', '', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DM,C1010189', 'saiful alam', '-', 'bcrypt_sha256$$2b$12$4UUqQhz.S/c1afJoZ0IIQu8ZHz6d2g3NAoFRqdNipiqkhs1CIeIh6', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-08', '2028-11-06', 'user', '', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000001', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$Q9L2dRQOvk5UP.FlLuvajOAbAsfpWifSbUFDwWbFOJ18TcMM1FFCK', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000001/images/images_3.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000002', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$j1zQpOiCbOsKXdcH5fq6w.lBMRZ9P3cIHX4wqIMqOTg1LsO6XJ9oa', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000002/images/images_3.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000003', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$pDB1E9RRs6hKBwASJyobzuENrDtySjj4ezK1N..AR/LHnXGcnHZ/.', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000003/images/images_3.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000004', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$syOfsbzxS2fK9DZR.F0l1.2B6taAJoWwznxKDVD.2V95dAY8swoVS', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000004/images/images_3.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000005', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$ybS3QvkiHSqoyBYdIWPhrOQckt/KmwGgqi/15MhMoRcIccU.mWvke', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000005/images/images_3.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000006', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$/K4tPhbcM/ncC0OjIACjHeTGOCSepWlWFq2pzsDGoWEuFo8W29xFy', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000006/images/images_3.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000007', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$1O3inyXgGi54VfiSutBa0OrOQziwMYp7rn5sYppnuUSjLRRR0NMXq', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000007/images/images_3.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000008', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$EwvSjYQkGb4BXWkuBokv4.Du6G6B0h/uSwG4vpr0l3lzNt.Tx6by6', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000008/images/images_3.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000009', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$WuQ0RpqTegh6SlaA0UojCOkVa40Qb7Tqn2kuRItTSY4.ZoFZukSGW', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000009/images/images_3.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000010', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$AS1Fpa6RnoDepwjt0vhy8uUa9qY9bcwsmwRD4SbDSCZj4bsGWjgZC', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000010/images/images_3.jpg', 4, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000011', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$DXSReFzTd1q/FygIZ3JbJO.9EF2mGdeSjLNeI.X6y.jkkWQ/ln6ni', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000011/images/images_3.jpg', 4, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000012', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$leuHmFnqyKDsMGLkXPS3VuavvrNcJO/o54DwJLpN7maERmnroVnCK', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000012/images/images_3.jpg', 4, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000013', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$goIbfvQHFjVM.kqLvt1PWOJZuUOMdHY8sTboFKR/k0lKS0zRDdIv6', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000013/images/images_3.jpg', 4, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000014', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$TGSzk9fFCo6yxxtK9h3kXeu2bMW/gxDdynYK2PDjtnrrDyNkGGceC', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000014/images/images_3.jpg', 4, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000015', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$hRXdcJhbNaO0f8.4dWDK9uttu3TMq/6E3Sg0.s1ehqPOPtQauH8kS', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000015/images/images_3.jpg', 4, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000016', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$ZNedrOL2A4.bhaYqUBz1euFpyuFfxaNRrriEUG36BBzAPzsfzuQ5q', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000016/images/images_3.jpg', 4, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000019', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$HPxtvZxaOCWQDHvQjcHc9ugPV5DjFcEQ08fkQhuEIIGxo.xpEVSbO', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC0000019/images/images_3.jpg', 4, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0000020', 'brad pitt', '-', 'bcrypt_sha256$$2b$12$KcCP5VQFdih4neRYKnWoles7cTl8XFn3NGFhWslwpawQZavqprIne', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-16', '2028-11-14', 'user', 'DMC0000020/images/images_3.jpg', 4, '2023-11-16 08:57:02.234284', 1, 1, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC0001', 'rezvialauddin', '-', '1234', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-20', '2028-11-18', 'user', 'DMC0001/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-20 11:31:48.667241', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC001', 'rezvi', '-', 'bcrypt_sha256$$2b$12$89D576TUal.i1DVWCtIyI.DudsJGTqeCebmJM22YAId3F0yLjW7jy', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-16', '2028-11-14', 'user', 'DMC001/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-16 09:00:07.455115', 0, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC002', 'rezvialauddin', '-', 'bcrypt_sha256$$2b$12$hsRmF.VT447opNHFgCU8X.GhKcBa0flp2sA/6OfmMaN3ti3UoyRFa', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-16', '2028-11-14', 'user', 'DMC002/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-16 09:01:43.149966', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1', 'rezvialauddin', '-', '1234', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-20', '2028-11-18', 'user', 'DMC1/images/Md_Alauddin_Rezvi.jpg', NULL, '2023-11-20 11:33:19.273426', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC101010', 'Azizur Rhman', '-', 'bcrypt_sha256$$2b$12$nuFtxq8cFoP4GozI.iFOwupT7FEegzbtGmcC.ksqgMfVecHbLcSIO', '-', '-', '08:00:00.000000', '17:00:00.000000', NULL, 'user', 'user', '', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1010181', 'saiful alam', '-', 'bcrypt_sha256$$2b$12$mSAqw9tdKFeLPS5MfIeMH.0ToPhY5oHfv2SKVUSqcS.NAesGkcJN2', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-08', '2028-11-06', 'user', '', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1010184', 'saiful alam', '-', 'bcrypt_sha256$$2b$12$NZfLwc5UR7fdTuxHV21E/.6Wu1C8vzS.xoeJ4xWc5Yv9jy4tz6UI.', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-08', '2028-11-06', 'user', '', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1010187', 'saiful alam', '-', 'bcrypt_sha256$$2b$12$BPha59GPZVyQWNzyxKsTzu9r2fwhpAWOOC0VdImkkFk9EMEKwFUKS', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-08', '2028-11-06', 'user', '', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC101030', 'Shamim Hasan Chowdhury', '-', 'bcrypt_sha256$$2b$12$BsxUmdE6QV5jZl5bA/3LQOqIbGn3OiO.3chm8RUp8OJpE756fD6h.', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-08', '2028-11-06', 'user', '', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC101070', 'Shamim Hasnat Ripon', '-', 'bcrypt_sha256$$2b$12$rUd0Cb5eXBmikMZCzcU.QeS/aNYJ/K9zSWomkTOebCsrBJ1RzcPvS', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-12', '2028-11-10', 'user', '', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC101090', 'Shamim Hasnat Ripon', '-', 'bcrypt_sha256$$2b$12$aGRRik5.Y8YDoSpEp.HNqeWwCJoZWmUedl6R.5/cavSx4mQNy7BKi', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-12', '2028-11-10', 'user', '', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC10173200', 'Shamim shorker', '-', 'bcrypt_sha256$$2b$12$84/73z657bBoesNUnhDDpufsGQtGjVqlhjEdG5ppUxz9ccigGDJoG', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-12', '2028-11-10', 'user', 'images/Shamim_shorker/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC10173201', 'Shamim shorker', '-', 'bcrypt_sha256$$2b$12$H8Ani8DY59jCrfNvDiEL/.Ei4f2WuzxXpqUEbhf9eQ2P3HsQGkR1O', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-12', '2028-11-10', 'user', 'images/DMC10173201/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC10173203', 'Shamim', '-', 'bcrypt_sha256$$2b$12$cr9/Aa.pIaGWwPiNHQfYQe32HkWDXu6.YdUh7Opo3R1nt0guKnn96', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-12', '2028-11-10', 'user', 'images/Shamim/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC10173209', 'Shamim shorker', '-', 'bcrypt_sha256$$2b$12$fEe56tCS64i.yo3eyoGE8eXYgTlUQE1200vuB45fF/sRcpYOCorA2', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-12', '2028-11-10', 'user', 'DMC10173209/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC11', 'rezvialauddin', '-', '1234', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-20', '2028-11-18', 'user', 'DMC11/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-20 11:33:56.527794', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC12', 'rezvialauddin', '-', '1234', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC12/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 04:00:20.140986', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC13', 'rezvialauddin', '-', '1234', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC13/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 04:03:10.315185', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC14', '', '-', 'bcrypt_sha256$$2b$12$L08l94N1pnsD9c/EnIoANuEl0LyvHqLd70jU8siuBi05p1xysvi9K', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', '', NULL, '2023-11-21 04:09:44.209875', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC15', '', '-', 'bcrypt_sha256$$2b$12$6Rh557d.W8R6oCgXe5lvf.3KJhXcAoysA0DhhHWoMAqCg5rF3m4Q.', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', '', NULL, '2023-11-21 04:10:09.060305', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC16', 'rezvialauddin', '-', '1234', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC16/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 04:12:20.001115', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC17', 'rezvialauddin', '-', '1234', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC17/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 04:12:48.408522', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1717320', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$tHXSo2B6tKPk32mm/v3RUelLvLSAI7jBCCQ.BP/Puz90ombm6zEXC', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC1717320/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC17173208', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$UKlRQJT6nek5TsjbROsu5.PbfaDyYtAx50zjc0//Gku7qK6IAXhbG', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC17173208/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC171732081', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$58TcrUVi1spcK5gH.6RzLur49GGRM3uKH1hKtti4NaGcR2J.YV/Pq', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC171732081/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1717320810', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$cOHk2SD.0SCkBSGe./B/RuVlHja4UaL8hIJg5Ks8DA8b1QfYPXxGa', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC1717320810/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1717320812', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$zoBn71c8kFS/VjMiduWbz.G6Zszxo/AoaEb11/voBpM16NJhiPh66', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC1717320812/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1717320813', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$zbRDSVi2xZ764vGV5PMhi.0LgFz20hIZq78bbmp.VPlTOc58LA2g.', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC1717320813/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC171732082', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$vfTuI5fWW3y.yl0Z.QTUzOtE7SVep2xjicYoXrity/rVWsqsrPVXW', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC171732082/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC171732083', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$RTNKyRA5cYQoMAQpw4Xp6.UaIAssaXSZfXlsoUjUWnOAgkb7Ul2EK', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC171732083/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC171732084', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$hnYh.GwQy9mcea9.nYwuieacw/DZ7VRSv5NUPlZGNSmktA9mNYs9y', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC171732084/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC171732085', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$PmEhu0PGhLEOxAqINasZ2e.ey5k21q3/l6lt/TPLbb1krFKwkoEBO', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC171732085/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC171732086', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$mRqTzeBaHYcQi/1tH55U4OgBofiVnxIYLdCgCNp5FxXa.xi7KfV0W', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC171732086/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC171732087', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$yJcSCp62tuCcUZn8.nT/g.yOUrWolX8T3vc7pyQk2Uqxl2HQ01dBG', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC171732087/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC171732089', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$TDRQsL3alw8xe01T3fcBzujDwDbDYdzj8trHYyO0TRh8Jd5SH1lJy', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC171732089/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1717320890', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$Vy027JpS9JKsu7UADbCrA.U.1pbr2h16oKKRkX4cbvChU0NO2emDK', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC1717320890/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1717320891', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$yVTaiS2VolTYNvBJQiprZO6rSMAZp9SY3HIJep/WK3jQfEvKKX.Ry', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC1717320891/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1717320892', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$Y1TENrn3KYZzEfAd9cpopuKMQT6bADsBZwllE32XJ/oBNxQdZM8RW', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC1717320892/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1717320893', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$p3sWhkVyNUWmb/3d3QsxSOGdAN7j767qnXUC/cECf33Inj1/NT5Ri', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC1717320893/images/Masudul_Kabir.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC17173209', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$zp..D8HsFcY.zNdQOdLoEeoA0/EzNVRRW3Z2nm1UjCfrFSKH.86/y', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC17173209/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1717321', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$Q/.A9svmlGojRdE77F.aKOd00533PESdFa7RyoDnb5koqfdSg0QA2', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC1717321/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC17173211', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$Rd63Ti5fq8z3nceuUsXxGegOjJ7fzevExKgBqq42pI5rfME08sUCe', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC17173211/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC171732111', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$jKLre3dnfcHpAmcca2eUnOu17mfMWzM65EArZnHrG3VSnwV43pa3.', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC171732111/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1717321111', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$4WD74MU7ahYmHdDNgTGh5eROy9m9M/R//.aVTcWQ9QB7rt3EEeRkq', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC1717321111/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1717321112', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$cfYO/GhKO84yefSdCcdBjO1ZCtBNWoa8hXdT2HCE09ra2kqZIaAk6', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC1717321112/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC17173211125', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$3s4dMugfwRPhOvW/6Ci5WeiaFC8ZJgxaH8hW9378hA.RSVESx5TnC', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC17173211125/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC171732111251', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$1QFqYhWDjtZqyyUgMw8Gfug6M6VvPfTegO2KL456ulIq6pWVLUPXi', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC171732111251/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1717321112511', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$O7Rtr0klMYAfpojUowbH2u6BRDMiSNPCnhGGhKKSEWGeNWQt9I0u2', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC1717321112511/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1717321112514', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$LNfsO0.0oMY/jEyy6dhMoOdgLmpzV29yZD6G7.b7lFQqYp3a57pJ.', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC1717321112514/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC171732111253', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$m0BqI5RBFtiX1qqhNb5.nemd9lS8lKIGP4KxZ7NgJlfPdKTxxd3RG', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC171732111253/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC171732112514', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$k3Hj4Qqkt/a4UXZ6VOihYeyXy8cJF5UC6Pabg2Q4viZggggwv5se2', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC171732112514/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC171732112517', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$AFuzjQliOyShmBTz0U0Mn.5WCgv3kYVHzQU.5YWaOV0n.U8Cj7tyC', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC171732112517/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC171732112519', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$s7F979o3bCXz5JBq.AUEteUmfdekJlqWrzXW8h0uBsjMwjtGqUjFq', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC171732112519/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC17173214', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$/g.kC5Hjb8UZpxh5ptYmFeyCqLVMfcntz27RDvBlKMuFpZcGF.r8q', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC17173214/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC171732144', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$8dnOIXG0ckBIEN.ieUcCqOmMUGivt9IuApy7vZsvJy24yqG4AvQ2i', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC171732144/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC1717321448', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$2V0RiQRByfzBxCVR4cB.Du6YXrE1l8mSlEDXjuoz3DZ5Mz0vEvZVS', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC1717321448/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC17173214480', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$uiFZr1Dp/v/3HiBS32nT2ul2PiKYDvCihaTtYU3Ue/foBpBAxZ9uK', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC17173214480/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC171732144808', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$o3m7t/5JpsxNOqF1m4sbfONHqGRDjO/tYZobAFhxmVCR03E.Ut1ai', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC171732144808/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC17173214481', 'Ajaz', '-', 'bcrypt_sha256$$2b$12$OSd73DbkpRuLrbY7yEiTU.PWxbubC7wV93stPgNs4w/JJBFvVxfs2', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-15', '2028-11-13', 'user', 'DMC17173214481/images/Md_Saiful_Alam.jpg', NULL, '2023-11-16 08:34:23.750772', 1, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC18', 'rezvialauddin', '-', '1234', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC18/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 04:13:20.755474', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC19', 'rezvialauddin', '-', '1234', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC19/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 04:18:25.068038', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC20', 'rezvialauddin', '-', '1234', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC20/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 04:20:17.062705', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC21', 'rezvialauddin', '-', '1234', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC21/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 04:23:19.441552', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC22', 'rezvialauddin', '-', 'bcrypt_sha256$$2b$12$q7ow.PPmDCqxzinx1V7wB.y8KU567UYMn3Hu6Ql1ZGaBMEoAHLxV.', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC22/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 04:24:08.991899', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC23', 'rezvialauddin', '-', 'bcrypt_sha256$$2b$12$JVUmvOSxkg13KvTsMjiqY.zGCEht1BeKVntCVcCytxUNTry1unt..', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC23/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 04:26:35.449557', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC24', 'rezvialauddin', '-', 'bcrypt_sha256$$2b$12$5FLPiN1A..WEuQ7fCVQfwusWgwImcbKHejX6Ttyu2eGIRLSdU1gAK', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC24/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 04:31:24.796551', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1672509600000),
('DMC25', 'rezvialauddin', '-', 'bcrypt_sha256$$2b$12$RXOPI.awav39mEz2YqaXqOguBqPMbzQBJji3JQo6IyV3En/imjS4.', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC25/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 05:49:01.391863', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700545719),
('DMC26', 'rezvialauddin', '-', 'bcrypt_sha256$$2b$12$eIcOELGd7pfC5VEFRkOC4eMg/OTpXTt3qSToY5s4QZflsCf1U8VQm', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC26/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 06:00:45.002097', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 0),
('DMC27', 'rezvialauddin', '-', 'bcrypt_sha256$$2b$12$TKaJLlOfxD.WZrQX8N6UIu7vqq1bc8I/Pw/HJsHXaYNP8Sk5xZYZG', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC27/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 06:04:51.047207', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700546691047),
('DMC28', 'rezvialauddin', '-', 'bcrypt_sha256$$2b$12$T6s6hknuc1zfvJX9Tsd8wOn3k0btibZeedYroEOcCz49W8ditBCA.', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC28/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 06:05:14.542846', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700546714542),
('DMC29', 'rezvialauddin', '-', 'bcrypt_sha256$$2b$12$pxqzhN0mpDb5yqQa3EApbOzKgep.pgakOoqC7os7Y9IlN6ICuMbU2', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC29/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 06:16:07.544595', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700547367544),
('DMC30', 'rezvialauddin', '-', 'bcrypt_sha256$$2b$12$LObf/4Y.RxSxTXXVb3oqr.hLPKpD4EjFcHXdcq0oBi0gdE1yWPQka', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC30/images/Md_Alauddin_Rezvi.jpg', 4, '2023-11-21 06:16:53.588755', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700547413588),
('DMC31', 'rezvialauddin', '-', 'bcrypt_sha256$$2b$12$fRmIEm19db3OjQrwLNTLb.M4u40ITTpi7/ePizs5uEis7xLqOiNRS', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC31/images/Md_Alauddin_Rezvi.jpg', 2, '2023-11-21 06:18:43.385965', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700547523386),
('DMC32', 'rezvialauddin', '-', 'bcrypt_sha256$$2b$12$0oRU94Alk42nl2s3ArHEpuYGEefQYJeMsSXTJrsrxJNL4OUbvQrSa', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC32/images/Md_Alauddin_Rezvi.jpg', 2, '2023-11-21 06:21:43.087122', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700547703087),
('DMC33', 'rezvialauddin', '-', 'bcrypt_sha256$$2b$12$3fWpbik2xpeHcYrHfUiqROShtbftfjkA/4tsHxxRmU2Tz/Y..TnQu', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC33/images/Md_Alauddin_Rezvi.jpg', 2, '2023-11-21 06:26:28.068834', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700547988068),
('DMC34', 'rezvialauddin', '-', 'bcrypt_sha256$$2b$12$7rYZ5PD0.H9OVVg1/bohf.LBptMNhV.qUB.2Spr/UAgUY0oNlZGlG', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC34/images/Md_Alauddin_Rezvi.jpg', 2, '2023-11-21 06:28:06.848127', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700548086848),
('DMC38', 'ajwat', '-', 'bcrypt_sha256$$2b$12$kRC199fdfBaCb3BBG.NVVehlu75shO70NDy0qjne7v3FeV.3nRKmK', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC38/images/Ajwat.jpg', 2, '2023-11-21 06:40:31.477435', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700548831477),
('DMC39', 'Nazmul haque', '-', 'bcrypt_sha256$$2b$12$mjZ3lkfWeHARgAPNX4IlseIQ/bmF9SahQOdKt.CAS4Nq8FFziuE6a', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC39/images/Md_Nazmul_Haque.jpg', 2, '2023-11-21 07:07:26.139384', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700550446139),
('DMC40', 'Urmi Hera', '-', 'bcrypt_sha256$$2b$12$PChGU2Dwc.3kX5RxfDCd7OX/94QpBH9g7cOoM.Y9AQhl8.x7a91wW', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-21', '2028-11-19', 'user', 'DMC40/images/URMI_HIRA.jpg', 2, '2023-11-21 09:45:42.853628', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700559942853),
('DMC41', 'Mihal', '-', 'bcrypt_sha256$$2b$12$Cqwr3oqdzw3sOPzRigYI9e1WV5FnZmKjqnA.Vwe4gRchuuUuSbPFW', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-22', '2028-11-20', 'user', 'DMC41/images/Md_Mihal..jpg', 2, '2023-11-22 06:25:29.555488', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700634329555),
('DMC43', 'Siful Alam', '-', 'bcrypt_sha256$$2b$12$HA/cJW969qMZAd.AcHjF4.q1i8DOh8sWxVziYLPhBVg8mSMYHF2Ru', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-22', '2028-11-20', 'user', 'DMC43/images/Md_Saiful_Alam.jpg', 2, '2023-11-22 12:10:35.032543', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700655035032),
('DMC44', 'Siful Alam', '-', 'bcrypt_sha256$$2b$12$NKrPeHgU/UGyF4MJ7ES03eVuo5E7P8VrCHcF3bHOFidm6nJyMIbM6', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-22', '2028-11-20', 'user', 'DMC44/images/Md_Saiful_Alam.jpg', 2, '2023-11-22 12:11:13.643001', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700655073643),
('DMC45', 'Ajwat', '-', 'bcrypt_sha256$$2b$12$60qd/Yfbk/nIKTSHrTmnSuvhMQRnKaOgp635jPnTk0ioRsDaPXZJ.', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC45/images/Ajwat.jpg', 2, '2023-11-23 07:41:42.431541', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700725302431),
('DMC46', 'Ajwat', '-', 'bcrypt_sha256$$2b$12$F83OtAB3gVrB7d3gcTIrr.mHb1XQJr5abdJgd/s35ZgBWURCeTJ0G', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC46/images/Ajwat.jpg', 2, '2023-11-23 07:43:56.851513', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700725436852),
('DMC47', 'Ajwat', '-', 'bcrypt_sha256$$2b$12$U.rDsZn45iYAyTkkBOHeze06SXXAfNsQ5FoyVq8Jw0CGZ1RY9UmzW', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC47/images/Ajwat.jpg', 2, '2023-11-23 07:45:09.221965', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700725509222),
('DMC48', 'Ajwat', '-', 'bcrypt_sha256$$2b$12$kEYj41niz0/gZo4ud6KwceYAu.dBRNDpHn7dmx4yXM.3mMY12X79q', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', '', 2, '2023-11-23 07:49:08.191266', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700725748191),
('DMC49', 'Ajwat', '-', 'bcrypt_sha256$$2b$12$Sv587xjZ/yqhCe.n37GwE.R0kNZAAq/kV.jHawsm.sh9uYQ6JQ8Ca', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC49/images/Ajwat_TdpDXPk.jpg', 2, '2023-11-23 07:50:33.716176', 0, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1700725833716),
('DMC50', 'Ajwat', '-', 'bcrypt_sha256$$2b$12$uFHtQp5wWbao5JDi3XlV/eZZOO6EEnDcbZljoVEkNEaqnMb.Ga.Wm', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', '', 2, '2023-11-23 08:18:03.424782', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700727483424),
('DMC51', 'Ajwat', '-', 'bcrypt_sha256$$2b$12$IdjckTNqnCoyyA5eEKry.OxzANA6Q7zOa6KoPFLENaUBG7mpvVfKq', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', '', 2, '2023-11-23 08:20:59.417579', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700727659417),
('DMC52', 'Ajwat', '-', 'bcrypt_sha256$$2b$12$OjVg3aiwK8tgmk1Pk2N1cusgGcKejbTGFM50fuY.nmAoF7R.RazcC', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC52/images/Ajwat.jpg', 2, '2023-11-23 08:23:50.217422', 0, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1700727830217),
('DMC53', 'Ajwat', '-', 'bcrypt_sha256$$2b$12$xWGsUGr6IuEt0eJWdxkRj.hXtNUM/XWP2Vb0z1Y1JqHx.D9vZosIO', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC53/images/GM_Nazmul_Hussain_oy5AOFm.jpg', 2, '2023-11-23 08:25:51.088076', 0, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1700727951088),
('DMC54', 'Ajwat', '-', 'bcrypt_sha256$$2b$12$1DRFKhLOX1ua2b6IVdaP6OakUjsOw9sxaUwQSA50mGsZ8FtHk89Bi', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', '', 2, '2023-11-23 08:58:48.965132', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700729928965),
('DMC55', 'Ibrahim', '-', 'bcrypt_sha256$$2b$12$Gt6qovSim.uPM5zshX/dpuM3DawQ8auwYxXV.P5TfJlfRSiXzkzWq', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', '', 2, '2023-11-23 09:46:46.770701', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700732806771),
('DMC56', 'Ibrahim', '-', 'bcrypt_sha256$$2b$12$5L5CHxAkhNw0/LYBB7km2e7dq2v0mtdCpB.e49PPXIGk1VFopB9aW', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC56/images/Mohammad_Ibrahim_1.jpg', 2, '2023-11-23 09:47:54.415043', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700732874415),
('DMC57', 'Ibrahim', '-', 'bcrypt_sha256$$2b$12$7F2XIhv5rm3nTQ5gzwkDHucW6uBMiK/mfxzap.CyTnzUDRS5qYFjC', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC57/images/Mohammad_Ibrahim_1.jpg', 2, '2023-11-23 09:49:22.867124', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700732962867),
('DMC58', 'Ibrahim', '-', 'bcrypt_sha256$$2b$12$Hb7TkS7NjGBQmksJHR9e8.NPphWtvs/7edoCm5m719pMkrX8z/zTm', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC58/images/Mohammad_Ibrahim_1.jpg', 2, '2023-11-23 09:49:58.432403', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700545719),
('DMC59', 'Ibrahim', '-', 'bcrypt_sha256$$2b$12$F1bHlhGAfhK8BuVZKTpPYeVcCdYrf0xUU7wCoYG3hSXEqzedy9pwG', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC59/images/Mohammad_Ibrahim_1.jpg', 2, '2023-11-23 09:50:52.026003', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700545719),
('DMC60', 'jiaur', '-', 'bcrypt_sha256$$2b$12$7yntFzvhHSeF2ufn6PdM..jw.HuI8MN5.VvEaoAOsoe.lWJHRTBRy', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC60/images/Md_Jiaur_Rahman.jpg', 2, '2023-11-23 10:21:31.849290', 0, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1700545719),
('DMC61', 'masud', '-', 'bcrypt_sha256$$2b$12$Xi7Xl6Zcc05rm8ZfnBgvP.tKgfbwo2uA/XQ8sTJzicPEu6EjcZqH.', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC61/images/Masudul_Kabir.jpg', 2, '2023-11-23 10:25:02.567487', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700545719),
('DMC62', 'anata', '-', 'bcrypt_sha256$$2b$12$3QZNEgfirGTUifwCfjD3ce0T0QlCf3mnED9A3FQ3NZUtRGblUFCLa', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC62/images/Anata_Kumar_Ridoy.jpg', 2, '2023-11-23 10:29:40.919536', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700545719),
('DMC63', 'jamiul', '-', 'bcrypt_sha256$$2b$12$X4YwDKXJypIUEHosgAoBouRhihMBF9gPSUZYNl3S9WdaW1bRSzr/u', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC63/images/Jamiul_Islam.jpg', 2, '2023-11-23 10:33:09.017222', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700545719),
('DMC64', 'jamiul', '-', 'bcrypt_sha256$$2b$12$fxHta.RzLG21YeejvoztG.kYeitNYN15UyPj/T6WUWmxiCdslmM76', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC64/images/Jamiul_Islam.jpg', 2, '2023-11-23 10:34:33.702408', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700545719),
('DMC65', 'jamiul', '-', 'bcrypt_sha256$$2b$12$e/pEfD0Uel8LMCFYzu6pJ.UL8/WWjCkJcGDpnQXhKsStQxbnv7nly', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC65/images/Jamiul_Islam.jpg', 2, '2023-11-23 10:35:19.267128', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700545719),
('DMC66', 'jamiul', '-', 'bcrypt_sha256$$2b$12$lXzNrMc3BVCtBFJaS73/uOCpM4191M2I8aEBouFZKurvYn7Xh4wwi', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC66/images/Jamiul_Islam.jpg', 2, '2023-11-23 10:35:53.592302', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700735753592),
('DMC67', 'jamiul', '-', 'bcrypt_sha256$$2b$12$YXy4ZnXER2RDTbJBQhjBWOkA3VLUBlIcTFe52IWIjPbGc2Kw1bVFy', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC67/images/Jamiul_Islam.jpg', 2, '2023-11-23 10:36:14.378676', 0, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1700735774379),
('DMC68', 'jamiul', '-', 'bcrypt_sha256$$2b$12$GsPcfaze4OwhqmjxTPpXSuHBX4.u0W6yzHOnEHz80kKih2B483IU6', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC68/images/Jamiul_Islam.jpg', 2, '2023-11-23 10:49:49.940985', 0, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1700736589940),
('DMC69', 'MAMUN', '-', 'bcrypt_sha256$$2b$12$ZzsGi07yoYV.YgwneUJeNOaovvxbt2gCu94pVv6hpNgxvzD9SdhXC', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC69/images/Md_Mamun_Ali_dCzqgz1.jpg', 2, '2023-11-23 10:51:32.706804', 0, 0, 0, NULL, '2023-01-01 00:00:00.000000', 1700736692706),
('DMC7', 'NAYEM SHEKH', '-', 'bcrypt_sha256$$2b$12$75xj0T3szZ87ItjBoMYV/eMZ9W1n516MvX.uj48c18U4Vm2vltR8y', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-27', '2028-11-25', 'user', 'DMC7/images/Md_Nymur_Rahman.jpg', 2, '2023-11-27 10:30:14.973635', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1701081014973),
('DMC70', 'NAYEMURRAHMAN', '-', 'bcrypt_sha256$$2b$12$jbLajqfjTpnTLwQbi3Hc8e583lw1E2xA.rdJVhtMy4A3sxjX6gdgS', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-23', '2028-11-21', 'user', 'DMC70/images/Md_Nymur_Rahman.jpg', 2, '2023-11-23 10:52:54.959250', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1700736774959),
('DMC71', 'NAYEM SHEKH', '-', 'bcrypt_sha256$$2b$12$FrqbGMVvXFISCNOYbT0Zm.p9nExMD3KM3a1i524eqPevfixN8knlu', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-27', '2028-11-25', 'user', 'DMC71/images/Md_Nymur_Rahman.jpg', 2, '2023-11-27 10:17:55.797488', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1701080275797),
('DMC72', 'NAYEM SHEKH', '-', 'bcrypt_sha256$$2b$12$7OlJFfe.q.wyfa8g3zN69efHokfCvWPDSG8so6dpFKU8faxp.5vlK', '-', '-', '08:00:00.000000', '17:00:00.000000', '2023-11-27', '2028-11-25', 'user', 'DMC72/images/Md_Nymur_Rahman.jpg', 2, '2023-11-27 10:19:07.759265', 1, 1, 1, NULL, '2023-01-01 00:00:00.000000', 1701080347759);

-- --------------------------------------------------------

--
-- Table structure for table `employee_employeegroup`
--

CREATE TABLE `employee_employeegroup` (
  `id` bigint(20) NOT NULL,
  `employee_id` varchar(100) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_employeegroupdevice`
--

CREATE TABLE `employee_employeegroupdevice` (
  `id` int(11) NOT NULL,
  `device_id_id` varchar(100) NOT NULL,
  `employee_id_id` varchar(100) NOT NULL,
  `group_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_employeepermission`
--

CREATE TABLE `employee_employeepermission` (
  `id` bigint(20) NOT NULL,
  `employee_id` varchar(100) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grpdev_groupdevice`
--

CREATE TABLE `grpdev_groupdevice` (
  `id` int(11) NOT NULL,
  `device_id_id` varchar(100) NOT NULL,
  `group_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grpdev_groupdevice`
--

INSERT INTO `grpdev_groupdevice` (`id`, `device_id_id`, `group_id_id`) VALUES
(2, 'DmcGate11', 4),
(3, 'Dmc10101', 4),
(4, 'DmcGate1', 4),
(5, 'DmcGate3', 4),
(6, 'DmcGate5', 4),
(7, 'DmcGate7', 4),
(8, 'DmcGate9', 4),
(9, 'DmcGate1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `log_log`
--

CREATE TABLE `log_log` (
  `r_clsf_record_id` int(11) NOT NULL,
  `CardName` varchar(100) DEFAULT NULL,
  `InTime` datetime(6) DEFAULT NULL,
  `RecNo` int(11) DEFAULT NULL,
  `RoomNumber` varchar(100) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `device_id_id` varchar(100) NOT NULL,
  `employee_id_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_log`
--

INSERT INTO `log_log` (`r_clsf_record_id`, `CardName`, `InTime`, `RecNo`, `RoomNumber`, `Status`, `Type`, `image_url`, `device_id_id`, `employee_id_id`) VALUES
(368, 'Nazmul haque', '2023-11-21 13:08:05.000000', 61, '', 1, 'Entry', '/SnapShotFilePath/2023-11-21/15/08/DMC39_99_100_20231121150805485.jpg', 'DmcGate1', 'DMC39'),
(369, 'Nazmul haque', '2023-11-21 13:08:08.000000', 62, '', 1, 'Entry', '/SnapShotFilePath/2023-11-21/15/08/DMC39_99_100_20231121150808324.jpg', 'DmcGate1', 'DMC39'),
(370, 'Urmi Hera', '2023-11-21 15:45:30.000000', 69, '', 1, 'Entry', '/SnapShotFilePath/2023-11-21/17/45/DMC40_99_100_20231121174530368.jpg', 'DmcGate1', 'DMC40'),
(371, 'Urmi Hera', '2023-11-21 15:45:33.000000', 70, '', 1, 'Entry', '/SnapShotFilePath/2023-11-21/17/45/DMC40_99_100_20231121174533441.jpg', 'DmcGate1', 'DMC40'),
(372, 'Urmi Hera', '2023-11-21 15:45:36.000000', 71, '', 1, 'Entry', '/SnapShotFilePath/2023-11-21/17/45/DMC40_99_100_20231121174536569.jpg', 'DmcGate1', 'DMC40'),
(373, 'Nazmul haque', '2023-11-21 17:25:21.000000', 72, '', 1, 'Entry', '/SnapShotFilePath/2023-11-21/19/25/DMC39_99_100_20231121192521799.jpg', 'DmcGate1', 'DMC39'),
(374, 'Siful Alam', '2023-11-22 18:12:55.000000', 95, '', 1, 'Entry', '/SnapShotFilePath/2023-11-22/20/12/DMC44_99_100_20231122201255400.jpg', 'DmcGate1', 'DMC44'),
(375, 'Siful Alam', '2023-11-22 18:12:59.000000', 96, '', 1, 'Entry', '/SnapShotFilePath/2023-11-22/20/12/DMC44_98_100_20231122201259974.jpg', 'DmcGate1', 'DMC44'),
(376, 'NAYEMURRAHMAN', '2023-11-26 17:41:00.000000', 122, '', 1, 'Entry', '/SnapShotFilePath/2023-11-26/19/41/DMC70_99_100_20231126194100859.jpg', 'DmcGate1', 'DMC70'),
(377, 'NAYEMURRAHMAN', '2023-11-26 17:41:03.000000', 123, '', 1, 'Entry', '/SnapShotFilePath/2023-11-26/19/41/DMC70_99_100_20231126194103888.jpg', 'DmcGate1', 'DMC70'),
(378, 'NAYEMURRAHMAN', '2023-11-26 17:41:07.000000', 124, '', 1, 'Entry', '/SnapShotFilePath/2023-11-26/19/41/DMC70_99_100_20231126194107029.jpg', 'DmcGate1', 'DMC70'),
(379, 'NAYEMURRAHMAN', '2023-11-26 17:41:10.000000', 125, '', 1, 'Entry', '/SnapShotFilePath/2023-11-26/19/41/DMC70_99_100_20231126194110224.jpg', 'DmcGate1', 'DMC70'),
(380, 'NAYEMURRAHMAN', '2023-11-26 17:41:13.000000', 126, '', 1, 'Entry', '/SnapShotFilePath/2023-11-26/19/41/DMC70_99_100_20231126194113291.jpg', 'DmcGate1', 'DMC70'),
(381, 'NAYEMURRAHMAN', '2023-11-26 17:41:16.000000', 127, '', 1, 'Entry', '/SnapShotFilePath/2023-11-26/19/41/DMC70_99_100_20231126194116504.jpg', 'DmcGate1', 'DMC70'),
(382, 'NAYEMURRAHMAN', '2023-11-26 17:41:20.000000', 128, '', 1, 'Entry', '/SnapShotFilePath/2023-11-26/19/41/DMC70_99_100_20231126194120495.jpg', 'DmcGate1', 'DMC70'),
(383, 'MAMUN', '2023-11-27 10:47:51.000000', 140, '', 1, 'Entry', '/SnapShotFilePath/2023-11-27/12/47/DMC69_99_100_20231127124751260.jpg', 'DmcGate1', 'DMC69'),
(384, 'jiaur', '2023-11-27 10:47:57.000000', 141, '', 1, 'Entry', '/SnapShotFilePath/2023-11-27/12/47/DMC60_99_100_20231127124757822.jpg', 'DmcGate1', 'DMC60'),
(385, 'jiaur', '2023-11-27 10:48:05.000000', 142, '', 1, 'Entry', '/SnapShotFilePath/2023-11-27/12/48/DMC60_99_100_20231127124805781.jpg', 'DmcGate1', 'DMC60'),
(386, 'Urmi Hera', '2023-11-27 10:48:09.000000', 143, '', 1, 'Entry', '/SnapShotFilePath/2023-11-27/12/48/DMC40_99_100_20231127124809293.jpg', 'DmcGate1', 'DMC40'),
(387, 'Nazmul haque', '2023-11-27 15:04:42.000000', 145, '', 1, 'Entry', '/SnapShotFilePath/2023-11-27/17/04/DMC39_99_100_20231127170442600.jpg', 'DmcGate1', 'DMC39'),
(388, 'Nazmul haque', '2023-11-27 15:04:45.000000', 146, '', 1, 'Entry', '/SnapShotFilePath/2023-11-27/17/04/DMC39_99_100_20231127170445583.jpg', 'DmcGate1', 'DMC39'),
(389, 'Nazmul haque', '2023-11-27 15:18:25.000000', 148, '', 1, 'Entry', '/SnapShotFilePath/2023-11-27/17/18/DMC39_99_100_20231127171825239.jpg', 'DmcGate1', 'DMC39'),
(390, 'Nazmul haque', '2023-11-28 11:32:41.000000', 152, '', 1, 'Entry', '/SnapShotFilePath/2023-11-28/13/32/DMC39_99_100_20231128133241013.jpg', 'DmcGate1', 'DMC39'),
(391, 'MAMUN', '2023-11-28 11:33:08.000000', 155, '', 1, 'Entry', '/SnapShotFilePath/2023-11-28/13/33/DMC69_99_100_20231128133308122.jpg', 'DmcGate1', 'DMC69'),
(392, 'Nazmul haque', '2023-11-28 11:50:57.000000', 156, '', 1, 'Entry', '/SnapShotFilePath/2023-11-28/13/50/DMC39_99_100_20231128135057259.jpg', 'DmcGate1', 'DMC39'),
(393, 'Nazmul haque', '2023-11-28 11:50:59.000000', 157, '', 1, 'Entry', '/SnapShotFilePath/2023-11-28/13/50/DMC39_99_100_20231128135059968.jpg', 'DmcGate1', 'DMC39'),
(394, 'MAMUN', '2023-11-28 13:01:10.000000', 159, '', 1, 'Entry', '/SnapShotFilePath/2023-11-28/15/01/DMC69_99_100_20231128150110415.jpg', 'DmcGate1', 'DMC69'),
(395, 'Nazmul haque', '2023-11-28 13:09:25.000000', 161, '', 1, 'Entry', '/SnapShotFilePath/2023-11-28/15/09/DMC39_99_100_20231128150925780.jpg', 'DmcGate1', 'DMC39'),
(396, 'NAYEMURRAHMAN', '2023-11-28 13:09:32.000000', 162, '', 1, 'Entry', '/SnapShotFilePath/2023-11-28/15/09/DMC70_99_100_20231128150932417.jpg', 'DmcGate1', 'DMC70');

-- --------------------------------------------------------

--
-- Table structure for table `role_role`
--

CREATE TABLE `role_role` (
  `role_id` int(11) NOT NULL,
  `role` varchar(100) NOT NULL,
  `role_description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_role`
--

INSERT INTO `role_role` (`role_id`, `role`, `role_description`) VALUES
(5, 'admin', '-'),
(6, 'user', 'This role is for user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_task`
--
ALTER TABLE `api_task`
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
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `department_department`
--
ALTER TABLE `department_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designation_designation`
--
ALTER TABLE `designation_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_device`
--
ALTER TABLE `device_device`
  ADD PRIMARY KEY (`device_id`),
  ADD KEY `device_device_group_id_id_27cc8972_fk_empgrp_group_group_id` (`group_id_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

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
-- Indexes for table `empfiles_employeefiles`
--
ALTER TABLE `empfiles_employeefiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empfiles_employeefil_employee_id_id_754e0345_fk_employee_` (`employee_id_id`);

--
-- Indexes for table `empgrpdev_groupbydevice`
--
ALTER TABLE `empgrpdev_groupbydevice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empgrpdev_groupbydev_device_ip_id_cfe75a12_fk_device_de` (`device_ip_id`);

--
-- Indexes for table `empgrp_group`
--
ALTER TABLE `empgrp_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `employee_employee`
--
ALTER TABLE `employee_employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `employee_employee_group_id_id_da518927_fk_empgrp_group_group_id` (`group_id_id`);

--
-- Indexes for table `employee_employeegroup`
--
ALTER TABLE `employee_employeegroup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_employeegro_employee_id_e70dc23c_fk_employee_` (`employee_id`),
  ADD KEY `employee_employeegroup_group_id_92c1d15c_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `employee_employeegroupdevice`
--
ALTER TABLE `employee_employeegroupdevice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_employeegro_device_id_id_9a7f7213_fk_device_de` (`device_id_id`),
  ADD KEY `employee_employeegro_employee_id_id_97b09ae4_fk_employee_` (`employee_id_id`),
  ADD KEY `employee_employeegro_group_id_id_8527138b_fk_auth_grou` (`group_id_id`);

--
-- Indexes for table `employee_employeepermission`
--
ALTER TABLE `employee_employeepermission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_employeeper_employee_id_d0fac65d_fk_employee_` (`employee_id`),
  ADD KEY `employee_employeeper_permission_id_5436a46a_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `grpdev_groupdevice`
--
ALTER TABLE `grpdev_groupdevice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grpdev_groupdevice_device_id_id_58fe9d4a_fk_device_de` (`device_id_id`),
  ADD KEY `grpdev_groupdevice_group_id_id_8a0f00e2_fk_empgrp_group_group_id` (`group_id_id`);

--
-- Indexes for table `log_log`
--
ALTER TABLE `log_log`
  ADD PRIMARY KEY (`r_clsf_record_id`),
  ADD KEY `log_log_device_id_id_9b2f7b50_fk_device_device_device_id` (`device_id_id`),
  ADD KEY `log_log_employee_id_id_73254996_fk_employee_employee_employee_id` (`employee_id_id`);

--
-- Indexes for table `role_role`
--
ALTER TABLE `role_role`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_role_role_69f0b6b0_uniq` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_task`
--
ALTER TABLE `api_task`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department_department`
--
ALTER TABLE `department_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `designation_designation`
--
ALTER TABLE `designation_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `empfiles_employeefiles`
--
ALTER TABLE `empfiles_employeefiles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `empgrpdev_groupbydevice`
--
ALTER TABLE `empgrpdev_groupbydevice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `empgrp_group`
--
ALTER TABLE `empgrp_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee_employeegroup`
--
ALTER TABLE `employee_employeegroup`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_employeegroupdevice`
--
ALTER TABLE `employee_employeegroupdevice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_employeepermission`
--
ALTER TABLE `employee_employeepermission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grpdev_groupdevice`
--
ALTER TABLE `grpdev_groupdevice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `log_log`
--
ALTER TABLE `log_log`
  MODIFY `r_clsf_record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=397;

--
-- AUTO_INCREMENT for table `role_role`
--
ALTER TABLE `role_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `device_device`
--
ALTER TABLE `device_device`
  ADD CONSTRAINT `device_device_group_id_id_27cc8972_fk_empgrp_group_group_id` FOREIGN KEY (`group_id_id`) REFERENCES `empgrp_group` (`group_id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `empfiles_employeefiles`
--
ALTER TABLE `empfiles_employeefiles`
  ADD CONSTRAINT `empfiles_employeefil_employee_id_id_754e0345_fk_employee_` FOREIGN KEY (`employee_id_id`) REFERENCES `employee_employee` (`employee_id`);

--
-- Constraints for table `empgrpdev_groupbydevice`
--
ALTER TABLE `empgrpdev_groupbydevice`
  ADD CONSTRAINT `empgrpdev_groupbydev_device_ip_id_cfe75a12_fk_device_de` FOREIGN KEY (`device_ip_id`) REFERENCES `device_device` (`device_id`);

--
-- Constraints for table `employee_employee`
--
ALTER TABLE `employee_employee`
  ADD CONSTRAINT `employee_employee_group_id_id_da518927_fk_empgrp_group_group_id` FOREIGN KEY (`group_id_id`) REFERENCES `empgrp_group` (`group_id`);

--
-- Constraints for table `employee_employeegroup`
--
ALTER TABLE `employee_employeegroup`
  ADD CONSTRAINT `employee_employeegro_employee_id_e70dc23c_fk_employee_` FOREIGN KEY (`employee_id`) REFERENCES `employee_employee` (`employee_id`),
  ADD CONSTRAINT `employee_employeegroup_group_id_92c1d15c_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `employee_employeegroupdevice`
--
ALTER TABLE `employee_employeegroupdevice`
  ADD CONSTRAINT `employee_employeegro_device_id_id_9a7f7213_fk_device_de` FOREIGN KEY (`device_id_id`) REFERENCES `device_device` (`device_id`),
  ADD CONSTRAINT `employee_employeegro_employee_id_id_97b09ae4_fk_employee_` FOREIGN KEY (`employee_id_id`) REFERENCES `employee_employee` (`employee_id`),
  ADD CONSTRAINT `employee_employeegro_group_id_id_8527138b_fk_auth_grou` FOREIGN KEY (`group_id_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `employee_employeepermission`
--
ALTER TABLE `employee_employeepermission`
  ADD CONSTRAINT `employee_employeeper_employee_id_d0fac65d_fk_employee_` FOREIGN KEY (`employee_id`) REFERENCES `employee_employee` (`employee_id`),
  ADD CONSTRAINT `employee_employeeper_permission_id_5436a46a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `grpdev_groupdevice`
--
ALTER TABLE `grpdev_groupdevice`
  ADD CONSTRAINT `grpdev_groupdevice_device_id_id_58fe9d4a_fk_device_de` FOREIGN KEY (`device_id_id`) REFERENCES `device_device` (`device_id`),
  ADD CONSTRAINT `grpdev_groupdevice_group_id_id_8a0f00e2_fk_empgrp_group_group_id` FOREIGN KEY (`group_id_id`) REFERENCES `empgrp_group` (`group_id`);

--
-- Constraints for table `log_log`
--
ALTER TABLE `log_log`
  ADD CONSTRAINT `log_log_device_id_id_9b2f7b50_fk_device_device_device_id` FOREIGN KEY (`device_id_id`) REFERENCES `device_device` (`device_id`),
  ADD CONSTRAINT `log_log_employee_id_id_73254996_fk_employee_employee_employee_id` FOREIGN KEY (`employee_id_id`) REFERENCES `employee_employee` (`employee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
