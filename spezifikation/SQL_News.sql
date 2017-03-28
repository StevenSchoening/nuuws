-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2017 at 09:07 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nuuws`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catID` int(10) NOT NULL,
  `catName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categorynews`
--

CREATE TABLE `categorynews` (
  `category` int(10) NOT NULL,
  `news` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorynews`
--

INSERT INTO `categorynews` (`category`, `news`) VALUES
(20, 10),
(20, 11),
(30, 10);

-- --------------------------------------------------------

--
-- Table structure for table `crawleruri`
--

CREATE TABLE `crawleruri` (
  `uriID` int(10) NOT NULL,
  `createdTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uri` varchar(200) NOT NULL,
  `interpreted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crawleruri`
--

INSERT INTO `crawleruri` (`uriID`, `createdTS`, `uri`, `interpreted`) VALUES
(1, '2017-02-17 12:51:06', 'http://abo.spiegel.de/de/c/dein-spiegel', 0),
(2, '2017-02-17 12:51:06', 'http://abo.spiegel.de/de/c/spiegel-geschichte', 1),
(3, '2017-02-17 12:51:06', 'http://abo.spiegel.de/de/c/spiegel-wissen', 1),
(4, '2017-02-17 12:51:06', 'http://gutenberg.spiegel.de', 1),
(5, '2017-02-17 12:51:06', 'http://news.google.com/', 1),
(6, '2017-02-17 12:51:06', 'http://schneeundmehr.spiegel.de/', 1),
(7, '2017-02-17 12:51:06', 'http://sportal.spiegel.de/spiegel/ergebnisse/', 1),
(8, '2017-02-17 12:51:06', 'http://sportal.spiegel.de/spiegel/liveticker/', 1),
(9, '2017-02-17 12:51:06', 'http://tippspiel.spiegel.de', 1),
(10, '2017-02-17 12:51:06', 'http://tvprogramm.spiegel.de/', 1),
(11, '2017-02-17 12:51:06', 'http://werkstattvergleich.spiegel.de', 0),
(12, '2017-02-17 12:51:06', 'http://wetter.spiegel.de/', 0),
(13, '2017-02-17 12:51:06', 'http://www.spiegel.de/auto/aktuell/benzinpreisvergleich-die-guenstigste-tankstelle-in-ihrer-naehe-a-185826.html', 0),
(14, '2017-02-17 12:51:06', 'http://www.spiegel.de/auto/aktuell/bussgeldrechner-was-zu-schnelles-fahren-kostet-a-244772.html', 0),
(15, '2017-02-17 12:51:06', 'http://www.spiegel.de/einestages/archiv.html', 0),
(16, '2017-02-17 12:51:06', 'http://www.spiegel.de/einestages/thema/ddr/', 0),
(17, '2017-02-17 12:51:06', 'http://www.spiegel.de/einestages/thema/film/', 0),
(18, '2017-02-17 12:51:06', 'http://www.spiegel.de/einestages/thema/fotografie/', 0),
(19, '2017-02-17 12:51:06', 'http://www.spiegel.de/einestages/thema/musik/', 0),
(20, '2017-02-17 12:51:06', 'http://www.spiegel.de/einestages/thema/zweiter_weltkrieg/', 0),
(21, '2017-02-17 12:51:06', 'http://www.spiegel.de/gesundheit/diagnose/brille-krankenkassen-bezahlt-in-zukunft-ab-sechs-dioptrien-a-1134979.html', 0),
(22, '2017-02-17 12:51:06', 'http://www.spiegel.de/panorama/justiz/hannover-babys-im-koffer-mutter-bestreitet-toetungsvorsatz-a-1135011.html', 0),
(23, '2017-02-17 12:51:06', 'http://www.spiegel.de/panorama/justiz/offenbach-mutmasslicher-taeter-nach-toedlichem-angriff-auf-frau-gefasst-a-1135094.html', 0),
(24, '2017-02-17 12:51:06', 'http://www.spiegel.de/panorama/leute/spanien-infantin-cristina-wegen-steuerbetrugs-freigesporochen-a-1135101.html', 0),
(25, '2017-02-17 12:51:06', 'http://www.spiegel.de/politik/deutschland/martin-schulz-verhalf-markus-engels-zu-dauerdienstreise-a-1135053.html', 0),
(26, '2017-02-17 12:51:06', 'http://www.spiegel.de/spiegel/', 0),
(27, '2017-02-17 12:51:06', 'http://www.spiegel.de/spiegel/literaturspiegel/index-2017-2.html', 0),
(28, '2017-02-17 12:51:06', 'http://www.spiegel.de/spiegel/unispiegel/index-2017-1.html', 0),
(29, '2017-02-17 12:51:06', 'http://www.spiegel.de/story/', 0),
(30, '2017-02-17 12:51:06', 'http://www.spiegel.de/thema/buchrezensionen/', 0),
(31, '2017-02-17 12:51:06', 'http://www.spiegel.de/thema/daten/', 0),
(32, '2017-02-17 12:51:06', 'http://www.spiegel.de/thema/elterncouch/', 0),
(33, '2017-02-17 12:51:06', 'http://www.spiegel.de/thema/eu/', 0),
(34, '2017-02-17 12:51:06', 'http://www.spiegel.de/thema/meinung/', 0),
(35, '2017-02-17 12:51:06', 'http://www.spiegel.de/thema/mittelstand/', 0),
(36, '2017-02-17 12:51:06', 'http://www.spiegel.de/thema/stil_design/', 0),
(37, '2017-02-17 12:51:06', 'http://www.spiegel.de/thema/stil_hotels/', 0),
(38, '2017-02-17 12:51:06', 'http://www.spiegel.de/thema/stil_kochen/', 0),
(39, '2017-02-17 12:51:06', 'http://www.spiegel.de/thema/stil_mode/', 0),
(40, '2017-02-17 12:51:06', 'http://www.spiegel.de/thema/stil_reisen/', 0),
(41, '2017-02-17 12:51:06', 'http://www.spiegel.de/wirtschaft/service/brutto-netto-rechner-was-von-ihrem-lohn-noch-uebrig-bleibt-a-223811.html', 0),
(42, '2017-02-17 12:51:06', 'http://www.spiegel.de/wirtschaft/soziales/berlin-will-zweitwohnungssteuer-verdreifachen-a-1135046.html', 1);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `imageID` int(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `copyright` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL,
  `imagePath` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`imageID`, `title`, `description`, `copyright`, `link`, `imagePath`) VALUES
(1, 'Berlin-Wilmersdorf', '', 'spiegel', 'http://cdn2.spiegel.de/images/image-1108379-860_poster_16x9-pkps-1108379.jpg', 'C:/xampp/htdocs/nuuws/portal/assets/images/sp/af8b4e595067374688eec35da96131c1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `navigation`
--

CREATE TABLE `navigation` (
  `parentID` int(10) NOT NULL,
  `link` varchar(200) NOT NULL,
  `linkName` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `newsID` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `createdTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(10) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `crawlerURI` text NOT NULL,
  `priority` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`newsID`, `title`, `content`, `createdTS`, `userID`, `published`, `crawlerURI`, `priority`) VALUES
