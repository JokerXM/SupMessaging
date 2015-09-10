-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 14, 2014 at 09:01 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `supmessaging`
--
CREATE DATABASE IF NOT EXISTS `supmessaging` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `supmessaging`;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `myname` varchar(30) NOT NULL,
  `friendname` varchar(30) NOT NULL,
  `id` int(30) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`myname`, `friendname`, `id`) VALUES
('xuming', 'longqiuxian', 17),
('longqiuxian', 'xuming', 18),
('liyaxuan', 'xuming', 19),
('xuming', 'liyaxuan', 20),
('liyaxuan', 'longqiuxian', 21),
('longqiuxian', 'liyaxuan', 22),
('jinxi', 'longqiuxian', 23),
('longqiuxian', 'jinxi', 24),
('jinxi', 'xuming', 25),
('xuming', 'jinxi', 26),
('jinxi', 'liyaxuan', 27),
('liyaxuan', 'jinxi', 28);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `time` varchar(50) NOT NULL,
  `content` varchar(100) NOT NULL,
  `sender` varchar(30) NOT NULL,
  `recipient` varchar(30) NOT NULL,
  `ifread` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `time`, `content`, `sender`, `recipient`, `ifread`) VALUES
(48, '2014/12/14 16:21:56', 'hello! I am liyaxuan. i want to make a friend with you&#65281;', 'liyaxuan', 'xuming', 'have read'),
(49, '2014/12/14 16:22:34', 'hi ! i love supmessaging.', 'liyaxuan', 'admin', 'have read'),
(50, '2014/12/14 16:23:01', 'hi! long qiu xian', 'liyaxuan', 'longqiuxian', 'have read'),
(51, '2014/12/14 16:24:29', 'hi ! liyaxuan.', 'longqiuxian', 'liyaxuan', 'have read'),
(52, '2014/12/14 16:25:04', 'xuming, i am longqiuxian.', 'longqiuxian', 'xuming', 'have read'),
(53, '2014/12/14 16:25:20', 'how are you?', 'longqiuxian', 'liyaxuan', 'have read'),
(54, '2014/12/14 16:25:59', 'if you see this message. please call me back!', 'longqiuxian', 'xuming', 'have read'),
(55, '2014/12/14 16:48:43', 'hi&#65281;sister', 'jinxi', 'longqiuxian', 'have read'),
(56, '2014/12/14 16:49:17', 'Do you have time to go shoping&#65311;', 'jinxi', 'longqiuxian', 'have read'),
(57, '2014/12/14 16:50:07', 'hi&#65281;this afternoon i will visit you!', 'jinxi', 'xuming', 'have read'),
(58, '2014/12/14 16:50:34', 'Hi ! ', 'jinxi', 'liyaxuan', 'have read');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `firstname`, `lastname`, `email`, `password`) VALUES
(17, 'longqiuxian', 'long', 'qiuxian', 'longqiuxian@qq.com', 'long'),
(18, 'xuming', 'xu', 'ming', 'xuming@supinfo.com', 'xu'),
(19, 'liyaxuan', 'li', 'yaxuan', 'liyaxuan@163.com', 'li'),
(20, 'jinxi', 'jin', 'xi', 'jinxi@supinfo.com', 'ji');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
