-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2025 at 05:21 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `customer_id`, `created_at`) VALUES
(2, 2, '2025-04-02 04:00:00'),
(3, 3, '2025-04-03 07:00:00'),
(15, 1, '2025-05-02 01:47:46');

-- --------------------------------------------------------

--
-- Table structure for table `cartdetails`
--

CREATE TABLE `cartdetails` (
  `cart_id` int(11) NOT NULL,
  `product_code` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL CHECK (`quantity` > 0),
  `product_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cartdetails`
--

INSERT INTO `cartdetails` (`cart_id`, `product_code`, `quantity`, `product_price`) VALUES
(3, 'P004', 2, 313.00),
(15, 'P001', 1, 300.00),
(15, 'P002', 2, 50.00),
(15, 'P003', 1, 20.00);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category`) VALUES
(1, 'Electronics'),
(2, 'Fashion'),
(3, 'Books');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `point` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `phone_number`, `email`, `password`, `address`, `point`) VALUES
(1, '1', '1', '1', '1', '1', 0),
(2, 'Bob', '987654321', 'bob@example.com', 'password', '456 Elm St', 20),
(3, 'Charlie', '111222333', 'charlie@example.com', 'password', '789 Oak St', 30),
(4, 'Alice', '123456789', 'alice@example.com', 'password', '123 Main St', 10),
(5, 'John Doe', '1234567890', 'john@example.com', 'password123', '123 Main St', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pointshistory`
--

CREATE TABLE `pointshistory` (
  `transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pointshistory`
--

INSERT INTO `pointshistory` (`transaction_id`, `customer_id`, `amount`, `date`) VALUES
(1, 1, 10, '2025-04-01 03:05:00'),
(2, 2, 5, '2025-04-02 05:05:00'),
(3, 1, 2, '2025-04-03 08:10:00'),
(4, 3, 15, '2025-04-04 09:20:00'),
(5, 2, 6, '2025-04-05 10:25:00'),
(6, 3, 12, '2025-04-06 11:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_code` varchar(10) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_category` int(11) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_description` text DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_code`, `product_name`, `product_category`, `product_price`, `product_description`, `product_image`) VALUES
('P001', 'Smartphone', 1, 300.00, 'Latest smartphone', NULL),
('P002', 'Headphones', 1, 50.00, 'Noise-cancelling headphones', NULL),
('P003', 'T-shirt', 2, 20.00, 'Cotton T-shirt', NULL),
('P004', 'Novel', 3, 10.00, 'Bestselling novel', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactiondetails`
--

CREATE TABLE `transactiondetails` (
  `transaction_id` int(11) NOT NULL,
  `product_code` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactiondetails`
--

INSERT INTO `transactiondetails` (`transaction_id`, `product_code`, `quantity`, `total`) VALUES
(1, 'P001', 1, 300.00),
(1, 'P002', 1, 50.00),
(2, 'P002', 1, 50.00),
(3, 'P003', 1, 20.00),
(4, 'P001', 1, 300.00),
(4, 'P003', 3, 60.00),
(5, 'P003', 1, 20.00),
(5, 'P004', 1, 40.00),
(6, 'P001', 1, 300.00),
(22, 'P003', 1, 20.00);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `recipient_name` varchar(100) NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_status` varchar(20) DEFAULT NULL CHECK (`order_status` in ('Pending','Paid','Shipped','Delivered'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `customer_id`, `recipient_name`, `total_amount`, `order_date`, `order_status`) VALUES
(1, 1, 'Alice', 350.00, '2025-04-01 03:00:00', 'Delivered'),
(2, 2, 'Bob', 50.00, '2025-04-02 05:00:00', 'Delivered'),
(3, 1, 'Alice', 20.00, '2025-04-03 08:00:00', 'Delivered'),
(4, 3, 'Charlie', 360.00, '2025-04-04 09:00:00', 'Delivered'),
(5, 2, 'Bob', 60.00, '2025-04-05 10:00:00', 'Delivered'),
(6, 3, 'Charlie', 300.00, '2025-04-06 11:00:00', 'Delivered'),
(7, 1, 'Alice', 25.00, '2025-04-07 03:00:00', 'Delivered'),
(8, 1, 'Alice', 30.00, '2025-04-08 04:00:00', 'Delivered'),
(9, 2, 'Bob', 40.00, '2025-04-09 05:00:00', 'Delivered'),
(10, 3, 'Charlie', 70.00, '2025-04-10 06:00:00', 'Delivered'),
(11, 3, 'Charlie', 80.00, '2025-04-11 07:00:00', 'Delivered'),
(12, 3, 'Charlie', 90.00, '2025-04-12 08:00:00', 'Delivered'),
(22, 1, '1', 20.00, '2025-05-01 17:51:50', 'Pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `cartdetails`
--
ALTER TABLE `cartdetails`
  ADD PRIMARY KEY (`cart_id`,`product_code`),
  ADD KEY `product_code` (`product_code`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `pointshistory`
--
ALTER TABLE `pointshistory`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_code`),
  ADD KEY `product_category_id` (`product_category`);

--
-- Indexes for table `transactiondetails`
--
ALTER TABLE `transactiondetails`
  ADD PRIMARY KEY (`transaction_id`,`product_code`),
  ADD KEY `product_code` (`product_code`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `cartdetails`
--
ALTER TABLE `cartdetails`
  ADD CONSTRAINT `cartdetails_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `cartdetails_ibfk_2` FOREIGN KEY (`product_code`) REFERENCES `product` (`product_code`);

--
-- Constraints for table `pointshistory`
--
ALTER TABLE `pointshistory`
  ADD CONSTRAINT `pointshistory_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`),
  ADD CONSTRAINT `pointshistory_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_category`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `transactiondetails`
--
ALTER TABLE `transactiondetails`
  ADD CONSTRAINT `transactiondetails_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`),
  ADD CONSTRAINT `transactiondetails_ibfk_2` FOREIGN KEY (`product_code`) REFERENCES `product` (`product_code`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