(1, 'Berlin will Zweitwohnungssteuer verdreifachen', '<p>Der Berliner Senat will künftig die Zweitwohnungssteuer von fünf auf 15 Prozent der Nettokaltmiete verdreifachen, sagte Finanzsenator Matthias Kollatz-Ahnen (SPD) der \"Rheinischen Post\" aus Düsseldorf vom Freitag.</p><p>Berlin werde in Kürze einen Gesetzentwurf zur Erhöhung der Zweitwohnungssteuer auf den Weg bringen. Betroffen sind demnach viele Abgeordnete, Studenten oder Berlin-Besucher.</p><p>Dem Zeitungsbericht zufolge hat Berlin als größte deutsche Metropole auch die größte Zahl gemeldeter Zweitwohnsitze. Demnach sind Zehntausende Menschen mit dem Erstwohnsitz anderswo gemeldet und damit auch dort einkommensteuerpflichtig. </p><p>Zumindest ein Teil dieser Steuern soll künftig an Berlin gezahlt werden. \"Unser Ziel ist vor allem der Lenkungseffekt: Wir wollen mehr Menschen motivieren, in Berlin ihren Erstwohnsitz anzumelden\", sagte Kollatz-Ahnen.</p>', '2017-02-17 10:02:00', 0, 1, 'http://www.spiegel.de/wirtschaft/soziales/berlin-will-zweitwohnungssteuer-verdreifachen-a-1135046.html', 0);

-- --------------------------------------------------------

--
-- Table structure for table `newsimage`
--

CREATE TABLE `newsimage` (
  `images` int(10) NOT NULL,
  `news` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsimage`
--

INSERT INTO `newsimage` (`images`, `news`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ranking`
--

CREATE TABLE `ranking` (
  `rankID` int(10) NOT NULL,
  `ranking` int(1) NOT NULL,
  `user` int(10) NOT NULL,
  `news` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `sessionID` int(10) NOT NULL,
  `userID` int(10) NOT NULL,
  `createdTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tagsID` int(10) NOT NULL,
  `tagsName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tagsID`, `tagsName`) VALUES
(1, 'Wirtschaft'),
(2, 'Staat & Soziales'),
(3, 'Immobilien');

-- --------------------------------------------------------

--
-- Table structure for table `tagsinnews`
--

CREATE TABLE `tagsinnews` (
  `news` int(10) NOT NULL,
  `tags` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tagsinnews`
--

INSERT INTO `tagsinnews` (`news`, `tags`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(10) NOT NULL,
  `userName` varchar(32) NOT NULL,
  `password` varchar(250) NOT NULL,
  `fName` varchar(100) NOT NULL,
  `lName` varchar(100) NOT NULL,
  `birthDat` date NOT NULL,
  `createdTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(200) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `userName`, `password`, `fName`, `lName`, `birthDat`, `createdTS`, `email`, `isActive`, `isAdmin`) VALUES
(1, '', 'sdskdfkdsfkdsh4', 'nikja', 'mylvakanam', '0000-00-00', '2017-01-24 10:01:51', '', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catID`);

--
-- Indexes for table `categorynews`
--
ALTER TABLE `categorynews`
  ADD PRIMARY KEY (`category`,`news`);

--
-- Indexes for table `crawleruri`
--
ALTER TABLE `crawleruri`
  ADD PRIMARY KEY (`uriID`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`imageID`);

--
-- Indexes for table `navigation`
--
ALTER TABLE `navigation`
  ADD PRIMARY KEY (`parentID`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`newsID`);

--
-- Indexes for table `newsimage`
--
ALTER TABLE `newsimage`
  ADD PRIMARY KEY (`images`,`news`);

--
-- Indexes for table `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`rankID`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`sessionID`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tagsID`);

--
-- Indexes for table `tagsinnews`
--
ALTER TABLE `tagsinnews`
  ADD PRIMARY KEY (`news`,`tags`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `crawleruri`
--
ALTER TABLE `crawleruri`
  MODIFY `uriID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `imageID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `navigation`
--
ALTER TABLE `navigation`
  MODIFY `parentID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `newsID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ranking`
--
ALTER TABLE `ranking`
  MODIFY `rankID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `sessionID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tagsID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
