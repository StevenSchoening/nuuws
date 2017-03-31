-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2017 at 10:20 AM
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
-- Table structure for table `adress`
--

CREATE TABLE `adress` (
  `adressID` int(10) NOT NULL,
  `street` varchar(200) NOT NULL,
  `homeNo` varchar(10) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bankdetails`
--

CREATE TABLE `bankdetails` (
  `detailsID` int(10) NOT NULL,
  `bankName` varchar(200) NOT NULL,
  `IBAN` varchar(100) NOT NULL,
  `bankCode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catID` int(10) NOT NULL,
  `catName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catID`, `catName`) VALUES
(1, 'Wirtschaft'),
(2, 'Auto');

-- --------------------------------------------------------

--
-- Table structure for table `categorytags`
--

CREATE TABLE `categorytags` (
  `category` int(10) NOT NULL,
  `tag` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorytags`
--

INSERT INTO `categorytags` (`category`, `tag`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentID` int(10) NOT NULL,
  `comment` text NOT NULL,
  `user` int(10) NOT NULL,
  `news` int(10) NOT NULL,
  `createdTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `publicized` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, '2017-03-30 09:07:48', 'http://abo.spiegel.de/de/c/dein-spiegel', 0),
(2, '2017-03-30 09:07:48', 'http://abo.spiegel.de/de/c/spiegel-geschichte', 1),
(3, '2017-03-30 09:07:48', 'http://abo.spiegel.de/de/c/spiegel-wissen', 1),
(4, '2017-03-30 09:07:48', 'http://gutenberg.spiegel.de', 1),
(5, '2017-03-30 09:07:48', 'http://news.google.com/', 1),
(6, '2017-03-30 09:07:48', 'http://schneeundmehr.spiegel.de/', 1),
(7, '2017-03-30 09:07:48', 'http://sportal.spiegel.de/spiegel/ergebnisse/', 1),
(8, '2017-03-30 09:07:48', 'http://sportal.spiegel.de/spiegel/liveticker/', 1),
(9, '2017-03-30 09:07:48', 'http://tippspiel.spiegel.de', 1),
(10, '2017-03-30 09:07:48', 'http://tvprogramm.spiegel.de/', 1),
(11, '2017-03-30 09:07:48', 'http://werkstattvergleich.spiegel.de', 1),
(12, '2017-03-30 09:07:48', 'http://wetter.spiegel.de/', 1),
(13, '2017-03-30 09:07:48', 'http://www.spiegel.de/auto/aktuell/benzinpreisvergleich-die-guenstigste-tankstelle-in-ihrer-naehe-a-185826.html', 1),
(14, '2017-03-30 09:07:48', 'http://www.spiegel.de/auto/aktuell/bussgeldrechner-was-zu-schnelles-fahren-kostet-a-244772.html', 1),
(15, '2017-03-30 09:07:48', 'http://www.spiegel.de/auto/fahrberichte/mercedes-amg-gt-c-roadster-im-test-der-kann-kannibalisieren-a-1141004.html', 1),
(16, '2017-03-30 09:07:48', 'http://www.spiegel.de/einestages/archiv.html', 1),
(17, '2017-03-30 09:07:48', 'http://www.spiegel.de/einestages/thema/ddr/', 1),
(18, '2017-03-30 09:07:48', 'http://www.spiegel.de/einestages/thema/film/', 1),
(19, '2017-03-30 09:07:48', 'http://www.spiegel.de/einestages/thema/fotografie/', 1),
(20, '2017-03-30 09:07:48', 'http://www.spiegel.de/einestages/thema/musik/', 0),
(21, '2017-03-30 09:07:48', 'http://www.spiegel.de/einestages/thema/zweiter_weltkrieg/', 0),
(22, '2017-03-30 09:07:48', 'http://www.spiegel.de/gesundheit/diagnose/gelaehmter-kann-selbst-essen-erstmals-nach-acht-jahren-a-1140922.html', 0),
(23, '2017-03-30 09:07:48', 'http://www.spiegel.de/kultur/tv/sandra-maischberger-talk-zum-brexit-das-wird-kein-success-a-1141064.html', 0),
(24, '2017-03-30 09:07:48', 'http://www.spiegel.de/netzwelt/gadgets/microsoft-windows-10-bekommt-im-april-creators-update-mit-3d-funktionen-a-1140903.html', 0),
(25, '2017-03-30 09:07:48', 'http://www.spiegel.de/politik/ausland/donald-trump-us-senat-prueft-russische-einflussnahme-auf-wahlen-auch-in-europa-a-1141073.html', 0),
(26, '2017-03-30 09:07:48', 'http://www.spiegel.de/politik/ausland/donald-trump-zweites-einreiseverbot-auf-unbestimmte-zeit-ausgesetzt-a-1141066.html', 0),
(27, '2017-03-30 09:07:48', 'http://www.spiegel.de/spiegel/', 0),
(28, '2017-03-30 09:07:48', 'http://www.spiegel.de/spiegel/literaturspiegel/index-2017-4.html', 0),
(29, '2017-03-30 09:07:48', 'http://www.spiegel.de/spiegel/unispiegel/index-2017-1.html', 0),
(30, '2017-03-30 09:07:48', 'http://www.spiegel.de/story/', 0),
(31, '2017-03-30 09:07:48', 'http://www.spiegel.de/thema/buchrezensionen/', 0),
(32, '2017-03-30 09:07:48', 'http://www.spiegel.de/thema/daten/', 0),
(33, '2017-03-30 09:07:48', 'http://www.spiegel.de/thema/elterncouch/', 0),
(34, '2017-03-30 09:07:48', 'http://www.spiegel.de/thema/eu/', 0),
(35, '2017-03-30 09:07:48', 'http://www.spiegel.de/thema/meinung/', 0),
(36, '2017-03-30 09:07:48', 'http://www.spiegel.de/thema/mittelstand/', 0),
(37, '2017-03-30 09:07:48', 'http://www.spiegel.de/thema/stil_design/', 0),
(38, '2017-03-30 09:07:48', 'http://www.spiegel.de/thema/stil_hotels/', 0),
(39, '2017-03-30 09:07:48', 'http://www.spiegel.de/thema/stil_kochen/', 0),
(40, '2017-03-30 09:07:48', 'http://www.spiegel.de/thema/stil_mode/', 0),
(41, '2017-03-30 09:07:48', 'http://www.spiegel.de/thema/stil_reisen/', 0),
(42, '2017-03-30 09:07:48', 'http://www.spiegel.de/wirtschaft/service/brutto-netto-rechner-was-von-ihrem-lohn-noch-uebrig-bleibt-a-223811.html', 1),
(43, '2017-03-30 09:07:48', 'http://www.spiegel.de/wirtschaft/unternehmen/donald-trump-wie-die-deutsche-bank-ihr-trump-problem-loswerden-will-a-1141065.html', 1);

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
(1, 'US-Präsident Donald Trump', '', 'spiegel', 'http://cdn4.spiegel.de/images/image-1123997-860_poster_16x9-kwms-1123997.jpg', 'C:/xampp/htdocs/nuuws/portal/assets/images/sp/42a57118e9bdd2c72797b31586fe6b8d2112.jpg'),
(2, 'Gehaltsverhandlungen: Sieben goldene Regeln', '', 'spiegel', 'http://cdn2.spiegel.de/images/image-1091699-breitwandaufmacher-jvda-1091699.jpg', 'C:/xampp/htdocs/nuuws/portal/assets/images/sp/f47bc351770dc5dcff5dc511ce689c618897.jpg'),
(3, 'Mercedes AMG GTC Roadster: Pink steht ihm', '', 'spiegel', 'http://cdn4.spiegel.de/images/image-1123627-breitwandaufmacher-omzq-1123627.jpg', 'C:/xampp/htdocs/nuuws/portal/assets/images/sp/de0ace986786fec7a604067481fc5c2a7852.jpg'),
(4, 'Günstig tanken: Nutzen Sie unseren Benzinpreisvergleich', '', 'spiegel', 'http://cdn2.spiegel.de/images/image-333831-breitwandaufmacher-clsg-333831.jpg', 'C:/xampp/htdocs/nuuws/portal/assets/images/sp/ca026a182171c360c87c51e041378b7e582.jpg');

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
(1, 'Donald Trump Wie die Deutsche Bank ihr Trump-Problem loswerden will', '<p>Die Deutsche Bank gehört zu den größten Gläubigern von Donald Trump - eine Rolle, die dem Konzern aus verschiedenen Gründen unangenehm ist. Laut Medienberichten versucht die Bank derzeit, seine Trump-Kredite zu restrukturieren.</p><p>Offiziell will die Deutsche Bank <a href=\"http://boersen.manager-magazin.de/mm/kurse_einzelkurs_suche.htn?isin=DE0005140008\" target=\"Boerse\"><img src=\"/static/sys/v10/icons/chartlink15x11.png\" width=\"15\" height=\"11\" alt=\"Chart zeigen\" /></a> nichts zu ihren Trump-Deals sagen, die Verbindlichkeiten sollen aber bei gut 300 Millionen Dollar liegen. Ein Bericht der Finanznachrichtenagentur <a href=\"https://www.bloomberg.com/politics/articles/2017-03-27/deutsche-bank-in-bind-over-how-to-modify-300-million-trump-debt\" target=\"_blank\" title=\"Bloomberg über Trump-Kredit der Deutschen Bank\" class=\"spTextlinkExt text-link-ext lp-text-link-ext\">Bloomberg</a> erklärt die Probleme der Bank.</p><p>Demnach wurden drei Trump-Immobilien mithilfe der Deutschen Bank finanziert:</p><p>Restrukturierung ist in Zusammenhang mit Krediten ein böses Wort. Meist wird damit eine Umschuldung beschönigt, die nötig wird, weil der Schuldner seine Zahlungspflicht nicht erfüllen kann oder will - man könnte auch Pleite dazu sagen.</p><p>Doch während der Schuldner Trump und die Gläubigerin Deutsche Bank sich in der Vergangenheit schon vor Gericht über Zahlungsmoral stritten, gilt diesmal nicht das Kreditrisiko als Problem. Die laufenden Darlehen würden regelmäßig bedient, heißt es.</p><p> <b>Die Deutsche Bank könnte Trumps persönlichen Besitz pfänden</b> </p><p>Was den Bankern stattdessen offenbar Sorge bereitet, ist das Risiko für ihren Ruf - und für ihre juristische Integrität. Sie würden die Trump-Kredite gern als reine Immobilienfinanzierung behandeln, mit inzwischen gut ausgelasteten Gewerbeimmobilien in Top-Lagen als Sicherheit. Zins und Tilgung zahlt die Trump Organization, die nun von Trumps Söhnen Eric und Donald jr. geführt wird.</p><p>Doch Donald Trump senior, der eigentlich gar nichts mehr mit dem Geschäftlichen zu tun haben soll, hat die Rückzahlung der Kredite persönlich garantiert. Falls doch einmal einer davon faul würde, könnte - oder müsste - die Bank also den Besitz des amtierenden Präsidenten der Vereinigten Staaten pfänden - oder es zumindest versuchen.</p><p>Dem Vernehmen nach wurden die Kredite auch von der Sparte Vermögensverwaltung für superreiche Privatkunden vergeben - im Fall Chicago, um die Kollegen von der Unternehmenskundensparte, der Trump einst als Türöffner ins Amerikageschäft diente, aus dem Problemkredit herauszulösen.</p><p>Laut Bloomberg zielt die Deutsche Bank nun darauf ab, das Verhältnis zu professionalisieren, die persönliche Garantie aus den Verträgen zu nehmen und durch die Immobilien als Sicherheit zu ersetzen. Ein Trump-Anwalt hatte im Dezember erklärt, das Darlehen für den Turm in Chicago sei bereits entsprechend geändert worden.</p><p>Für Miami und Washington stockt das Vorhaben aber offenbar. Die Bank, die noch eine US-Strafe wegen Geldwäsche in Russland erwartet, will weder Kritikern eine Vorlage liefern, indem sie Trump billig aus seiner Vertragspflicht entlässt; noch mag sie ein schlechtes Verhältnis mit der Trump Organization riskieren, wenn sie als Preis für den Verzicht die Zinsen anhebt.</p><p>So oder so, den Interessenkonflikt mit Trump wird die Deutsche Bank wohl nicht so schnell los.</p>', '2017-03-30 05:53:00', 0, 1, 'http://www.spiegel.de/wirtschaft/unternehmen/donald-trump-wie-die-deutsche-bank-ihr-trump-problem-loswerden-will-a-1141065.html', 0),
(2, 'Brutto-Netto-Rechner 2017 Was von Lohn und Gehalt übrig bleibt', '<p>Das Gehalt für den neuen Job hört sich gut an. Doch wie viel Geld bleibt netto davon übrig? Welche Steuerklasse ist die günstigste, wenn beide Ehepartner arbeiten? Und wie wirkt sich ein Kinderfreibetrag aus?</p><p>All diese Fragen lassen sich mit dem Brutto-Netto-Rechner beantworten. Tragen Sie einfach Ihren Bruttolohn und Freibetrag ein, wählen Sie Steuerklasse, Bundesland und Krankenkasse. Falls Sie Kinder haben, geben Sie mögliche Kinderfreibeträge an. Je mehr Angaben Sie machen, desto genauer ist das Ergebnis.</p><p> <b>In Kooperation mit Steuerfachanwalt Disqué</b> </p><p> <span class=\"spTextSmaller\"> Für die Richtigkeit und Vollständigkeit der Tabelle sowie des ermittelten Auswertungsergebnisses wird keine Gewährleistung übernommen. </span> </p><p>Um den Rechner benutzen zu können, müssen Sie zunächst ihre Lohnsteuerklasse kennen. Hier eine kurze Übersicht, in welche Klasse Sie gehören.</p><p>Die <b>Lohnsteuerklasse I</b> gilt für die folgenden Arbeitnehmer:<br/>  -Ledige<br/>  -Verwitwete ab dem übernächsten Jahr nach dem Tod des Ehepartners oder eingetragenen Lebenspartners<br/>  -Geschiedene<br/>  -Verheiratete oder in Partnerschaft lebende, die dauernd getrennt leben<br/>  -Verheiratete oder in Partnerschaft lebende, deren Ehegatte oder eingetragener Lebenspartner in der Bundesrepublik nur beschränkt steuerpflichtig ist (in der Regel, weil er oder sie nicht in Deutschland lebt)</p><p>Die<b> Lohnsteuerklasse II</b> gilt für Alleinerziehende, die die Voraussetzungen der Steuerklasse I erfüllen und die zusätzlich Anspruch auf den Entlastungsbetrag für Alleinerziehende haben.</p><p>In die<b> Lohnsteuerklasse III</b> fallen folgende Arbeitnehmer:<br/>  -Verheiratete und eingetragene Lebenspartner, die nicht dauernd getrennt leben und nicht die Steuerklasse IV gewählt haben. Der ebenfalls berufstätige Ehepartner oder Lebenspartner erhält dann die Steuerklasse V. Wenn der andere Partner nicht berufstätig oder selbstständig ist, gilt für ihn ebenfalls die Lohnsteuerklasse III.<br/>  -Verwitwete bis zum Ende des auf den Tod des Ehegatten/Lebenspartners folgenden Kalenderjahres. Der verstorbene Ehegatte oder Lebenspartner muss zum Zeitpunkt seines Todes unbeschränkt einkommensteuerpflichtig gewesen sein. Die Ehegatten oder Lebenspartner dürfen bis zum Zeitpunkt des Todes nicht dauernd getrennt gelebt haben.</p><p>In die<b> Lohnsteuerklasse IV </b>fallen verheiratete oder in Partnerschaft lebende Arbeitnehmer, wenn beide Partner unbeschränkt einkommensteuerpflichtig sind und nicht dauernd getrennt leben. Wenn allerdings für einen Partner die Steuerklasse III gilt, fällt der andere nicht in Steuerklasse IV, sondern in Steuerklasse V. Ehegatten oder Lebenspartner, die beide berufstätig sind, können die Steuerklasse einmal im Jahr ändern lassen.</p><p>Die <b>Steuerklasse V</b> wird angewendet, wenn beide Ehegatten oder Lebenspartner beantragen, den jeweils anderen Ehegatten oder Lebenspartner in die Steuerklasse III einzureihen (siehe oben)</p><p>Die<b> Lohnsteuerklasse VI </b>wird in der Regel eingetragen, wenn ein Arbeitnehmer mehr als ein Arbeitsverhältnis hat.</p><p> <b>Wie ändern sich Ihre Finanzen, wenn Sie Ihr Leben ändern?</b> </p><p>Mit Hilfe dieses Rechners können Sie zum Beispiel schnell und unkompliziert herausfinden, wie sich ein Jobwechsel oder eine Gehaltserhöhung auf Ihr Nettogehalt auswirken. So vermeiden sie Überraschungen, wenn sie dann tatsächlich die ersten neue Gehaltsabrechnung in Händen halten. Auch andere Veränderungen im Leben lassen sich mit Hilfe des Rechners auf ihre finanziellen Auswirkungen hin abklopfen.</p><p> <b>Sie wollen heiraten?</b> Dann müssen Sie sich zusammen mit Ihrem Partner überlegen, in welchen Steuerklassen Sie arbeiten wollen: Entweder der eine in III oder der andere in V oder beide in IV. Die Steuerklasse IV für beide Partner ist empfehlenswert, wenn beide ähnlich viel verdienen. Sonst eher die Kombination aus III für den einen Partner und V für den anderen. Die Steuerklassen unterscheiden sich aber nur dadurch, wie viel Steuer monatlich automatisch vom Gehalt abgezogen wird. Wer zu viel gezahlt hat, bekommt das Geld einmal im Jahr nach Abgabe seiner Steuererklärung zurück.</p><p> <b>Sie erwarten ein Kind?</b> Dann erhöht sich in der Regel ihr Nettogehalt durch Kinderfreibeträge und ein höheres Kindergeld.</p><p> <b>Sie sind vom Glauben abgefallen?</b> Dann können Sie überprüfen, ob die gesparte Kirchensteuer den Verzicht aufs ewige Seelenheil wett machen kann.</p><p> <b>Sie erwägen, von der gesetzlichen in die private Krankenkasse wechseln?</b> Wenn sie wissen, welchen Beitragssatz ihre neue Versicherung verlangt, können Sie anhand des Rechners überprüfen, wie sich dadurch ihr Netto-Gehalt verändert.</p><p>Allerdings sollten Sie die Frage der richtigen Krankenversicherung auf keinen Fall allein von steuerlichen Erwägungen abhängig machen. Die mögliche Steuerersparnis fällt gering aus gegenüber den gewaltigen Kosten, die eine schlecht gewählte private Krankenversicherung im Laufe der Jahre verursacht. Welche Versicherungen für Sie generell sinnvoll sind, <a href=\"http://spiegel.de/wirtschaft/service/versicherung-check-fuer-haftpflicht-hausrat-berufsunfaehigkeit-a-960380.html\" target=\"_blank\" title=\"finden Sie in unserem Überblick\" class=\"text-link-int lp-text-link-int\">finden Sie in unserem Überblick</a>.</p><p>Die allermeisten Möglichkeiten zur Steuerersparnis erschließen sich nur dem, der auch eine Steuererklärung abgibt. Gerade für junge Arbeitnehmer kann das eine ziemliche Herausforderung sein. <a href=\"http://spiegel.de/wirtschaft/service/steuererklaerung-hilfe-bei-einkommensteuer-fuer-berufseinsteiger-a-969128.html\" target=\"_blank\" title=\"Eine Hilfestellung finden Sie hier\" class=\"text-link-int lp-text-link-int\">Eine Hilfestellung finden Sie hier</a>.</p>', '2016-02-01 15:49:00', 0, 1, 'http://www.spiegel.de/wirtschaft/service/brutto-netto-rechner-was-von-ihrem-lohn-noch-uebrig-bleibt-a-223811.html', 0),
(3, 'Mercedes AMG GT C Roadster im Test Der kann kannibalisieren', '<p> <b>Der erste Eindruck: </b>Wow, für einen Mercedes hat der AMG GTC fast schon obszöne Rundungen.</p><p> <b>Das sagt der Hersteller: </b>\"Wir wollten mit dem GT frischen Wind ins Segment der Sportwagen bringen\", sagt Jürgen Hirsch aus der AMG-Entwicklung mit Sitz in Affalterbach. Absatzzahlen für den Zweitürer möchte er zwar nicht nennen, doch laut Statistik des Kraftfahrt-Bundesamts waren es 2016 in Deutschland rund 1300 Neuzulassen. Das sieht nach gelungenem Einstand aus - auch wenn der <a href=\"http://spiegel.de/auto/fahrberichte/porsche-911-cabrio-endlich-ein-dach-ueber-dem-kopf-a-813864.html\" target=\"_blank\" title=\"Porsche 911\" class=\"text-link-int lp-text-link-int\">Porsche 911</a> in der gleichen Statistik auf 8016 Exemplare kommt.</p><p>Der Porsche kostet weniger, ist das traditionsreichere Auto, und es gibt zahlreiche Varianten. Letzteres strebt auch Mercedes AMG an, weshalb AMG-Chef Tobias Moers bei den neuen Roadster-Modellen von einer \"strategischen Ausweitung der GT-Familie\" spricht. </p><p>Mit den Coupés <a href=\"http://spiegel.de/auto/aktuell/mercedes-amg-gt-neuer-porsche-911-gegner-mit-maechtigem-v8-turbomotor-a-990567.html\" target=\"_blank\" title=\"GT\" class=\"text-link-int lp-text-link-int\">GT</a>, GTS, GTC und <a href=\"http://spiegel.de/auto/fahrberichte/mercedes-amg-gt-r-der-radikale-unter-den-sportwagen-a-1125879.html\" target=\"_blank\" title=\"GTR\" class=\"text-link-int lp-text-link-int\">GTR</a>, dem Rennwagen GT 3 und den beiden neuen Roadstern ist die Familie des Sportwagens bereits auf sieben Mitglieder gewachsen. Doch dabei soll es nicht bleiben. So hat AMG bereits die Serienfassung der viertürigen GT-Studie bestätigt und eine aufgemotzte \"Black Series\" in Aussicht gestellt. \"Für die Zukunft des GT\", so kokettiert Moers mit der brachialen Top-Version, \"sehe ich schwarz.\"</p><p> <i>Werfen Sie einen Blick in den Innenraum des AMG GTC Roadster - mit unserem 360-Grad-Foto:</i> </p><p> <b>Das ist uns aufgefallen: </b>Es sind nur elf Sekunden, doch im GT Roadster kommt einem diese Zeitspanne vor wie eine Ewigkeit. Elf Sekunden, dann hat sich das knappe Stoffdach elektrisch hinter die Sitze gefaltet. So lange muss man sich zusammenreißen und mit weniger als 50 km/h dahinfahren. Klingt banal, ist aber schwierig, denn in diesem Wagen drängt alles nach vorn. In rund vier Sekunden könnte man mit dem Auto auf Tempo 100 beschleunigen; oder, mit elektronischer Hilfe für den perfekten Kavalierstart, in elf Sekunden weit mehr als 200 Sachen schnell sein. Das gilt für den normalen GT Roadster mit 476 PS Leistung und 630 Nm Drehmoment, und erst recht für den GTC mit 557 PS und 680 Nm.</p><p>Der vier Liter große V8-Motor reagiert so giftig auf jeden Gasstoss, dass man entweder feinfühlige Füße oder eine stabile Nackenmuskulatur braucht. Überhaupt das Set-up: Wie die <a href=\"http://spiegel.de/auto/fahrberichte/mercedes-amg-gt-r-der-radikale-unter-den-sportwagen-a-1125879.html\" target=\"_blank\" title=\"Variante GT-R\" class=\"text-link-int lp-text-link-int\">Variante GT-R</a> hat auch der GTC ein elektronisches Sperrdifferenzial an der Hinterachse und lenkt mit den 305er-Reifen aktiv mit. Das Differenzial verbessert dazu die Traktion der Antriebsräder, damit man nach dem Scheitelpunkt der Kurve sogleich wieder aufs Gas treten kann.</p><p>Die Hinterachslenkung wiederum verkürzt virtuell den Radstand, und das Auto kommt leichter ums Eck. In Kombination können beide Systeme zu einer Sinnestäuschung führen: Obwohl der Wagen mit 4,56 Meter Länge und 1,7 Tonnen Gewicht ziemlich stattlich daherkommt, fühlt er sich handlich und leicht an. </p><p>Ein puristischer Racer ist der Wagen indes nicht. Bei einem Mercedes muss offenbar immer noch ein gewisses Maß an Luxus geboten werden - das gilt auch für die Autos der selbst ernannten \"Performance-Marke\" AMG. Wählt man also den Fahrmodus \"Comfort\", kann man sich entspannt zurücklehnen, den Nackenföhn anschalten und die Sitzklimatisierung genießen.</p><p>Auf der einen Seite ist das schade, weil der GT als Roadster trotz vergleichbarer Leistungsdaten nicht ganz so rabiat und lustvoll ist wie ein <a href=\"http://spiegel.de/auto/aktuell/lamborghini-huracan-die-ersten-bilder-des-gallardo-nachfolgers-a-939846.html\" target=\"_blank\" title=\"Lamborghini Huracan,\" class=\"text-link-int lp-text-link-int\">Lamborghini Huracan,</a> ein <a href=\"http://spiegel.de/auto/fahrberichte/audi-r8-spyder-ein-trumpf-fuers-autoquartett-a-683868.html\" target=\"_blank\" title=\"Audi R8\" class=\"text-link-int lp-text-link-int\">Audi R8</a> oder ein Ferrari 488. Auf der anderen Seite jedoch ist es ein Vorteil, weil man das teure, offene Auto öfter und vor allem länger genießen kann.</p><p>Für diesen Kompromiss stand im Daimler-Portfolio bislang vor allem ein anderes Modell, und damit wirft der Wagen eine Frage auf: Was wird aus dem <a href=\"http://spiegel.de/auto/fahrberichte/mercedes-sl-luxus-roadster-mit-all-inklusive-anspruch-a-1079409.html\" target=\"_blank\" title=\"Mercedes SL\" class=\"text-link-int lp-text-link-int\">Mercedes SL</a>? Der ist nämlich in seiner aktuellen Verfassung ein hoffnungslos vernachlässigtes Klappdachmodell - und ist entsprechend erfolglos. Wo zwischen dem sportlichen GT Roadster und dem luxuriösem <a href=\"http://spiegel.de/auto/fahrberichte/mercedes-s-klasse-cabrio-im-test-luxus-unter-freiem-himmel-a-1087168.html\" target=\"_blank\" title=\"S-Klasse Cabrio\" class=\"text-link-int lp-text-link-int\">S-Klasse Cabrio</a> zukünftig noch Platz für den Klassiker SL sein soll, ist jedenfall unklar.</p><p> <b>Das muss man wissen: </b>Die Auslieferung des GT Roadsters startet in diesen Tagen, und die Preise beginnen bei 129.180 Euro für das Grundmodell und 160.650 Euro für den GTC. Damit liegt der Aufpreis für die Variante mit dem dreilagigen Faltverdeck mit einer massiven Unterschicht aus Aluminium, Magnesium und Kunststoff bei gut 12.000 Euro.</p><p>Die Roadster-Variante verfügt aber auch über ein paar weitere Finessen, die schrittweise sicher auch im Coupé zum Einsatz kommen werden. Um das Gewicht zu drücken und den Schwerpunkt zu senken, wird etwa der Deckel für den 165 Liter fassenden Kofferraum aus Karbon gefertigt. Und zugunsten der Aerodynamik gibt es hinter dem Kühlergrill ein sogenanntes Airpanel - eine Jalousie, mit der sich der Schlund öffnen und schließen lässt.</p><p> <b>Das werden wir nicht vergessen:</b> Den Blick zurück im geschlossenen Auto. Der blieb nämlich erst an einem Windschott hängen, das billig aussieht und kaum Wirkung zeigt, und danach verlor er sich zwischen dem Buckel des Verdeckkastens und der kleinen Heckscheibe. Zum Glück lässt sich das Dach öffnen und damit eine Rundumaussicht herstellen.</p>', '2017-03-29 22:46:00', 0, 1, 'http://www.spiegel.de/auto/fahrberichte/mercedes-amg-gt-c-roadster-im-test-der-kann-kannibalisieren-a-1141004.html', 0),
(4, 'Benzinpreise aktuell Die günstigste Tankstelle in Ihrer Nähe', '<p> <b>Super, Super E10, SuperPlus und Diesel - Vergleichen Sie bei uns die aktuellen Benzinpreise und finden Sie die günstigste Tankstelle in ihrer Nähe. Tanken Sie künftig immer günstig!</b> </p><p>So geht\'s: Wählen Sie den gewünschten Kraftstoff aus und geben Sie die Postleitzahl <b>oder</b> den Namen der gesuchten Stadt ein (Städtenamen müssen mit Umlauten geschrieben werden, also \"Lüneburg\" statt \"Lueneburg\") - schon sehen Sie das Ergebnis. Alle Preise ohne Gewähr.</p><p> <a class=\"aGo\" onclick=\"submitBPV();return false;\" type=\"submit\">Suche starten!</a> </p><p> <b>Mysterium Spritpreis - so tanken Sie günstig</b> </p><p>Einmal voll tanken für einen Euro - der Traum eines jeden Autofahrers. Und er ist seit fast zwanzig Jahren Wirklichkeit: allerdings in Venezuela. Dort wird der Treibstoff zu 90 Prozent vom Staat subventioniert, was dazu führt, dass ein Liter Benzin umgerechnet weniger als zwei Cent kostet. Davon können deutsche Autofahrer nur träumen. Im vergangenen Jahr kostete ein Liter <a href=\"http://spiegel.de/thema/benzin/\" target=\"_blank\" title=\"Benzin\" class=\"text-link-int lp-text-link-int\">Benzin</a> in Deutschland 1,549 Euro für Super E10 und 1,420 für <a href=\"http://spiegel.de/thema/diesel/\" target=\"_blank\" title=\"Diesel\" class=\"text-link-int lp-text-link-int\">Diesel</a>. Seit Ende August 2013 müssen mehr als 14.000 Tankstellen in Deutschland ihre aktuellen Preise melden. Wie sich der Spritpreis zusammensetzt, wodurch er beeinflusst wird und wie man die Spritkosten möglichst gering halten kann - das wird im Folgenden kurz und bündig erklärt.</p><p> <b>? Wie setzt sich der Benzinpreis zusammen?</b> </p><p>Den größten Anteil am Benzinpreis machen Steuern aus, nämliche die Energiesteuer von 65,45 Cent pro Liter sowie die 19 Prozent Mehrwertsteuer. Hinzu kommt der Produktpreis, der für Europa an der Rohöl-Börse des Hafens in Rotterdam ermittelt wird, wo auch die Preise für Benzin, Diesel und Heizöl festgelegt werden. Des weiteren schlagen die Mineralölgesellschaften und Tankstellen ihre jeweiligen Betriebs- und Lagerkosten auf den Preis auf. </p><p>Hier ein Beispiel: Im Januar dieses Jahres kostete ein Liter Benzin für Autofahrer durchschnittlich 151,9 Cent pro Liter. Dieser Betrag setzt sich zusammen aus: 65,45 Cent Energiesteuer, zirka 51 Cent Produktpreis, 24,25 Cent Mehrwertsteuer und rund 11 Cent, die als Deckungsbeitrag bezeichnet werden. In diesen 11 Cent sind unter anderem die Betriebskosten und der Gewinn der Tankstellen enthalten.</p><p> <b>? Welche Faktoren beeinflussen die Benzinpreise?</b> </p><p>Der Benzinpreis unterliegt laufenden Schwankungen und variiert inzwischen mehrmals täglich. Die Preisentwicklung wird dabei vom Rohölpreis, von der Fördermenge, von der weltweiten Nachfrage, vom Wechselkurs des Euro (denn Rohöl wird in Dollar gehandelt), dem von den Mineralölgesellschaften festgelegten Produktpreis und dazu von globalen, politischen und ökonomischen Entwicklungen beeinflusst. </p><p>Steigt der Preis pro Barrel Rohöl (ein Barrel sind exakt 158,987 Liter) auf dem Weltmarkt, steigt auch der Preis des Benzins an den heimischen Tankstellen.</p><p>Ein Barrel der für den europäischen Rohölmarkt wichtigen Nordseesorte Brent kostete Anfang 2009 noch 40 Dollar, aktuell sind es rund 90 Dollar.</p><p> <b>? Ist der Benzinpreis verantwortlich für steigende Mobilitätskosten?</b> </p><p>Nach Angaben des Verbraucherpreisindex des Statistischen Bundesamts stiegen die Preise für die allgemeinen Mobilitätskosten im Zeitraum von 2009 bis 2013 um mehr als zehn Prozent. Dieser Preisanstieg liegt jedoch nicht allein daran, dass im gleichen Zeitraum die Preise für Diesel und Benzin um mehr als 23 Prozent gestiegen sind. </p><p>Denn zusätzlich kletterten auch die weiteren Betriebskosten für einen Pkw - etwa Reparaturen, Inspektionen sowie Kfz-Versicherungen - um durchschnittlich jeweils gut acht Prozent. Teurer wurden in diesem Zeitraum zudem Gebrauchtwagen (+0,8%), Neuwagen (+2,8 %) sowie Ersatzteile und Pflegemittel (+5,5%). Insgesamt entfällt etwa ein Drittel der gesamten Betriebskosten eines Pkw auf die Kraftstoffkosten.</p><p> <b>? Was kann man tun, um die Spritkosten möglichst gering zu halten?</b> </p><p>Den größten Einfluss auf den Spritverbrauch eines Fahrzeugs hat, sofern man die jeweilige Größe und Antriebskonfiguration eines Pkw als gegeben hinnimmt, das Fahrverhalten. Durch eine vorausschauende Fahrweise ohne extreme Beschleunigungen oder Verzögerungen, durch frühzeitiges Schalten in den nächst höheren Gang sowie den zurückhaltenden Einsatz von Nebenverbrauchern, wie etwa der Klimaanlage, können erhebliche Spriteinsparungen realisiert werden.</p><p>Darüber hinaus kann auch durch das Tanken zum richtigen Zeitpunkt Geld gespart werden, wie aus einer Langzeitstudie des Automobilclubs ADAC hervor geht. Die niedrigsten Spritpreise an den Tankstellen sind demnach am frühen Abend <a href=\"http://spiegel.de/wirtschaft/unternehmen/spritpreis-beobachter-wer-sparen-will-tankt-am-fruehen-abend-a-979930.html\" target=\"_blank\" title=\"zwischen 18 und 20 Uhr zu erwarten\" class=\"text-link-int lp-text-link-int\">zwischen 18 und 20 Uhr zu erwarten</a>. Laut der Markttransparenzstelle (MTS) zufolge kann ein Autofahrer in einer Stadt im Schnitt 15 bis 20 Cent pro Liter Kraftstoff sparen, wenn er die günstigste Tankstelle zum günstigsten Zeitpunkt des Tages anfährt.</p><p>Als Faustregel gilt, dass früh morgens der Sprit am teuersten ist und der Preis im Tagesverlauf eher fällt, da die Tankstellen häufig versuchen, sich gegenseitig zu unterbieten. </p><p>In den Nachtstunden wiederum sind die Preise meist hoch, weil einige - vor allem freie - Tankstellen schließen und die durchgehend geöffneten Stationen diese fehlende Konkurrenz meist nutzen, um einen höheren Preis zu verlangen. Was die Wochentage betrifft, so ist der Sonntag eine Ausnahme, denn sonntags sind die Preisschwankungen meist sehr gering. </p><p>Generell gilt, dass das Tanken am Sonntagabend nicht so billig und in der Sonntagnacht nicht so teuer ist wie zu den gleichen Zeiten von Montag bis Samstag.</p><p> <b>? Woher bezieht Deutschland sein Rohöl?</b> </p><p>Nach den Statistiken des Bundesministeriums für Wirtschaft und Technologie betrugen die Rohölimporte nach Deutschland in den vergangenen Jahren rund 95 Millionen Tonnen (2012: 93,4 Mio. Tonnen). Der Löwenanteil, nämlich 37,1 Prozent des importierten Rohöls, kam aus Russland; die weiteren großen Lieferanten waren Großbritannien (14,2 Prozent), Norwegen (10,0 Prozent), Libyen (9,2 Prozent) und Nigeria (7,1 Prozent). Aus dem Nahen Osten (Saudi-Arabien, Irak, Iran) stammten nach Angaben des Ministeriums im Jahr 2012 lediglich 4,2 Prozent der Rohöl-Gesamteinfuhr. </p><p> <b>? Lohnen sich Benzinpreis-Apps? </b> </p><p>Wer sparen will, muss Preise vergleichen. Wie für zahlreiche Konsumgüter gibt es auch für Treibstoff entsprechende Spritpreisvergleich-Apps für das Smartphone. Angeblich informiert sich jeder vierte Deutsche auf diese Weise über die aktuellen Spritpreise. </p><p>Doch auch wenn solche Apps eine günstige Tankstelle in der näheren Umgebung anzeigen - der Umweg wegen geringer Preisunterschiede ist nicht immer sinnvoll und wirklich billiger. Ein Beispiel: Beträgt der Unterschied beim Preis pro Liter zweier Tankstellen zwei Cent, bringt das bei einer Tankfüllung von 50 Liter exakt einen Euro Ersparnis. Angenommen, der betankte Wagen verbraucht im Schnitt 6,5 Liter pro 100 Kilometer, ist bei einem Umweg von zehn Kilometern zur billigeren Tankstelle die Ersparnis durch den Mehrverbrauch schon wieder verloren.</p>', '2017-03-30 09:08:59', 0, 1, 'http://www.spiegel.de/auto/aktuell/benzinpreisvergleich-die-guenstigste-tankstelle-in-ihrer-naehe-a-185826.html', 0);

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
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `premium`
--

CREATE TABLE `premium` (
  `premiumID` int(10) NOT NULL,
  `premiumValid` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`sessionID`, `userID`, `createdTS`) VALUES
(1, 1, '2017-03-30 07:15:39'),
(2, 1, '2017-03-30 07:16:03');

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
(2, 'Unternehmen & Märkte'),
(3, 'Donald Trump'),
(4, 'Verbraucher & Service'),
(5, 'Löhne und Gehälter'),
(6, 'Auto'),
(7, 'Tests'),
(8, 'Fahrberichte'),
(9, 'Aktuell'),
(10, 'Benzin');

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
(1, 3),
(2, 5),
(3, 8),
(4, 10);

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
  `isAdmin` tinyint(1) NOT NULL,
  `premium` int(10) NOT NULL,
  `adress` int(10) NOT NULL,
  `bankDetails` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `userName`, `password`, `fName`, `lName`, `birthDat`, `createdTS`, `email`, `isActive`, `isAdmin`, `premium`, `adress`, `bankDetails`) VALUES
