-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th4 20, 2024 lúc 11:33 AM
-- Phiên bản máy phục vụ: 5.7.44-log
-- Phiên bản PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `khotainguyen247`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role`
--

CREATE TABLE `admin_role` (
  `id` int(11) NOT NULL,
  `name` text,
  `role` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `admin_role`
--

INSERT INTO `admin_role` (`id`, `name`, `role`, `create_gettime`, `update_gettime`) VALUES
(1, 'Super Admin', '[\"view_logs\",\"view_transactions\",\"view_block_ip\",\"edit_block_ip\",\"view_user\",\"edit_user\",\"view_role\",\"edit_role\",\"view_recharge\",\"edit_recharge\",\"view_affiliate\",\"view_withdraw_affiliate\",\"edit_withdraw_affiliate\",\"edit_affiliate\",\"view_email_campaigns\",\"edit_email_campaigns\",\"view_coupon\",\"edit_coupon\",\"view_blog\",\"edit_blog\",\"view_product\",\"edit_product\",\"edit_stock_product\",\"view_orders_product\",\"view_order_product\",\"delete_order_product\",\"manager_suppliers\",\"view_menu\",\"edit_menu\",\"view_lang\",\"edit_lang\",\"view_currency\",\"edit_currency\",\"edit_theme\",\"edit_setting\"]', '2023-11-16 20:28:54', '2024-03-25 22:16:45'),
(2, 'Sales', '[\"view_logs\",\"view_transactions\",\"view_user\",\"view_affiliate\",\"view_withdraw_affiliate\",\"view_coupon\"]', '2023-11-16 20:41:10', '2023-11-16 20:53:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `aff_log`
--

CREATE TABLE `aff_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `reason` text COLLATE utf8_unicode_ci,
  `sotientruoc` float NOT NULL DEFAULT '0',
  `sotienthaydoi` float NOT NULL DEFAULT '0',
  `sotienhientai` float NOT NULL DEFAULT '0',
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `aff_withdraw`
--

