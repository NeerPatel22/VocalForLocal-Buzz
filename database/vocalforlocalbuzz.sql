-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2021 at 05:35 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vocalforlocalbuzz`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(25, 'Can add login', 7, 'add_login'),
(26, 'Can change login', 7, 'change_login'),
(27, 'Can delete login', 7, 'delete_login'),
(28, 'Can view login', 7, 'view_login'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add vendor details', 10, 'add_vendordetails'),
(38, 'Can change vendor details', 10, 'change_vendordetails'),
(39, 'Can delete vendor details', 10, 'delete_vendordetails'),
(40, 'Can view vendor details', 10, 'view_vendordetails'),
(41, 'Can add orders', 11, 'add_orders'),
(42, 'Can change orders', 11, 'change_orders'),
(43, 'Can delete orders', 11, 'delete_orders'),
(44, 'Can view orders', 11, 'view_orders'),
(45, 'Can add help', 12, 'add_help'),
(46, 'Can change help', 12, 'change_help'),
(47, 'Can delete help', 12, 'delete_help'),
(48, 'Can view help', 12, 'view_help');

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
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(8, 'vflbuzz', 'category'),
(12, 'vflbuzz', 'help'),
(7, 'vflbuzz', 'login'),
(11, 'vflbuzz', 'orders'),
(9, 'vflbuzz', 'product'),
(10, 'vflbuzz', 'vendordetails');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-08-20 12:58:52.812476'),
(2, 'auth', '0001_initial', '2020-08-20 12:58:55.355246'),
(3, 'admin', '0001_initial', '2020-08-20 12:59:05.070443'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-08-20 12:59:07.007589'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-08-20 12:59:07.182320'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-08-20 12:59:08.098065'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-08-20 12:59:09.050327'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-08-20 12:59:10.428341'),
(9, 'auth', '0004_alter_user_username_opts', '2020-08-20 12:59:10.489132'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-08-20 12:59:12.259446'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-08-20 12:59:12.364848'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-08-20 12:59:12.506019'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-08-20 12:59:12.637672'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-08-20 12:59:12.849647'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-08-20 12:59:13.954157'),
(16, 'auth', '0011_update_proxy_permissions', '2020-08-20 12:59:13.992884'),
(17, 'sessions', '0001_initial', '2020-08-20 12:59:14.322303'),
(18, 'vflbuzz', '0001_initial', '2020-08-20 12:59:15.035174'),
(19, 'vflbuzz', '0002_remove_login_name', '2020-08-20 15:21:31.519733'),
(20, 'vflbuzz', '0003_category', '2020-08-24 09:48:04.248457'),
(21, 'vflbuzz', '0004_product', '2020-09-03 10:39:23.046310'),
(22, 'vflbuzz', '0005_auto_20201001_1626', '2020-10-01 10:56:33.558565'),
(23, 'vflbuzz', '0006_vendordetails', '2020-10-24 07:48:19.580857'),
(24, 'vflbuzz', '0007_remove_category_username', '2021-03-06 15:50:28.144991'),
(25, 'vflbuzz', '0008_auto_20210307_1152', '2021-03-07 06:22:45.071132'),
(26, 'vflbuzz', '0009_auto_20210308_1232', '2021-03-08 07:02:39.538098'),
(27, 'vflbuzz', '0010_vendordetails_pincode', '2021-03-08 08:18:37.813506'),
(28, 'vflbuzz', '0011_vendordetails_vendorname', '2021-03-08 08:22:33.552612'),
(29, 'vflbuzz', '0012_auto_20210308_1732', '2021-03-08 12:03:05.775715'),
(30, 'vflbuzz', '0013_auto_20210309_1535', '2021-03-09 10:05:28.708092'),
(31, 'vflbuzz', '0014_auto_20210309_2114', '2021-03-09 15:44:17.406377'),
(32, 'vflbuzz', '0015_auto_20210309_2126', '2021-03-09 15:56:07.590702'),
(33, 'vflbuzz', '0016_auto_20210309_2132', '2021-03-09 16:02:32.442466'),
(34, 'vflbuzz', '0017_product_status', '2021-03-10 06:29:25.077589'),
(35, 'vflbuzz', '0018_auto_20210312_2234', '2021-03-12 17:13:14.353730'),
(36, 'vflbuzz', '0019_auto_20210312_2241', '2021-03-12 17:13:15.325564'),
(37, 'vflbuzz', '0020_auto_20210317_1746', '2021-03-17 12:17:02.838444'),
(38, 'vflbuzz', '0021_auto_20210317_1753', '2021-03-17 12:23:35.432639'),
(39, 'vflbuzz', '0022_product_vendorname', '2021-03-20 09:11:29.302285'),
(40, 'vflbuzz', '0023_product_shopname', '2021-03-20 09:19:21.627413'),
(41, 'vflbuzz', '0024_orders_productimage', '2021-03-24 08:19:25.623967'),
(42, 'vflbuzz', '0025_category_status', '2021-05-07 07:35:14.502758'),
(43, 'vflbuzz', '0026_category_categoryby', '2021-05-07 12:28:58.071294'),
(44, 'vflbuzz', '0027_help', '2021-05-08 11:57:06.886843'),
(45, 'vflbuzz', '0028_help_status', '2021-05-08 11:58:09.901699'),
(46, 'vflbuzz', '0029_product_notification', '2021-05-09 10:47:03.332336'),
(47, 'vflbuzz', '0030_auto_20210511_1115', '2021-05-11 05:45:45.771514');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0cyg73xey0eartuazpcek9smrhcyxsv1', 'MWRiZjQyZjk2OTNkNDk1YjZhZjBlOTFkODNiNTIyOThlOWZiYjhjZjp7ImNhcnQiOnsiOCI6MX0sImNhdGVnb3J5IjoiTW9iaWxlcyBhbmQgQ29tcHV0ZXJzIiwidXNlcm5hbWUiOiJEZWVwIiwicm9sZSI6InZlbmRvciJ9', '2021-05-25 06:03:02.828678'),
('2p4mp0qpn25vru1fmzfs1bgwmorz9kf7', 'ZTk5ZjZmZWJhMjcwNmY0ZDQ2NTM5ZTI4MGE2N2U3MzA1ZWU0MDNhNDp7InVzZXJuYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4ifQ==', '2021-03-22 08:24:17.627458'),
('4icuhfvbxdw2iqujwd6kli08bjyw6y0r', 'ZTk5ZjZmZWJhMjcwNmY0ZDQ2NTM5ZTI4MGE2N2U3MzA1ZWU0MDNhNDp7InVzZXJuYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4ifQ==', '2021-05-25 05:48:21.776486'),
('5rnmj6katgukx70czzyxmtjb9wf9west', 'NzQ1ZWYyODA3NzYyYjEzMzg3NGRhMTViZDlmNmNkN2Y3NTc5NDJlYTp7InVzZXJuYW1lIjoiZGVtbyIsInJvbGUiOiJ1c2VyIiwicGluY29kZSI6InllcyJ9', '2021-04-08 05:36:51.518315'),
('9hfn2uoq4fnz1hagrbbwol4c78zupz8g', 'N2UyNWMxMGM5MDMwNDExM2QxNzRmZDA5ODgzMDRjN2RiYWRlOTljMDp7fQ==', '2021-03-19 09:51:18.506614'),
('aqhetwlp1d5dnlrp0rdoo4btpu13a4pi', 'MDc0ZjFlYzM1MWY5ZDQ5YjBiZWJmNGI0NmE0MmY1OTQ5NmQ2ZmY0Mzp7InVzZXJuYW1lIjoiamF5Iiwicm9sZSI6InVzZXIifQ==', '2020-09-19 07:59:21.527271'),
('bgxnr5jhw6hgid8hdnqeb2a8ncz0s9qp', 'ZTk5ZjZmZWJhMjcwNmY0ZDQ2NTM5ZTI4MGE2N2U3MzA1ZWU0MDNhNDp7InVzZXJuYW1lIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4ifQ==', '2021-03-25 09:03:53.358887'),
('e5qb0wwbbjkobxdpjec0wn8cdw7rlvx2', 'N2UyNWMxMGM5MDMwNDExM2QxNzRmZDA5ODgzMDRjN2RiYWRlOTljMDp7fQ==', '2021-02-25 05:14:30.280736'),
('ee1zq0iewpi1qq7a2j95ug9bmq2ldjkc', 'OWJiNmU0NjU5Yjk0Mzg4NWU1NDg2YTZiYzg4YjNjZjI4MWY4YzAwMzp7ImNhcnQiOnsiOCI6MiwiOSI6MSwiNiI6MX19', '2021-03-26 17:32:10.737515'),
('f6vvlbkz3uckcnexs964d1ayp6he347q', 'MDc0ZjFlYzM1MWY5ZDQ5YjBiZWJmNGI0NmE0MmY1OTQ5NmQ2ZmY0Mzp7InVzZXJuYW1lIjoiamF5Iiwicm9sZSI6InVzZXIifQ==', '2020-10-22 04:37:42.542816'),
('g18wpqbyp44vai15evxtuz73nkb89r3z', 'N2UyNWMxMGM5MDMwNDExM2QxNzRmZDA5ODgzMDRjN2RiYWRlOTljMDp7fQ==', '2021-05-23 06:42:08.437418'),
('h0n41tzewyus5v4lzfvwannhg0vjzhk4', 'N2UyNWMxMGM5MDMwNDExM2QxNzRmZDA5ODgzMDRjN2RiYWRlOTljMDp7fQ==', '2021-04-03 11:25:55.127278'),
('hfbzisnggohq989qamkdo651o89c0v1y', 'ZTUyZWQzMmJlZjRmMzI0ODI2NmJlMmMyNjMwOTNkOTgyY2E0ODc5ZDp7ImNhcnQiOnt9fQ==', '2021-05-21 06:18:10.847140'),
('ilvwq86m9nyjwor3wq4kn7mc0smnsxte', 'N2UyNWMxMGM5MDMwNDExM2QxNzRmZDA5ODgzMDRjN2RiYWRlOTljMDp7fQ==', '2021-05-25 05:52:52.282892'),
('linf5y2cbux82jmb6csw6mf2zpo2xn4n', 'N2UyNWMxMGM5MDMwNDExM2QxNzRmZDA5ODgzMDRjN2RiYWRlOTljMDp7fQ==', '2021-04-01 12:40:22.461076'),
('uen027yf0nzelx6g2bayy326rfpwtxig', 'MWNkMWZlNmM3Y2E5Y2Y5MTFiMGI0ZmY5MjhjNzJiMWJlNjZiYjRmZTp7InVzZXJuYW1lIjoiamF5Iiwicm9sZSI6InZlbmRvciJ9', '2021-03-25 09:19:08.205996'),
('xf6q42zpxrqzb7vvbq5o972ejvrbkj0b', 'NzE5MDAxYmZhYjBkMGZmMGExMzVhNGYzZmYzNWE2YzE4NmJiMTdiODp7ImNhcnQiOnsiOCI6MX19', '2021-04-12 08:17:29.861991'),
('zpf6iefayrk6mg41xigc0jv7jcshjvks', 'N2UyNWMxMGM5MDMwNDExM2QxNzRmZDA5ODgzMDRjN2RiYWRlOTljMDp7fQ==', '2020-12-16 06:24:00.239895'),
('zvk6mveswloyvl1srwz8af17nsgooj2k', 'N2UyNWMxMGM5MDMwNDExM2QxNzRmZDA5ODgzMDRjN2RiYWRlOTljMDp7fQ==', '2020-10-22 09:07:33.137841');

-- --------------------------------------------------------

--
-- Table structure for table `vflbuzz_category`
--

CREATE TABLE `vflbuzz_category` (
  `id` int(11) NOT NULL,
  `CATEGORY` varchar(100) NOT NULL,
  `Status` varchar(15) NOT NULL,
  `categoryby` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vflbuzz_category`
