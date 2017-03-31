-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 31, 2017 at 10:55 AM
-- Server version: 5.6.35
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sceqicla_som`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `answerID` char(16) NOT NULL,
  `userID` char(16) NOT NULL,
  `questionID` char(16) NOT NULL,
  `text` varchar(1024) NOT NULL,
  `anonymous` tinyint(1) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`answerID`),
  KEY `userID` (`userID`),
  KEY `questionID` (`questionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `moduleID` char(16) NOT NULL,
  `userID` char(16) DEFAULT NULL,
  `code` varchar(16) NOT NULL,
  `name` varchar(255) NOT NULL,
  `outline` varchar(1024) DEFAULT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`moduleID`),
  UNIQUE KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `questionID` char(16) NOT NULL,
  `userID` char(16) NOT NULL,
  `moduleID` char(16) NOT NULL,
  `text` varchar(1024) NOT NULL,
  `anonymous` tinyint(1) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`questionID`),
  KEY `userID` (`userID`),
  KEY `moduleID` (`moduleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `ratingID` char(16) NOT NULL,
  `userID` char(16) NOT NULL,
  `answerID` char(16) NOT NULL,
  `positive` tinyint(1) NOT NULL,
  PRIMARY KEY (`ratingID`),
  KEY `userID` (`userID`),
  KEY `answerID` (`answerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `sessionID` char(16) NOT NULL,
  `userID` char(16) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiresOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sessionID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userID` char(16) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `permissions` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `username` (`username`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `userModule`
--

CREATE TABLE IF NOT EXISTS `userModule` (
  `userModuleID` int(16) NOT NULL,
  `userID` char(16) NOT NULL,
  `moduleID` char(16) NOT NULL,
  PRIMARY KEY (`userModuleID`),
  KEY `userID` (`userID`),
  KEY `moduleID` (`moduleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`questionID`) REFERENCES `question` (`questionID`);

--
-- Constraints for table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `question_ibfk_2` FOREIGN KEY (`moduleID`) REFERENCES `module` (`moduleID`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`answerID`) REFERENCES `answer` (`answerID`);

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `userModule`
--
ALTER TABLE `userModule`
  ADD CONSTRAINT `userModule_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `userModule_ibfk_2` FOREIGN KEY (`moduleID`) REFERENCES `module` (`moduleID`);
  
CREATE USER 'som_user'@'localhost' IDENTIFIED VIA mysql_native_password USING '***';GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'som_user'@'localhost' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
