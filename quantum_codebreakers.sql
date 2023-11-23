-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2023 at 10:05 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quantum_codebreakers`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `srno` int(11) NOT NULL,
  `Name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `massage` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`srno`, `Name`, `email`, `phone_no`, `massage`, `date`) VALUES
(1, 'first post', 'firstpost@gmail.com', '9876541230', 'first post', '2023-11-20 18:15:15'),
(5, 'ninja', 'vocapa9107@weizixu.com', '7894564561', 'hi', '2023-11-21 19:58:24'),
(6, 'ninja', 'vocapa9107@weizixu.com', '7894564561', 'hi', '2023-11-21 20:01:00'),
(7, 'ninja', 'vocapa9107@weizixu.com', '7894564561', 'hi', '2023-11-21 20:05:06'),
(8, 'ninja', 'vocapa9107@weizixu.com', '7894564561', 'hi', '2023-11-21 20:18:20'),
(9, 'ninja', 'vocapa9107@weizixu.com', '7894564561', 'hi', '2023-11-21 20:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `srno` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `subheading` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`srno`, `title`, `slug`, `content`, `subheading`, `img_file`, `date`) VALUES
(2, 'second', 'second-post', 'dase with me ', 'secong', 'about-bg.jpg', '2023-11-22 19:22:59'),
(3, 'this is my third blog', 'third-post', 'this is mt third blog go ahead ', 'third blog', '', '2023-11-21 20:45:13'),
(4, 'this is my forth blog', 'forth-post', 'this is mt forth blog go ahead ', 'forth blog', '', '2023-11-21 20:46:09'),
(5, 'this is my fiveth blog', 'fiveth-post', 'this is mt fiveth blog go ahead ', 'fiveth blog', '', '2023-11-21 20:46:36'),
(6, 'this is my sixthblog', 'sixth-post', 'this is mt sixth blog go ahead ', 'sixth blog', '', '2023-11-21 20:46:56'),
(7, 'this is my  seventh blog', ' seventh blog', 'seventh blog seventh blog seventh blog seventh blog seventh blog seventh blog seventh blog', ' seventh blog', ' seventh blo', '2023-11-22 18:58:46'),
(8, 'this is my  seventh blog', ' seventh', 'ninw', ' seventh blog', ' seventh blo', '2023-11-22 19:04:00'),
(9, 'this is my  seventh blog', ' seventh blog', 'seventh blog seventh blog seventh blog seventh blog seventh blog seventh blog seventh blog', ' seventh blog', ' seventh blo', '2023-11-22 19:05:45'),
(10, 'this is my  seventh blog', ' seventh blog', 'cae', ' seventh blog', ' seventh blo', '2023-11-22 19:06:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`srno`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`srno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `srno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `srno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