CREATE TABLE `aff_withdraw` (
  `id` int(11) NOT NULL,
  `trans_id` text COLLATE utf8_unicode_ci,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `bank` text COLLATE utf8_unicode_ci,
  `stk` text COLLATE utf8_unicode_ci,
  `name` text COLLATE utf8_unicode_ci,
  `amount` float NOT NULL DEFAULT '0',
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `reason` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `automations`
--

CREATE TABLE `automations` (
  `id` int(11) NOT NULL,
  `name` text,
  `type` varchar(55) DEFAULT NULL,
  `product_id` longtext,
  `schedule` int(11) NOT NULL DEFAULT '0',
  `other` text,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banks`
--

CREATE TABLE `banks` (
  `id` int(11) NOT NULL,
  `short_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `accountName` text COLLATE utf8_unicode_ci,
  `accountNumber` text COLLATE utf8_unicode_ci,
  `password` text COLLATE utf8_unicode_ci,
  `token` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `block_ip`
--

CREATE TABLE `block_ip` (
  `id` int(11) NOT NULL,
  `ip` text COLLATE utf8_unicode_ci,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `banned` int(11) NOT NULL DEFAULT '0',
  `reason` text COLLATE utf8_unicode_ci,
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `display` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cards`
--

CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `trans_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telco` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `serial` text COLLATE utf8_unicode_ci,
  `pin` text COLLATE utf8_unicode_ci,
  `status` varchar(55) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `reason` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `id_api` int(11) NOT NULL DEFAULT '0',
  `stt` int(11) NOT NULL DEFAULT '0',
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `keywords` text COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `used` int(11) NOT NULL DEFAULT '0',
  `discount` float NOT NULL DEFAULT '0',
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `min` int(11) NOT NULL DEFAULT '1000',
  `max` int(11) NOT NULL DEFAULT '10000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupon_used`
--

CREATE TABLE `coupon_used` (
  `id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `trans_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` float NOT NULL DEFAULT '0',
  `symbol_left` text COLLATE utf8_unicode_ci,
  `symbol_right` text COLLATE utf8_unicode_ci,
  `seperator` text COLLATE utf8_unicode_ci,
  `display` int(11) NOT NULL DEFAULT '1',
  `default_currency` int(11) NOT NULL DEFAULT '0',
  `decimal_currency` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `rate`, `symbol_left`, `symbol_right`, `seperator`, `display`, `default_currency`, `decimal_currency`) VALUES
(3, 'Đồng', 'VND', 1, '', 'đ', 'dot', 1, 1, 0),
(4, 'Dollar', 'USD', 24000, '$', '', 'dot', 1, 0, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `deposit_log`
--

CREATE TABLE `deposit_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `method` varchar(255) DEFAULT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `received` float NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL,
  `is_virtual` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dongtien`
--

CREATE TABLE `dongtien` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `sotientruoc` float NOT NULL DEFAULT '0',
  `sotienthaydoi` float NOT NULL DEFAULT '0',
  `sotiensau` float NOT NULL DEFAULT '0',
  `thoigian` datetime NOT NULL,
  `noidung` text COLLATE utf8_unicode_ci,
  `transid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `email_campaigns`
--

CREATE TABLE `email_campaigns` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `subject` text COLLATE utf8_unicode_ci,
  `cc` text COLLATE utf8_unicode_ci,
  `bcc` text COLLATE utf8_unicode_ci,
  `content` longblob,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `email_sending`
--

CREATE TABLE `email_sending` (
  `id` int(11) NOT NULL,
  `camp_id` int(11) DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `response` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `create_gettime`) VALUES
(6, 106, 128, '2024-04-18 01:34:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` text COLLATE utf8_unicode_ci,
  `lang_default` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `languages`
--

INSERT INTO `languages` (`id`, `lang`, `icon`, `lang_default`, `status`) VALUES
(1, 'Vietnamese', 'assets/storage/flags/flag_Vietnamese.png', 1, 1),
(2, 'English', 'assets/storage/flags/flag_English.png', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `action` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `ip`, `device`, `createdate`, `action`) VALUES
(1027, 106, '171.239.16.21', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Zalo iOS/592 ZaloTheme/light ZaloLanguage/vn', '2024-04-17 19:27:16', '[Warning] Thực hiện đăng nhập vào website'),
(1028, 106, '103.252.92.60', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-04-17 19:28:03', '[Warning] Thực hiện đăng nhập vào website'),
(1029, 106, '103.252.92.60', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-04-17 19:29:54', '[Warning] Thực hiện đăng nhập vào website'),
(1030, 106, '2405:4802:6548:2e90:8d5d:5606:5d4c:d47d', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-04-18 01:23:50', '[Warning] Thực hiện đăng nhập vào website'),
(1031, 106, '103.149.86.81', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0.1 Mobile/15E148 Safari/604.1', '2024-04-18 01:24:58', '[Warning] Thực hiện đăng nhập vào website'),
(1032, 106, '2405:4802:23a7:c4e0:2806:af9c:26d8:b0eb', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-04-18 01:25:23', '[Warning] Thực hiện đăng nhập vào website'),
(1033, 106, '2402:800:6205:1a62:b831:c74d:2913:4a4c', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Mobile/15E148 Safari/604.1', '2024-04-18 01:46:43', '[Warning] Thực hiện đăng nhập vào website'),
(1034, 106, '2402:800:6310:c7c2:f0de:c533:3849:9486', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Mobile/15E148 Safari/604.1', '2024-04-18 17:59:14', '[Warning] Thực hiện đăng nhập vào website'),
(1035, 106, '2401:d800:bc4e:f96f:3d45:c58a:a98c:679c', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Mobile/15E148 Safari/604.1', '2024-04-20 17:53:33', '[Warning] Thực hiện đăng nhập vào website'),
(1036, 106, '27.70.220.53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-04-20 18:28:34', '[Warning] Thực hiện đăng nhập vào website');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `log_bank_auto`
--

CREATE TABLE `log_bank_auto` (
  `id` int(11) NOT NULL,
  `tid` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `type` text COLLATE utf8_unicode_ci,
  `amount` float NOT NULL DEFAULT '0',
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `log_ref`
--

CREATE TABLE `log_ref` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `reason` text COLLATE utf8_unicode_ci,
  `sotientruoc` float NOT NULL DEFAULT '0',
  `sotienthaydoi` float NOT NULL DEFAULT '0',
  `sotienhientai` float NOT NULL DEFAULT '0',
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` text COLLATE utf8_unicode_ci,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `href` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '0',
  `target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '3',
  `content` longtext COLLATE utf8_unicode_ci,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `momo`
--

CREATE TABLE `momo` (
  `id` int(11) NOT NULL,
  `request_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tranId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partnerId` text COLLATE utf8_unicode_ci,
  `partnerName` text COLLATE utf8_unicode_ci,
  `amount` text COLLATE utf8_unicode_ci,
  `received` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `status` varchar(32) COLLATE utf8_unicode_ci DEFAULT 'xuly'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_log`
--

CREATE TABLE `order_log` (
  `id` int(11) NOT NULL,
  `buyer` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `pay` float NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL,
  `is_virtual` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_bank`
--

CREATE TABLE `payment_bank` (
  `id` int(11) NOT NULL,
  `method` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `amount` int(11) DEFAULT '0',
  `received` int(11) DEFAULT '0',
  `create_gettime` datetime DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `notication` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_crypto`
--

CREATE TABLE `payment_crypto` (
  `id` int(11) NOT NULL,
  `trans_id` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `request_id` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `received` float NOT NULL DEFAULT '0',
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `status` varchar(55) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'waiting',
  `msg` text COLLATE utf8_unicode_ci,
  `url_payment` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_momo`
--

CREATE TABLE `payment_momo` (
  `id` int(11) NOT NULL,
  `tid` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `amount` int(11) DEFAULT '0',
  `received` int(11) DEFAULT '0',
  `create_gettime` datetime DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `notication` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_paypal`
--

CREATE TABLE `payment_paypal` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trans_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_pm`
--

CREATE TABLE `payment_pm` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `payment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_date` datetime NOT NULL,
  `update_time` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_squadco`
--

CREATE TABLE `payment_squadco` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `transaction_ref` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `create_gettime` datetime NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_toyyibpay`
--

CREATE TABLE `payment_toyyibpay` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `trans_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billName` text COLLATE utf8_unicode_ci,
  `amount` float NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `BillCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `reason` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `stt` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` text COLLATE utf8_unicode_ci,
  `image` text COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '0',
  `view` int(11) NOT NULL DEFAULT '0',
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_category`
--

CREATE TABLE `post_category` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `slug` text COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `icon` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `stt` int(11) NOT NULL DEFAULT '0',
  `code` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_desc` text COLLATE utf8_unicode_ci,
  `images` text COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `note` text COLLATE utf8_unicode_ci,
  `price` float NOT NULL DEFAULT '0',
  `cost` float NOT NULL DEFAULT '0',
  `discount` float NOT NULL DEFAULT '0',
  `min` int(11) NOT NULL DEFAULT '1',
  `max` int(11) NOT NULL DEFAULT '1000000',
  `flag` text COLLATE utf8_unicode_ci,
  `sold` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `check_live` varchar(55) COLLATE utf8_unicode_ci DEFAULT 'None',
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `api_id` text COLLATE utf8_unicode_ci,
  `api_name` text COLLATE utf8_unicode_ci,
  `api_stock` int(11) NOT NULL DEFAULT '0',
  `api_time_update` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `stt`, `code`, `user_id`, `name`, `slug`, `short_desc`, `images`, `description`, `note`, `price`, `cost`, `discount`, `min`, `max`, `flag`, `sold`, `category_id`, `status`, `create_gettime`, `update_gettime`, `check_live`, `supplier_id`, `api_id`, `api_name`, `api_stock`, `api_time_update`) VALUES
(127, 0, '66059b0fd1ad7', 1, 'Random Acc Liên Quân Ads New', 'random-acc-lien-quan-ads-new', 'Hàng chuẩn ads,tỷ lệ nổ acc vip cao,có tỷ lệ trắng thông tin - thông tin xấu,(log : garena)', '8O7MRSI3.png', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgTVVBIFJBTkRPTSA6PC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+LSBCJkFncmF2ZTtJIFZJ4bq+VCBLSCZBYWN1dGU7SSBRVSZBYWN1dGU7VCBW4buAIFJBTkRPTSBMSSZFY2lyYztOIFFVJkFjaXJjO04gViZBZ3JhdmU7IFJBTkRPTSBMSSZFY2lyYztOIFFVJkFjaXJjO04gQURTIDombmJzcDs8L3N0cm9uZz48L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly9yYW5kb212aWV0LmNvbS9ibG9nL3JhbmRvbS1saWVuLXF1YW4tdmEtcmFuZG9tLWxpZW4tcXVhbi1hZHMtbGEtZ2ktIj48c3BhbiBzdHlsZT0iY29sb3I6I2U3NGMzYyI+PHN0cm9uZz5OSOG6pE4gViZBZ3JhdmU7TyDEkCZBY2lyYztZPC9zdHJvbmc+PC9zcGFuPjwvYT48L3A+DQoNCjxwPjxzdHJvbmc+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPi0gUVUmWWFjdXRlOyBLSCZBYWN1dGU7Q0ggTuG7liBI4bumIEFDQyBWSVAgTEkmRWNpcmM7TiBI4buGIDwvc3Bhbj48YSBocmVmPSJodHRwczovL3d3dy5mYWNlYm9vay5jb20vbGFtYnV1dGhhaS8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMGZmIj5GQUNFQk9PSyBBRE1JTiZuYnNwOzwvc3Bhbj48L2E+xJDhu4IgU0hPVyBOSEE8L3N0cm9uZz48L3A+DQoNCjxwPjxzdHJvbmc+LSBSQU5ET00gQUNDIFRIJklncmF2ZTsgTiZFY2lyYztOIE1VQSDEkOG7piBT4buQIEzGr+G7ok5HIEPhuqZOIFRISeG6vlQgTVVBLEMmT2FjdXRlOyBUSOG7giBNVUEgxJBJIEImQWFjdXRlO04gTOG6oEkgxJDhu4IgS0nhur5NIEzhu5xJPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPi0gxJDhu4pOSCBE4bqgTkcgTE9HIDogVCZBZ3JhdmU7SSBLSE/huqJOfE3huqxUIEtI4bqoVTwvc3Ryb25nPjwvcD4NCg==', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgQ0hFQ0sgQUNDIDo8L3N0cm9uZz48L3NwYW4+PC9wPg0KDQo8cD48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIEPhuqZOIENIVeG6qE4gQuG7iiBT4bq0TiZuYnNwO0tJTkggTkdISeG7hk0sVE9PTCxDJkFhY3V0ZTtDIE3hurhPJm5ic3A7xJDhu4IgxJDhu5RJIFRIJk9jaXJjO05HIFRJTiA8L3N0cm9uZz48L3NwYW4+PHN0cm9uZz5BQ0M8L3N0cm9uZz48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+PHN0cm9uZz4sViZBZ3JhdmU7IEtJTkggTkdISeG7hk0gQuG6ok8gTeG6rFQgVCZBZ3JhdmU7SSBLSE/huqJOPC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHN0cm9uZz48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+LSBRVSZZYWN1dGU7IEtIJkFhY3V0ZTtDSCBO4buWIEjhu6YgQUNDIFZJUCBMSSZFY2lyYztOIEjhu4YgPC9zcGFuPjxhIGhyZWY9Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS9sYW1idXV0aGFpLyI+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwZmYiPkZBQ0VCT09LIEFETUlOJm5ic3A7PC9zcGFuPjwvYT7EkOG7giBTSE9XIE5IQTwvc3Ryb25nPjwvcD4NCg0KPHA+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIE4mRWNpcmM7TiBWJkFncmF2ZTtPIE5HQVkgVCZBZ3JhdmU7SSBLSE/huqJOIMSQ4buCIMSQ4buUSSBN4bqsVCBLSOG6qFUgVEgmRWNpcmM7TSBUSCZPY2lyYztORyBUSU4gS0gmT2NpcmM7TkcgTiZFY2lyYztOIMSQ4buCIEwmQWNpcmM7VTwvc3Ryb25nPjwvcD4NCg0KPHA+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIEQmSWFjdXRlO05IIEFDQyBUSCZPY2lyYztORyBUSU4gWOG6pFUgVEgmSWdyYXZlOyBDJk9hY3V0ZTsgVEjhu4IgRCZVZ3JhdmU7TkcgxJDhu4IgVEVTVCBBQ0MsVEVTVCBIQUNLLC4uLiBIQVkgQiZBYWN1dGU7TiBM4bqgSSBUUiZFY2lyYztOIEMmQWFjdXRlO0MgR1JPVVAgREnhu4ROIMSQ4bqmTiBW4buaSSBHSSZBYWN1dGU7IFLhurogS0nhur5NIEzhu5xJPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPuKdpCBDaCZ1YWN1dGU7YyBxdSZ5YWN1dGU7IGtoJmFhY3V0ZTtjaCBoJmFncmF2ZTtuZyBtYXkgbeG6r24gbmgmZWFjdXRlOyZuYnNwO+KdpDwvc3Ryb25nPjwvcD4NCg==', 500, 1, 10, 1, 1000000, NULL, 118297, 25, 1, '2024-03-28 23:37:12', '2024-04-03 11:23:21', 'None', 0, NULL, NULL, 0, 0),
(128, 0, '', 1, 'Random Acc FreeFire Ads Facebook', 'random-acc-freefire-ads-facebook1', 'Hàng chuẩn ads facebook,tỷ lệ nổ ổn,(log : facebook)', 'DW3SUEXB.png', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgTVVBIFJBTkRPTSA6PC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+LSBCJkFncmF2ZTtJIFZJ4bq+VCBLSCZBYWN1dGU7SSBRVSZBYWN1dGU7VCBW4buAIFJBTkRPTSBGUkVFRklSRSBBRFMmbmJzcDs6Jm5ic3A7PC9zdHJvbmc+PC9zcGFuPjxhIGhyZWY9Imh0dHBzOi8vcmFuZG9tdmlldC5jb20vYmxvZy9yYW5kb20tZnJlZWZpcmUtYWRzLWxhLWdpLSI+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TkjhuqROIFYmQWdyYXZlO08gxJAmQWNpcmM7WTwvc3Ryb25nPjwvc3Bhbj48L2E+PC9wPg0KDQo8cD48c3Ryb25nPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMDAwIj4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIE7hu5YgSOG7piBBQ0MgVklQIExJJkVjaXJjO04gSOG7hiA8L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly93d3cuZmFjZWJvb2suY29tL2xhbWJ1dXRoYWkvIj48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDBmZiI+RkFDRUJPT0sgQURNSU4mbmJzcDs8L3NwYW4+PC9hPsSQ4buCIFNIT1cgTkhBPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPi0gUkFORE9NIEFDQyBUSCZJZ3JhdmU7IE4mRWNpcmM7TiBNVUEgxJDhu6YgU+G7kCBMxq/hu6JORyBD4bqmTiBUSEnhur5UIE1VQSxDJk9hY3V0ZTsgVEjhu4IgTVVBIMSQSSBCJkFhY3V0ZTtOIEzhuqBJIMSQ4buCIEtJ4bq+TSBM4bucSTwvc3Ryb25nPjwvcD4NCg0KPHA+PHN0cm9uZz4tIMSQ4buKTkggROG6oE5HIExPRyA6IFQmQWdyYXZlO0kgS0hP4bqiTnxN4bqsVCBLSOG6qFU8L3N0cm9uZz48L3A+DQo=', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgQ0hFQ0sgQUNDIDo8L3N0cm9uZz48L3NwYW4+PC9wPg0KDQo8cD48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIEPhuqZOIENIVeG6qE4gQuG7iiBT4bq0TiAxIMSQ4buKQSBDSOG7iCBJUCBT4bqgQ0gsS0lOSCBOR0hJ4buGTSDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIEFDQyDEkOG7giBUUiZBYWN1dGU7TkggQ0hFQ0tQT0lOVCxWJkFncmF2ZTsgQuG6ok8gTeG6rFQgVCZBZ3JhdmU7SSBLSE/huqJOPC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+LSBLSCZPY2lyYztORyDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIFQmQWdyYXZlO0kgS0hP4bqiTiBO4bq+VSBLSCZPY2lyYztORyBDJk9hY3V0ZTsgS0lOSCBOR0hJ4buGTSDEkOG7lEk8L3N0cm9uZz48L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+IDwvc3Ryb25nPjwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6I2U3NGMzYyI+PHN0cm9uZz4oIFQmSWdyYXZlO00gSEnhu4JVIFRI4bqsVCBL4bu4IFRSxq/hu5pDIEtISSDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIEhP4bq2QyBOSOG7nCBOR8av4bucSSBDJk9hY3V0ZTsgS0lOSCBOR0hJ4buGTSDEkOG7lEkgR0kmVWFjdXRlO1AgVFImQWFjdXRlO05IIFRSxq/hu5xORyBI4buiUCBY4bqkVSBOSOG6pFQgKTwvc3Ryb25nPjwvc3Bhbj48L3A+DQoNCjxwPjxzdHJvbmc+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPi0gUVUmWWFjdXRlOyBLSCZBYWN1dGU7Q0ggTuG7liBI4bumIEFDQyBWSVAgTEkmRWNpcmM7TiBI4buGIDwvc3Bhbj48YSBocmVmPSJodHRwczovL3d3dy5mYWNlYm9vay5jb20vbGFtYnV1dGhhaS8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMGZmIj5GQUNFQk9PSyBBRE1JTiZuYnNwOzwvc3Bhbj48L2E+xJDhu4IgU0hPVyBOSEE8L3N0cm9uZz48L3A+DQoNCjxwPjxzdHJvbmc+LSBRVSZZYWN1dGU7IEtIJkFhY3V0ZTtDSCBOJkVjaXJjO04gViZBZ3JhdmU7TyBOR0FZIFQmQWdyYXZlO0kgS0hP4bqiTiDEkOG7giDEkOG7lEkgTeG6rFQgS0gmQWNpcmM7VSBUSCZFY2lyYztNIFRIJk9jaXJjO05HIFRJTiBLSCZPY2lyYztORyBOJkVjaXJjO04gxJDhu4IgTCZBY2lyYztVPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPi0gUVUmWWFjdXRlOyBLSCZBYWN1dGU7Q0ggRCZJYWN1dGU7TkggQUNDIEtIJk9jaXJjO05HIE5HT04gQyZPYWN1dGU7IFRI4buCIEQmVWdyYXZlO05HIMSQ4buCJm5ic3A7VEVTVCBBQ0MsVEVTVCBIQUNLLC4uLiBIQVkgQiZBYWN1dGU7TiBM4bqgSSBUUiZFY2lyYztOIEMmQWFjdXRlO0MgR1JPVVAgREnhu4ROIMSQ4bqmTiBW4buaSSBHSSZBYWN1dGU7IFLhurogS0nhur5NIEzhu5xJPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPuKdpCBDaCZ1YWN1dGU7YyBxdSZ5YWN1dGU7IGtoJmFhY3V0ZTtjaCBoJmFncmF2ZTtuZyBtYXkgbeG6r24gbmgmZWFjdXRlOyZuYnNwO+KdpDwvc3Ryb25nPjwvcD4NCg==', 5100, 3000, 0, 1, 1000000, NULL, 65123, 21, 1, '2024-03-29 17:10:17', '2024-04-02 21:17:28', 'None', 3, '1', 'Free Fire Hàng ADS FB', 0, 1712848683),
(130, 0, '', 1, 'Random Acc FreeFire', 'random-acc-freefire', 'Hàng chạy ads ,tỷ lệ login thấp,tỷ lệ nổ ổn,(log : facebook)', '43H5V8XA.png', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgTVVBIFJBTkRPTSA6PC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+LSBCJkFncmF2ZTtJIFZJ4bq+VCBLSCZBYWN1dGU7SSBRVSZBYWN1dGU7VCBW4buAIFJBTkRPTSBGUkVFRklSRSBBRFMmbmJzcDs6Jm5ic3A7PC9zdHJvbmc+PC9zcGFuPjxhIGhyZWY9Imh0dHBzOi8vcmFuZG9tdmlldC5jb20vYmxvZy9yYW5kb20tZnJlZWZpcmUtYWRzLWxhLWdpLSI+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TkjhuqROIFYmQWdyYXZlO08gxJAmQWNpcmM7WTwvc3Ryb25nPjwvc3Bhbj48L2E+PC9wPg0KDQo8cD48c3Ryb25nPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMDAwIj4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIE7hu5YgSOG7piBBQ0MgVklQIExJJkVjaXJjO04gSOG7hiA8L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly93d3cuZmFjZWJvb2suY29tL2xhbWJ1dXRoYWkvIj48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDBmZiI+RkFDRUJPT0sgQURNSU4mbmJzcDs8L3NwYW4+PC9hPsSQ4buCIFNIT1cgTkhBPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPi0gUkFORE9NIEFDQyBUSCZJZ3JhdmU7IE4mRWNpcmM7TiBNVUEgxJDhu6YgU+G7kCBMxq/hu6JORyBD4bqmTiBUSEnhur5UIE1VQSxDJk9hY3V0ZTsgVEjhu4IgTVVBIMSQSSBCJkFhY3V0ZTtOIEzhuqBJIMSQ4buCIEtJ4bq+TSBM4bucSTwvc3Ryb25nPjwvcD4NCg0KPHA+PHN0cm9uZz4tIMSQ4buKTkggROG6oE5HIExPRyA6IFQmQWdyYXZlO0kgS0hP4bqiTnxN4bqsVCBLSOG6qFU8L3N0cm9uZz48L3A+DQo=', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgQ0hFQ0sgQUNDIDo8L3N0cm9uZz48L3NwYW4+PC9wPg0KDQo8cD48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIEPhuqZOIENIVeG6qE4gQuG7iiBT4bq0TiAxIMSQ4buKQSBDSOG7iCBJUCBT4bqgQ0gsS0lOSCBOR0hJ4buGTSDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIEFDQyDEkOG7giBUUiZBYWN1dGU7TkggQ0hFQ0tQT0lOVCxWJkFncmF2ZTsgQuG6ok8gTeG6rFQgVCZBZ3JhdmU7SSBLSE/huqJOPC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+LSBLSCZPY2lyYztORyDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIFQmQWdyYXZlO0kgS0hP4bqiTiBO4bq+VSBLSCZPY2lyYztORyBDJk9hY3V0ZTsgS0lOSCBOR0hJ4buGTSDEkOG7lEk8L3N0cm9uZz48L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+IDwvc3Ryb25nPjwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6I2U3NGMzYyI+PHN0cm9uZz4oIFQmSWdyYXZlO00gSEnhu4JVIFRI4bqsVCBL4bu4IFRSxq/hu5pDIEtISSDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIEhP4bq2QyBOSOG7nCBOR8av4bucSSBDJk9hY3V0ZTsgS0lOSCBOR0hJ4buGTSDEkOG7lEkgR0kmVWFjdXRlO1AgVFImQWFjdXRlO05IIFRSxq/hu5xORyBI4buiUCBY4bqkVSBOSOG6pFQgKTwvc3Ryb25nPjwvc3Bhbj48L3A+DQoNCjxwPjxzdHJvbmc+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPi0gUVUmWWFjdXRlOyBLSCZBYWN1dGU7Q0ggTuG7liBI4bumIEFDQyBWSVAgTEkmRWNpcmM7TiBI4buGIDwvc3Bhbj48YSBocmVmPSJodHRwczovL3d3dy5mYWNlYm9vay5jb20vbGFtYnV1dGhhaS8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMGZmIj5GQUNFQk9PSyBBRE1JTiZuYnNwOzwvc3Bhbj48L2E+xJDhu4IgU0hPVyBOSEE8L3N0cm9uZz48L3A+DQoNCjxwPjxzdHJvbmc+LSBRVSZZYWN1dGU7IEtIJkFhY3V0ZTtDSCBOJkVjaXJjO04gViZBZ3JhdmU7TyBOR0FZIFQmQWdyYXZlO0kgS0hP4bqiTiDEkOG7giDEkOG7lEkgTeG6rFQgS0gmQWNpcmM7VSBUSCZFY2lyYztNIFRIJk9jaXJjO05HIFRJTiBLSCZPY2lyYztORyBOJkVjaXJjO04gxJDhu4IgTCZBY2lyYztVPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPi0gUVUmWWFjdXRlOyBLSCZBYWN1dGU7Q0ggRCZJYWN1dGU7TkggQUNDIEtIJk9jaXJjO05HIE5HT04gQyZPYWN1dGU7IFRI4buCIEQmVWdyYXZlO05HIMSQ4buCJm5ic3A7VEVTVCBBQ0MsVEVTVCBIQUNLLC4uLiBIQVkgQiZBYWN1dGU7TiBM4bqgSSBUUiZFY2lyYztOIEMmQWFjdXRlO0MgR1JPVVAgREnhu4ROIMSQ4bqmTiBW4buaSSBHSSZBYWN1dGU7IFLhurogS0nhur5NIEzhu5xJPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPuKdpCBDaCZ1YWN1dGU7YyBxdSZ5YWN1dGU7IGtoJmFhY3V0ZTtjaCBoJmFncmF2ZTtuZyBtYXkgbeG6r24gbmgmZWFjdXRlOyZuYnNwO+KdpDwvc3Ryb25nPjwvcD4NCg==', 1000, 600, 0, 1, 1000000, '', 112060, 21, 1, '2024-03-29 17:10:17', '2024-04-16 20:43:07', 'None', 3, '3', 'RANDOM FREE FIRE HÀNG LIVE THẤP', 858, 1712848683),
(131, 0, '', 1, 'Random Acc FreeFire Used', 'random-acc-freefire-used4', 'Hàng chạy ads đã qua sử dụng,tỷ lệ nổ ổn,(log : facebook)', 'SKTIEWDR.png', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgTVVBIFJBTkRPTSA6PC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+LSBCJkFncmF2ZTtJIFZJ4bq+VCBLSCZBYWN1dGU7SSBRVSZBYWN1dGU7VCBW4buAIFJBTkRPTSBGUkVFRklSRSBBRFMmbmJzcDs6Jm5ic3A7PC9zdHJvbmc+PC9zcGFuPjxhIGhyZWY9Imh0dHBzOi8vcmFuZG9tdmlldC5jb20vYmxvZy9yYW5kb20tZnJlZWZpcmUtYWRzLWxhLWdpLSI+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TkjhuqROIFYmQWdyYXZlO08gxJAmQWNpcmM7WTwvc3Ryb25nPjwvc3Bhbj48L2E+PC9wPg0KDQo8cD48c3Ryb25nPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMDAwIj4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIE7hu5YgSOG7piBBQ0MgVklQIExJJkVjaXJjO04gSOG7hiA8L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly93d3cuZmFjZWJvb2suY29tL2xhbWJ1dXRoYWkvIj48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDBmZiI+RkFDRUJPT0sgQURNSU4mbmJzcDs8L3NwYW4+PC9hPsSQ4buCIFNIT1cgTkhBPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPi0gUkFORE9NIEFDQyBUSCZJZ3JhdmU7IE4mRWNpcmM7TiBNVUEgxJDhu6YgU+G7kCBMxq/hu6JORyBD4bqmTiBUSEnhur5UIE1VQSxDJk9hY3V0ZTsgVEjhu4IgTVVBIMSQSSBCJkFhY3V0ZTtOIEzhuqBJIMSQ4buCIEtJ4bq+TSBM4bucSTwvc3Ryb25nPjwvcD4NCg0KPHA+PHN0cm9uZz4tIMSQ4buKTkggROG6oE5HIExPRyA6IFQmQWdyYXZlO0kgS0hP4bqiTnxN4bqsVCBLSOG6qFU8L3N0cm9uZz48L3A+DQo=', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgQ0hFQ0sgQUNDIDo8L3N0cm9uZz48L3NwYW4+PC9wPg0KDQo8cD48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIEPhuqZOIENIVeG6qE4gQuG7iiBT4bq0TiAxIMSQ4buKQSBDSOG7iCBJUCBT4bqgQ0gsS0lOSCBOR0hJ4buGTSDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIEFDQyDEkOG7giBUUiZBYWN1dGU7TkggQ0hFQ0tQT0lOVCxWJkFncmF2ZTsgQuG6ok8gTeG6rFQgVCZBZ3JhdmU7SSBLSE/huqJOPC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+LSBLSCZPY2lyYztORyDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIFQmQWdyYXZlO0kgS0hP4bqiTiBO4bq+VSBLSCZPY2lyYztORyBDJk9hY3V0ZTsgS0lOSCBOR0hJ4buGTSDEkOG7lEk8L3N0cm9uZz48L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+IDwvc3Ryb25nPjwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6I2U3NGMzYyI+PHN0cm9uZz4oIFQmSWdyYXZlO00gSEnhu4JVIFRI4bqsVCBL4bu4IFRSxq/hu5pDIEtISSDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIEhP4bq2QyBOSOG7nCBOR8av4bucSSBDJk9hY3V0ZTsgS0lOSCBOR0hJ4buGTSDEkOG7lEkgR0kmVWFjdXRlO1AgVFImQWFjdXRlO05IIFRSxq/hu5xORyBI4buiUCBY4bqkVSBOSOG6pFQgKTwvc3Ryb25nPjwvc3Bhbj48L3A+DQoNCjxwPjxzdHJvbmc+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPi0gUVUmWWFjdXRlOyBLSCZBYWN1dGU7Q0ggTuG7liBI4bumIEFDQyBWSVAgTEkmRWNpcmM7TiBI4buGIDwvc3Bhbj48YSBocmVmPSJodHRwczovL3d3dy5mYWNlYm9vay5jb20vbGFtYnV1dGhhaS8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMGZmIj5GQUNFQk9PSyBBRE1JTiZuYnNwOzwvc3Bhbj48L2E+xJDhu4IgU0hPVyBOSEE8L3N0cm9uZz48L3A+DQoNCjxwPjxzdHJvbmc+LSBRVSZZYWN1dGU7IEtIJkFhY3V0ZTtDSCBOJkVjaXJjO04gViZBZ3JhdmU7TyBOR0FZIFQmQWdyYXZlO0kgS0hP4bqiTiDEkOG7giDEkOG7lEkgTeG6rFQgS0gmQWNpcmM7VSBUSCZFY2lyYztNIFRIJk9jaXJjO05HIFRJTiBLSCZPY2lyYztORyBOJkVjaXJjO04gxJDhu4IgTCZBY2lyYztVPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPi0gUVUmWWFjdXRlOyBLSCZBYWN1dGU7Q0ggRCZJYWN1dGU7TkggQUNDIEtIJk9jaXJjO05HIE5HT04gQyZPYWN1dGU7IFRI4buCIEQmVWdyYXZlO05HIMSQ4buCJm5ic3A7VEVTVCBBQ0MsVEVTVCBIQUNLLC4uLiBIQVkgQiZBYWN1dGU7TiBM4bqgSSBUUiZFY2lyYztOIEMmQWFjdXRlO0MgR1JPVVAgREnhu4ROIMSQ4bqmTiBW4buaSSBHSSZBYWN1dGU7IFLhurogS0nhur5NIEzhu5xJPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPuKdpCBDaCZ1YWN1dGU7YyBxdSZ5YWN1dGU7IGtoJmFhY3V0ZTtjaCBoJmFncmF2ZTtuZyBtYXkgbeG6r24gbmgmZWFjdXRlOyZuYnNwO+KdpDwvc3Ryb25nPjwvcD4NCg==', 200, 100, 0, 1, 1000000, NULL, 157092, 21, 1, '2024-03-29 17:10:17', '2024-04-02 21:16:52', 'None', 3, '4', 'RANDOM FREE FIRE CŨ ( ĐÃ QUA SỬ DỤNG )', 0, 1712848683),
(132, 0, '', 1, 'Random Acc FreeFire 100% Log', 'random-acc-freefire-100-log10', 'Hàng random có 2fa,tỷ lệ 100% đăng nhập được ,tỷ lệ nổ ổn,(log : facebook)', 'RJV807O3.png', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgTVVBIFJBTkRPTSA6PC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+LSBCJkFncmF2ZTtJIFZJ4bq+VCBLSCZBYWN1dGU7SSBRVSZBYWN1dGU7VCBW4buAIFJBTkRPTSBGUkVFRklSRSBBRFMmbmJzcDs6Jm5ic3A7PC9zdHJvbmc+PC9zcGFuPjxhIGhyZWY9Imh0dHBzOi8vcmFuZG9tdmlldC5jb20vYmxvZy9yYW5kb20tZnJlZWZpcmUtYWRzLWxhLWdpLSI+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TkjhuqROIFYmQWdyYXZlO08gxJAmQWNpcmM7WTwvc3Ryb25nPjwvc3Bhbj48L2E+PC9wPg0KDQo8cD48c3Ryb25nPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMDAwIj4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIE7hu5YgSOG7piBBQ0MgVklQIExJJkVjaXJjO04gSOG7hiA8L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly93d3cuZmFjZWJvb2suY29tL2xhbWJ1dXRoYWkvIj48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDBmZiI+RkFDRUJPT0sgQURNSU4mbmJzcDs8L3NwYW4+PC9hPsSQ4buCIFNIT1cgTkhBPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPi0gUkFORE9NIEFDQyBUSCZJZ3JhdmU7IE4mRWNpcmM7TiBNVUEgxJDhu6YgU+G7kCBMxq/hu6JORyBD4bqmTiBUSEnhur5UIE1VQSxDJk9hY3V0ZTsgVEjhu4IgTVVBIMSQSSBCJkFhY3V0ZTtOIEzhuqBJIMSQ4buCIEtJ4bq+TSBM4bucSTwvc3Ryb25nPjwvcD4NCg0KPHA+PHN0cm9uZz4tIMSQ4buKTkggROG6oE5HIExPRyA6IFQmQWdyYXZlO0kgS0hP4bqiTnxN4bqsVCBLSOG6qFU8L3N0cm9uZz48L3A+DQo=', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgQ0hFQ0sgQUNDIDo8L3N0cm9uZz48L3NwYW4+PC9wPg0KDQo8cD48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIEPhuqZOIENIVeG6qE4gQuG7iiBT4bq0TiAxIMSQ4buKQSBDSOG7iCBJUCBT4bqgQ0gsS0lOSCBOR0hJ4buGTSDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIEFDQyDEkOG7giBUUiZBYWN1dGU7TkggQ0hFQ0tQT0lOVCxWJkFncmF2ZTsgQuG6ok8gTeG6rFQgVCZBZ3JhdmU7SSBLSE/huqJOPC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+LSBLSCZPY2lyYztORyDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIFQmQWdyYXZlO0kgS0hP4bqiTiBO4bq+VSBLSCZPY2lyYztORyBDJk9hY3V0ZTsgS0lOSCBOR0hJ4buGTSDEkOG7lEk8L3N0cm9uZz48L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+IDwvc3Ryb25nPjwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6I2U3NGMzYyI+PHN0cm9uZz4oIFQmSWdyYXZlO00gSEnhu4JVIFRI4bqsVCBL4bu4IFRSxq/hu5pDIEtISSDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIEhP4bq2QyBOSOG7nCBOR8av4bucSSBDJk9hY3V0ZTsgS0lOSCBOR0hJ4buGTSDEkOG7lEkgR0kmVWFjdXRlO1AgVFImQWFjdXRlO05IIFRSxq/hu5xORyBI4buiUCBY4bqkVSBOSOG6pFQgKTwvc3Ryb25nPjwvc3Bhbj48L3A+DQoNCjxwPjxzdHJvbmc+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPi0gUVUmWWFjdXRlOyBLSCZBYWN1dGU7Q0ggTuG7liBI4bumIEFDQyBWSVAgTEkmRWNpcmM7TiBI4buGIDwvc3Bhbj48YSBocmVmPSJodHRwczovL3d3dy5mYWNlYm9vay5jb20vbGFtYnV1dGhhaS8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMGZmIj5GQUNFQk9PSyBBRE1JTiZuYnNwOzwvc3Bhbj48L2E+xJDhu4IgU0hPVyBOSEE8L3N0cm9uZz48L3A+DQoNCjxwPjxzdHJvbmc+LSBRVSZZYWN1dGU7IEtIJkFhY3V0ZTtDSCBOJkVjaXJjO04gViZBZ3JhdmU7TyBOR0FZIFQmQWdyYXZlO0kgS0hP4bqiTiDEkOG7giDEkOG7lEkgTeG6rFQgS0gmQWNpcmM7VSBUSCZFY2lyYztNIFRIJk9jaXJjO05HIFRJTiBLSCZPY2lyYztORyBOJkVjaXJjO04gxJDhu4IgTCZBY2lyYztVPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPi0gUVUmWWFjdXRlOyBLSCZBYWN1dGU7Q0ggRCZJYWN1dGU7TkggQUNDIEtIJk9jaXJjO05HIE5HT04gQyZPYWN1dGU7IFRI4buCIEQmVWdyYXZlO05HIMSQ4buCJm5ic3A7VEVTVCBBQ0MsVEVTVCBIQUNLLC4uLiBIQVkgQiZBYWN1dGU7TiBM4bqgSSBUUiZFY2lyYztOIEMmQWFjdXRlO0MgR1JPVVAgREnhu4ROIMSQ4bqmTiBW4buaSSBHSSZBYWN1dGU7IFLhurogS0nhur5NIEzhu5xJPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPuKdpCBDaCZ1YWN1dGU7YyBxdSZ5YWN1dGU7IGtoJmFhY3V0ZTtjaCBoJmFncmF2ZTtuZyBtYXkgbeG6r24gbmgmZWFjdXRlOyZuYnNwO+KdpDwvc3Ryb25nPjwvcD4NCg==', 34000, 20000, 5, 1, 1000000, NULL, 649, 21, 1, '2024-03-29 17:10:17', '2024-04-02 21:16:39', 'None', 3, '10', 'RANDOM FF HÀNG 100% ĐĂNG NHẬP ĐƯỢC (TK/MK/2FA)', 0, 1712848683),
(133, 0, '', 1, 'Random Acc FreeFire Ads', 'random-acc-freefire-ads13', 'Hàng chạy ads ,tỷ lệ login ổn,tỷ lệ nổ ổn,(log : facebook)', 'BPDTNRK4.png', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgTVVBIFJBTkRPTSA6PC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+LSBCJkFncmF2ZTtJIFZJ4bq+VCBLSCZBYWN1dGU7SSBRVSZBYWN1dGU7VCBW4buAIFJBTkRPTSBGUkVFRklSRSBBRFMmbmJzcDs6Jm5ic3A7PC9zdHJvbmc+PC9zcGFuPjxhIGhyZWY9Imh0dHBzOi8vcmFuZG9tdmlldC5jb20vYmxvZy9yYW5kb20tZnJlZWZpcmUtYWRzLWxhLWdpLSI+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TkjhuqROIFYmQWdyYXZlO08gxJAmQWNpcmM7WTwvc3Ryb25nPjwvc3Bhbj48L2E+PC9wPg0KDQo8cD48c3Ryb25nPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMDAwIj4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIE7hu5YgSOG7piBBQ0MgVklQIExJJkVjaXJjO04gSOG7hiA8L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly93d3cuZmFjZWJvb2suY29tL2xhbWJ1dXRoYWkvIj48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDBmZiI+RkFDRUJPT0sgQURNSU4mbmJzcDs8L3NwYW4+PC9hPsSQ4buCIFNIT1cgTkhBPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPi0gUkFORE9NIEFDQyBUSCZJZ3JhdmU7IE4mRWNpcmM7TiBNVUEgxJDhu6YgU+G7kCBMxq/hu6JORyBD4bqmTiBUSEnhur5UIE1VQSxDJk9hY3V0ZTsgVEjhu4IgTVVBIMSQSSBCJkFhY3V0ZTtOIEzhuqBJIMSQ4buCIEtJ4bq+TSBM4bucSTwvc3Ryb25nPjwvcD4NCg0KPHA+PHN0cm9uZz4tIMSQ4buKTkggROG6oE5HIExPRyA6IFQmQWdyYXZlO0kgS0hP4bqiTnxN4bqsVCBLSOG6qFU8L3N0cm9uZz48L3A+DQo=', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgQ0hFQ0sgQUNDIDo8L3N0cm9uZz48L3NwYW4+PC9wPg0KDQo8cD48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIEPhuqZOIENIVeG6qE4gQuG7iiBT4bq0TiAxIMSQ4buKQSBDSOG7iCBJUCBT4bqgQ0gsS0lOSCBOR0hJ4buGTSDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIEFDQyDEkOG7giBUUiZBYWN1dGU7TkggQ0hFQ0tQT0lOVCxWJkFncmF2ZTsgQuG6ok8gTeG6rFQgVCZBZ3JhdmU7SSBLSE/huqJOPC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+LSBLSCZPY2lyYztORyDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIFQmQWdyYXZlO0kgS0hP4bqiTiBO4bq+VSBLSCZPY2lyYztORyBDJk9hY3V0ZTsgS0lOSCBOR0hJ4buGTSDEkOG7lEk8L3N0cm9uZz48L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+IDwvc3Ryb25nPjwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6I2U3NGMzYyI+PHN0cm9uZz4oIFQmSWdyYXZlO00gSEnhu4JVIFRI4bqsVCBL4bu4IFRSxq/hu5pDIEtISSDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIEhP4bq2QyBOSOG7nCBOR8av4bucSSBDJk9hY3V0ZTsgS0lOSCBOR0hJ4buGTSDEkOG7lEkgR0kmVWFjdXRlO1AgVFImQWFjdXRlO05IIFRSxq/hu5xORyBI4buiUCBY4bqkVSBOSOG6pFQgKTwvc3Ryb25nPjwvc3Bhbj48L3A+DQoNCjxwPjxzdHJvbmc+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPi0gUVUmWWFjdXRlOyBLSCZBYWN1dGU7Q0ggTuG7liBI4bumIEFDQyBWSVAgTEkmRWNpcmM7TiBI4buGIDwvc3Bhbj48YSBocmVmPSJodHRwczovL3d3dy5mYWNlYm9vay5jb20vbGFtYnV1dGhhaS8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMGZmIj5GQUNFQk9PSyBBRE1JTiZuYnNwOzwvc3Bhbj48L2E+xJDhu4IgU0hPVyBOSEE8L3N0cm9uZz48L3A+DQoNCjxwPjxzdHJvbmc+LSBRVSZZYWN1dGU7IEtIJkFhY3V0ZTtDSCBOJkVjaXJjO04gViZBZ3JhdmU7TyBOR0FZIFQmQWdyYXZlO0kgS0hP4bqiTiDEkOG7giDEkOG7lEkgTeG6rFQgS0gmQWNpcmM7VSBUSCZFY2lyYztNIFRIJk9jaXJjO05HIFRJTiBLSCZPY2lyYztORyBOJkVjaXJjO04gxJDhu4IgTCZBY2lyYztVPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPi0gUVUmWWFjdXRlOyBLSCZBYWN1dGU7Q0ggRCZJYWN1dGU7TkggQUNDIEtIJk9jaXJjO05HIE5HT04gQyZPYWN1dGU7IFRI4buCIEQmVWdyYXZlO05HIMSQ4buCJm5ic3A7VEVTVCBBQ0MsVEVTVCBIQUNLLC4uLiBIQVkgQiZBYWN1dGU7TiBM4bqgSSBUUiZFY2lyYztOIEMmQWFjdXRlO0MgR1JPVVAgREnhu4ROIMSQ4bqmTiBW4buaSSBHSSZBYWN1dGU7IFLhurogS0nhur5NIEzhu5xJPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPuKdpCBDaCZ1YWN1dGU7YyBxdSZ5YWN1dGU7IGtoJmFhY3V0ZTtjaCBoJmFncmF2ZTtuZyBtYXkgbeG6r24gbmgmZWFjdXRlOyZuYnNwO+KdpDwvc3Ryb25nPjwvcD4NCg==', 1700, 1000, 0, 1, 1000000, NULL, 87051, 21, 1, '2024-03-29 17:10:17', '2024-04-02 21:16:14', 'None', 3, '13', 'RANDOM FREE FIRE HÀNG ADS TIK TOK', 0, 1712848683),
(134, 0, '', 1, 'Random Acc Liên Quân Auth', 'random-acc-lien-quan-auth5', 'Hàng random Auth liên quân,chắn level 20 ,tỷ lệ nổ acc vip cao,(log : garena)', 'OTB52Y3P.png', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgTVVBIFJBTkRPTSA6PC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+LSBCJkFncmF2ZTtJIFZJ4bq+VCBLSCZBYWN1dGU7SSBRVSZBYWN1dGU7VCBW4buAIFJBTkRPTSBMSSZFY2lyYztOIFFVJkFjaXJjO04gViZBZ3JhdmU7IFJBTkRPTSBMSSZFY2lyYztOIFFVJkFjaXJjO04gQURTIDombmJzcDs8L3N0cm9uZz48L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly9yYW5kb212aWV0LmNvbS9ibG9nL3JhbmRvbS1saWVuLXF1YW4tdmEtcmFuZG9tLWxpZW4tcXVhbi1hZHMtbGEtZ2ktIj48c3BhbiBzdHlsZT0iY29sb3I6I2U3NGMzYyI+PHN0cm9uZz5OSOG6pE4gViZBZ3JhdmU7TyDEkCZBY2lyYztZPC9zdHJvbmc+PC9zcGFuPjwvYT48L3A+DQoNCjxwPjxzdHJvbmc+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPi0gUVUmWWFjdXRlOyBLSCZBYWN1dGU7Q0ggTuG7liBI4bumIEFDQyBWSVAgTEkmRWNpcmM7TiBI4buGIDwvc3Bhbj48YSBocmVmPSJodHRwczovL3d3dy5mYWNlYm9vay5jb20vbGFtYnV1dGhhaS8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMGZmIj5GQUNFQk9PSyBBRE1JTiZuYnNwOzwvc3Bhbj48L2E+xJDhu4IgU0hPVyBOSEE8L3N0cm9uZz48L3A+DQoNCjxwPjxzdHJvbmc+LSBSQU5ET00gQUNDIFRIJklncmF2ZTsgTiZFY2lyYztOIE1VQSDEkOG7piBT4buQIEzGr+G7ok5HIEPhuqZOIFRISeG6vlQgTVVBLEMmT2FjdXRlOyBUSOG7giBNVUEgxJBJIEImQWFjdXRlO04gTOG6oEkgxJDhu4IgS0nhur5NIEzhu5xJPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPi0gxJDhu4pOSCBE4bqgTkcgTE9HIDogVCZBZ3JhdmU7SSBLSE/huqJOfE3huqxUIEtI4bqoVTwvc3Ryb25nPjwvcD4NCg==', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgQ0hFQ0sgQUNDIDo8L3N0cm9uZz48L3NwYW4+PC9wPg0KDQo8cD48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIEPhuqZOIENIVeG6qE4gQuG7iiBT4bq0TiZuYnNwO0tJTkggTkdISeG7hk0sVE9PTCxDJkFhY3V0ZTtDIE3hurhPJm5ic3A7xJDhu4IgxJDhu5RJIFRIJk9jaXJjO05HIFRJTiA8L3N0cm9uZz48L3NwYW4+PHN0cm9uZz5BQ0M8L3N0cm9uZz48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+PHN0cm9uZz4sViZBZ3JhdmU7IEtJTkggTkdISeG7hk0gQuG6ok8gTeG6rFQgVCZBZ3JhdmU7SSBLSE/huqJOPC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHN0cm9uZz48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+LSBRVSZZYWN1dGU7IEtIJkFhY3V0ZTtDSCBO4buWIEjhu6YgQUNDIFZJUCBMSSZFY2lyYztOIEjhu4YgPC9zcGFuPjxhIGhyZWY9Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS9sYW1idXV0aGFpLyI+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwZmYiPkZBQ0VCT09LIEFETUlOJm5ic3A7PC9zcGFuPjwvYT7EkOG7giBTSE9XIE5IQTwvc3Ryb25nPjwvcD4NCg0KPHA+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIE4mRWNpcmM7TiBWJkFncmF2ZTtPIE5HQVkgVCZBZ3JhdmU7SSBLSE/huqJOIMSQ4buCIMSQ4buUSSBN4bqsVCBLSOG6qFUgVEgmRWNpcmM7TSBUSCZPY2lyYztORyBUSU4gS0gmT2NpcmM7TkcgTiZFY2lyYztOIMSQ4buCIEwmQWNpcmM7VTwvc3Ryb25nPjwvcD4NCg0KPHA+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIEQmSWFjdXRlO05IIEFDQyBUSCZPY2lyYztORyBUSU4gWOG6pFUgVEgmSWdyYXZlOyBDJk9hY3V0ZTsgVEjhu4IgRCZVZ3JhdmU7TkcgxJDhu4IgVEVTVCBBQ0MsVEVTVCBIQUNLLC4uLiBIQVkgQiZBYWN1dGU7TiBM4bqgSSBUUiZFY2lyYztOIEMmQWFjdXRlO0MgR1JPVVAgREnhu4ROIMSQ4bqmTiBW4buaSSBHSSZBYWN1dGU7IFLhurogS0nhur5NIEzhu5xJPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPuKdpCBDaCZ1YWN1dGU7YyBxdSZ5YWN1dGU7IGtoJmFhY3V0ZTtjaCBoJmFncmF2ZTtuZyBtYXkgbeG6r24gbmgmZWFjdXRlOyZuYnNwO+KdpDwvc3Ryb25nPjwvcD4NCg==', 25500, 15000, 5, 1, 1000000, NULL, 621, 25, 1, '2024-03-29 17:10:17', '2024-04-02 21:15:55', 'None', 3, '5', 'RANDOM AUTHEN LIÊN QUÂN MOBILE', 0, 1712848683),
(137, 0, '', 1, 'Random Acc Liên Quân Rẻ', 'random-acc-lien-quan-re12', 'Hàng random chắn level 15,tỷ lệ trắng thông tin cao hoặc có liên kết ảo hoặc đã rip,tỷ lệ nổ acc vip ổn,(log : garena)', 'YN4J8OE1.png', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgTVVBIFJBTkRPTSA6PC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+LSBCJkFncmF2ZTtJIFZJ4bq+VCBLSCZBYWN1dGU7SSBRVSZBYWN1dGU7VCBW4buAIFJBTkRPTSBMSSZFY2lyYztOIFFVJkFjaXJjO04gViZBZ3JhdmU7IFJBTkRPTSBMSSZFY2lyYztOIFFVJkFjaXJjO04gQURTIDombmJzcDs8L3N0cm9uZz48L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly9yYW5kb212aWV0LmNvbS9ibG9nL3JhbmRvbS1saWVuLXF1YW4tdmEtcmFuZG9tLWxpZW4tcXVhbi1hZHMtbGEtZ2ktIj48c3BhbiBzdHlsZT0iY29sb3I6I2U3NGMzYyI+PHN0cm9uZz5OSOG6pE4gViZBZ3JhdmU7TyDEkCZBY2lyYztZPC9zdHJvbmc+PC9zcGFuPjwvYT48L3A+DQoNCjxwPjxzdHJvbmc+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPi0gUVUmWWFjdXRlOyBLSCZBYWN1dGU7Q0ggTuG7liBI4bumIEFDQyBWSVAgTEkmRWNpcmM7TiBI4buGIDwvc3Bhbj48YSBocmVmPSJodHRwczovL3d3dy5mYWNlYm9vay5jb20vbGFtYnV1dGhhaS8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMGZmIj5GQUNFQk9PSyBBRE1JTiZuYnNwOzwvc3Bhbj48L2E+xJDhu4IgU0hPVyBOSEE8L3N0cm9uZz48L3A+DQoNCjxwPjxzdHJvbmc+LSBSQU5ET00gQUNDIFRIJklncmF2ZTsgTiZFY2lyYztOIE1VQSDEkOG7piBT4buQIEzGr+G7ok5HIEPhuqZOIFRISeG6vlQgTVVBLEMmT2FjdXRlOyBUSOG7giBNVUEgxJBJIEImQWFjdXRlO04gTOG6oEkgxJDhu4IgS0nhur5NIEzhu5xJPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPi0gxJDhu4pOSCBE4bqgTkcgTE9HIDogVCZBZ3JhdmU7SSBLSE/huqJOfE3huqxUIEtI4bqoVTwvc3Ryb25nPjwvcD4NCg==', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgQ0hFQ0sgQUNDIDo8L3N0cm9uZz48L3NwYW4+PC9wPg0KDQo8cD48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIEPhuqZOIENIVeG6qE4gQuG7iiBT4bq0TiZuYnNwO0tJTkggTkdISeG7hk0sVE9PTCxDJkFhY3V0ZTtDIE3hurhPJm5ic3A7xJDhu4IgxJDhu5RJIFRIJk9jaXJjO05HIFRJTiA8L3N0cm9uZz48L3NwYW4+PHN0cm9uZz5BQ0M8L3N0cm9uZz48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+PHN0cm9uZz4sViZBZ3JhdmU7IEtJTkggTkdISeG7hk0gQuG6ok8gTeG6rFQgVCZBZ3JhdmU7SSBLSE/huqJOPC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHN0cm9uZz48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+LSBRVSZZYWN1dGU7IEtIJkFhY3V0ZTtDSCBO4buWIEjhu6YgQUNDIFZJUCBMSSZFY2lyYztOIEjhu4YgPC9zcGFuPjxhIGhyZWY9Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS9sYW1idXV0aGFpLyI+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwZmYiPkZBQ0VCT09LIEFETUlOJm5ic3A7PC9zcGFuPjwvYT7EkOG7giBTSE9XIE5IQTwvc3Ryb25nPjwvcD4NCg0KPHA+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIE4mRWNpcmM7TiBWJkFncmF2ZTtPIE5HQVkgVCZBZ3JhdmU7SSBLSE/huqJOIMSQ4buCIMSQ4buUSSBN4bqsVCBLSOG6qFUgVEgmRWNpcmM7TSBUSCZPY2lyYztORyBUSU4gS0gmT2NpcmM7TkcgTiZFY2lyYztOIMSQ4buCIEwmQWNpcmM7VTwvc3Ryb25nPjwvcD4NCg0KPHA+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIEQmSWFjdXRlO05IIEFDQyBUSCZPY2lyYztORyBUSU4gWOG6pFUgVEgmSWdyYXZlOyBDJk9hY3V0ZTsgVEjhu4IgRCZVZ3JhdmU7TkcgxJDhu4IgVEVTVCBBQ0MsVEVTVCBIQUNLLC4uLiBIQVkgQiZBYWN1dGU7TiBM4bqgSSBUUiZFY2lyYztOIEMmQWFjdXRlO0MgR1JPVVAgREnhu4ROIMSQ4bqmTiBW4buaSSBHSSZBYWN1dGU7IFLhurogS0nhur5NIEzhu5xJPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPuKdpCBDaCZ1YWN1dGU7YyBxdSZ5YWN1dGU7IGtoJmFhY3V0ZTtjaCBoJmFncmF2ZTtuZyBtYXkgbeG6r24gbmgmZWFjdXRlOyZuYnNwO+KdpDwvc3Ryb25nPjwvcD4NCg==', 13600, 8000, 5, 1, 1000000, NULL, 642, 25, 1, '2024-03-29 17:10:17', '2024-04-02 21:15:34', 'None', 3, '12', 'RANDOM LIÊN QUÂN HÀNG TTT ( CHẮN LV15)', 0, 1712848683),
(146, 0, '', 1, 'Random Acc Liên Quân Ads', 'random-acc-lien-quan-ads7', 'Hàng ads,tỷ lệ acc login được cao,tỷ lệ nổ acc vip cao,có tỷ lệ trắng thông tin - thông tin xấu,(log : garena)', 'OUZ8FB3P.png', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgTVVBIFJBTkRPTSA6PC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+LSBCJkFncmF2ZTtJIFZJ4bq+VCBLSCZBYWN1dGU7SSBRVSZBYWN1dGU7VCBW4buAIFJBTkRPTSBMSSZFY2lyYztOIFFVJkFjaXJjO04gViZBZ3JhdmU7IFJBTkRPTSBMSSZFY2lyYztOIFFVJkFjaXJjO04gQURTIDombmJzcDs8L3N0cm9uZz48L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly9yYW5kb212aWV0LmNvbS9ibG9nL3JhbmRvbS1saWVuLXF1YW4tdmEtcmFuZG9tLWxpZW4tcXVhbi1hZHMtbGEtZ2ktIj48c3BhbiBzdHlsZT0iY29sb3I6I2U3NGMzYyI+PHN0cm9uZz5OSOG6pE4gViZBZ3JhdmU7TyDEkCZBY2lyYztZPC9zdHJvbmc+PC9zcGFuPjwvYT48L3A+DQoNCjxwPjxzdHJvbmc+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPi0gUVUmWWFjdXRlOyBLSCZBYWN1dGU7Q0ggTuG7liBI4bumIEFDQyBWSVAgTEkmRWNpcmM7TiBI4buGIDwvc3Bhbj48YSBocmVmPSJodHRwczovL3d3dy5mYWNlYm9vay5jb20vbGFtYnV1dGhhaS8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMGZmIj5GQUNFQk9PSyBBRE1JTiZuYnNwOzwvc3Bhbj48L2E+xJDhu4IgU0hPVyBOSEE8L3N0cm9uZz48L3A+DQoNCjxwPjxzdHJvbmc+LSBSQU5ET00gQUNDIFRIJklncmF2ZTsgTiZFY2lyYztOIE1VQSDEkOG7piBT4buQIEzGr+G7ok5HIEPhuqZOIFRISeG6vlQgTVVBLEMmT2FjdXRlOyBUSOG7giBNVUEgxJBJIEImQWFjdXRlO04gTOG6oEkgxJDhu4IgS0nhur5NIEzhu5xJPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPi0gxJDhu4pOSCBE4bqgTkcgTE9HIDogVCZBZ3JhdmU7SSBLSE/huqJOfE3huqxUIEtI4bqoVTwvc3Ryb25nPjwvcD4NCg==', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgQ0hFQ0sgQUNDIDo8L3N0cm9uZz48L3NwYW4+PC9wPg0KDQo8cD48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIEPhuqZOIENIVeG6qE4gQuG7iiBT4bq0TiZuYnNwO0tJTkggTkdISeG7hk0sVE9PTCxDJkFhY3V0ZTtDIE3hurhPJm5ic3A7xJDhu4IgxJDhu5RJIFRIJk9jaXJjO05HIFRJTiBBQ0MsViZBZ3JhdmU7IEtJTkggTkdISeG7hk0gQuG6ok8gTeG6rFQgVCZBZ3JhdmU7SSBLSE/huqJOPC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHN0cm9uZz48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+LSBRVSZZYWN1dGU7IEtIJkFhY3V0ZTtDSCBO4buWIEjhu6YgQUNDIFZJUCBMSSZFY2lyYztOIEjhu4YgPC9zcGFuPjxhIGhyZWY9Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS9sYW1idXV0aGFpLyI+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwZmYiPkZBQ0VCT09LIEFETUlOJm5ic3A7PC9zcGFuPjwvYT7EkOG7giBTSE9XIE5IQTwvc3Ryb25nPjwvcD4NCg0KPHA+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIE4mRWNpcmM7TiBWJkFncmF2ZTtPIE5HQVkgVCZBZ3JhdmU7SSBLSE/huqJOIMSQ4buCIMSQ4buUSSBN4bqsVCBLSOG6qFUgVEgmRWNpcmM7TSBUSCZPY2lyYztORyBUSU4gS0gmT2NpcmM7TkcgTiZFY2lyYztOIMSQ4buCIEwmQWNpcmM7VTwvc3Ryb25nPjwvcD4NCg0KPHA+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIEQmSWFjdXRlO05IIEFDQyBUSCZPY2lyYztORyBUSU4gWOG6pFUgVEgmSWdyYXZlOyBDJk9hY3V0ZTsgVEjhu4IgRCZVZ3JhdmU7TkcgxJDhu4IgVEVTVCBBQ0MsVEVTVCBIQUNLLC4uLiBIQVkgQiZBYWN1dGU7TiBM4bqgSSBUUiZFY2lyYztOIEMmQWFjdXRlO0MgR1JPVVAgREnhu4ROIMSQ4bqmTiBW4buaSSBHSSZBYWN1dGU7IFLhurogS0nhur5NIEzhu5xJPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPuKdpCBDaCZ1YWN1dGU7YyBxdSZ5YWN1dGU7IGtoJmFhY3V0ZTtjaCBoJmFncmF2ZTtuZyBtYXkgbeG6r24gbmgmZWFjdXRlOyZuYnNwO+KdpDwvc3Ryb25nPjwvcD4NCg==', 3400, 2000, 20, 1, 1000000, NULL, 32646, 25, 1, '2024-03-29 17:11:20', '2024-04-02 21:13:29', 'None', 3, '7', 'RANDOM LIÊN QUÂN TK/MK LOGO GARENA', 164, 1712848683),
(202, 0, '', 1, 'Random Acc FreeFire Ads Facebook Sale', 'random-acc-freefire-ads-facebook-sale2', 'Hàng chạy ads faebook,tỷ lệ nổ acc vip ổn ,(log : facebook)', 'I46CHLBF.png', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgTVVBIFJBTkRPTSA6PC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+LSBCJkFncmF2ZTtJIFZJ4bq+VCBLSCZBYWN1dGU7SSBRVSZBYWN1dGU7VCBW4buAIFJBTkRPTSBGUkVFRklSRSBBRFMmbmJzcDs6Jm5ic3A7PC9zdHJvbmc+PC9zcGFuPjxhIGhyZWY9Imh0dHBzOi8vcmFuZG9tdmlldC5jb20vYmxvZy9yYW5kb20tZnJlZWZpcmUtYWRzLWxhLWdpLSI+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TkjhuqROIFYmQWdyYXZlO08gxJAmQWNpcmM7WTwvc3Ryb25nPjwvc3Bhbj48L2E+PC9wPg0KDQo8cD48c3Ryb25nPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMDAwIj4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIE7hu5YgSOG7piBBQ0MgVklQIExJJkVjaXJjO04gSOG7hiA8L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly93d3cuZmFjZWJvb2suY29tL2xhbWJ1dXRoYWkvIj48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDBmZiI+RkFDRUJPT0sgQURNSU4mbmJzcDs8L3NwYW4+PC9hPsSQ4buCIFNIT1cgTkhBPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPi0gUkFORE9NIEFDQyBUSCZJZ3JhdmU7IE4mRWNpcmM7TiBNVUEgxJDhu6YgU+G7kCBMxq/hu6JORyBD4bqmTiBUSEnhur5UIE1VQSxDJk9hY3V0ZTsgVEjhu4IgTVVBIMSQSSBCJkFhY3V0ZTtOIEzhuqBJIMSQ4buCIEtJ4bq+TSBM4bucSTwvc3Ryb25nPjwvcD4NCg0KPHA+PHN0cm9uZz4tIMSQ4buKTkggROG6oE5HIExPRyA6IFQmQWdyYXZlO0kgS0hP4bqiTnxN4bqsVCBLSOG6qFU8L3N0cm9uZz48L3A+DQo=', 'PHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNlNzRjM2MiPjxzdHJvbmc+TMavVSAmWWFjdXRlOyBLSEkgQ0hFQ0sgQUNDIDo8L3N0cm9uZz48L3NwYW4+PC9wPg0KDQo8cD48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMCI+PHN0cm9uZz4tIFFVJllhY3V0ZTsgS0gmQWFjdXRlO0NIIEPhuqZOIENIVeG6qE4gQuG7iiBT4bq0TiAxIMSQ4buKQSBDSOG7iCBJUCBT4bqgQ0gsS0lOSCBOR0hJ4buGTSDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIEFDQyDEkOG7giBUUiZBYWN1dGU7TkggQ0hFQ0tQT0lOVCxWJkFncmF2ZTsgQuG6ok8gTeG6rFQgVCZBZ3JhdmU7SSBLSE/huqJOPC9zdHJvbmc+PC9zcGFuPjwvcD4NCg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+LSBLSCZPY2lyYztORyDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIFQmQWdyYXZlO0kgS0hP4bqiTiBO4bq+VSBLSCZPY2lyYztORyBDJk9hY3V0ZTsgS0lOSCBOR0hJ4buGTSDEkOG7lEk8L3N0cm9uZz48L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPjxzdHJvbmc+IDwvc3Ryb25nPjwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6I2U3NGMzYyI+PHN0cm9uZz4oIFQmSWdyYXZlO00gSEnhu4JVIFRI4bqsVCBL4bu4IFRSxq/hu5pDIEtISSDEkOG7lEkgVEgmT2NpcmM7TkcgVElOIEhP4bq2QyBOSOG7nCBOR8av4bucSSBDJk9hY3V0ZTsgS0lOSCBOR0hJ4buGTSDEkOG7lEkgR0kmVWFjdXRlO1AgVFImQWFjdXRlO05IIFRSxq/hu5xORyBI4buiUCBY4bqkVSBOSOG6pFQgKTwvc3Ryb25nPjwvc3Bhbj48L3A+DQoNCjxwPjxzdHJvbmc+PHNwYW4gc3R5bGU9ImNvbG9yOiMwMDAwMDAiPi0gUVUmWWFjdXRlOyBLSCZBYWN1dGU7Q0ggTuG7liBI4bumIEFDQyBWSVAgTEkmRWNpcmM7TiBI4buGIDwvc3Bhbj48YSBocmVmPSJodHRwczovL3d3dy5mYWNlYm9vay5jb20vbGFtYnV1dGhhaS8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMGZmIj5GQUNFQk9PSyBBRE1JTiZuYnNwOzwvc3Bhbj48L2E+xJDhu4IgU0hPVyBOSEE8L3N0cm9uZz48L3A+DQoNCjxwPjxzdHJvbmc+LSBRVSZZYWN1dGU7IEtIJkFhY3V0ZTtDSCBOJkVjaXJjO04gViZBZ3JhdmU7TyBOR0FZIFQmQWdyYXZlO0kgS0hP4bqiTiDEkOG7giDEkOG7lEkgTeG6rFQgS0gmQWNpcmM7VSBUSCZFY2lyYztNIFRIJk9jaXJjO05HIFRJTiBLSCZPY2lyYztORyBOJkVjaXJjO04gxJDhu4IgTCZBY2lyYztVPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPi0gUVUmWWFjdXRlOyBLSCZBYWN1dGU7Q0ggRCZJYWN1dGU7TkggQUNDIEtIJk9jaXJjO05HIE5HT04gQyZPYWN1dGU7IFRI4buCIEQmVWdyYXZlO05HIMSQ4buCJm5ic3A7VEVTVCBBQ0MsVEVTVCBIQUNLLC4uLiBIQVkgQiZBYWN1dGU7TiBM4bqgSSBUUiZFY2lyYztOIEMmQWFjdXRlO0MgR1JPVVAgREnhu4ROIMSQ4bqmTiBW4buaSSBHSSZBYWN1dGU7IFLhurogS0nhur5NIEzhu5xJPC9zdHJvbmc+PC9wPg0KDQo8cD48c3Ryb25nPuKdpCBDaCZ1YWN1dGU7YyBxdSZ5YWN1dGU7IGtoJmFhY3V0ZTtjaCBoJmFncmF2ZTtuZyBtYXkgbeG6r24gbmgmZWFjdXRlOyZuYnNwO+KdpDwvc3Ryb25nPjwvcD4NCg==', 3400, 2000, 0, 1, 1000000, NULL, 37812, 21, 1, '2024-03-29 17:39:04', '2024-04-02 21:13:13', 'None', 3, '2', 'Free Fire Hàng ADS FB', 0, 1712848683);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_die`
--

CREATE TABLE `product_die` (
  `id` int(11) NOT NULL,
  `product_code` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seller` int(11) NOT NULL DEFAULT '0',
  `uid` text COLLATE utf8_unicode_ci,
  `account` text COLLATE utf8_unicode_ci,
  `create_gettime` datetime NOT NULL,
  `type` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_discount`
--

CREATE TABLE `product_discount` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `discount` float NOT NULL DEFAULT '0',
  `min` int(11) NOT NULL DEFAULT '0',
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_order`
--

CREATE TABLE `product_order` (
  `id` int(11) NOT NULL,
  `trans_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `product_name` text COLLATE utf8_unicode_ci,
  `buyer` int(11) NOT NULL DEFAULT '0',
  `seller` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `money` float NOT NULL DEFAULT '0',
  `pay` float NOT NULL DEFAULT '0',
  `cost` int(11) NOT NULL DEFAULT '0',
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `trash` int(11) NOT NULL DEFAULT '0',
  `refund` int(11) NOT NULL DEFAULT '0',
  `ip` text COLLATE utf8_unicode_ci,
  `device` text COLLATE utf8_unicode_ci,
  `status_view_order` int(11) NOT NULL DEFAULT '0',
  `api_transid` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_sold`
--

CREATE TABLE `product_sold` (
  `id` int(11) NOT NULL,
  `product_code` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trans_id` text COLLATE utf8_unicode_ci,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `buyer` int(11) NOT NULL DEFAULT '0',
  `seller` int(11) NOT NULL DEFAULT '0',
  `uid` text COLLATE utf8_unicode_ci,
  `account` text COLLATE utf8_unicode_ci,
  `create_gettime` datetime NOT NULL,
  `time_check_live` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_stock`
--

CREATE TABLE `product_stock` (
  `id` int(11) NOT NULL,
  `product_code` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seller` int(11) NOT NULL DEFAULT '0',
  `uid` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account` text COLLATE utf8_unicode_ci,
  `create_gettime` datetime NOT NULL,
  `type` varchar(55) COLLATE utf8_unicode_ci DEFAULT 'WEB',
  `time_check_live` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotions`
--

CREATE TABLE `promotions` (
  `id` int(11) NOT NULL,
  `min` float NOT NULL DEFAULT '0',
  `discount` float NOT NULL DEFAULT '0',
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(1, 'status_demo', '1'),
(2, 'type_password', 'bcrypt'),
(3, 'title', ''),
(4, 'description', ''),
(5, 'keywords', ''),
(6, 'author', ''),
(7, 'timezone', 'Asia/Ho_Chi_Minh'),
(8, 'email', ''),
(9, 'status', '1'),
(10, 'status_update', '1'),
(12, 'session_login', '10000000'),
(13, 'javascript_header', '<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n<link href=\"https://fonts.googleapis.com/css2?family=Saira+Semi+Condensed:wght@100;200;300;400;500;600;700;800;900&display=swap\" rel=\"stylesheet\">'),
(14, 'javascript_footer', ''),
(16, 'logo_light', 'assets/storage/images/logo_light_U5V.png'),
(17, 'logo_dark', ''),
(18, 'favicon', ''),
(19, 'image', ''),
(20, 'bg_login', 'assets/storage/images/bg_loginBYI.png'),
(21, 'bg_register', 'assets/storage/images/bg_registerMOU.png'),
(26, 'telegram_token', ''),
(27, 'telegram_chat_id', ''),
(30, 'prefix_autobank', ''),
(35, 'bank_status', '1'),
(36, 'bank_notice', ''),
(43, 'notice_home', ''),
(44, 'font_family', 'font-family: \'Saira Semi Condensed\', sans-serif;'),
(59, 'popup_status', '1'),
(60, 'popup_noti', '<p>hiiiii</p>\r\n'),
(64, 'license_key', ''),
(69, 'home_page', 'home'),
(70, 'smtp_host', 'smtp.gmail.com'),
(71, 'smtp_encryption', 'tls'),
(72, 'smtp_port', '587'),
(73, 'smtp_email', ''),
(74, 'smtp_password', ''),
(76, 'default_product_image', ''),
(77, 'status_captcha', '0'),
(78, 'crypto_note', ''),
(79, 'crypto_address', ''),
(80, 'crypto_token', ''),
(81, 'crypto_min', '10'),
(82, 'crypto_max', '100000'),
(83, 'crypto_status', '0'),
(84, 'crypto_rate', '23000'),
(85, 'reCAPTCHA_site_key', ''),
(86, 'reCAPTCHA_secret_key', ''),
(87, 'reCAPTCHA_status', '0'),
(88, 'telegram_status', '1'),
(89, 'smtp_status', '1'),
(93, 'affiliate_ck', '5'),
(94, 'affiliate_status', '1'),
(95, 'affiliate_min', '10000'),
(96, 'affiliate_banks', 'Vietcombank\r\nMBBank\r\nTechcombank'),
(97, 'affiliate_note', ''),
(98, 'affiliate_chat_id_telegram', '1048444403'),
(99, 'check_time_cron_cron2', '0'),
(100, 'bank_min', '1000'),
(101, 'bank_max', '1000000000'),
(102, 'paypal_clientId', ''),
(103, 'paypal_clientSecret', ''),
(104, 'paypal_status', '0'),
(105, 'paypal_rate', '23000'),
(108, 'paypal_note', ''),
(109, 'noti_recharge', '[{time}] <b>{username}</b> vừa nạp {amount} vào {method} thực nhận {price}.'),
(110, 'noti_action', '[{time}] \r\n- <b>Username</b>: <code>{username}</code>\r\n- <b>Action</b>:  <code>{action}</code>\r\n- <b>IP</b>: <code>{ip}</code>'),
(111, 'theme_color', '#001ca8'),
(112, 'hotline', ''),
(113, 'type_notification', 'telegram'),
(114, 'perfectmoney_status', '0'),
(115, 'perfectmoney_account', ''),
(116, 'perfectmoney_pass', ''),
(117, 'perfectmoney_rate', '23000'),
(118, 'perfectmoney_units', ''),
(119, 'perfectmoney_notice', ''),
(120, 'fanpage', ''),
(121, 'address', ''),
(122, 'toyyibpay_status', '0'),
(123, 'toyyibpay_userSecretKey', ''),
(124, 'toyyibpay_categoryCode', ''),
(125, 'toyyibpay_min', '1'),
(126, 'toyyibpay_billChargeToCustomer', '0'),
(127, 'toyyibpay_rate', '5258'),
(128, 'toyyibpay_notice', ''),
(129, 'noti_affiliate_withdraw', '[{time}] \r\n- <b>Username</b>: <code>{username}</code>\r\n- <b>Action</b>:  <code>Tạo lệnh rút {amount} về ngân hàng {bank} | {account_number} | {account_name}</code>\r\n- <b>IP</b>: <code>{ip}</code>'),
(130, 'check_time_cron_sending_email', '1712848682'),
(131, 'squadco_status', '0'),
(132, 'squadco_Secret_Key', ''),
(133, 'squadco_Public_Key', ''),
(134, 'squadco_rate', '51'),
(135, 'squadco_currency_code', 'NGN'),
(136, 'squadco_notice', ''),
(137, 'theme_color1', '#1a5e75'),
(138, 'product_photo_display', '1'),
(139, 'product_rating_display', '0'),
(140, 'product_sold_display', '1'),
(141, 'banner_singer', 'assets/storage/images/banner_singerWCV.png'),
(142, 'image_empty_state', 'assets/storage/images/image_empty_stateNPV.png'),
(143, 'copyright_footer', 'Software By <a href=\"https://www.cmsnt.co/\">CMSNT.CO</a>'),
(144, 'menu_category_right', '1'),
(145, 'crypto_trial', '5'),
(146, 'type_show_product', 'BOX_4'),
(147, 'check_time_cron_bank', '1712848682'),
(148, 'google_analytics_status', '0'),
(149, 'google_analytics_id', ''),
(150, 'card_status', '1'),
(151, 'card_partner_id', ''),
(152, 'card_partner_key', ''),
(153, 'card_ck', '20'),
(154, 'card_notice', ''),
(155, 'api_status', '1'),
(156, 'time_cron_suppliers_shopclone6', '1712848682'),
(157, 'time_cron_suppliers_api1', '1711259047'),
(158, 'language_type', 'manual'),
(159, 'gtranslate_script', '<div class=\"gtranslate_wrapper\"></div>\n<script>window.gtranslateSettings = {\"default_language\":\"vi\",\"languages\":[\"vi\",\"fr\",\"de\",\"it\",\"es\",\"zh-CN\",\"ar\",\"tr\",\"ru\",\"uk\",\"km\",\"th\",\"en\"],\"wrapper_selector\":\".gtranslate_wrapper\"}</script>\n<script src=\"https://cdn.gtranslate.net/widgets/latest/dropdown.js\" defer></script>'),
(160, 'notice_top_left', ''),
(161, 'page_contact', ''),
(162, 'page_policy', ''),
(163, 'page_faq', ''),
(164, 'page_block_ip', NULL),
(165, 'email_temp_content_warning_login', '<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"https://img.upanh.tv/2024/03/29/IMG_2099.gif\" style=\"height:150px; width:150px\" /></p>\r\n\r\n<h2 style=\"text-align:center\"><span style=\"color:#000000\"><strong>TH&Ocirc;NG B&Aacute;O ĐĂNG NHẬP</strong></span></h2>\r\n\r\n<p style=\"text-align:center\"><strong><img alt=\"\" src=\"https://img.upanh.tv/2024/03/29/lien-he-chu-dau-tu.gif.pagespeed.ce.9cZa7M_Wm6.gif\" style=\"height:40px; width:50px\" /></strong></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><strong>CH&Uacute;NG T&Ocirc;I VỪA NHẬN THẤY THIẾT BỊ&nbsp;<span style=\"color:#e74c3c\">{device}</span> ĐĂNG NHẬP V&Agrave;O T&Agrave;I KHOẢN<span style=\"color:#000000\"> CỦA QU&Yacute; KH&Aacute;CH</span>&nbsp;V&Agrave;O L&Uacute;C&nbsp;<span style=\"color:#e74c3c\">{time}</span></strong></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"color:#000000\"><strong>IP THIẾT BỊ :</strong></span><span style=\"color:#e74c3c\"><strong>&nbsp;</strong></span><span style=\"color:#e74c3c\"><strong>{ip}</strong></span></p>\r\n\r\n<hr />\r\n<p style=\"text-align:center\"><span style=\"color:#e74c3c\"><strong>Lưu &yacute; :</strong></span></p>\r\n\r\n<p style=\"text-align:center\"><strong>NẾU Đ&Oacute; KH&Ocirc;NG PHẢI L&Agrave; BẠN ĐĂNG NHẬP TH&Igrave; VUI L&Ograve;NG V&Agrave;O T&Agrave;I KHOẢN ĐỂ THAY ĐỔI MẬT KHẨU V&Agrave; BẢO MẬT T&Agrave;I KHOẢN</strong></p>\r\n'),
(166, 'email_temp_subject_warning_login', ''),
(167, 'email_temp_content_otp_mail', '<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"https://img.upanh.tv/2024/03/29/IMG_2099.gif\" style=\"height:150px; width:150px\" /></p>\r\n\r\n<h2 style=\"text-align:center\"><span style=\"color:#000000\"><strong>TH&Ocirc;NG B&Aacute;O M&Atilde; OTP ĐĂNG NHẬP</strong></span></h2>\r\n\r\n<p style=\"text-align:center\"><strong><img alt=\"\" src=\"https://img.upanh.tv/2024/03/29/lien-he-chu-dau-tu.gif.pagespeed.ce.9cZa7M_Wm6.gif\" style=\"height:40px; width:50px\" /></strong></p>\r\n\r\n<h1 style=\"text-align:center\"><span style=\"color:#000000\"><strong>M&Atilde; OTP :</strong></span><span style=\"color:#e74c3c\"><strong>&nbsp;</strong><strong>{otp}</strong></span></h1>\r\n'),
(168, 'email_temp_subject_otp_mail', ''),
(169, 'email_temp_content_forgot_password', '<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"https://img.upanh.tv/2024/03/29/IMG_2099.gif\" style=\"height:150px; width:150px\" /></p>\r\n\r\n<h2 style=\"text-align:center\"><strong><span style=\"color:#000000\">X&Aacute;C NHẬN KH&Ocirc;I PHỤC MẬT KHẨU</span></strong></h2>\r\n\r\n<p style=\"text-align:center\"><strong>Nếu bạn y&ecirc;u cầu kh&ocirc;i kh&ocirc;i phục mật khẩu, Vui l&ograve;ng nhấn v&agrave;o li&ecirc;n kết b&ecirc;n dưới để đổi mật khẩu</strong></p>\r\n\r\n<p style=\"text-align:center\"><strong><img alt=\"\" src=\"https://img.upanh.tv/2024/03/29/lien-he-chu-dau-tu.gif.pagespeed.ce.9cZa7M_Wm6.gif\" style=\"height:40px; width:50px\" /></strong></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"color:#e74c3c\"><strong>{li&ecirc;n kết}</strong></span></p>\r\n\r\n<hr />\r\n<p style=\"text-align:center\"><span style=\"color:#e74c3c\"><strong>Lưu &yacute; :</strong></span></p>\r\n\r\n<p style=\"text-align:center\"><strong>NẾU BẠN KH&Ocirc;NG Y&Ecirc;U CẦU KH&Ocirc;I PHỤC MẬT KHẨU TH&Igrave; VUI L&Ograve;NG BỎ QUA HỘP THƯ N&Agrave;Y</strong></p>\r\n'),
(170, 'email_temp_subject_forgot_password', ''),
(171, 'time_cron_suppliers_api6', '1710443639'),
(172, 'time_cron_checklive_clone', '1710654841'),
(173, 'time_cron_checklive_hotmail', '1710668914'),
(174, 'product_hide_outstock', '0'),
(175, 'time_cron_suppliers_api14', '1710930652'),
(176, 'max_show_product_home', '10'),
(177, 'email_temp_content_buy_order', '<p style=\"text-align:center\"><span style=\"color:#e74c3c\"><strong>CẢM ƠN QU&Yacute; KH&Aacute;CH Đ&Atilde; SỬ DỤNG DỊCH VỤ&nbsp;CỦA CH&Uacute;NG T&Ocirc;I</strong></span></p>\r\n\r\n<hr />\r\n<p style=\"text-align:center\"><strong><img alt=\"\" src=\"https://img.upanh.tv/2024/03/29/tich-xanh-icon.png\" style=\"height:20px; width:20px\" />CH&Uacute;NG T&Ocirc;I XIN TH&Ocirc;NG B&Aacute;O ĐƠN H&Agrave;NG&nbsp;{trans_id} Đ&Atilde; ĐƯỢC MUA TH&Agrave;NH C&Ocirc;NG</strong></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"color:#e74c3c\"><strong>TH&Ocirc;NG TIN ĐƠN H&Agrave;NG :</strong></span></p>\r\n\r\n<p style=\"text-align:center\"><strong>T&Ecirc;N SẢN PHẨM :&nbsp;{product}&nbsp;</strong></p>\r\n\r\n<p style=\"text-align:center\"><strong>SỐ LƯỢNG Đ&Atilde; MUA :&nbsp;{amount}</strong></p>\r\n\r\n<p style=\"text-align:center\"><strong>M&Atilde; ĐƠN H&Agrave;NG :&nbsp;{trans_id}</strong></p>\r\n\r\n<p style=\"text-align:center\"><strong>SỐ TIỀN Đ&Atilde; THANH TO&Aacute;N : {pay}</strong></p>\r\n\r\n<hr />\r\n<p style=\"text-align:center\"><span style=\"color:#e74c3c\"><strong>Lưu &yacute; :</strong></span></p>\r\n\r\n<p style=\"text-align:center\"><strong>NẾU ĐƠN H&Agrave;NG KH&Ocirc;NG PHẢI DO BẠN MUA H&Atilde;Y ĐỔI MẬT KHẨU V&Agrave; BẢO MẬT T&Agrave;I KHOẢN&nbsp;</strong></p>\r\n'),
(178, 'email_temp_subject_buy_order', ''),
(179, 'time_cron_suppliers_shopclone7', '0'),
(180, 'time_cron_suppliers_api18', '0'),
(181, 'avatar', 'assets/storage/images/avatarHGX.png'),
(182, 'check_time_cron_momo', '1712848683'),
(183, 'momo_number', ''),
(184, 'momo_name', ''),
(185, 'momo_token', ''),
(186, 'momo_notice', ''),
(187, 'momo_status', '0'),
(188, 'script_footer_admin', ''),
(189, 'time_cron_suppliers_api19', '0'),
(190, 'cot_so_du_ben_phai', '1'),
(191, 'time_cron_suppliers_api4', '0'),
(192, 'status_giao_dich_gan_day', '1'),
(193, 'content_gd_mua_gan_day', '<b style=\"color: green;\">...{username}</b> mua <b style=\"color: red;\">{amount}</b> <b>{product_name}</b> với giá <b style=\"color:blue;\">{price}</b>'),
(194, 'content_gd_nap_tien_gan_day', '<b style=\"color: green;\">...{username}</b> thực hiện nạp <b style=\"color:blue;\">{amount}</b> bằng <b style=\"color:red;\">{method}</b> thực nhận <b style=\"color:blue;\">{received}</b>'),
(195, 'status_tao_gd_ao', '1'),
(196, 'sl_mua_toi_thieu_gd_ao', '1'),
(197, 'sl_mua_toi_da_gd_ao', '100'),
(198, 'toc_do_gd_mua_ao', '5'),
(199, 'menh_gia_nap_ao_ngau_nhien', '10000\r\n20000\r\n40000\r\n50000\r\n60000\r\n70000\r\n100000\r\n200000\r\n300000\r\n500000\r\n400000\r\n40000\r\n15000\r\n25000\r\n35000\r\n45000\r\n55000\r\n65000\r\n45000\r\n100000\r\n1500000\r\n200000'),
(200, 'toc_do_gd_nap_ao', '5'),
(201, 'method_nap_ao', 'ACB\r\nMOMO\r\nThẻ cào'),
(202, 'tao_gd_ao_sp_het_hang', '0'),
(203, 'check_time_cron_cron', '1713612735'),
(204, 'blog_status', '1'),
(205, 'cong_tien_nguoi_ban', '0'),
(206, 'noti_buy_product', '[{time}] <b>{username}</b> vừa mua {amount} tài khoản {product} với giá {pay} - #{trans_id}'),
(207, 'check_time_cron_task', '0'),
(208, 'thoi_gian_mua_cach_nhau', '3');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` text COLLATE utf8_unicode_ci,
  `domain` text COLLATE utf8_unicode_ci,
  `username` text COLLATE utf8_unicode_ci,
  `password` text COLLATE utf8_unicode_ci,
  `api_key` text COLLATE utf8_unicode_ci,
  `token` text COLLATE utf8_unicode_ci,
  `coupon` text COLLATE utf8_unicode_ci,
  `price` text COLLATE utf8_unicode_ci,
  `discount` float NOT NULL DEFAULT '0',
  `update_name` text COLLATE utf8_unicode_ci,
  `update_price` text COLLATE utf8_unicode_ci,
  `roundMoney` varchar(55) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ON',
  `status` int(11) NOT NULL DEFAULT '1',
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `translate`
--

CREATE TABLE `translate` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `name` longtext COLLATE utf8_unicode_ci,
  `value` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `translate`
--

INSERT INTO `translate` (`id`, `lang_id`, `name`, `value`) VALUES
(1, 1, 'Vui lòng nhập username', 'Vui lòng nhập username'),
(2, 2, 'Vui lòng nhập username', 'Please enter username'),
(3, 1, 'Vui lòng nhập mật khẩu', 'Vui lòng nhập mật khẩu'),
(4, 2, 'Vui lòng nhập mật khẩu', 'Please enter a password'),
(5, 1, 'Vui lòng xác minh Captcha', 'Vui lòng xác minh Captcha'),
(6, 2, 'Vui lòng xác minh Captcha', 'Please verify Captcha'),
(7, 1, 'Thông tin đăng nhập không chính xác', 'Thông tin đăng nhập không chính xác'),
(8, 2, 'Thông tin đăng nhập không chính xác', 'Login information is incorrect'),
(9, 1, 'Vui lòng nhập địa chỉ Email', 'Vui lòng nhập địa chỉ Email'),
(10, 2, 'Vui lòng nhập địa chỉ Email', 'Please enter your email address'),
(11, 1, 'Vui lòng nhập lại mật khẩu', 'Vui lòng nhập lại mật khẩu'),
(12, 2, 'Vui lòng nhập lại mật khẩu', 'Please re-enter your password'),
(13, 1, 'Xác minh mật khẩu không chính xác', 'Xác minh mật khẩu không chính xác'),
(14, 2, 'Xác minh mật khẩu không chính xác', 'Verify password is incorrect'),
(15, 1, 'Tên đăng nhập đã tồn tại trong hệ thống', 'Tên đăng nhập đã tồn tại trong hệ thống'),
(16, 2, 'Tên đăng nhập đã tồn tại trong hệ thống', 'Username already exists in the system'),
(17, 1, 'Địa chỉ email đã tồn tại trong hệ thống', 'Địa chỉ email đã tồn tại trong hệ thống'),
(18, 2, 'Địa chỉ email đã tồn tại trong hệ thống', 'Email address already exists in the system'),
(19, 1, 'IP của bạn đã đạt đến giới hạn tạo tài khoản cho phép', 'IP của bạn đã đạt đến giới hạn tạo tài khoản cho phép'),
(20, 2, 'IP của bạn đã đạt đến giới hạn tạo tài khoản cho phép', 'Your IP has reached the allowable account creation limit'),
(21, 1, 'Đăng ký thành công!', 'Đăng ký thành công!'),
(22, 2, 'Đăng ký thành công!', 'Sign Up Success!'),
(23, 1, 'Tạo tài khoản không thành công, vui lòng thử lại', 'Tạo tài khoản không thành công, vui lòng thử lại'),
(24, 2, 'Tạo tài khoản không thành công, vui lòng thử lại', 'Account creation failed, please try again'),
(25, 1, 'Vui lòng đăng nhập', 'Vui lòng đăng nhập'),
(26, 2, 'Vui lòng đăng nhập', 'please log in'),
(27, 1, 'Lưu thành công', 'Lưu thành công'),
(28, 2, 'Lưu thành công', 'Save successfully'),
(29, 1, 'Lưu thất bại', 'Lưu thất bại'),
(30, 2, 'Lưu thất bại', 'Save failed'),
(31, 1, 'Vui lòng nhập mật khẩu hiện tại', 'Vui lòng nhập mật khẩu hiện tại'),
(32, 2, 'Vui lòng nhập mật khẩu hiện tại', 'Please enter your current password'),
(33, 1, 'Vui lòng nhập mật khẩu mới', 'Vui lòng nhập mật khẩu mới'),
(34, 2, 'Vui lòng nhập mật khẩu mới', 'Please enter a new password'),
(35, 1, 'Mật khẩu mới quá ngắn', 'Mật khẩu mới quá ngắn'),
(36, 2, 'Mật khẩu mới quá ngắn', 'New password is too short'),
(37, 1, 'Xác nhận mật khẩu không chính xác', 'Xác nhận mật khẩu không chính xác'),
(38, 2, 'Xác nhận mật khẩu không chính xác', 'Confirm password is incorrect'),
(39, 1, 'Mật khẩu hiện tại không đúng', 'Mật khẩu hiện tại không đúng'),
(40, 2, 'Mật khẩu hiện tại không đúng', 'Current password is incorrect'),
(41, 1, 'Địa chỉ Email này không tồn tại trong hệ thống', 'Địa chỉ Email này không tồn tại trong hệ thống'),
(42, 2, 'Địa chỉ Email này không tồn tại trong hệ thống', 'This email address does not exist in the system'),
(43, 1, 'Vui lòng thử lại trong ít phút', 'Vui lòng thử lại trong ít phút'),
(44, 2, 'Vui lòng thử lại trong ít phút', 'Please try again in a few minutes'),
(45, 1, 'Nếu bạn yêu cầu đặt lại mật khẩu, vui lòng nhấp vào liên kết bên dưới để xác minh.', 'Nếu bạn yêu cầu đặt lại mật khẩu, vui lòng nhấp vào liên kết bên dưới để xác minh.'),
(46, 2, 'Nếu bạn yêu cầu đặt lại mật khẩu, vui lòng nhấp vào liên kết bên dưới để xác minh.', 'If you require a password reset, please click the link below to verify.'),
(47, 1, 'Nếu không phải là bạn, vui lòng liên hệ ngay với Quản trị viên của bạn để được hỗ trợ về bảo mật.', 'Nếu không phải là bạn, vui lòng liên hệ ngay với Quản trị viên của bạn để được hỗ trợ về bảo mật.'),
(48, 2, 'Nếu không phải là bạn, vui lòng liên hệ ngay với Quản trị viên của bạn để được hỗ trợ về bảo mật.', 'If not you, please contact your Administrator immediately for security assistance.'),
(49, 1, 'Xác nhận tìm mật khẩu website', 'Xác nhận tìm mật khẩu website'),
(50, 2, 'Xác nhận tìm mật khẩu website', 'Confirm to find the website password'),
(51, 1, 'Xác nhận khôi phục mật khẩu', 'Xác nhận khôi phục mật khẩu'),
(52, 2, 'Xác nhận khôi phục mật khẩu', 'Confirm Password Recovery'),
(53, 1, 'Vui lòng kiểm tra Email của bạn để hoàn tất quá trình đặt lại mật khẩu', 'Vui lòng kiểm tra Email của bạn để hoàn tất quá trình đặt lại mật khẩu'),
(54, 2, 'Vui lòng kiểm tra Email của bạn để hoàn tất quá trình đặt lại mật khẩu', 'Please check your Email to complete the password reset process'),
(55, 1, 'Có lỗi hệ thống, vui lòng liên hệ Developer', 'Có lỗi hệ thống, vui lòng liên hệ Developer'),
(56, 2, 'Có lỗi hệ thống, vui lòng liên hệ Developer', 'There is a system error, please contact Developer'),
(57, 1, 'Liên kết không tồn tại', 'Liên kết không tồn tại'),
(58, 2, 'Liên kết không tồn tại', 'Link does not exist'),
(59, 1, 'Thay đổi mật khẩu thành công', 'Thay đổi mật khẩu thành công'),
(60, 2, 'Thay đổi mật khẩu thành công', 'Change password successfully'),
(61, 1, 'Thay đổi mật khẩu thất bại', 'Thay đổi mật khẩu thất bại'),
(62, 2, 'Thay đổi mật khẩu thất bại', 'Password change failed'),
(63, 1, 'Hồ sơ của bạn', 'Hồ sơ của bạn'),
(64, 2, 'Hồ sơ của bạn', 'Your Profile'),
(65, 1, 'Tên đăng nhập', 'Tên đăng nhập'),
(66, 2, 'Tên đăng nhập', 'Username'),
(67, 1, 'Địa chỉ Email', 'Địa chỉ Email'),
(68, 2, 'Địa chỉ Email', 'Email address'),
(69, 1, 'Số điện thoại', 'Số điện thoại'),
(70, 2, 'Số điện thoại', 'Phone number'),
(71, 1, 'Họ và Tên', 'Họ và Tên'),
(72, 2, 'Họ và Tên', 'Full name'),
(73, 1, 'Địa chỉ IP', 'Địa chỉ IP'),
(74, 2, 'Địa chỉ IP', 'IP address'),
(75, 1, 'Thiết bị', 'Thiết bị'),
(76, 2, 'Thiết bị', 'Device'),
(77, 1, 'Đăng ký vào lúc', 'Đăng ký vào lúc'),
(78, 2, 'Đăng ký vào lúc', 'Sign up at'),
(79, 1, 'Đăng nhập gần nhất', 'Đăng nhập gần nhất'),
(80, 2, 'Đăng nhập gần nhất', 'Last login'),
(81, 1, 'Chỉnh sửa thông tin', 'Chỉnh sửa thông tin'),
(82, 2, 'Chỉnh sửa thông tin', 'Edit information'),
(83, 1, 'Thay đổi mật khẩu', 'Thay đổi mật khẩu'),
(84, 2, 'Thay đổi mật khẩu', 'Change password'),
(85, 1, 'Thay đổi mật khẩu đăng nhập của bạn là một cách dễ dàng để giữ an toàn cho tài khoản của bạn.', 'Thay đổi mật khẩu đăng nhập của bạn là một cách dễ dàng để giữ an toàn cho tài khoản của bạn.'),
(86, 2, 'Thay đổi mật khẩu đăng nhập của bạn là một cách dễ dàng để giữ an toàn cho tài khoản của bạn.', 'Changing your login password is an easy way to keep your account secure.'),
(87, 1, 'Mật khẩu hiện tại', 'Mật khẩu hiện tại'),
(88, 2, 'Mật khẩu hiện tại', 'Current password'),
(89, 1, 'Mật khẩu mới', 'Mật khẩu mới'),
(90, 2, 'Mật khẩu mới', 'New password'),
(91, 1, 'Nhập lại mật khẩu mới', 'Nhập lại mật khẩu mới'),
(92, 2, 'Nhập lại mật khẩu mới', 'Re-verify new password'),
(93, 1, 'Cập Nhật', 'Cập Nhật'),
(94, 2, 'Cập Nhật', 'Update'),
(95, 1, 'Đăng Xuất', 'Đăng Xuất'),
(96, 2, 'Đăng Xuất', 'Logout'),
(97, 1, 'Bạn có chắc không?', 'Bạn có chắc không?'),
(98, 2, 'Bạn có chắc không?', 'Are you sure?'),
(99, 1, 'Bạn sẽ bị đăng xuất khỏi tài khoản khi nhấn Đồng Ý', 'Bạn sẽ bị đăng xuất khỏi tài khoản khi nhấn Đồng Ý'),
(100, 2, 'Bạn sẽ bị đăng xuất khỏi tài khoản khi nhấn Đồng Ý', 'You will be posted from the account when click Okey'),
(101, 1, 'Đồng ý', 'Đồng ý'),
(102, 2, 'Đồng ý', 'Okey'),
(103, 1, 'Huỷ bỏ', 'Huỷ bỏ'),
(104, 2, 'Huỷ bỏ', 'Cancel'),
(105, 1, 'Đăng Nhập', 'Đăng Nhập'),
(106, 2, 'Đăng Nhập', 'Sign In'),
(107, 1, 'Vui Lòng Đăng Nhập Để Tiếp Tục', 'Vui Lòng Đăng Nhập Để Tiếp Tục'),
(108, 2, 'Vui Lòng Đăng Nhập Để Tiếp Tục', 'Please Login To Continue'),
(109, 1, 'Quên mật khẩu', 'Quên mật khẩu'),
(110, 2, 'Quên mật khẩu', 'Forgot password'),
(111, 1, 'Bạn quên mật khẩu?', 'Bạn quên mật khẩu?'),
(112, 2, 'Bạn quên mật khẩu?', 'Forgot your password?'),
(113, 1, 'Vui lòng nhập thông tin vào ô dưới đây để xác minh', 'Vui lòng nhập thông tin vào ô dưới đây để xác minh'),
(114, 2, 'Vui lòng nhập thông tin vào ô dưới đây để xác minh', 'Please enter information in the box below to verify'),
(115, 1, 'Xác minh', 'Xác minh'),
(116, 2, 'Xác minh', 'Verification'),
(117, 1, 'Bạn đã có tài khoản?', 'Bạn đã có tài khoản?'),
(118, 2, 'Bạn đã có tài khoản?', 'Do you already have an account?'),
(119, 1, 'Ghi nhớ tôi', 'Ghi nhớ tôi'),
(120, 2, 'Ghi nhớ tôi', 'Remember'),
(121, 1, 'Quên mật khẩu?', 'Quên mật khẩu?'),
(122, 2, 'Quên mật khẩu?', 'Forgot password?'),
(123, 1, 'Bạn chưa có tài khoản?', 'Bạn chưa có tài khoản?'),
(124, 2, 'Bạn chưa có tài khoản?', 'Do not have an account?'),
(125, 1, 'Đăng Ký Ngay', 'Đăng Ký Ngay'),
(126, 2, 'Đăng Ký Ngay', 'Register'),
(127, 1, 'Nạp tiền', 'Nạp tiền'),
(128, 2, 'Nạp tiền', 'Recharge'),
(129, 1, 'Ngân hàng', 'Ngân hàng'),
(130, 2, 'Ngân hàng', 'Bank'),
(131, 1, 'Ví của tôi', 'Ví của tôi'),
(132, 2, 'Ví của tôi', 'My Wallet'),
(133, 1, 'Số dư hiện tại', 'Số dư hiện tại'),
(134, 2, 'Số dư hiện tại', 'Current balance'),
(135, 1, 'Tổng tiền nạp', 'Tổng tiền nạp'),
(136, 2, 'Tổng tiền nạp', 'Total Deposit'),
(137, 1, 'Số dư đã sử dụng', 'Số dư đã sử dụng'),
(138, 2, 'Số dư đã sử dụng', 'Used Balance'),
(139, 1, 'THANH TOÁN', 'Thanh toán'),
(141, 1, 'Lưu ý nạp tiền', 'Lưu ý nạp tiền'),
(142, 2, 'Lưu ý nạp tiền', 'Recharge note'),
(143, 1, 'Lịch sử nạp tiền', 'Lịch sử nạp tiền'),
(144, 2, 'Lịch sử nạp tiền', 'Recharge History'),
(145, 1, 'Số tài khoản:', 'Số tài khoản:'),
(146, 2, 'Số tài khoản:', 'Account number:'),
(147, 1, 'Chủ tài khoản:', 'Chủ tài khoản:'),
(148, 2, 'Chủ tài khoản:', 'Account name:'),
(149, 1, 'Ngân hàng:', 'Ngân hàng:'),
(150, 2, 'Ngân hàng:', 'Bank:'),
(151, 1, 'Nội dung chuyển khoản:', 'Nội dung chuyển khoản:'),
(152, 2, 'Nội dung chuyển khoản:', 'Transfer content:'),
(153, 1, 'Mã giao dịch', 'Mã giao dịch'),
(154, 2, 'Mã giao dịch', 'Transaction'),
(155, 1, 'Nội dung', 'Nội dung'),
(156, 2, 'Nội dung', 'Content'),
(157, 1, 'Số tiền nạp', 'Số tiền nạp'),
(158, 2, 'Số tiền nạp', 'Amount'),
(159, 1, 'Thực nhận', 'Thực nhận'),
(160, 2, 'Thực nhận', 'Received'),
(161, 1, 'Thời gian', 'Thời gian'),
(162, 2, 'Thời gian', 'Time'),
(163, 1, 'Trạng thái', 'Trạng thái'),
(164, 2, 'Trạng thái', 'Status'),
(165, 1, 'Đã thanh toán', 'Đã thanh toán'),
(166, 2, 'Đã thanh toán', 'Paid'),
(167, 1, 'Tất cả', 'Tất cả'),
(168, 2, 'Tất cả', 'ALL'),
(169, 1, 'Hôm nay', 'Hôm nay'),
(170, 2, 'Hôm nay', 'Today'),
(171, 1, 'Tuần này', 'Tuần này'),
(172, 2, 'Tuần này', 'This week'),
(173, 1, 'Tháng này', 'Tháng này'),
(174, 2, 'Tháng này', 'This month'),
(175, 1, 'Đã thanh toán:', 'Đã thanh toán:'),
(176, 2, 'Đã thanh toán:', 'Paid:'),
(177, 1, 'Thực nhận:', 'Thực nhận:'),
(178, 2, 'Thực nhận:', 'Received:'),
(179, 1, 'Thao tác', 'Thao tác'),
(180, 2, 'Thao tác', 'Action'),
(181, 1, 'Nhật ký hoạt động', 'Nhật ký hoạt động'),
(182, 2, 'Nhật ký hoạt động', 'Activity Log'),
(183, 1, 'Tìm kiếm', 'Tìm kiếm'),
(184, 2, 'Tìm kiếm', 'Search'),
(185, 1, 'Bỏ lọc', 'Bỏ lọc'),
(186, 2, 'Bỏ lọc', 'Clear Filter'),
(187, 1, 'Hiển thị', 'Hiển thị'),
(188, 2, 'Hiển thị', 'Show'),
(189, 1, 'Ẩn', 'Ẩn'),
(190, 2, 'Ẩn', 'Hide'),
(191, 1, 'Biến động số dư', 'Biến động số dư'),
(192, 2, 'Biến động số dư', 'Transactions'),
(193, 1, 'Số dư ban đầu', 'Số dư ban đầu'),
(194, 2, 'Số dư ban đầu', 'Initial balance'),
(195, 1, 'Số dư thay đổi', 'Số dư thay đổi'),
(196, 2, 'Số dư thay đổi', 'Balance change'),
(197, 1, 'Lý do', 'Lý do'),
(198, 2, 'Lý do', 'Reason'),
(199, 1, 'Chọn thời gian cần tìm', 'Chọn thời gian cần tìm'),
(200, 2, 'Chọn thời gian cần tìm', 'Choose a time to search'),
(203, 2, 'Hiển thị thêm', 'Show more'),
(204, 1, 'Hiển thị thêm', 'Hiển thị thêm'),
(205, 1, 'Ẩn bớt', 'Ẩn bớt'),
(206, 2, 'Ẩn bớt', 'Hide'),
(207, 1, 'Nội dung chuyển khoản', 'Nội dung chuyển khoản'),
(208, 2, 'Nội dung chuyển khoản', 'Transfer contents'),
(209, 1, 'Đăng nhập bằng Google', 'Đăng nhập bằng Google'),
(210, 2, 'Đăng nhập bằng Google', 'Login with Google'),
(211, 1, 'Đăng nhập bằng Facebook', 'Đăng nhập bằng Facebook'),
(212, 2, 'Đăng nhập bằng Facebook', 'Login with Google'),
(213, 1, 'Đăng ký tài khoản', 'Đăng ký tài khoản'),
(214, 2, 'Đăng ký tài khoản', 'Sign up for an account'),
(215, 1, 'Tài khoản đăng nhập', 'Tài khoản đăng nhập'),
(216, 2, 'Tài khoản đăng nhập', 'Username'),
(217, 1, 'Mật khẩu', 'Mật khẩu'),
(218, 2, 'Mật khẩu', 'Password'),
(219, 1, 'Nhập lại mật khẩu', 'Nhập lại mật khẩu'),
(220, 2, 'Nhập lại mật khẩu', 'Confirm password'),
(221, 1, 'Đăng Ký', 'Đăng Ký'),
(222, 2, 'Đăng Ký', 'Register'),
(223, 1, 'Vui lòng nhập thông tin đăng ký', 'Vui lòng nhập thông tin đăng ký'),
(224, 2, 'Vui lòng nhập thông tin đăng ký', 'Please enter registration information'),
(225, 1, 'Vui lòng nhập thông tin đăng nhập', 'Vui lòng nhập thông tin đăng nhập'),
(226, 2, 'Vui lòng nhập thông tin đăng nhập', 'Please enter login information'),
(227, 1, 'Thông tin cá nhân', 'Thông tin cá nhân'),
(228, 2, 'Thông tin cá nhân', 'Personal information'),
(229, 1, 'Cấu hình nạp tiền Crypto', 'Cấu hình nạp tiền Crypto'),
(230, 2, 'Cấu hình nạp tiền Crypto', 'Configuration Recharge Crypto'),
(231, 1, 'All Time', 'All Time'),
(232, 2, 'All Time', 'Toàn thời gian'),
(235, 1, 'Thống kê thanh toán tháng', 'Thống kê thanh toán tháng'),
(236, 2, 'Thống kê thanh toán tháng', 'Payment Statistics Month'),
(237, 1, 'Lịch sử nạp tiền Crypto', 'Lịch sử nạp tiền Crypto'),
(238, 2, 'Lịch sử nạp tiền Crypto', 'Crypto Deposit History'),
(239, 1, 'Thống kê', 'Thống kê'),
(240, 2, 'Thống kê', 'Statistical'),
(241, 1, 'Cấu hình', 'Cấu hình'),
(242, 2, 'Cấu hình', 'Configuration'),
(243, 1, 'Nạp tối đa', 'Nạp tối đa'),
(244, 2, 'Nạp tối đa', 'Maximum deposit amount'),
(245, 1, 'Nạp tối thiểu', 'Nạp tối thiểu'),
(246, 2, 'Nạp tối thiểu', 'Minimum deposit amount'),
(247, 1, 'Nạp tiền bằng Crypto', 'Nạp tiền bằng Crypto'),
(248, 2, 'Nạp tiền bằng Crypto', 'Deposit with Crypto'),
(249, 1, 'Lưu ý', 'Lưu ý'),
(250, 2, 'Lưu ý', 'Note'),
(251, 1, 'Lịch sử nạp Crypto', 'Lịch sử nạp Crypto'),
(252, 2, 'Lịch sử nạp Crypto', 'Crypto Deposit History'),
(253, 1, 'Số lượng', 'Số lượng'),
(254, 2, 'Số lượng', 'Amount'),
(255, 1, 'Thời gian tạo', 'Thời gian tạo'),
(256, 2, 'Thời gian tạo', 'Create date'),
(257, 1, 'Xem thêm', 'Xem thêm'),
(258, 2, 'Xem thêm', 'See more'),
(259, 1, 'The minimum deposit amount is:', 'The minimum deposit amount is:'),
(261, 1, 'Số tiền gửi tối đa là:', 'Số tiền gửi tối đa là:'),
(262, 2, 'Số tiền gửi tối đa là:', 'The maximum deposit amount is:'),
(263, 1, 'Số tiền gửi tối thiểu là:', 'Số tiền gửi tối thiểu là:'),
(264, 2, 'Số tiền gửi tối thiểu là:', 'The minimum deposit amount is:'),
(265, 1, 'Chức năng này đang được bảo trì', 'Chức năng này đang được bảo trì'),
(266, 2, 'Chức năng này đang được bảo trì', 'This function is under maintenance'),
(267, 1, 'Không thể tạo hóa đơn do lỗi API, vui lòng thử lại sau', 'Không thể tạo hóa đơn do lỗi API, vui lòng thử lại sau'),
(268, 2, 'Không thể tạo hóa đơn do lỗi API, vui lòng thử lại sau', 'Invoice could not be generated due to API error, please try again later'),
(269, 1, 'Tạo hoá đơn nạp tiền thành công', 'Tạo hoá đơn nạp tiền thành công'),
(270, 2, 'Tạo hoá đơn nạp tiền thành công', 'Deposit request created successfully'),
(271, 1, 'Nạp tiền bằng PayPal', 'Nạp tiền bằng PayPal'),
(272, 2, 'Nạp tiền bằng PayPal', 'Pay with PayPal'),
(273, 1, 'Lịch sử nạp PayPal', 'Lịch sử nạp PayPal'),
(274, 2, 'Lịch sử nạp PayPal', 'PayPal Recharge History'),
(275, 1, 'Số tiền gửi', 'Số tiền gửi'),
(276, 2, 'Số tiền gửi', 'Amount'),
(277, 1, 'Vui lòng nhập số tiền cần nạp', 'Vui lòng nhập số tiền cần nạp'),
(278, 2, 'Vui lòng nhập số tiền cần nạp', 'Please enter the amount to deposit'),
(279, 1, 'Mặc định', 'Mặc định'),
(280, 2, 'Mặc định', 'Default'),
(281, 1, 'Phổ biến', 'Phổ biến'),
(282, 2, 'Phổ biến', 'Popular'),
(283, 1, 'Tìm kiếm bài viết', 'Tìm kiếm bài viết'),
(284, 2, 'Tìm kiếm bài viết', 'Find Blogs'),
(285, 1, 'Bài viết phổ biến', 'Bài viết phổ biến'),
(286, 2, 'Bài viết phổ biến', 'Popular Feeds'),
(287, 1, 'Liên kết giới thiệu của bạn', 'Liên kết giới thiệu của bạn'),
(288, 2, 'Liên kết giới thiệu của bạn', 'Your referral link'),
(289, 1, 'Đã sao chép vào bộ nhớ tạm', 'Đã sao chép vào bộ nhớ tạm'),
(290, 2, 'Đã sao chép vào bộ nhớ tạm', 'Copied to clipboard'),
(291, 1, 'Số tài khoản', 'Số tài khoản'),
(292, 2, 'Số tài khoản', 'Account number'),
(293, 1, 'Tên chủ tài khoản', 'Tên chủ tài khoản'),
(294, 2, 'Tên chủ tài khoản', 'Account name'),
(295, 1, 'Số tiền cần rút', 'Số tiền cần rút'),
(296, 2, 'Số tiền cần rút', 'Amount to withdraw'),
(297, 1, 'Rút số dư hoa hồng', 'Rút số dư hoa hồng'),
(298, 2, 'Rút số dư hoa hồng', 'Affiliate Withdraw'),
(299, 1, 'Lịch sử rút tiền', 'Lịch sử rút tiền'),
(300, 2, 'Lịch sử rút tiền', 'Withdraw history'),
(301, 1, 'Rút tiền', 'Rút tiền'),
(302, 2, 'Rút tiền', 'Withdraw'),
(303, 1, 'Lịch sử', 'Lịch sử'),
(304, 2, 'Lịch sử', 'History'),
(305, 1, 'Thao tác quá nhanh, vui lòng chờ', 'Thao tác quá nhanh, vui lòng chờ'),
(306, 2, 'Thao tác quá nhanh, vui lòng chờ', 'You are working too fast, please wait'),
(307, 1, 'Vui lòng chọn ngân hàng cần rút', 'Vui lòng chọn ngân hàng cần rút'),
(308, 2, 'Vui lòng chọn ngân hàng cần rút', 'Please select the bank to withdraw'),
(309, 1, 'Vui lòng nhập số tài khoản cần rút', 'Vui lòng nhập số tài khoản cần rút'),
(310, 2, 'Vui lòng nhập số tài khoản cần rút', 'Please enter the account number to withdraw'),
(311, 1, 'Vui lòng nhập tên chủ tài khoản', 'Vui lòng nhập tên chủ tài khoản'),
(312, 2, 'Vui lòng nhập tên chủ tài khoản', 'Please enter the account name'),
(313, 1, 'Vui lòng nhập số tiền cần rút', 'Vui lòng nhập số tiền cần rút'),
(314, 2, 'Vui lòng nhập số tiền cần rút', 'Please enter the amount to withdraw'),
(315, 1, 'Số tiền rút tối thiểu phải là', 'Số tiền rút tối thiểu phải là'),
(316, 2, 'Số tiền rút tối thiểu phải là', 'Minimum withdrawal amount should be'),
(317, 1, 'Số dư hoa hồng khả dụng của bạn không đủ', 'Số dư hoa hồng khả dụng của bạn không đủ'),
(318, 2, 'Số dư hoa hồng khả dụng của bạn không đủ', 'Your available commission balance is not enough'),
(319, 1, 'Gian lận khi rút số dư hoa hồng', 'Gian lận khi rút số dư hoa hồng'),
(320, 2, 'Gian lận khi rút số dư hoa hồng', 'Fraud when withdrawing commission balance'),
(321, 1, 'Tài khoản của bạn đã bị khóa vì gian lận', 'Tài khoản của bạn đã bị khóa vì gian lận'),
(322, 2, 'Tài khoản của bạn đã bị khóa vì gian lận', 'Your account has been blocked for cheating'),
(323, 1, 'Yêu cầu rút tiền được tạo thành công, vui lòng đợi ADMIN xử lý', 'Yêu cầu rút tiền được tạo thành công, vui lòng đợi ADMIN xử lý'),
(324, 2, 'Yêu cầu rút tiền được tạo thành công, vui lòng đợi ADMIN xử lý', 'Withdrawal request created successfully, please wait for ADMIN to process'),
(325, 1, 'Số tiền rút', 'Số tiền rút'),
(326, 2, 'Số tiền rút', 'Withdrawal amount'),
(327, 1, 'Thông kê của bạn', 'Thông kê của bạn'),
(328, 2, 'Thông kê của bạn', 'Your stats'),
(329, 1, 'Số tiền hoa hồng khả dụng', 'Số tiền hoa hồng khả dụng'),
(330, 2, 'Số tiền hoa hồng khả dụng', 'Amount of available commission'),
(331, 1, 'Tổng số tiền hoa hồng đã nhận', 'Tổng số tiền hoa hồng đã nhận'),
(332, 2, 'Tổng số tiền hoa hồng đã nhận', 'Total commission received'),
(333, 1, 'Số lần nhấp vào liên kết', 'Số lần nhấp vào liên kết'),
(334, 2, 'Số lần nhấp vào liên kết', 'Clicks'),
(335, 1, 'Lịch sử hoa hồng', 'Lịch sử hoa hồng'),
(336, 2, 'Lịch sử hoa hồng', 'History commission'),
(337, 1, 'Hoa hồng ban đầu', 'Hoa hồng ban đầu'),
(338, 2, 'Hoa hồng ban đầu', 'Initial commission balance'),
(339, 1, 'Hoa hồng thay đổi', 'Hoa hồng thay đổi'),
(340, 2, 'Hoa hồng thay đổi', 'Change commission balance'),
(341, 1, 'Hoa hồng hiện tại', 'Hoa hồng hiện tại'),
(342, 2, 'Hoa hồng hiện tại', 'Current commission balance'),
(343, 1, 'Vui lòng nhập số lượng cần mua', 'Vui lòng nhập số lượng cần mua'),
(344, 2, 'Vui lòng nhập số lượng cần mua', 'Please enter the quantity'),
(345, 1, 'Tổng tiền thanh toán:', 'Tổng tiền thanh toán:'),
(346, 2, 'Tổng tiền thanh toán:', 'Total payment:'),
(347, 1, 'Số tiền giảm:', 'Số tiền giảm:'),
(348, 2, 'Số tiền giảm:', 'Discount:'),
(349, 1, 'Thành tiền:', 'Thành tiền:'),
(350, 2, 'Thành tiền:', 'Price:'),
(351, 1, 'Mã giảm giá:', 'Mã giảm giá:'),
(352, 2, 'Mã giảm giá:', 'Coupon:'),
(353, 1, 'Nhập mã giảm giá nếu có', 'Nhập mã giảm giá nếu có'),
(354, 2, 'Nhập mã giảm giá nếu có', 'Enter discount code if available'),
(355, 1, 'THÔNG TIN MUA HÀNG', 'THÔNG TIN MUA HÀNG'),
(356, 2, 'THÔNG TIN MUA HÀNG', 'PURCHASE INFORMATION'),
(357, 1, 'Số lượng cần mua:', 'Số lượng cần mua:'),
(358, 2, 'Số lượng cần mua:', 'Amount:'),
(359, 1, 'Chia sẻ:', 'Chia sẻ:'),
(360, 2, 'Chia sẻ:', 'Share:'),
(361, 1, 'Mua Ngay', 'Mua Ngay'),
(362, 2, 'Mua Ngay', 'Buy Now'),
(363, 1, 'Kho hàng:', 'Kho hàng:'),
(364, 2, 'Kho hàng:', 'Stock:'),
(365, 1, 'Đã bán:', 'Đã bán:'),
(366, 2, 'Đã bán:', 'Sold:'),
(367, 1, 'Yêu Thích', 'Yêu Thích'),
(368, 2, 'Yêu Thích', 'Add Favourite'),
(369, 1, 'Bỏ Thích', 'Bỏ Thích'),
(370, 2, 'Bỏ Thích', 'Remove Favourite'),
(371, 1, 'Danh sách sản phẩm yêu thích', 'Danh sách sản phẩm yêu thích'),
(372, 2, 'Danh sách sản phẩm yêu thích', 'Favorites'),
(373, 1, 'Sản phẩm', 'Sản phẩm'),
(374, 2, 'Sản phẩm', 'Product'),
(375, 1, 'Kho hàng', 'Kho hàng'),
(376, 2, 'Kho hàng', 'Stock'),
(377, 1, 'Giá', 'Giá'),
(378, 2, 'Giá', 'Price'),
(379, 1, 'Mua', 'Mua'),
(380, 2, 'Mua', 'Buy'),
(381, 1, 'Xem', 'Xem'),
(382, 2, 'Xem', 'View'),
(383, 1, 'Xóa', 'Xóa'),
(384, 2, 'Xóa', 'Delete'),
(385, 1, 'Hết hàng', 'Hết hàng'),
(386, 2, 'Hết hàng', 'Out of Stock'),
(387, 1, 'Thêm vào mục yêu thích', 'Thêm vào mục yêu thích'),
(388, 2, 'Thêm vào mục yêu thích', 'Add to Favorites'),
(389, 1, 'Đã thêm vào mục yêu thích', 'Đã thêm vào mục yêu thích'),
(390, 2, 'Đã thêm vào mục yêu thích', 'Added to Favorites'),
(393, 2, 'Lịch sử đơn hàng', 'Order History'),
(394, 1, 'Xóa đơn hàng', 'Xóa đơn hàng'),
(395, 2, 'Xóa đơn hàng', 'Delete Order'),
(396, 1, 'Xóa đơn hàng đã chọn khỏi lịch sử của bạn', 'Xóa đơn hàng đã chọn khỏi lịch sử của bạn'),
(397, 2, 'Xóa đơn hàng đã chọn khỏi lịch sử của bạn', 'Delete selected orders from your history'),
(398, 1, 'Mã đơn hàng', 'Mã đơn hàng'),
(399, 2, 'Mã đơn hàng', 'Transaction'),
(400, 2, 'Thanh toán', 'Pay'),
(401, 1, 'Xem chi tiết', 'Xem chi tiết'),
(402, 2, 'Xem chi tiết', 'See details'),
(403, 1, 'Tải về máy', 'Tải về máy'),
(404, 2, 'Tải về máy', 'Download'),
(405, 1, 'Xóa khỏi lịch sử', 'Xóa khỏi lịch sử'),
(406, 2, 'Xóa khỏi lịch sử', 'Delete from history'),
(407, 1, 'Liên hệ', 'Liên hệ'),
(408, 2, 'Liên hệ', 'Contact'),
(409, 1, 'Chính sách', 'Chính sách'),
(410, 2, 'Chính sách', 'Policy'),
(411, 1, 'Tài liệu API', 'Tài liệu API'),
(412, 2, 'Tài liệu API', 'API Document'),
(413, 1, 'Trang chủ', 'Trang chủ'),
(414, 2, 'Trang chủ', 'Home'),
(415, 1, 'Liên kết', 'Liên kết'),
(416, 2, 'Liên kết', 'Links'),
(417, 1, 'Câu hỏi thường gặp', 'Câu hỏi thường gặp'),
(418, 2, 'Câu hỏi thường gặp', 'FAQ'),
(419, 1, 'Liên hệ chúng tôi', 'Liên hệ chúng tôi'),
(420, 2, 'Liên hệ chúng tôi', 'Contact us'),
(421, 1, 'Sản phẩm:', 'Sản phẩm:'),
(422, 2, 'Sản phẩm:', 'Product:'),
(423, 1, 'Số lượng mua:', 'Số lượng mua:'),
(424, 2, 'Số lượng mua:', 'Quantity purchased:'),
(425, 1, 'Thanh toán:', 'Thanh toán:'),
(426, 2, 'Thanh toán:', 'Pay:'),
(427, 1, 'Mã đơn hàng:', 'Mã đơn hàng:'),
(428, 2, 'Mã đơn hàng:', 'Transaction:'),
(429, 1, 'Chi tiết đơn hàng', 'Chi tiết đơn hàng'),
(430, 2, 'Chi tiết đơn hàng', 'Order details'),
(431, 1, 'Tài khoản', 'Tài khoản'),
(432, 2, 'Tài khoản', 'Account'),
(433, 1, 'Lưu các tài khoản đã chọn vào tệp .txt', 'Lưu các tài khoản đã chọn vào tệp .txt'),
(434, 2, 'Lưu các tài khoản đã chọn vào tệp .txt', 'Save selected accounts to a .txt file'),
(435, 1, 'Sao chép các tài khoản đã chọn', 'Sao chép các tài khoản đã chọn'),
(436, 2, 'Sao chép các tài khoản đã chọn', 'Copy selected accounts'),
(437, 1, 'Chỉ sao chép UID các tài khoản đã chọn', 'Chỉ sao chép UID các tài khoản đã chọn'),
(438, 2, 'Chỉ sao chép UID các tài khoản đã chọn', 'Copy only the UID of the selected accounts'),
(439, 1, 'Số dư của tôi:', 'Số dư của tôi:'),
(440, 2, 'Số dư của tôi:', 'My balance:'),
(441, 1, 'Khuyến mãi', 'Khuyến mãi'),
(442, 2, 'Khuyến mãi', 'Promotion'),
(443, 1, 'Số tiền nạp lớn hơn hoặc bằng', 'Số tiền nạp lớn hơn hoặc bằng'),
(444, 2, 'Số tiền nạp lớn hơn hoặc bằng', 'The deposit amount is greater than or equal to'),
(445, 1, 'Khuyến mãi thêm', 'Khuyến mãi thêm'),
(446, 2, 'Khuyến mãi thêm', 'Extra'),
(447, 1, 'Thông tin chi tiết khách hàng', 'Thông tin chi tiết khách hàng'),
(448, 2, 'Thông tin chi tiết khách hàng', 'Customer details'),
(449, 1, 'Chia sẻ liên kết này lên mạng xã hội hoặc bạn bè của bạn.', 'Chia sẻ liên kết này lên mạng xã hội hoặc bạn bè của bạn.'),
(451, 1, 'Tài liệu tích hợp API', 'Tài liệu tích hợp API'),
(452, 2, 'Tài liệu tích hợp API', 'API integration documentation'),
(453, 1, 'Lấy thông tin tài khoản', 'Lấy thông tin tài khoản'),
(454, 2, 'Lấy thông tin tài khoản', 'Get account information'),
(455, 1, 'Lấy danh sách chuyên mục và sản phẩm', 'Lấy danh sách chuyên mục và sản phẩm'),
(456, 2, 'Lấy danh sách chuyên mục và sản phẩm', 'Get a list of categories and products'),
(457, 1, 'Mua hàng', 'Mua hàng'),
(458, 2, 'Mua hàng', 'Purchase'),
(459, 1, 'ID sản phẩm cần mua', 'ID sản phẩm cần mua'),
(460, 2, 'ID sản phẩm cần mua', 'Product ID to buy'),
(461, 1, 'Số lượng cần mua', 'Số lượng cần mua'),
(462, 2, 'Số lượng cần mua', 'Quantity to buy'),
(463, 1, 'Mã giảm giá nếu có', 'Mã giảm giá nếu có'),
(464, 2, 'Mã giảm giá nếu có', 'Discount code if available'),
(465, 1, 'Bảo mật', 'Bảo mật'),
(466, 2, 'Bảo mật', 'Security'),
(467, 1, 'Bảo mật tài khoản', 'Bảo mật tài khoản'),
(468, 2, 'Bảo mật tài khoản', 'Account security'),
(469, 1, 'Xác minh đăng nhập bằng', 'Xác minh đăng nhập bằng'),
(470, 2, 'Xác minh đăng nhập bằng', 'Verify login with'),
(471, 1, 'Gửi thông báo về mail khi đăng nhập thành công:', 'Gửi thông báo về mail khi đăng nhập thành công:'),
(472, 2, 'Gửi thông báo về mail khi đăng nhập thành công:', 'Send email notification upon successful login:'),
(473, 1, 'Đúng Trình Duyệt và IP mua hàng mới có thể xem đơn hàng:', 'Đúng Trình Duyệt và IP mua hàng mới có thể xem đơn hàng:'),
(474, 2, 'Đúng Trình Duyệt và IP mua hàng mới có thể xem đơn hàng:', 'Only the correct browser and purchase IP can view orders:'),
(475, 1, '- Sử dụng điện thoại tải App Google Authenticator sau đó quét mã QR để nhận mã xác minh.', '- Sử dụng điện thoại tải App Google Authenticator sau đó quét mã QR để nhận mã xác minh.'),
(476, 2, '- Sử dụng điện thoại tải App Google Authenticator sau đó quét mã QR để nhận mã xác minh.', '- Use your phone to download the Google Authenticator App then scan the QR code to receive the verification code.'),
(477, 1, '- Mã QR sẽ được thay đổi khi bạn tắt xác minh.', '- Mã QR sẽ được thay đổi khi bạn tắt xác minh.'),
(478, 2, '- Mã QR sẽ được thay đổi khi bạn tắt xác minh.', '- The QR code will be changed when you turn off verification.'),
(479, 1, '- Nếu bật Xác minh đăng nhập bằng OTP Mail thì không bật Google Authenticator và ngược lại.', '- Nếu bật Xác minh đăng nhập bằng OTP Mail thì không bật Google Authenticator và ngược lại.'),
(480, 2, '- Nếu bật Xác minh đăng nhập bằng OTP Mail thì không bật Google Authenticator và ngược lại.', '- If you enable Login Verification using OTP Mail, do not enable Google Authenticator and vice versa.'),
(481, 1, 'Lưu', 'Lưu'),
(482, 2, 'Lưu', 'Save'),
(483, 1, 'Nhập mã xác minh để lưu', 'Nhập mã xác minh để lưu'),
(484, 2, 'Nhập mã xác minh để lưu', 'Enter the verification code to save'),
(485, 1, 'Sản phẩm liên quan đến từ khóa', 'Sản phẩm liên quan đến từ khóa'),
(486, 2, 'Sản phẩm liên quan đến từ khóa', 'Products related to keyword'),
(487, 1, 'trong số', 'trong số'),
(488, 2, 'trong số', 'of'),
(489, 1, 'Quay lại', 'Quay lại'),
(490, 2, 'Quay lại', 'Back'),
(491, 1, 'Tải về đơn hàng', 'Tải về đơn hàng'),
(492, 2, 'Tải về đơn hàng', 'Download Order'),
(493, 1, 'Hệ thống sẽ tải về đơn hàng khi bạn nhấn đồng ý', 'Hệ thống sẽ tải về đơn hàng khi bạn nhấn đồng ý'),
(494, 2, 'Hệ thống sẽ tải về đơn hàng khi bạn nhấn đồng ý', 'The system will download the order when you click Okey'),
(495, 1, 'Hệ thống sẽ xóa đơn hàng khỏi lịch sử của bạn khi bạn nhấn đồng ý', 'Hệ thống sẽ xóa đơn hàng khỏi lịch sử của bạn khi bạn nhấn đồng ý'),
(496, 2, 'Hệ thống sẽ xóa đơn hàng khỏi lịch sử của bạn khi bạn nhấn đồng ý', 'The system will delete the order from your history when you click Okey'),
(497, 1, 'Đóng', 'Đóng'),
(498, 2, 'Đóng', 'Cancel'),
(499, 1, 'Xuất tất cả tài khoản ra tệp .txt', 'Xuất tất cả tài khoản ra tệp .txt'),
(500, 2, 'Xuất tất cả tài khoản ra tệp .txt', 'Export all accounts to a .txt file'),
(501, 1, 'Xóa đơn hàng này khỏi lịch sử của bạn', 'Xóa đơn hàng này khỏi lịch sử của bạn'),
(502, 2, 'Xóa đơn hàng này khỏi lịch sử của bạn', 'Delete this order from your history'),
(503, 1, 'Thành công !', 'Thành công !'),
(504, 2, 'Thành công !', 'Success !'),
(505, 1, 'Xem chi tiết đơn hàng', 'Xem chi tiết đơn hàng'),
(506, 2, 'Xem chi tiết đơn hàng', 'View order details'),
(507, 1, 'Mua thêm', 'Mua thêm'),
(508, 2, 'Mua thêm', 'Buy more'),
(509, 1, 'Tạo đơn hàng thành công !', 'Tạo đơn hàng thành công !'),
(510, 2, 'Tạo đơn hàng thành công !', 'Create order successfully!'),
(511, 1, 'Đang xử lý...', 'Đang xử lý...'),
(512, 2, 'Đang xử lý...', 'Processing...');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` int(11) NOT NULL DEFAULT '0',
  `ctv` int(11) NOT NULL DEFAULT '0',
  `banned` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `time_session` int(11) DEFAULT '0',
  `time_request` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token_2fa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token_forgot_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_forgot_password` int(11) NOT NULL DEFAULT '0',
  `money` float NOT NULL DEFAULT '0',
  `total_money` float NOT NULL DEFAULT '0',
  `debit` float NOT NULL DEFAULT '0',
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Male',
  `device` text COLLATE utf8_unicode_ci,
  `avatar` text COLLATE utf8_unicode_ci,
  `status_2fa` int(11) NOT NULL DEFAULT '0',
  `SecretKey_2fa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `limit_2fa` int(11) NOT NULL DEFAULT '0',
  `discount` float NOT NULL DEFAULT '0',
  `trial` int(11) NOT NULL DEFAULT '0',
  `ref_id` int(11) NOT NULL DEFAULT '0',
  `ref_ck` float NOT NULL DEFAULT '0',
  `ref_click` int(11) NOT NULL DEFAULT '0',
  `ref_amount` float NOT NULL DEFAULT '0',
  `ref_price` float NOT NULL DEFAULT '0',
  `ref_total_price` float NOT NULL DEFAULT '0',
  `telegram_chat_id` text COLLATE utf8_unicode_ci,
  `api_key` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_attempts` int(11) NOT NULL DEFAULT '0',
  `status_otp_mail` int(11) NOT NULL DEFAULT '0',
  `otp_mail` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token_otp_mail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `limit_otp_mail` int(11) NOT NULL DEFAULT '0',
  `status_noti_login_to_mail` int(11) NOT NULL DEFAULT '0',
  `status_view_order` int(11) NOT NULL DEFAULT '0',
  `utm_source` varchar(55) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `aff_log`
--
ALTER TABLE `aff_log`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `aff_withdraw`
--
ALTER TABLE `aff_withdraw`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `automations`
--
ALTER TABLE `automations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `block_ip`
--
ALTER TABLE `block_ip`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trans_id` (`trans_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `coupon_used`
--
ALTER TABLE `coupon_used`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `deposit_log`
--
ALTER TABLE `deposit_log`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `dongtien`
--
ALTER TABLE `dongtien`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transid` (`transid`);

--
-- Chỉ mục cho bảng `email_campaigns`
--
ALTER TABLE `email_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `email_sending`
--
ALTER TABLE `email_sending`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `log_bank_auto`
--
ALTER TABLE `log_bank_auto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tid` (`tid`);

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `momo`
--
ALTER TABLE `momo`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `tranId` (`tranId`);

--
-- Chỉ mục cho bảng `order_log`
--
ALTER TABLE `order_log`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_bank`
--
ALTER TABLE `payment_bank`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `tid` (`tid`);

--
-- Chỉ mục cho bảng `payment_crypto`
--
ALTER TABLE `payment_crypto`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_momo`
--
ALTER TABLE `payment_momo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tid` (`tid`);

--
-- Chỉ mục cho bảng `payment_paypal`
--
ALTER TABLE `payment_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_pm`
--
ALTER TABLE `payment_pm`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_squadco`
--
ALTER TABLE `payment_squadco`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_toyyibpay`
--
ALTER TABLE `payment_toyyibpay`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trans_id` (`trans_id`),
  ADD UNIQUE KEY `BillCode` (`BillCode`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Chỉ mục cho bảng `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_die`
--
ALTER TABLE `product_die`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_discount`
--
ALTER TABLE `product_discount`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trans_id` (`trans_id`);

--
-- Chỉ mục cho bảng `product_sold`
--
ALTER TABLE `product_sold`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_stock`
--
ALTER TABLE `product_stock`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `translate`
--
ALTER TABLE `translate`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_role`
--
ALTER TABLE `admin_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `aff_log`
--
ALTER TABLE `aff_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `aff_withdraw`
--
ALTER TABLE `aff_withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `automations`
--
ALTER TABLE `automations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `block_ip`
--
ALTER TABLE `block_ip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `coupon_used`
--
ALTER TABLE `coupon_used`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `deposit_log`
--
ALTER TABLE `deposit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3435;

--
-- AUTO_INCREMENT cho bảng `dongtien`
--
ALTER TABLE `dongtien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT cho bảng `email_campaigns`
--
ALTER TABLE `email_campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `email_sending`
--
ALTER TABLE `email_sending`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1037;

--
-- AUTO_INCREMENT cho bảng `log_bank_auto`
--
ALTER TABLE `log_bank_auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1169;

--
-- AUTO_INCREMENT cho bảng `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `momo`
--
ALTER TABLE `momo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `order_log`
--
ALTER TABLE `order_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3486;

--
-- AUTO_INCREMENT cho bảng `payment_bank`
--
ALTER TABLE `payment_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `payment_crypto`
--
ALTER TABLE `payment_crypto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payment_momo`
--
ALTER TABLE `payment_momo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `payment_paypal`
--
ALTER TABLE `payment_paypal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payment_pm`
--
ALTER TABLE `payment_pm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payment_squadco`
--
ALTER TABLE `payment_squadco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payment_toyyibpay`
--
ALTER TABLE `payment_toyyibpay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `post_category`
--
ALTER TABLE `post_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT cho bảng `product_die`
--
ALTER TABLE `product_die`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_discount`
--
ALTER TABLE `product_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT cho bảng `product_sold`
--
ALTER TABLE `product_sold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=695;

--
-- AUTO_INCREMENT cho bảng `product_stock`
--
ALTER TABLE `product_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT cho bảng `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `translate`
--
ALTER TABLE `translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=513;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
