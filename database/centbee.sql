-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2020 at 12:17 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `centbee`
--
CREATE DATABASE IF NOT EXISTS `centbee` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `centbee`;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `empId` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `occupation` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`empId`, `name`, `surname`, `occupation`) VALUES
(5, 'Benjamin', 'Kane', 'Data Analyst'),
(8, 'Daniel', 'Thad', 'IT Manager'),
(13, 'Tshegofatso', 'Letsoalo', 'Accountant'),
(14, 'Pritchard Tinaye', 'Greenwood', 'Senior Software Developer'),
(16, 'Victoria', 'Lewis', 'CFO'),
(17, 'Stephanie', 'Van Staden', 'Data Analyst'),
(18, 'Finn', 'Damon', 'CEO'),
(19, 'Jacob', 'Murry', 'Network Administrator'),
(20, 'Matome', 'Molamoleng', 'Project Manager'),
(21, 'Kinsley', 'Conan', 'Auditor'),
(22, 'Bongi', 'Mahlangu', 'Maintenance'),
(24, 'Jimmy', 'Rose', 'Electrician');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`empId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `empId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--