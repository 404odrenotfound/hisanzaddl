-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 05:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hisanzaddl`
--

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `Discount` decimal(5,2) DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`OrderID`, `ProductID`, `Quantity`, `UnitPrice`, `Discount`, `StatusID`) VALUES
(1, 1, 10, 15.00, 0.05, 1),
(1, 2, 5, 20.00, 0.10, 2),
(2, 3, 8, 14.00, 0.00, 1),
(3, 4, 15, 12.00, 0.05, 2),
(4, 5, 20, 17.00, 0.10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `ShippedDate` date DEFAULT NULL,
  `ShipperID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `EmployeeID`, `CustomerID`, `OrderDate`, `ShippedDate`, `ShipperID`) VALUES
(1, 101, 201, '2024-10-01', '2024-10-05', 1),
(2, 102, 202, '2024-10-02', '2024-10-06', 2),
(3, 103, 203, '2024-10-03', '2024-10-07', 3),
(4, 104, 204, '2024-10-04', '2024-10-08', 1),
(5, 105, 205, '2024-10-05', '2024-10-09', 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ID` int(11) NOT NULL,
  `ProductCode` varchar(50) DEFAULT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `StandardCost` decimal(10,2) DEFAULT NULL,
  `ListPrice` decimal(10,2) DEFAULT NULL,
  `ReorderLevel` int(11) DEFAULT NULL,
  `TargetLevel` int(11) DEFAULT NULL,
  `QuantityPerUnit` varchar(50) DEFAULT NULL,
  `Discontinued` tinyint(1) DEFAULT NULL,
  `MinimumReorderQuantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ID`, `ProductCode`, `ProductName`, `Description`, `StandardCost`, `ListPrice`, `ReorderLevel`, `TargetLevel`, `QuantityPerUnit`, `Discontinued`, `MinimumReorderQuantity`) VALUES
(1, 'P001', 'Product 1', 'Description for Product 1', 10.00, 15.00, 20, 50, '10 units', 0, 5),
(2, 'P002', 'Product 2', 'Description for Product 2', 12.50, 20.00, 15, 40, '5 units', 0, 5),
(3, 'P003', 'Product 3', 'Description for Product 3', 8.75, 14.00, 10, 30, '20 units', 0, 4),
(4, 'P004', 'Product 4', 'Description for Product 4', 9.50, 12.00, 12, 35, '8 units', 1, 6),
(5, 'P005', 'Product 5', 'Description for Product 5', 11.00, 17.00, 25, 60, '15 units', 0, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