--

INSERT INTO `vflbuzz_category` (`id`, `CATEGORY`, `Status`, `categoryby`) VALUES
(6, 'Mobiles and Computers', 'approve', 'admin'),
(7, 'Electronics accessories', 'approve', 'admin'),
(8, 'Men’s Fashion', 'approve', 'admin'),
(9, 'Women’s Fashion', 'approve', 'admin'),
(10, 'Bags', 'approve', 'admin'),
(11, 'Baby products & Toys', 'approve', 'admin'),
(12, 'Books', 'approve', 'admin'),
(13, 'Home appliances', 'approve', 'admin'),
(14, 'Sports & Fitness', 'approve', 'admin'),
(15, 'Groceries', 'approve', 'admin'),
(16, 'Stationery supplies', 'approve', 'admin'),
(17, 'Safety & Hygiene Essentials (for special Covid-19 )', 'approve', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `vflbuzz_login`
--

CREATE TABLE `vflbuzz_login` (
  `id` int(11) NOT NULL,
  `USERNAME` varchar(20) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `EMAILID` varchar(64) NOT NULL,
  `ROLE` varchar(10) NOT NULL,
  `PINCODE` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vflbuzz_login`
--

INSERT INTO `vflbuzz_login` (`id`, `USERNAME`, `PASSWORD`, `EMAILID`, `ROLE`, `PINCODE`) VALUES
(2, 'jay', '202cb962ac59075b964b07152d234b70', 'patelneer8@gmail.com', 'vendor', '384002'),
(3, 'Neer', '202cb962ac59075b964b07152d234b70', 'patelneer371@gmail.com', 'user', '384002'),
(4, 'Deep', '202cb962ac59075b964b07152d234b70', 'patelneer371@gmail.com', 'vendor', '384002'),
(5, 'admin', '202cb962ac59075b964b07152d234b70', 'patelneer8@gmail.com', 'admin', '0'),
(7, 'ashil', '1b42ac6d1a5d6266dc5f06a04c944bb8', 'patelneer371@gmail.com', 'user', '384002'),
(11, 'demo', '202cb962ac59075b964b07152d234b70', 'patelneer371@gmail.com', 'vendor', '384002'),
(12, 'demo1', '202cb962ac59075b964b07152d234b70', 'patelneer371@gmail.com', 'vendor', '3841002');

-- --------------------------------------------------------

--
-- Table structure for table `vflbuzz_orders`
--

CREATE TABLE `vflbuzz_orders` (
  `id` int(11) NOT NULL,
  `CustomerUserName` varchar(20) NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `CustomerAddress` varchar(500) NOT NULL,
  `CustomerPhone` varchar(15) NOT NULL,
  `CustomerEmail` varchar(64) NOT NULL,
  `VendorUsername` varchar(20) NOT NULL,
  `VendorEmail` varchar(64) NOT NULL,
  `ShopName` varchar(100) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `ProductQuantity` varchar(15) NOT NULL,
  `ProductPrice` varchar(10) NOT NULL,
  `PlaceDate` date NOT NULL,
  `Status` varchar(20) NOT NULL,
  `ProductImage` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vflbuzz_orders`
--

INSERT INTO `vflbuzz_orders` (`id`, `CustomerUserName`, `CustomerName`, `CustomerAddress`, `CustomerPhone`, `CustomerEmail`, `VendorUsername`, `VendorEmail`, `ShopName`, `ProductId`, `ProductName`, `ProductQuantity`, `ProductPrice`, `PlaceDate`, `Status`, `ProductImage`) VALUES
(6, 'Neer', 'Neer Patel', 'sidhpur', '7096207373', 'patelneer8@gmail.com', 'Deep', 'patelneer8@gmail.com', 'umiya super market', 6, 'LG 679 L Frost Free Side-by-Side Refrigerator', '1', '78490', '2021-03-24', 'Delivered', 'product_images/lg.jpg'),
(7, 'Neer', 'Neer Patel', 'sidhpur', '7096207373', 'patelneer8@gmail.com', 'jay', 'jaykumar2642000@gmail.com', 'yaari', 8, 'Samsung Galaxy M31', '1', '15999', '2021-03-24', 'Placed', 'product_images/samsung_2VNkNMK.jpg'),
(10, 'Neer', 'Neer Patel', 'mehsana', '7096207373', 'patelneer8@gmail.com', 'Deep', 'patelneer8@gmail.com', 'umiya super market', 6, 'LG 679 L Frost Free Side-by-Side Refrigerator', '1', '78490', '2021-05-07', 'Delivered', 'product_images/lg.jpg'),
(11, 'demo', 'Ashil Patel', 'mehsana', '7096207373', 'patelneer371@gmail.com', 'Deep', 'patelneer8@gmail.com', 'umiya super market', 6, 'LG 679 L Frost Free Side-by-Side Refrigerator', '1', '78490', '2021-05-07', 'Placed', 'product_images/lg.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `vflbuzz_product`
--

CREATE TABLE `vflbuzz_product` (
  `id` int(11) NOT NULL,
  `VendorUsername` varchar(20) NOT NULL,
  `CATEGORY` varchar(50) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `ProductPrice` bigint(20) NOT NULL,
  `ProductQuantity` varchar(15) NOT NULL,
  `ProductDeliveryCharge` varchar(5) NOT NULL,
  `ProductDescription` varchar(500) NOT NULL,
  `ProductImage1` varchar(100) DEFAULT NULL,
  `ProductBrand` varchar(30) NOT NULL,
  `Status` varchar(15) NOT NULL,
  `VendorName` varchar(50) NOT NULL,
  `ShopName` varchar(100) NOT NULL,
  `Notification` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vflbuzz_product`
--

INSERT INTO `vflbuzz_product` (`id`, `VendorUsername`, `CATEGORY`, `ProductName`, `ProductPrice`, `ProductQuantity`, `ProductDeliveryCharge`, `ProductDescription`, `ProductImage1`, `ProductBrand`, `Status`, `VendorName`, `ShopName`, `Notification`) VALUES
(5, 'Deep', 'Men’s Fashion', 'Peter England Blue Shirt PCSFCSLPP77795', 735, '735', '0', 'Make an impression in this blue check shirt, tailored in Slim Fit from Peter England Casuals by Peter England.', 'product_images/shirt_OQnX8qU.jpg', 'Peter England', 'approve', 'Deep Patel', 'umiya super market', '0'),
(8, 'jay', 'Mobiles and Computers', 'Samsung Galaxy M31', 15999, '300', '0', 'Space Black, 6GB RAM, 64GB Storage', 'product_images/samsung_2VNkNMK.jpg', 'Samsung', 'approve', 'jay patel', 'yaari', '0'),
(9, 'jay', 'Mobiles and Computers', 'Samsung Galaxy M21', 13999, '200', '0', 'Midnight Blue, 4GB RAM, 64GB Storage', 'product_images/s.jpg', 'Samsung', 'approve', 'jay patel', 'yaari', '0'),
(10, 'demo', 'Women’s Fashion', 'Annabelle', 700, '150', '0', 'Collared Short Sleeves Blue Top', 'product_images/350772-1724185.png', 'Pantaloon', 'approve', 'Demo', 'demo shop', '0');

-- --------------------------------------------------------

--
-- Table structure for table `vflbuzz_vendordetails`
--

CREATE TABLE `vflbuzz_vendordetails` (
  `id` int(11) NOT NULL,
  `USERNAME` varchar(20) NOT NULL,
  `ShopName` varchar(100) NOT NULL,
  `ContactNo` varchar(12) NOT NULL,
  `Email` varchar(64) NOT NULL,
  `ShopAddress` varchar(500) NOT NULL,
  `AboutShop` varchar(500) NOT NULL,
  `GSTNo` varchar(15) NOT NULL,
  `LicenseNo` varchar(30) NOT NULL,
  `Status` varchar(15) NOT NULL,
  `Pincode` varchar(6) NOT NULL,
  `VendorName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vflbuzz_vendordetails`
--

INSERT INTO `vflbuzz_vendordetails` (`id`, `USERNAME`, `ShopName`, `ContactNo`, `Email`, `ShopAddress`, `AboutShop`, `GSTNo`, `LicenseNo`, `Status`, `Pincode`, `VendorName`) VALUES
(4, 'Deep', 'umiya super market', '7096207373', 'patelneer8@gmail.com', 'modhera circul mehsana', 'grosary shop', '24AADCB2230M1Z2', 'dfvyadfh122', 'approve', '384002', 'Deep Patel'),
(6, 'jay', 'yaari', '9824783470', 'jaykumar2642000@gmail.com', 'mehsana', 'mobile & accessories', '124567788252', '5137881448915', 'approve', '384002', 'jay patel'),
(7, 'demo', 'demo shop', '9824783470', 'patelneer371@gmail.com', 'Sidhpur', 'super market', '24AADCB2230M1Z2', 'dfvyadfh122', 'approve', '384151', 'Demo'),
(8, 'demo1', 'umiya kirana store', '7096207373', 'patelneer371@gmail.com', 'mehsana', 'supermarket', '24AADCB2230M1Z2', 'dfvyadfh122', 'approve', '384002', 'Demo1'),
(9, 'Neer', 'Neer super market', '7096207373', 'patelneer8@gmail.com', 'mehsana', 'this is super market', '24AADCB2230M1Z2', 'dfvyadfh122', 'pending', '384002', 'Neer patel');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `vflbuzz_category`
--
ALTER TABLE `vflbuzz_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vflbuzz_login`
--
ALTER TABLE `vflbuzz_login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `USERNAME` (`USERNAME`);

--
-- Indexes for table `vflbuzz_orders`
--
ALTER TABLE `vflbuzz_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vflbuzz_product`
--
ALTER TABLE `vflbuzz_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vflbuzz_vendordetails`
--
ALTER TABLE `vflbuzz_vendordetails`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `vflbuzz_category`
--
ALTER TABLE `vflbuzz_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `vflbuzz_login`
--
ALTER TABLE `vflbuzz_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vflbuzz_orders`
--
ALTER TABLE `vflbuzz_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vflbuzz_product`
--
ALTER TABLE `vflbuzz_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vflbuzz_vendordetails`
--
ALTER TABLE `vflbuzz_vendordetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
