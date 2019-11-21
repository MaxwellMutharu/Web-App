-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2019 at 02:45 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active | 0=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `created`, `modified`, `status`) VALUES
(5, 'Maxwell', 'Mutharu', 'dhnd@gmail.com', '0740695039', 'hhd845', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1'),
(6, 'Maxwell', 'Mutharu', 'dhnd@gmail.com', '0740695039', 'hhd845', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1'),
(7, 'Maxwell', 'Mutharu', 'dhnd@gmail.com', '0740695039', 'hhd845', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1'),
(8, 'Maxwell', 'Mutharu', 'dhnd@gmail.com', '0740695039', 'hhd845', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1'),
(9, 'Maxwell', 'Mutharu', 'dhnd@gmail.com', '0740695039', 'hhd845', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1'),
(10, 'Maxwell', 'Mutharu', 'dhnd@gmail.com', '0740695039', 'hhd845', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1'),
(11, 'Maxwell', 'Mutharu', 'dhnd@gmail.com', '0740695039', 'hhd845', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `grand_total` float(10,2) NOT NULL,
  `created` datetime NOT NULL,
  `status` enum('Pending','Completed','Cancelled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `grand_total`, `created`, `status`) VALUES
(5, 5, 26025.35, '2019-11-16 13:26:04', 'Pending'),
(6, 6, 26025.35, '2019-11-16 13:52:45', 'Pending'),
(7, 7, 26021.25, '2019-11-16 13:55:09', 'Pending'),
(8, 8, 26021.25, '2019-11-16 13:57:53', 'Pending'),
(9, 9, 26025.35, '2019-11-16 13:59:31', 'Pending'),
(10, 10, 26026.20, '2019-11-16 14:00:30', 'Pending'),
(11, 11, 26025.35, '2019-11-21 16:38:07', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(5, 5, 1315, 1),
(6, 6, 1315, 1),
(7, 7, 1314, 1),
(8, 8, 1314, 1),
(9, 9, 1315, 1),
(10, 10, 1316, 1),
(11, 11, 1315, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` float(10,2) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active | 0=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `created`, `modified`, `status`) VALUES
(1314, 'Kari Home Based', 'Kira is a home assistant that performs the following tasks:\r\n1.Remind you of shopping when needed.\r\n2.help you in basic works like painting and cooking.', 26021.25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1'),
(1315, 'Wendy Office Based', 'It plays a role of an assistant\r\nIt books and cancels appointments for you', 26025.35, '2019-12-04 23:20:15', '2020-01-10 20:25:10', '1'),
(1316, 'Lynn', 'A kitchen assistant and very easy to use.\r\n\r\nAll you need to do is upload files of recipes and let Lynn perform the rest', 26026.20, '2019-08-12 04:06:56', '2020-01-10 20:25:10', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1318;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