(1, '', 'sdskdfkdsfkdsh4', 'nikja', 'mylvakanam', '0000-00-00', '2017-01-24 10:01:51', '', 0, 0, 0, 0, 0),
(2, 'Nikja', '123456', 'Nikja', 'Mylvakanam', '1991-11-15', '2017-03-30 06:35:45', 'nikja1@schule.bremen.de', 1, 1, 0, 0, 0),
(3, 'Nikja', '123456', 'Nikja', 'Mylvakanam', '1991-11-15', '2017-03-30 06:35:55', 'nikja1@schule.bremen.de', 1, 1, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`adressID`);

--
-- Indexes for table `bankdetails`
--
ALTER TABLE `bankdetails`
  ADD PRIMARY KEY (`detailsID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catID`);

--
-- Indexes for table `categorytags`
--
ALTER TABLE `categorytags`
  ADD PRIMARY KEY (`category`,`tag`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`);

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
-- Indexes for table `premium`
--
ALTER TABLE `premium`
  ADD PRIMARY KEY (`premiumID`);

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
-- AUTO_INCREMENT for table `adress`
--
ALTER TABLE `adress`
  MODIFY `adressID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bankdetails`
--
ALTER TABLE `bankdetails`
  MODIFY `detailsID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `crawleruri`
--
ALTER TABLE `crawleruri`
  MODIFY `uriID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `imageID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `newsID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `premium`
--
ALTER TABLE `premium`
  MODIFY `premiumID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ranking`
--
ALTER TABLE `ranking`
  MODIFY `rankID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `sessionID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tagsID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
