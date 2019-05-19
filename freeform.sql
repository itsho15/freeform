-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 27, 2019 at 08:46 PM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freeform`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(2, NULL, 1, 'Category 2', 'category-2', '2019-04-21 03:42:30', '2019-04-21 03:42:30');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `contact_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_view` tinyint(4) NOT NULL DEFAULT '0',
  `contact_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `contact_name`, `contact_email`, `contact_subject`, `contact_message`, `contact_view`, `contact_type`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', '0', 'asdasd', 0, '﻿استفسار', '2019-04-25 12:10:05', '2019-04-25 12:10:05');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '{}', 2),
(31, 5, 'category_id', 'text', 'Category', 0, 0, 1, 1, 1, 0, '{}', 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 0, 0, 1, 1, 1, 1, '{}', 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 10),
(39, 5, 'status', 'rich_text_box', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, '{}', 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '{}', 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 3),
(48, 6, 'body', 'rich_text_box', 'Body', 0, 0, 1, 1, 1, 1, '{}', 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, '{}', 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'user_id', 'text', 'user id', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'payment_method', 'text', 'Payment Method', 1, 1, 1, 1, 1, 1, '{}', 3),
(59, 7, 'payment_id', 'text', 'Payment Id', 0, 0, 1, 1, 1, 1, '{}', 5),
(61, 7, 'status', 'text', 'Status', 1, 1, 1, 1, 1, 1, '{}', 9),
(62, 7, 'extra_days', 'text', 'Extra Days', 0, 0, 1, 1, 1, 1, '{}', 10),
(63, 7, 'total_paid', 'number', 'Total Paid', 0, 1, 1, 1, 1, 1, '{}', 11),
(64, 7, 'quantity', 'number', 'Quantity', 0, 1, 1, 1, 1, 1, '{}', 12),
(65, 7, 'ends_at', 'timestamp', 'Ends At', 0, 1, 1, 1, 1, 1, '{}', 15),
(66, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 17),
(67, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 18),
(68, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(69, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(70, 8, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\",\"forceUpdate\":true},\"validation\":{\"rule\":\"required|unique:plans,slug\"}}', 3),
(71, 8, 'price_per_day', 'number', 'Price Per Day', 1, 1, 1, 1, 1, 1, '{}', 5),
(72, 8, 'cost', 'number', 'Cost', 1, 1, 1, 1, 1, 1, '{}', 6),
(73, 8, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{}', 8),
(74, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(75, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(76, 8, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 4),
(77, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(78, 10, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(79, 10, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"100%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 4),
(80, 10, 'icon', 'text', 'Icon', 0, 1, 1, 1, 1, 1, '{}', 5),
(81, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(82, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(83, 10, 'parent_id', 'select_dropdown', 'Parent Id', 0, 1, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 8),
(84, 10, 'order', 'text', 'Order', 0, 1, 1, 1, 1, 1, '{}', 9),
(85, 10, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"unique:menucategories,slug\"}}', 3),
(86, 10, 'menucategory_belongsto_menucategory_relationship', 'relationship', 'parent', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\MenuCategory\",\"table\":\"menucategories\",\"type\":\"belongsTo\",\"column\":\"parent_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(87, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(88, 13, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(89, 13, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, '{}', 4),
(90, 13, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"100%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 5),
(92, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(93, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(94, 13, 'category_id', 'select_dropdown', 'Category Id', 0, 1, 1, 1, 1, 1, '{\"default\":\"\"}', 9),
(95, 13, 'menu_list_belongsto_menucategory_relationship', 'relationship', 'menu category', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Menucategory\",\"table\":\"menucategories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"menucategories\",\"pivot\":\"0\",\"taggable\":\"on\"}', 10),
(100, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(101, 17, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 2),
(102, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(103, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(104, 6, 'excerpt', 'rich_text_box', 'Excerpt', 0, 0, 1, 1, 1, 1, '{}', 4),
(105, 13, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{}', 3),
(106, 13, 'images', 'multiple_images', 'Images', 0, 0, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"100%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 11),
(107, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(108, 18, 'name', 'rich_text_box', 'Name', 1, 0, 1, 1, 1, 1, '{}', 2),
(109, 18, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"100%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"120\",\"height\":\"100\"}}]}', 3),
(110, 18, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 4),
(111, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(112, 13, 'desc', 'rich_text_box', 'Desc', 0, 0, 1, 1, 1, 1, '{}', 6),
(113, 8, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '{\"default\":\"monthly\",\"options\":{\"weekly\":\"Weekly\",\"monthly\":\"Monthly\",\"yearly\":\"Yearly\"}}', 7),
(114, 7, 'username', 'text', 'Username', 0, 1, 1, 1, 1, 1, '{}', 4),
(115, 7, 'user_email', 'text', 'User Email', 0, 0, 1, 1, 1, 1, '{}', 6),
(116, 7, 'image', 'image', 'Copy of receipt', 0, 1, 1, 1, 1, 1, '{}', 13),
(117, 7, 'payment_date', 'timestamp', 'Payment Date', 0, 0, 1, 1, 1, 1, '{}', 16),
(118, 7, 'plan_type', 'select_dropdown', 'Plan Type', 1, 1, 1, 1, 1, 1, '{\"default\":\"monthly\",\"options\":{\"weekly\":\"Weekly\",\"monthly\":\"Monthly\",\"yearly\":\"Yearly\"}}', 19),
(119, 7, 'subscription_belongsto_user_relationship', 'relationship', 'customer email address', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(120, 7, 'subscription_belongsto_plan_relationship', 'relationship', 'plans', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Plan\",\"table\":\"plans\",\"type\":\"belongsTo\",\"column\":\"plan_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(121, 7, 'plan_id', 'text', 'Plan Id', 1, 1, 1, 1, 1, 1, '{}', 7),
(122, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(123, 19, 'contact_name', 'text', 'Contact Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(124, 19, 'contact_email', 'text', 'Contact Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(125, 19, 'contact_subject', 'hidden', 'Contact Subject', 1, 0, 0, 0, 0, 0, '{}', 4),
(126, 19, 'contact_message', 'text_area', 'Contact Message', 1, 1, 1, 1, 1, 1, '{}', 5),
(127, 19, 'contact_view', 'hidden', 'Contact View', 1, 0, 0, 0, 0, 0, '{}', 6),
(128, 19, 'contact_type', 'select_dropdown', 'Contact Type', 1, 1, 1, 1, 1, 1, '{}', 7),
(129, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(130, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(131, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(132, 20, 'content', 'rich_text_box', 'Content', 0, 1, 1, 1, 1, 1, '{}', 3),
(133, 20, 'link', 'text', 'Link', 0, 1, 1, 1, 1, 1, '{}', 6),
(134, 20, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
(135, 20, 'exerpet', 'rich_text_box', 'Exerpet', 0, 1, 1, 1, 1, 1, '{}', 4),
(136, 20, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(137, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(138, 20, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 5);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-04-21 03:41:27', '2019-04-21 03:41:27'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-04-21 03:41:27', '2019-04-21 03:41:27'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-04-21 03:41:27', '2019-04-21 03:41:27'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-04-21 03:42:30', '2019-04-22 20:17:42'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'App\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-04-21 03:42:30', '2019-04-25 11:58:37'),
(7, 'subscriptions', 'subscriptions', 'Subscription', 'Subscriptions', NULL, 'App\\Subscriptions', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-04-21 03:45:12', '2019-04-27 17:06:41'),
(8, 'plans', 'plans', 'Plan', 'Plans', NULL, 'App\\Plan', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-04-21 03:45:55', '2019-04-26 15:35:21'),
(10, 'menucategories', 'menucategories', 'Menucategory', 'Menucategories', NULL, 'App\\MenuCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-04-24 14:02:19', '2019-04-25 16:58:10'),
(13, 'menu_lists', 'menu-lists', 'Menu List', 'Menu Lists', NULL, 'App\\MenuList', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-04-24 14:10:13', '2019-04-25 17:53:12'),
(17, 'newsletters', 'newsletters', 'Newsletter', 'Newsletters', NULL, 'App\\Newsletter', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-04-25 10:19:03', '2019-04-25 10:19:03'),
(18, 'services', 'services', 'Service', 'Services', NULL, 'App\\Service', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-04-25 17:12:27', '2019-04-25 17:31:15'),
(19, 'contacts', 'contacts', 'Contact', 'Contacts', NULL, 'App\\Contact', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-04-27 17:37:50', '2019-04-27 17:39:32'),
(20, 'sliders', 'sliders', 'Slider', 'Sliders', NULL, 'App\\Slider', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-04-27 17:40:48', '2019-04-27 17:41:42');

-- --------------------------------------------------------

--
-- Table structure for table `menucategories`
--

DROP TABLE IF EXISTS `menucategories`;
CREATE TABLE IF NOT EXISTS `menucategories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) DEFAULT '1',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menucategories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menucategories`
--

INSERT INTO `menucategories` (`id`, `name`, `image`, `icon`, `created_at`, `updated_at`, `parent_id`, `order`, `slug`) VALUES
(12, 'main category 1', 'menucategories\\April2019\\o6QXdoGPci3jvtD7TBP4.jpg', 'Cillum consequuntur', '2019-04-25 18:10:00', '2019-04-25 18:12:33', NULL, 1, 'main category1'),
(13, 'main category 2', 'menucategories\\April2019\\TQdNMsVtSTIQgSE8quig.jpg', 'Id dicta fugiat ex', '2019-04-25 18:10:00', '2019-04-25 18:13:52', NULL, 2, 'main category 2'),
(14, 'main category 3', 'menucategories\\April2019\\gLL6PUUAXANqjmROW1zN.jpg', 'Non facilis eos quo', '2019-04-25 18:11:00', '2019-04-25 18:20:21', NULL, 3, 'main category 3'),
(15, 'main category 4', 'menucategories\\April2019\\vaMX5KSLITT19wBAqP3E.jpg', NULL, '2019-04-25 18:11:00', '2019-04-25 18:20:08', NULL, NULL, 'main category 4'),
(16, 'main category 5', 'menucategories\\April2019\\uFBMjTUy38X6AaCQfY0T.jpg', 'Sequi tempora sed a', '2019-04-25 18:11:00', '2019-04-25 18:12:25', NULL, 5, 'main category 5'),
(17, 'sub category 1', 'menucategories\\April2019\\63mCE18xcGBb4IEeXogm.png', NULL, '2019-04-25 18:13:00', '2019-04-25 18:19:57', 12, 1, 'sub category 1'),
(18, 'sub category 2', 'menucategories\\April2019\\liSHZLZ3KNeB4j9BOJWc.png', NULL, '2019-04-25 18:13:00', '2019-04-25 18:19:47', 13, NULL, 'sub category 2'),
(19, 'اسم الوجبة', 'menucategories\\April2019\\dej4d7oDQdURn5cjkhVx.jpg', 'Quis sint ad minim', '2019-04-25 18:16:00', '2019-04-27 15:07:28', 18, 1, 'slug-menu1');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(2, 'site', '2019-04-21 07:11:39', '2019-04-21 07:11:39');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'الرئيسية', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2019-04-21 03:41:28', '2019-04-21 04:43:33', 'voyager.dashboard', 'null'),
(2, 1, 'مكتبة الصور', '', '_self', 'voyager-images', '#000000', NULL, 4, '2019-04-21 03:41:28', '2019-04-24 14:11:08', 'voyager.media.index', 'null'),
(3, 1, 'الاعضاء', '', '_self', 'voyager-person', '#000000', NULL, 3, '2019-04-21 03:41:28', '2019-04-21 04:44:01', 'voyager.users.index', 'null'),
(4, 1, 'الصلاحيات', '', '_self', 'voyager-lock', '#000000', NULL, 2, '2019-04-21 03:41:28', '2019-04-21 04:43:51', 'voyager.roles.index', 'null'),
(5, 1, 'الادوات', '', '_self', 'voyager-tools', '#000000', NULL, 8, '2019-04-21 03:41:28', '2019-04-24 14:11:08', NULL, ''),
(6, 1, 'بناء القائمة', '', '_self', 'voyager-list', '#000000', 5, 1, '2019-04-21 03:41:28', '2019-04-24 14:11:08', 'voyager.menus.index', 'null'),
(7, 1, 'داتابيز', '', '_self', 'voyager-data', '#000000', 5, 2, '2019-04-21 03:41:28', '2019-04-24 14:11:08', 'voyager.database.index', 'null'),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-04-21 03:41:28', '2019-04-24 14:11:08', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-04-21 03:41:28', '2019-04-24 14:11:08', 'voyager.bread.index', NULL),
(10, 1, 'الاعدادات', '', '_self', 'voyager-settings', '#000000', NULL, 9, '2019-04-21 03:41:28', '2019-04-24 14:11:08', 'voyager.settings.index', 'null'),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-04-21 03:41:28', '2019-04-24 14:11:08', 'voyager.hooks', NULL),
(12, 1, 'الاقسام', '', '_self', 'voyager-categories', '#000000', NULL, 7, '2019-04-21 03:42:30', '2019-04-24 14:11:08', 'voyager.categories.index', 'null'),
(13, 1, 'المقالات', '', '_self', 'voyager-news', '#000000', NULL, 5, '2019-04-21 03:42:30', '2019-04-24 14:11:08', 'voyager.posts.index', 'null'),
(14, 1, 'الصفحات', '', '_self', 'voyager-file-text', '#000000', NULL, 6, '2019-04-21 03:42:30', '2019-04-24 14:11:08', 'voyager.pages.index', 'null'),
(15, 1, 'الاشتراكات', '', '_self', 'voyager-thumbs-up', '#000000', NULL, 14, '2019-04-21 03:45:12', '2019-04-26 17:20:50', 'voyager.subscriptions.index', 'null'),
(16, 1, 'خطط الاسعار', '', '_self', 'voyager-company', '#000000', NULL, 10, '2019-04-21 03:45:55', '2019-04-26 16:39:41', 'voyager.plans.index', 'null'),
(17, 1, 'اقسام الوجبات', '', '_self', NULL, '#000000', 19, 1, '2019-04-24 14:02:19', '2019-04-26 16:37:49', 'voyager.menucategories.index', 'null'),
(18, 1, 'الوجبات', '', '_self', NULL, '#000000', 19, 2, '2019-04-24 14:10:13', '2019-04-26 16:37:17', 'voyager.menu-lists.index', 'null'),
(19, 1, 'الوجبات', '#', '_self', 'voyager-pizza', '#000000', NULL, 11, '2019-04-24 14:11:03', '2019-04-26 16:41:21', NULL, ''),
(23, 1, 'النشرة الاخبارية', '', '_self', 'voyager-mail', '#000000', NULL, 12, '2019-04-25 10:19:03', '2019-04-26 17:20:10', 'voyager.newsletters.index', 'null'),
(24, 1, 'الخدمات في الصفحه الرئيسية', '', '_self', 'voyager-fire', '#000000', NULL, 13, '2019-04-25 17:12:27', '2019-04-26 17:20:35', 'voyager.services.index', 'null'),
(25, 2, 'الرئيسية', '/', '_self', 'fa fa-home', '#000000', NULL, 1, '2019-04-27 14:37:45', '2019-04-27 15:08:24', NULL, ''),
(26, 2, 'من نحن', '/pages/aboutus', '_self', NULL, '#000000', NULL, 2, '2019-04-27 14:52:28', '2019-04-27 15:08:24', NULL, ''),
(27, 2, 'خطط الاسعار', '', '_self', NULL, '#000000', NULL, 3, '2019-04-27 15:01:12', '2019-04-27 15:08:24', 'plans.index', NULL),
(28, 2, 'اقسام الوجبات', '/categories-menu', '_self', 'fa fa-cutlery', '#000000', NULL, 4, '2019-04-27 15:02:54', '2019-04-27 15:08:24', NULL, ''),
(29, 2, 'اسم وجبه 1', '/categories-menu/slug-menu1', '_self', 'fa fa-cutlery', '#000000', 30, 1, '2019-04-27 15:05:48', '2019-04-27 15:21:26', NULL, ''),
(30, 2, 'دينامك', '/', '_self', 'fa fa-cutlery', '#000000', NULL, 5, '2019-04-27 15:21:16', '2019-04-27 15:34:21', NULL, ''),
(31, 1, 'Contacts', '', '_self', 'voyager-mail', '#000000', NULL, 15, '2019-04-27 17:37:50', '2019-04-27 17:38:48', 'voyager.contacts.index', 'null'),
(32, 1, 'Sliders', '', '_self', NULL, NULL, NULL, 16, '2019-04-27 17:40:48', '2019-04-27 17:40:48', 'voyager.sliders.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_lists`
--

DROP TABLE IF EXISTS `menu_lists`;
CREATE TABLE IF NOT EXISTS `menu_lists` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `desc` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_lists`
--

INSERT INTO `menu_lists` (`id`, `name`, `price`, `image`, `slug`, `created_at`, `updated_at`, `category_id`, `images`, `desc`) VALUES
(1, 'اسم الوجبه', '376', 'menu-lists\\April2019\\uJcWBGPwL7sWG31qhZw7.jpg', 'Sit ut maxime ut non', '2019-04-24 14:13:00', '2019-04-25 13:21:27', 2, NULL, NULL),
(2, 'Chandler Wade', '492', 'menu-lists\\April2019\\3CdUBA3EX0uGmUiI5eDD.jpg', 'Chandler Wade', '2019-04-25 13:06:00', '2019-04-25 13:16:11', 2, NULL, NULL),
(3, 'asdasdasd', '426', 'menu-lists\\April2019\\JGGct6hQvjNUN6KfzBm5.jpg', 'Et ea qui mollitia v', '2019-04-25 13:26:00', '2019-04-25 13:26:19', 2, '[\"menu-lists\\\\April2019\\\\dbiZKtOl3HluGqK97FNb.png\", \"menu-lists\\\\April2019\\\\e0EhSaAj1PZ9Nq0d7Ew1.jpg\", \"menu-lists\\\\April2019\\\\OR9yux2NNBj32uNQifAI.png\"]', NULL),
(4, '', '656', 'menu-lists\\April2019\\JZPJBRl5O7wNQ9vfGk9T.jpg', 'Ut excepturi non neq', '2019-04-25 13:56:54', '2019-04-25 13:56:54', 3, '[\"menu-lists\\\\April2019\\\\nZwI5RZkC3nfK3IriZhM.png\", \"menu-lists\\\\April2019\\\\Qmq7aJ30QJjxU3PCHC4G.jpg\", \"menu-lists\\\\April2019\\\\0NlPONu7V4foCr0ynSTB.png\"]', NULL),
(5, 'Jillian Blackburn', '210', 'menu-lists\\April2019\\Eh6uRnFT8eDIpNcc9rRH.jpg', 'Id dolor sed sapient', '2019-04-25 13:58:00', '2019-04-25 18:18:21', 17, '[\"menu-lists\\\\April2019\\\\PeeJcgcaYNgfgsiv8Ym7.png\", \"menu-lists\\\\April2019\\\\arggqHBIQ5Nz5DWTj3oJ.png\", \"menu-lists\\\\April2019\\\\q0rBcM1DBBFLQeN2XREe.jpg\", \"menu-lists\\\\April2019\\\\FCBBrI1Hz4LmYRyboT6L.png\"]', '<h3 style=\"direction: rtl;\">عنوان الوجبة</h3>\n<p style=\"direction: rtl;\">هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع القارئ عن التركيز على الشكل الخارجي للنص .هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع القارئ عن التركيز على الشكل الخارجي للنص</p>\n<ul>\n<li style=\"direction: rtl;\"><strong>مكون الخلطة</strong>&nbsp;هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</li>\n<li style=\"direction: rtl;\"><strong>مكون الخلطة</strong>&nbsp;هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</li>\n<li style=\"direction: rtl;\"><strong>مكون الخلطة</strong>&nbsp;هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</li>\n<li style=\"direction: rtl;\"><strong>مكون الخلطة</strong>&nbsp;هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</li>\n</ul>'),
(6, 'Lois Taylor', '997', 'menu-lists\\April2019\\8wQoqC6lfUEzF3jLxqaC.jpg', 'Proident ipsum dolo', '2019-04-25 14:14:00', '2019-04-25 18:16:54', 17, '[\"menu-lists\\\\April2019\\\\bgf9jdeUSaa92XAmTnJ8.jpg\", \"menu-lists\\\\April2019\\\\jWZWSlQRDms8xcMmfbjc.png\", \"menu-lists\\\\April2019\\\\wgbQxeJGKpEWEAdKYEmJ.png\", \"menu-lists\\\\April2019\\\\VzlI4ayM120e8D8fEy2y.jpg\", \"menu-lists\\\\April2019\\\\81UFRrPowy2UqW2yqWwS.png\", \"menu-lists\\\\April2019\\\\OVgtaYWS3Rn9aIP9087t.png\", \"menu-lists\\\\April2019\\\\B6z1o1pOh8I2Gg6bzvuM.png\"]', '<h3 style=\"direction: rtl;\">عنوان الوجبة</h3>\n<p style=\"direction: rtl;\">هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع القارئ عن التركيز على الشكل الخارجي للنص .هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع القارئ عن التركيز على الشكل الخارجي للنص</p>\n<ul>\n<li style=\"direction: rtl;\"><strong>مكون الخلطة</strong> هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</li>\n<li style=\"direction: rtl;\"><strong>مكون الخلطة</strong> هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</li>\n<li style=\"direction: rtl;\"><strong>مكون الخلطة</strong> هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</li>\n<li style=\"direction: rtl;\"><strong>مكون الخلطة</strong> هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</li>\n</ul>');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2018_12_03_161058_create_subscriptions_table', 1),
(28, '2018_12_03_163045_create_plans_table', 1),
(29, '2018_12_27_064530_create_menu_lists_table', 2),
(30, '2018_12_27_064530_create_menucategories_table', 2),
(32, '2019_04_25_120059_create_news_letters_table', 3),
(33, '2018_02_19_194524_create_contacts_table', 4),
(34, '2019_04_25_190522_create_services_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
CREATE TABLE IF NOT EXISTS `newsletters` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'myhishamad2@gmail.com', '2019-04-25 10:12:21', '2019-04-25 10:12:21');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `body`, `excerpt`, `image`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'من نحن', '<div class=\"ab-top col-xs-12\">\n<div class=\"block col-md-6 col-xs-12\">\n<h3>رؤيتنا</h3>\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل القارئ عن التركيز على الشكل الخارجي للنص . أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها .</p>\n</div>\n<div class=\"block col-md-6 col-xs-12\">\n<h3>أهدافنا</h3>\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل القارئ عن التركيز على الشكل الخارجي للنص . أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها .</p>\n</div>\n</div>\n<div class=\"ab-bottom col-xs-12\">\n<div class=\"g-head col-xs-12\">\n<h3>تاريخنا</h3>\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها ، هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز .</p>\n</div>\n<div class=\"g-body col-xs-12\">\n<div class=\"body-icon col-xs-12\">\n<div class=\"icon\" style=\"background-image: url(\'images/cal.png\');\">&nbsp;</div>\n</div>\n<div class=\"body-items col-xs-12\">\n<div class=\"item col-xs-12\">\n<div class=\"date-i\">2018</div>\n<div class=\"hist-body\">\n<div class=\"i-inner\">\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها ، هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل . المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها</p>\n01</div>\n<div class=\"i-inner\">\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها ، هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل . المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها</p>\n02</div>\n</div>\n</div>\n<div class=\"item col-xs-12\">\n<div class=\"date-i\">2017</div>\n<div class=\"hist-body\">\n<div class=\"i-inner\">\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها ، هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل . المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها</p>\n01</div>\n</div>\n</div>\n<div class=\"item col-xs-12\">\n<div class=\"date-i\">2016</div>\n<div class=\"hist-body\">\n<div class=\"i-inner\">\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها ، هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل . المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها</p>\n01</div>\n</div>\n</div>\n</div>\n</div>\n</div>', '<h3 style=\"box-sizing: border-box; font-family: bahijbold; font-weight: 500; line-height: 1.1; color: #333333; margin-top: 20px; margin-bottom: 30px; font-size: 25px; transition: all 0.3s linear 0s; background-color: #fbfbfb;\">من نحن</h3>\n<p style=\"box-sizing: border-box; margin: 0px 0px 30px; font-family: bahijPlain; transition: all 0.3s linear 0s; color: #4c4c4c; font-size: 15px; line-height: 2; background-color: #fbfbfb;\">هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع القارئ عن التركيز على الشكل الخارجي للنص .</p>\n<p style=\"box-sizing: border-box; margin: 0px; font-family: bahijPlain; transition: all 0.3s linear 0s; color: #4c4c4c; font-size: 15px; line-height: 2; background-color: #fbfbfb;\">هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع القارئ عن التركيز على الشكل الخارجي للنص .</p>', 'pages/page1.jpg', 'aboutus', 'ACTIVE', '2019-04-21 03:42:31', '2019-04-25 12:00:19'),
(2, 'تواصل معنا', '<h3>تواصل معنا</h3>\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها ، هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل . المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها</p>', NULL, 'pages\\April2019\\Ciw82w11lazcO9Zsr9E3.jpg', 'contactus', 'ACTIVE', '2019-04-25 10:40:26', '2019-04-25 10:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(2, 'browse_bread', NULL, '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(3, 'browse_database', NULL, '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(4, 'browse_media', NULL, '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(5, 'browse_compass', NULL, '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(6, 'browse_menus', 'menus', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(7, 'read_menus', 'menus', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(8, 'edit_menus', 'menus', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(9, 'add_menus', 'menus', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(10, 'delete_menus', 'menus', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(11, 'browse_roles', 'roles', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(12, 'read_roles', 'roles', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(13, 'edit_roles', 'roles', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(14, 'add_roles', 'roles', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(15, 'delete_roles', 'roles', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(16, 'browse_users', 'users', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(17, 'read_users', 'users', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(18, 'edit_users', 'users', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(19, 'add_users', 'users', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(20, 'delete_users', 'users', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(21, 'browse_settings', 'settings', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(22, 'read_settings', 'settings', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(23, 'edit_settings', 'settings', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(24, 'add_settings', 'settings', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(25, 'delete_settings', 'settings', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(26, 'browse_hooks', NULL, '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(27, 'browse_categories', 'categories', '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(28, 'read_categories', 'categories', '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(29, 'edit_categories', 'categories', '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(30, 'add_categories', 'categories', '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(31, 'delete_categories', 'categories', '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(32, 'browse_posts', 'posts', '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(33, 'read_posts', 'posts', '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(34, 'edit_posts', 'posts', '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(35, 'add_posts', 'posts', '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(36, 'delete_posts', 'posts', '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(37, 'browse_pages', 'pages', '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(38, 'read_pages', 'pages', '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(39, 'edit_pages', 'pages', '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(40, 'add_pages', 'pages', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(41, 'delete_pages', 'pages', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(42, 'browse_subscriptions', 'subscriptions', '2019-04-21 03:45:12', '2019-04-21 03:45:12'),
(43, 'read_subscriptions', 'subscriptions', '2019-04-21 03:45:12', '2019-04-21 03:45:12'),
(44, 'edit_subscriptions', 'subscriptions', '2019-04-21 03:45:12', '2019-04-21 03:45:12'),
(45, 'add_subscriptions', 'subscriptions', '2019-04-21 03:45:12', '2019-04-21 03:45:12'),
(46, 'delete_subscriptions', 'subscriptions', '2019-04-21 03:45:12', '2019-04-21 03:45:12'),
(47, 'browse_plans', 'plans', '2019-04-21 03:45:55', '2019-04-21 03:45:55'),
(48, 'read_plans', 'plans', '2019-04-21 03:45:55', '2019-04-21 03:45:55'),
(49, 'edit_plans', 'plans', '2019-04-21 03:45:55', '2019-04-21 03:45:55'),
(50, 'add_plans', 'plans', '2019-04-21 03:45:55', '2019-04-21 03:45:55'),
(51, 'delete_plans', 'plans', '2019-04-21 03:45:55', '2019-04-21 03:45:55'),
(52, 'browse_menucategories', 'menucategories', '2019-04-24 14:02:19', '2019-04-24 14:02:19'),
(53, 'read_menucategories', 'menucategories', '2019-04-24 14:02:19', '2019-04-24 14:02:19'),
(54, 'edit_menucategories', 'menucategories', '2019-04-24 14:02:19', '2019-04-24 14:02:19'),
(55, 'add_menucategories', 'menucategories', '2019-04-24 14:02:19', '2019-04-24 14:02:19'),
(56, 'delete_menucategories', 'menucategories', '2019-04-24 14:02:19', '2019-04-24 14:02:19'),
(57, 'browse_menu_lists', 'menu_lists', '2019-04-24 14:10:13', '2019-04-24 14:10:13'),
(58, 'read_menu_lists', 'menu_lists', '2019-04-24 14:10:13', '2019-04-24 14:10:13'),
(59, 'edit_menu_lists', 'menu_lists', '2019-04-24 14:10:13', '2019-04-24 14:10:13'),
(60, 'add_menu_lists', 'menu_lists', '2019-04-24 14:10:13', '2019-04-24 14:10:13'),
(61, 'delete_menu_lists', 'menu_lists', '2019-04-24 14:10:13', '2019-04-24 14:10:13'),
(77, 'browse_newsletters', 'newsletters', '2019-04-25 10:19:03', '2019-04-25 10:19:03'),
(78, 'read_newsletters', 'newsletters', '2019-04-25 10:19:03', '2019-04-25 10:19:03'),
(79, 'edit_newsletters', 'newsletters', '2019-04-25 10:19:03', '2019-04-25 10:19:03'),
(80, 'add_newsletters', 'newsletters', '2019-04-25 10:19:03', '2019-04-25 10:19:03'),
(81, 'delete_newsletters', 'newsletters', '2019-04-25 10:19:03', '2019-04-25 10:19:03'),
(82, 'browse_services', 'services', '2019-04-25 17:12:27', '2019-04-25 17:12:27'),
(83, 'read_services', 'services', '2019-04-25 17:12:27', '2019-04-25 17:12:27'),
(84, 'edit_services', 'services', '2019-04-25 17:12:27', '2019-04-25 17:12:27'),
(85, 'add_services', 'services', '2019-04-25 17:12:27', '2019-04-25 17:12:27'),
(86, 'delete_services', 'services', '2019-04-25 17:12:27', '2019-04-25 17:12:27'),
(87, 'browse_contacts', 'contacts', '2019-04-27 17:37:50', '2019-04-27 17:37:50'),
(88, 'read_contacts', 'contacts', '2019-04-27 17:37:50', '2019-04-27 17:37:50'),
(89, 'edit_contacts', 'contacts', '2019-04-27 17:37:50', '2019-04-27 17:37:50'),
(90, 'add_contacts', 'contacts', '2019-04-27 17:37:50', '2019-04-27 17:37:50'),
(91, 'delete_contacts', 'contacts', '2019-04-27 17:37:50', '2019-04-27 17:37:50'),
(92, 'browse_sliders', 'sliders', '2019-04-27 17:40:48', '2019-04-27 17:40:48'),
(93, 'read_sliders', 'sliders', '2019-04-27 17:40:48', '2019-04-27 17:40:48'),
(94, 'edit_sliders', 'sliders', '2019-04-27 17:40:48', '2019-04-27 17:40:48'),
(95, 'add_sliders', 'sliders', '2019-04-27 17:40:48', '2019-04-27 17:40:48'),
(96, 'delete_sliders', 'sliders', '2019-04-27 17:40:48', '2019-04-27 17:40:48');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 1),
(6, 3),
(7, 1),
(7, 3),
(8, 1),
(8, 3),
(9, 1),
(9, 3),
(10, 1),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 1),
(16, 3),
(17, 1),
(17, 3),
(18, 1),
(18, 3),
(19, 1),
(19, 3),
(20, 1),
(20, 3),
(21, 1),
(21, 3),
(22, 1),
(22, 3),
(23, 1),
(23, 3),
(24, 1),
(24, 3),
(25, 1),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 1),
(37, 3),
(38, 1),
(38, 3),
(39, 1),
(39, 3),
(40, 1),
(40, 3),
(41, 1),
(41, 3),
(42, 1),
(42, 3),
(43, 1),
(43, 3),
(44, 1),
(44, 3),
(45, 1),
(45, 3),
(46, 1),
(46, 3),
(47, 1),
(47, 3),
(48, 1),
(48, 3),
(49, 1),
(49, 3),
(50, 1),
(50, 3),
(51, 1),
(51, 3),
(52, 1),
(52, 3),
(53, 1),
(53, 3),
(54, 1),
(54, 3),
(55, 1),
(55, 3),
(56, 1),
(56, 3),
(57, 1),
(57, 3),
(58, 1),
(58, 3),
(59, 1),
(59, 3),
(60, 1),
(60, 3),
(61, 1),
(61, 3),
(77, 1),
(77, 3),
(78, 1),
(78, 3),
(79, 1),
(79, 3),
(80, 1),
(80, 3),
(81, 1),
(81, 3),
(82, 1),
(82, 3),
(83, 1),
(83, 3),
(84, 1),
(84, 3),
(85, 1),
(85, 3),
(86, 1),
(86, 3),
(87, 1),
(87, 3),
(88, 1),
(88, 3),
(89, 1),
(89, 3),
(90, 1),
(90, 3),
(91, 1),
(91, 3),
(92, 1),
(92, 3),
(93, 1),
(93, 3),
(94, 1),
(94, 3),
(95, 1),
(95, 3),
(96, 1),
(96, 3);

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
CREATE TABLE IF NOT EXISTS `plans` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_per_day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(8,2) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('monthly','yearly','weekly') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plans_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `slug`, `price_per_day`, `cost`, `description`, `created_at`, `updated_at`, `image`, `type`) VALUES
(2, 'نظام الوجبتين', 'nzam-alwjbtyn', '30', 380.00, '<ul>\n<li>إختيار وجبة فطار</li>\n<li>إختيار وجبة غداء</li>\n</ul>', '2019-04-21 05:06:00', '2019-04-24 14:35:21', 'plans\\April2019\\kUxfjxDufVQkYw2n9Gga.png', 'monthly'),
(10, 'Tatum Rogersssasas', 'tatum-rogersssasas', '925', 76.00, '', '2019-04-24 14:30:00', '2019-04-25 18:33:00', 'plans\\April2019\\dnHalsYtNlBh9rgcFN9O.png', 'monthly'),
(11, 'Joel Weiss', 'Officia numquam volu', '919', 52.00, '', '2019-04-26 15:35:00', '2019-04-27 15:59:00', 'plans\\April2019\\VtsD059JqvQv64dHjkxI.png', 'weekly'),
(12, 'Finn Johnson', 'Qui enim suscipit qu', '169', 68.00, '', '2019-04-26 15:57:15', '2019-04-26 15:57:15', NULL, 'yearly'),
(13, 'Gillian Potts', 'Do quia et laboris v', '420', 69.00, '', '2019-04-26 16:28:00', '2019-04-27 15:58:50', 'plans\\April2019\\DZFl5azYAi01LhB59y5E.png', 'weekly');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-21 03:42:30', '2019-04-21 03:42:30'),
(5, 1, 2, 'Maxime non officia e', 'Est neque veniam cu', 'Quibusdam nulla id e', '', NULL, 'Voluptatibus ad enim', 'Expedita ipsam in co', 'Quia ad in esse rer', 'PENDING', 0, '2019-04-22 20:18:00', '2019-04-22 20:18:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(2, 'user', 'Normal User', '2019-04-21 03:41:28', '2019-04-21 03:41:28'),
(3, 'developer', 'Developer', '2019-04-26 17:22:11', '2019-04-26 17:22:11');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, '<p>إشترك في<br />النظام الأنسب</p>', 'services\\April2019\\kxVw1b255Nb4owl6uXtS.png', '2019-04-25 17:14:00', '2019-04-25 17:31:52'),
(2, '<p>إشترك في<br />النظام الأنسب</p>', 'services\\April2019\\cNuXnfokO0KtO9PRtrAM.jpg', '2019-04-25 17:24:00', '2019-04-25 17:32:05'),
(3, '<p>إشترك في<br />النظام الأنسب</p>', 'services\\April2019\\yYpe0kvta4TS3mToBuIJ.png', '2019-04-25 17:24:00', '2019-04-25 17:32:27');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\April2019\\DQVNF2KqZvH49q8PWpIa.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\April2019\\cm78A5JRGqfmqHdz0o2D.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Free Form', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Free form. Admin panel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\April2019\\9xS44Tw3NE7jhmNzJaO8.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(14, 'homepage.services', 'services', '<p><span class=\"wow fadeIn\">know how ?</span></p>\r\n<h1 class=\"wow fadeInDown\">Your steps to seek healthy food have made the difficult equation!</h1>\r\n<p class=\"wow fadeInUp\">There is a long-established fact that the readable content of a page will distract the reader from focusing on the outer shape of the text or the form of paragraphs on the page he reads</p>', NULL, 'rich_text_box', 8, 'homepage'),
(15, 'homepage.services_ar', 'services ar', '<p><span class=\"wow fadeIn\">أعرف كيف ؟</span></p>\r\n<h1 class=\"wow fadeInDown\">خطواتك لطلب طعام صحي حقق المعادلة الصعبة !</h1>\r\n<p class=\"wow fadeInUp\">هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها</p>', NULL, 'rich_text_box', 9, 'homepage'),
(16, 'homepage.subscription_content_ar', 'subscription content home ar', '<p><span class=\"wow fadeIn\">أعرف كيف ؟</span></p>\r\n<h1 class=\"wow fadeInDown\">خطواتك لطلب طعام صحي حقق المعادلة الصعبة !</h1>\r\n<p class=\"wow fadeInUp\">هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها</p>', NULL, 'rich_text_box', 10, 'homepage'),
(17, 'homepage.subscription_content', 'subscription content home en', '<p><span class=\"wow fadeIn\">know how ?</span></p>\r\n<h1 class=\"wow fadeInDown\">Your steps to seek healthy food have made the difficult equation!</h1>\r\n<p class=\"wow fadeInUp\">There is a long-established fact that the readable content of a page will distract the reader from focusing on the outer shape of the text or the form of paragraphs on the page he reads</p>', NULL, 'rich_text_box', 11, 'homepage'),
(18, 'site.keywords', 'keywords', NULL, NULL, 'text_area', 12, 'Site'),
(19, 'site.favicon', 'favicon', 'settings\\April2019\\yvyTHTxixPs3saTpvBMd.png', NULL, 'image', 13, 'Site'),
(20, 'site.phone', 'phone', '(+965) 567891234', NULL, 'text', 14, 'Site'),
(21, 'site.address', 'address', 'site adderss', NULL, 'text', 15, 'Site'),
(22, 'site.email', 'email', 'freeform.mail.com', NULL, 'text', 16, 'Site'),
(23, 'social.facebook', 'facebook link', NULL, NULL, 'text', 17, 'social'),
(24, 'social.twitter', 'twitter link', NULL, NULL, 'text', 18, 'social'),
(25, 'social.google', 'google link', NULL, NULL, 'text', 19, 'social');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exerpet` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `content`, `link`, `title`, `exerpet`, `created_at`, `updated_at`, `image`) VALUES
(1, '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها للنص أو شكل توضع الفقرات ..</p>', '/pages/contactus', 'مرحباً بك فري فروم ثقتك بنا تجعلنا الأفضل دائما !', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها للنص أو شكل توضع الفقرات ..</p>', '2019-04-27 17:46:00', '2019-04-27 17:47:02', 'sliders\\April2019\\pkcMnpaGDgzICk7l8BjD.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` timestamp NULL DEFAULT NULL,
  `extra_days` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_type` enum('monthly','yearly','weekly') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `total_paid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `username`, `user_email`, `payment_method`, `payment_id`, `plan_id`, `status`, `image`, `payment_date`, `extra_days`, `plan_type`, `total_paid`, `quantity`, `ends_at`, `created_at`, `updated_at`) VALUES
(10, 1, 'lexex', 'byreqylu@mailinator.com', 'cash', NULL, '2', 'paid', 'cashpayment/Yq9Cyutes4qvvvBb86olpfE77bBhhu5Lt7M4Kgef.png', '1972-01-24 22:00:00', NULL, 'monthly', NULL, NULL, '2019-05-27 17:01:06', '2019-04-27 16:58:26', '2019-04-27 17:01:06'),
(11, 1, 'pymutinod', 'pusal@mailinator.com', 'cash', NULL, '13', 'paid', 'cashpayment/vzqSkWtBy7kS3LMSB02nitaj4l7hfLBCxBl08lkE.png', '1988-04-05 22:00:00', NULL, 'weekly', NULL, NULL, '2019-05-27 17:01:06', '2019-04-27 17:00:51', '2019-04-27 17:01:06'),
(12, 8, NULL, NULL, 'paypal', 'PAYID-LTCKQ3Q19A56023X7125470A', '10', 'paid', NULL, NULL, '4', 'monthly', 45312, 12, '2020-04-27 17:09:50', '2019-04-27 17:09:50', '2019-04-27 17:09:50');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(22, 'menu_items', 'title', 13, 'pt', 'Publicações', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(24, 'menu_items', 'title', 12, 'pt', 'Categorias', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(25, 'menu_items', 'title', 14, 'pt', 'Páginas', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-04-21 03:42:31', '2019-04-21 03:42:31'),
(31, 'menu_items', 'title', 1, 'en', 'Dashboard', '2019-04-21 04:43:33', '2019-04-21 04:43:33'),
(32, 'menu_items', 'title', 4, 'en', 'Roles', '2019-04-21 04:43:51', '2019-04-21 04:43:51'),
(33, 'menu_items', 'title', 3, 'en', 'Users', '2019-04-21 04:44:01', '2019-04-21 04:44:01'),
(34, 'menu_items', 'title', 2, 'en', 'Media', '2019-04-21 04:44:09', '2019-04-21 04:44:09'),
(35, 'menu_items', 'title', 13, 'en', 'Posts', '2019-04-21 04:44:18', '2019-04-21 04:44:18'),
(36, 'menu_items', 'title', 14, 'en', 'Pages', '2019-04-21 04:44:24', '2019-04-21 04:44:24'),
(37, 'menu_items', 'title', 12, 'en', 'Categories', '2019-04-21 04:44:33', '2019-04-21 04:44:33'),
(38, 'menu_items', 'title', 5, 'en', 'Tools', '2019-04-21 04:44:41', '2019-04-21 04:44:41'),
(39, 'menu_items', 'title', 6, 'en', 'Menu Builder', '2019-04-21 04:44:53', '2019-04-21 04:44:53'),
(40, 'menu_items', 'title', 7, 'en', 'Database', '2019-04-21 04:45:02', '2019-04-21 04:45:02'),
(41, 'menu_items', 'title', 10, 'en', 'Settings', '2019-04-21 04:45:17', '2019-04-21 04:45:17'),
(42, 'menu_items', 'title', 15, 'en', 'Subscriptions', '2019-04-21 04:45:29', '2019-04-21 04:45:29'),
(43, 'menu_items', 'title', 16, 'en', 'Plans', '2019-04-21 04:45:38', '2019-04-21 04:45:38'),
(44, 'data_types', 'display_name_singular', 8, 'en', 'Plan', '2019-04-21 04:54:29', '2019-04-21 04:54:29'),
(45, 'data_types', 'display_name_plural', 8, 'en', 'Plans', '2019-04-21 04:54:29', '2019-04-21 04:54:29'),
(46, 'data_types', 'display_name_singular', 5, 'en', 'Post', '2019-04-21 05:00:24', '2019-04-21 05:00:24'),
(47, 'data_types', 'display_name_plural', 5, 'en', 'Posts', '2019-04-21 05:00:24', '2019-04-21 05:00:24'),
(50, 'plans', 'name', 2, 'en', 'nezam el wagbten', '2019-04-21 05:06:02', '2019-04-21 05:06:02'),
(51, 'plans', 'slug', 2, 'en', 'nezam-el-wagbten', '2019-04-21 05:06:02', '2019-04-21 05:06:02'),
(52, 'plans', 'description', 2, 'en', '<ul>\n                                    <li>choose1</li>\n                                    <li>choose2</li>\n                                </ul>', '2019-04-21 05:33:33', '2019-04-21 06:32:04'),
(53, 'posts', 'title', 5, 'en', '', '2019-04-22 20:18:00', '2019-04-22 20:18:00'),
(54, 'posts', 'seo_title', 5, 'en', '', '2019-04-22 20:18:00', '2019-04-22 20:18:00'),
(55, 'posts', 'excerpt', 5, 'en', '', '2019-04-22 20:18:00', '2019-04-22 20:18:00'),
(56, 'posts', 'slug', 5, 'en', '', '2019-04-22 20:18:00', '2019-04-22 20:18:00'),
(57, 'posts', 'meta_description', 5, 'en', '', '2019-04-22 20:18:00', '2019-04-22 20:18:00'),
(58, 'posts', 'meta_keywords', 5, 'en', '', '2019-04-22 20:18:00', '2019-04-22 20:18:00'),
(65, 'pages', 'title', 1, 'ar', 'Hello World', '2019-04-24 12:19:59', '2019-04-24 12:19:59'),
(66, 'pages', 'slug', 1, 'ar', 'hello-world', '2019-04-24 12:19:59', '2019-04-24 12:19:59'),
(67, 'data_types', 'display_name_singular', 6, 'ar', 'Page', '2019-04-24 12:21:07', '2019-04-24 12:21:07'),
(68, 'data_types', 'display_name_plural', 6, 'ar', 'Pages', '2019-04-24 12:21:07', '2019-04-24 12:21:07'),
(69, 'pages', 'body', 1, 'ar', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-04-24 12:21:59', '2019-04-24 12:21:59'),
(83, 'pages', 'title', 1, 'en', 'aboutus', '2019-04-24 13:47:55', '2019-04-24 13:55:27'),
(84, 'pages', 'slug', 1, 'en', 'hello-world', '2019-04-24 13:47:55', '2019-04-24 13:47:55'),
(85, 'pages', 'body', 1, 'en', '<div class=\"ab-top col-xs-12\">\n<div class=\"block col-md-6 col-xs-12\">\n<h3>رؤيتنا</h3>\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل القارئ عن التركيز على الشكل الخارجي للنص . أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها .</p>\n</div>\n<div class=\"block col-md-6 col-xs-12\">\n<h3>أهدافنا</h3>\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل القارئ عن التركيز على الشكل الخارجي للنص . أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها .</p>\n</div>\n</div>\n<div class=\"ab-bottom col-xs-12\">\n<div class=\"g-head col-xs-12\">\n<h3>تاريخنا</h3>\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها ، هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز .</p>\n</div>\n<div class=\"g-body col-xs-12\">\n<div class=\"body-icon col-xs-12\">\n<div class=\"icon\" style=\"background-image: url(\'images/cal.png\');\">&nbsp;</div>\n</div>\n<div class=\"body-items col-xs-12\">\n<div class=\"item col-xs-12\">\n<div class=\"date-i\">2018</div>\n<div class=\"hist-body\">\n<div class=\"i-inner\">\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها ، هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل . المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها</p>\n01</div>\n<div class=\"i-inner\">\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها ، هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل . المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها</p>\n02</div>\n</div>\n</div>\n<div class=\"item col-xs-12\">\n<div class=\"date-i\">2017</div>\n<div class=\"hist-body\">\n<div class=\"i-inner\">\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها ، هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل . المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها</p>\n01</div>\n</div>\n</div>\n<div class=\"item col-xs-12\">\n<div class=\"date-i\">2016</div>\n<div class=\"hist-body\">\n<div class=\"i-inner\">\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها ، هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل . المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها</p>\n01</div>\n</div>\n</div>\n</div>\n</div>\n</div>', '2019-04-24 13:47:55', '2019-04-25 12:00:19'),
(86, 'data_types', 'display_name_singular', 10, 'en', 'Menucategory', '2019-04-24 14:05:27', '2019-04-24 14:05:27'),
(87, 'data_types', 'display_name_plural', 10, 'en', 'Menucategories', '2019-04-24 14:05:27', '2019-04-24 14:05:27'),
(88, 'menucategories', 'slug', 1, 'en', 'la7ma', '2019-04-24 14:06:28', '2019-04-24 14:06:28'),
(90, 'menucategories', 'slug', 2, 'en', '', '2019-04-24 14:07:29', '2019-04-24 14:07:29'),
(92, 'menucategories', 'slug', 3, 'en', '', '2019-04-24 14:08:16', '2019-04-24 14:08:16'),
(94, 'menu_items', 'title', 19, 'en', 'meals', '2019-04-24 14:11:03', '2019-04-26 16:38:46'),
(95, 'data_types', 'display_name_singular', 13, 'en', 'Menu List', '2019-04-24 14:12:54', '2019-04-24 14:12:54'),
(96, 'data_types', 'display_name_plural', 13, 'en', 'Menu Lists', '2019-04-24 14:12:54', '2019-04-24 14:12:54'),
(97, 'menu_lists', 'name', 1, 'en', 'Tamara Hahn', '2019-04-24 14:13:27', '2019-04-25 13:16:22'),
(110, 'plans', 'name', 10, 'en', '', '2019-04-24 14:30:18', '2019-04-24 14:30:18'),
(111, 'plans', 'description', 10, 'en', '', '2019-04-24 14:30:18', '2019-04-24 14:30:18'),
(112, 'plans', 'slug', 10, 'en', '', '2019-04-24 14:30:18', '2019-04-24 14:30:18'),
(113, 'menucategories', 'slug', 4, 'en', 'Eveniet et voluptat', '2019-04-25 08:48:39', '2019-04-25 08:48:39'),
(115, 'menucategories', 'slug', 6, 'en', '', '2019-04-25 08:49:24', '2019-04-25 08:49:24'),
(117, 'menucategories', 'slug', 9, 'en', '', '2019-04-25 09:21:14', '2019-04-25 09:21:14'),
(119, 'menucategories', 'slug', 10, 'en', '', '2019-04-25 09:22:18', '2019-04-25 09:22:18'),
(123, 'pages', 'title', 2, 'en', 'contactus', '2019-04-25 10:40:26', '2019-04-25 10:41:00'),
(124, 'pages', 'slug', 2, 'en', 'contactus', '2019-04-25 10:40:26', '2019-04-25 10:41:00'),
(125, 'pages', 'body', 2, 'en', '<h3>تواصل معنا</h3>\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها ، هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها هناك حقيقة مثبتة منذ زمن طويل . المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأه</p>', '2019-04-25 10:40:26', '2019-04-25 10:59:08'),
(126, 'data_types', 'display_name_singular', 6, 'en', 'Page', '2019-04-25 10:55:23', '2019-04-25 10:55:23'),
(127, 'data_types', 'display_name_plural', 6, 'en', 'Pages', '2019-04-25 10:55:23', '2019-04-25 10:55:23'),
(128, 'pages', 'excerpt', 1, 'en', '<h3 style=\"box-sizing: border-box; font-family: bahijbold; font-weight: 500; line-height: 1.1; color: #333333; margin-top: 20px; margin-bottom: 30px; font-size: 25px; transition: all 0.3s linear 0s; background-color: #fbfbfb;\"><span style=\"font-family: bahijbold;\">who are we</span></h3>\n<h3 style=\"box-sizing: border-box; font-family: bahijbold; font-weight: 500; line-height: 1.1; color: #333333; margin-top: 20px; margin-bottom: 30px; font-size: 25px; transition: all 0.3s linear 0s; background-color: #fbfbfb;\"><span style=\"font-family: bahijbold;\">There is a long-established fact that the readable content of a page will distract the reader from focusing on the outward appearance of the text or the form of the reader\'s focus on the outer shape of the text.</span></h3>\n<h3 style=\"box-sizing: border-box; font-family: bahijbold; font-weight: 500; line-height: 1.1; color: #333333; margin-top: 20px; margin-bottom: 30px; font-size: 25px; transition: all 0.3s linear 0s; background-color: #fbfbfb;\"><span style=\"font-family: bahijbold;\">There is a long-established fact that the readable content of a page will distract the reader from focusing on the outward appearance of the text or the form of the reader\'s focus on the outer shape of the text.</span></h3>', '2019-04-25 12:00:19', '2019-04-25 12:00:19'),
(129, 'menu_lists', 'name', 2, 'en', '', '2019-04-25 13:06:43', '2019-04-25 13:06:43'),
(130, 'menu_lists', 'name', 3, 'en', 'Herrod Lindsey', '2019-04-25 13:26:07', '2019-04-25 13:26:07'),
(131, 'menu_lists', 'name', 4, 'en', 'Octavia Stevenson', '2019-04-25 13:56:54', '2019-04-25 13:56:54'),
(132, 'menucategories', 'slug', 11, 'en', '', '2019-04-25 13:57:57', '2019-04-25 13:57:57'),
(134, 'menu_lists', 'name', 5, 'en', 'Fiona Stafford', '2019-04-25 13:58:25', '2019-04-25 13:58:25'),
(135, 'menu_lists', 'name', 6, 'en', 'asdasd', '2019-04-25 14:14:04', '2019-04-25 18:00:56'),
(136, 'data_types', 'display_name_singular', 18, 'en', 'Service', '2019-04-25 17:12:38', '2019-04-25 17:12:38'),
(137, 'data_types', 'display_name_plural', 18, 'en', 'Services', '2019-04-25 17:12:38', '2019-04-25 17:12:38'),
(138, 'services', 'name', 1, 'en', '<p>إشترك في<br />النظام الأنسب</p>', '2019-04-25 17:18:15', '2019-04-25 17:24:17'),
(139, 'services', 'name', 2, 'en', '<p>إشترك في<br />النظام الأنسب</p>', '2019-04-25 17:24:45', '2019-04-25 17:24:45'),
(140, 'services', 'name', 3, 'en', '<p>إشترك في<br />النظام الأنسب</p>', '2019-04-25 17:24:57', '2019-04-25 17:32:48'),
(141, 'menu_lists', 'desc', 6, 'en', '<h3 style=\"direction: rtl;\">عنوان الوجبة</h3>\n<p style=\"font-size: 14px; font-weight: 400; direction: rtl;\">هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع القارئ عن التركيز على الشكل الخارجي للنص .هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع القارئ عن التركيز على الشكل الخارجي للنص</p>\n<ul style=\"font-size: 14px; font-weight: 400;\">\n<li style=\"direction: rtl;\"><strong>مكون الخلطة</strong>&nbsp;هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</li>\n<li style=\"direction: rtl;\"><strong>مكون الخلطة</strong>&nbsp;هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</li>\n<li style=\"direction: rtl;\"><strong>مكون الخلطة</strong>&nbsp;هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</li>\n<li style=\"direction: rtl;\"><strong>مكون الخلطة</strong>&nbsp;هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</li>\n</ul>', '2019-04-25 17:59:02', '2019-04-25 18:00:56'),
(142, 'menucategories', 'name', 12, 'en', 'main category1', '2019-04-25 18:10:16', '2019-04-25 18:10:16'),
(143, 'menucategories', 'name', 13, 'en', 'main category 2', '2019-04-25 18:10:42', '2019-04-25 18:10:42'),
(144, 'menucategories', 'name', 14, 'en', 'main category 3', '2019-04-25 18:11:13', '2019-04-25 18:20:21'),
(145, 'menucategories', 'name', 15, 'en', 'main category 4', '2019-04-25 18:11:28', '2019-04-25 18:20:08'),
(146, 'menucategories', 'name', 16, 'en', 'main category 5', '2019-04-25 18:11:43', '2019-04-25 18:11:43'),
(147, 'menucategories', 'name', 17, 'en', 'sub category 1', '2019-04-25 18:13:12', '2019-04-25 18:19:57'),
(148, 'menucategories', 'name', 18, 'en', 'sub category 2', '2019-04-25 18:13:36', '2019-04-25 18:19:47'),
(149, 'menucategories', 'name', 19, 'en', 'name-menu1', '2019-04-25 18:16:04', '2019-04-27 15:07:28'),
(150, 'menu_lists', 'desc', 5, 'en', '<h3 style=\"direction: rtl;\">عنوان الوجبة</h3>\n<p style=\"direction: rtl;\">هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع القارئ عن التركيز على الشكل الخارجي للنص .هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع القارئ عن التركيز على الشكل الخارجي للنص</p>\n<ul>\n<li style=\"direction: rtl;\"><strong>مكون الخلطة</strong>&nbsp;هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</li>\n<li style=\"direction: rtl;\"><strong>مكون الخلطة</strong>&nbsp;هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</li>\n<li style=\"direction: rtl;\"><strong>مكون الخلطة</strong>&nbsp;هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</li>\n<li style=\"direction: rtl;\"><strong>مكون الخلطة</strong>&nbsp;هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</li>\n</ul>', '2019-04-25 18:17:24', '2019-04-25 18:18:34'),
(151, 'plans', 'name', 11, 'en', 'Doris Pearson', '2019-04-26 15:35:41', '2019-04-26 15:35:41'),
(152, 'plans', 'description', 11, 'en', '<p>asdasd</p>', '2019-04-26 15:35:41', '2019-04-26 15:35:41'),
(153, 'plans', 'slug', 11, 'en', 'Dolorum enim adipisc', '2019-04-26 15:35:41', '2019-04-26 15:35:41'),
(154, 'plans', 'name', 12, 'en', 'Cooper Wynn', '2019-04-26 15:57:15', '2019-04-26 15:57:15'),
(155, 'plans', 'description', 12, 'en', '', '2019-04-26 15:57:15', '2019-04-26 15:57:15'),
(156, 'plans', 'slug', 12, 'en', 'In dicta quia aut do', '2019-04-26 15:57:15', '2019-04-26 15:57:15'),
(157, 'data_types', 'display_name_singular', 7, 'en', 'Subscription', '2019-04-26 16:21:07', '2019-04-26 16:21:07'),
(158, 'data_types', 'display_name_plural', 7, 'en', 'Subscriptions', '2019-04-26 16:21:07', '2019-04-26 16:21:07'),
(159, 'plans', 'name', 13, 'en', 'Heather Morgan', '2019-04-26 16:28:57', '2019-04-26 16:28:57'),
(160, 'plans', 'description', 13, 'en', '<p>asdasd</p>', '2019-04-26 16:28:57', '2019-04-26 16:28:57'),
(161, 'plans', 'slug', 13, 'en', 'Architecto do qui at', '2019-04-26 16:28:57', '2019-04-26 16:28:57'),
(162, 'menu_items', 'title', 17, 'en', ' meals categories', '2019-04-26 16:36:41', '2019-04-26 16:37:49'),
(163, 'menu_items', 'title', 18, 'en', 'meals', '2019-04-26 16:37:17', '2019-04-26 16:37:17'),
(164, 'menu_items', 'title', 24, 'en', 'Services in home', '2019-04-26 16:38:26', '2019-04-26 16:38:26'),
(165, 'menu_items', 'title', 23, 'en', 'Newsletters', '2019-04-26 16:39:17', '2019-04-26 16:39:17'),
(166, 'menu_items', 'title', 25, 'en', 'home', '2019-04-27 14:37:45', '2019-04-27 14:47:06'),
(167, 'menu_items', 'title', 26, 'en', 'about us', '2019-04-27 14:52:28', '2019-04-27 14:52:28'),
(168, 'menu_items', 'title', 27, 'en', 'Plans', '2019-04-27 15:01:12', '2019-04-27 15:01:12'),
(169, 'menu_items', 'title', 28, 'en', 'meals categories', '2019-04-27 15:02:54', '2019-04-27 15:02:54'),
(170, 'menu_items', 'title', 29, 'en', 'name-menu1', '2019-04-27 15:05:48', '2019-04-27 15:08:02'),
(171, 'menu_items', 'title', 30, 'en', 'dynamic menu', '2019-04-27 15:21:16', '2019-04-27 15:21:16'),
(172, 'menu_items', 'title', 31, 'en', 'Contacts', '2019-04-27 17:38:48', '2019-04-27 17:38:48'),
(173, 'data_types', 'display_name_singular', 19, 'en', 'Contact', '2019-04-27 17:39:33', '2019-04-27 17:39:33'),
(174, 'data_types', 'display_name_plural', 19, 'en', 'Contacts', '2019-04-27 17:39:33', '2019-04-27 17:39:33'),
(175, 'data_types', 'display_name_singular', 20, 'en', 'Slider', '2019-04-27 17:41:42', '2019-04-27 17:41:42'),
(176, 'data_types', 'display_name_plural', 20, 'en', 'Sliders', '2019-04-27 17:41:42', '2019-04-27 17:41:42'),
(177, 'sliders', 'title', 1, 'en', 'welcome to free form title', '2019-04-27 17:46:02', '2019-04-27 17:46:02'),
(178, 'sliders', 'content', 1, 'en', '<p>content english</p>', '2019-04-27 17:46:02', '2019-04-27 17:46:02'),
(179, 'sliders', 'exerpet', 1, 'en', '<p><span style=\"color: #76838f; font-family: \'Open Sans\', sans-serif;\">Exerpet </span>english</p>', '2019-04-27 17:46:02', '2019-04-27 17:46:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `phone`, `address`, `zip_code`, `city`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$XtebmDI1Dv8YpkUWFDfpluLNPfEfdbcBvEGcZKTm2mR5kKtFWUXZe', 'FDvLLj3ajjufDfCxnki5j7JSDcJWLiHL7HQoT6hUHYSRpnyAvvw3IptDTPaa', '', '2019-04-21 03:42:30', '2019-04-24 13:45:47', NULL, NULL, NULL, NULL),
(2, 2, 'hisham', 'myhishamad2@gmail.com', 'users/default.png', NULL, '$2y$10$wvvuHLCurqYZ.7UjgmGNo.dPWqdd8SBdw4IPjy/bRJpovU4BcRxhG', '7o1gqqVViLiorU00PsdKIQJfd9XaH1UcIrurKYAallgbqPCQbsiiUbDpJQqy', NULL, '2019-04-21 06:57:07', '2019-04-21 06:57:07', NULL, NULL, NULL, NULL),
(3, 2, 'aboelnaga', 'hisham@yahoo.com', 'users/default.png', NULL, '$2y$10$/HXN9N7Zg.gwbTYSnY9kouZR90M25lA/V2nO99LjF9rwDhJOmDPoG', '1wHG35vONtUYvqNzJRx9wmfFn1s1vkkSfKwnYCGdasYs9k7EcfmyUzEpJvJl', NULL, '2019-04-24 11:42:00', '2019-04-24 11:42:00', NULL, NULL, NULL, NULL),
(4, 2, 'aboelnaga', 'aboelnaga@yahoo.com', 'users/default.png', NULL, '$2y$10$rOhbxZ86zBe/WYvKOTLLdO/0/gS9wZSXfPJMCDd..qipSnBUbEDca', NULL, NULL, '2019-04-24 11:44:14', '2019-04-24 11:44:14', NULL, NULL, NULL, NULL),
(5, 2, 'Branden Silva', 'pykez@mailinator.net', 'users/default.png', NULL, '$2y$10$g7Vb3iA.rEf189Wn3Pc/6eU71gGuTQcHAyjzWhDhpxtPB3OHevrpW', 'oBEX8Jih4eEbeK2LAhW8j04sWwQzEUVmIuUE4Y6fciOmmlaiHGfE7NBeLqU9', NULL, '2019-04-26 11:14:02', '2019-04-26 11:14:02', NULL, NULL, NULL, NULL),
(6, 2, 'Bree Duke', 'fekisyw@mailinator.net', 'users/default.png', NULL, '$2y$10$W12IlXjRU7yTlvem2Vz6S.5wVKh/smc7xPTQPP.bD.Ts/MHX3/0Fm', 'xhTXw49aACgKPDblGba6CtUjoue41fsPfXixx9XzFiKqkUwTn7rsUy8Y86ZH', NULL, '2019-04-26 11:15:24', '2019-04-26 11:15:24', '+1 (267) 953-6937', 'Proident in consequ', '14772', 'In quas in alias sol'),
(8, 3, 'hisham', 'itsho19@gmail.com', 'users/default.png', NULL, '$2y$10$TJ8LNlA7qm6wB.ywHzHsaeKpdTOAj2ksNctzcry5K.Wuy/Npp/SGG', '0xVUfcGSgNooleCMZrwyS7pbZbFebCeU9ynGQvRqcO8tWzgq5kaUHIH7svyB', '', '2019-04-26 17:23:20', '2019-04-26 17:23:20', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
