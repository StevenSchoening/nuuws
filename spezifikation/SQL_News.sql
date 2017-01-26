-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 25. Jan 2017 um 09:03
-- Server-Version: 10.1.13-MariaDB
-- PHP-Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Datenbank: `nuuws`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `category`
--

CREATE TABLE `category` (
  `catID` int(10) NOT NULL,
  `catName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categorynews`
--

CREATE TABLE `categorynews` (
  `category` int(10) NOT NULL,
  `news` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `categorynews`
--

INSERT INTO `categorynews` (`category`, `news`) VALUES
(20, 10),
(20, 11),
(30, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `crawleruri`
--

CREATE TABLE `crawleruri` (
  `uriID` int(10) NOT NULL,
  `createdTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uri` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
ALTER TABLE `crawleruri` ADD `interprete` INT(1) NOT NULL DEFAULT '0' AFTER `uri`;
--

--
ALTER TABLE `crawleruri` CHANGE `interprete` `interpret` INT(1) NOT NULL DEFAULT '0';
--

--
ALTER TABLE `crawleruri` CHANGE `interpret` `interpreted` INT(1) NOT NULL DEFAULT '0';
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `news`
--

CREATE TABLE `news` (
  `newsID` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `createdTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` int(10) NOT NULL,
  `published(Y/N)` varchar(1) NOT NULL,
  `crawlerURI` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `news`
--

INSERT INTO `news` (`newsID`, `title`, `content`, `createdTS`, `user`, `published(Y/N)`, `crawlerURI`) VALUES
(1, 'cultural awareness', '', '2017-01-24 09:48:37', 345678, 'N', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ranking`
--

CREATE TABLE `ranking` (
  `rankID` int(10) NOT NULL,
  `ranking` int(1) NOT NULL,
  `user` int(10) NOT NULL,
  `news` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tags`
--

CREATE TABLE `tags` (
  `tagsID` int(10) NOT NULL,
  `tagsName` varchar(200) NOT NULL,
  `tagsIn` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
ALTER TABLE `tags` DROP `tagsIn`;
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tagsin`
--

CREATE TABLE `tagsin` (
  `tagsInID` int(10) NOT NULL,
  `tagsInName` varchar(200) NOT NULL,
  `News` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
DROP TABLE `tagsin`;
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tagsinnews`
--

CREATE TABLE `tagsinnews` (
  `newsID` int(10) NOT NULL,
  `tagsInID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
DROP TABLE `tagsinnews`;
--

--
CREATE TABLE `nuuws`.`tagsinnews` ( 
    `news` INT(10) NOT NULL AUTO_INCREMENT , 
    `tags` INT(10) NOT NULL AUTO_INCREMENT , 
  PRIMARY KEY (`news`, `tags`)
) ENGINE = InnoDB;
--
-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `userID` int(10) NOT NULL,
  `password` varchar(250) NOT NULL,
  `fName` varchar(100) NOT NULL,
  `lName` varchar(100) NOT NULL,
  `birthDat` date NOT NULL,
  `createdTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(200) NOT NULL,
  `ipAdress` varchar(200) NOT NULL,
  `usergroup` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
ALTER TABLE `user` ADD `userName` VARCHAR(32) NOT NULL AFTER `userID`;
--

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`userID`, `password`, `fName`, `lName`, `birthDat`, `createdTS`, `email`, `ipAdress`, `usergroup`) VALUES
(1, 'sdskdfkdsfkdsh4', 'nikja', 'mylvakanam', '0000-00-00', '2017-01-24 10:01:51', '', '', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `usergroup`
--

CREATE TABLE `usergroup` (
  `groupID` int(10) NOT NULL,
  `groupName` varchar(200) NOT NULL,
  `adminArea` int(1) NOT NULL,
  `userArea` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catID`);

--
-- Indizes für die Tabelle `categorynews`
--
ALTER TABLE `categorynews`
  ADD PRIMARY KEY (`category`,`news`);

--
-- Indizes für die Tabelle `crawleruri`
--
ALTER TABLE `crawleruri`
  ADD PRIMARY KEY (`uriID`);

--
-- Indizes für die Tabelle `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`newsID`);

--
-- Indizes für die Tabelle `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`rankID`);

--
-- Indizes für die Tabelle `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tagsID`);

--
-- Indizes für die Tabelle `tagsin`
--
ALTER TABLE `tagsin`
  ADD PRIMARY KEY (`tagsInID`);

--
-- Indizes für die Tabelle `tagsinnews`
--
ALTER TABLE `tagsinnews`
  ADD PRIMARY KEY (`tagsInID`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- Indizes für die Tabelle `usergroup`
--
ALTER TABLE `usergroup`
  ADD PRIMARY KEY (`groupID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `category`
--
ALTER TABLE `category`
  MODIFY `catID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `crawleruri`
--
ALTER TABLE `crawleruri`
  MODIFY `uriID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `news`
--
ALTER TABLE `news`
  MODIFY `newsID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `ranking`
--
ALTER TABLE `ranking`
  MODIFY `rankID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `tags`
--
ALTER TABLE `tags`
  MODIFY `tagsID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `tagsin`
--
ALTER TABLE `tagsin`
  MODIFY `tagsInID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `usergroup`
--
ALTER TABLE `usergroup`
  MODIFY `groupID` int(10) NOT NULL AUTO_INCREMENT;
