-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2022 at 03:59 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scamazon`
--
CREATE DATABASE IF NOT EXISTS `scamazon` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `scamazon`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `user_id` int(11) NOT NULL,
  `username` varchar(55) DEFAULT NULL,
  `e_mail` varchar(55) DEFAULT NULL,
  `user_address` varchar(55) DEFAULT NULL,
  `fk_payment_method` varchar(55) DEFAULT NULL,
  `f_name` varchar(55) DEFAULT NULL,
  `l_name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`user_id`, `username`, `e_mail`, `user_address`, `fk_payment_method`, `f_name`, `l_name`) VALUES
(1, 'Petro', 'petricio@gmail.com', 'patrickgasse32', 'Paypal', 'Piedro', 'Vasques'),
(2, 'padreto', 'padreto@gmail.com', 'spickcenter32', 'Visa', 'Bob', 'Wick'),
(3, 'Vedro', 'Vedro@gmail.com', 'vedrogasse66', 'Master', 'Verl', 'Bosco');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `country_name` varchar(55) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `city` varchar(55) DEFAULT NULL,
  `fk_shipping_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`country_name`, `country_id`, `city`, `fk_shipping_id`, `fk_user_id`) VALUES
('Brazil', 789870, 'Rio de Janeiro', 1, 1),
('Brazil', 789870, 'Rio de Janeiro', 1, 3),
('Mexico', 39451, 'Mexico', 2, 2),
('Spain', 890765, 'Madrid', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `invoice_number` int(11) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `fk_prod_id` int(11) DEFAULT NULL,
  `fk_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`invoice_number`, `payment_date`, `fk_prod_id`, `fk_user_id`) VALUES
(222, '2022-01-05', 4567, 3),
(666, '2022-06-01', 2341, 1),
(777, '2022-08-02', 3512, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(55) DEFAULT NULL,
  `brand` varchar(55) DEFAULT NULL,
  `fk_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `prod_name`, `brand`, `fk_user_id`) VALUES
(2341, 'bebromachine', 'bibrovici', 1),
(3512, 'mixer500', 'Rowenta', 2),
(4567, 'knife tactical', 'leatherman', 3);

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `shipping_id` int(11) NOT NULL,
  `shipping_date` date DEFAULT NULL,
  `fk_company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`shipping_id`, `shipping_date`, `fk_company_id`) VALUES
(1, '2022-06-01', 23),
(2, '2022-06-02', 45),
(4, '2022-07-03', 34);

-- --------------------------------------------------------

--
-- Table structure for table `shippingcompany`
--

CREATE TABLE `shippingcompany` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(55) DEFAULT NULL,
  `fk_invoice_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shippingcompany`
--

INSERT INTO `shippingcompany` (`company_id`, `company_name`, `fk_invoice_number`) VALUES
(23, 'Alejandro blitz', 666),
(34, 'Valera deliveries', 222),
(45, 'Metrona Fast delivery', 777);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`fk_shipping_id`,`fk_user_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`invoice_number`),
  ADD KEY `fk_prod_id` (`fk_prod_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shipping_id`),
  ADD KEY `fk_company_id` (`fk_company_id`);

--
-- Indexes for table `shippingcompany`
--
ALTER TABLE `shippingcompany`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `fk_invoice_number` (`fk_invoice_number`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`fk_shipping_id`) REFERENCES `shipping` (`shipping_id`),
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`fk_user_id`) REFERENCES `customer` (`user_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`fk_prod_id`) REFERENCES `products` (`prod_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `customer` (`user_id`);

--
-- Constraints for table `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`fk_company_id`) REFERENCES `shippingcompany` (`company_id`);

--
-- Constraints for table `shippingcompany`
--
ALTER TABLE `shippingcompany`
  ADD CONSTRAINT `shippingcompany_ibfk_1` FOREIGN KEY (`fk_invoice_number`) REFERENCES `payment` (`invoice_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
