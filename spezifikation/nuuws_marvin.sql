-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 28. Mrz 2017 um 11:29
-- Server-Version: 10.1.13-MariaDB
-- PHP-Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

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

--
-- Daten für Tabelle `category`
--

INSERT INTO `category` (`catID`, `catName`) VALUES
(1, 'Wirtschaft'),
(2, 'Auto'),
(3, 'Sport'),
(4, 'Politik'),
(5, 'Gesundheit');

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
(1, 1),
(1, 2),
(1, 4),
(2, 3),
(3, 5),
(4, 6),
(4, 7),
(4, 8),
(5, 9);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `crawleruri`
--

CREATE TABLE `crawleruri` (
  `uriID` int(10) NOT NULL,
  `createdTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uri` varchar(200) NOT NULL,
  `interpreted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `crawleruri`
--

INSERT INTO `crawleruri` (`uriID`, `createdTS`, `uri`, `interpreted`) VALUES
(1, '2017-03-10 21:44:08', 'http://abo.spiegel.de/de/c/dein-spiegel', 1),
(2, '2017-03-10 21:44:08', 'http://abo.spiegel.de/de/c/spiegel-geschichte', 1),
(3, '2017-03-10 21:44:08', 'http://abo.spiegel.de/de/c/spiegel-wissen', 1),
(4, '2017-03-10 21:44:08', 'http://gutenberg.spiegel.de', 1),
(5, '2017-03-10 21:44:08', 'http://news.google.com/', 1),
(6, '2017-03-10 21:44:08', 'http://schneeundmehr.spiegel.de/', 1),
(7, '2017-03-10 21:44:08', 'http://sportal.spiegel.de/spiegel/ergebnisse/', 1),
(8, '2017-03-10 21:44:08', 'http://sportal.spiegel.de/spiegel/liveticker/', 1),
(9, '2017-03-10 21:44:08', 'http://tippspiel.spiegel.de', 1),
(10, '2017-03-10 21:44:08', 'http://tvprogramm.spiegel.de/', 1),
(11, '2017-03-10 21:44:08', 'http://werkstattvergleich.spiegel.de', 1),
(12, '2017-03-10 21:44:08', 'http://wetter.spiegel.de/', 1),
(13, '2017-03-10 21:44:08', 'http://www.spiegel.de/auto/aktuell/benzinpreisvergleich-die-guenstigste-tankstelle-in-ihrer-naehe-a-185826.html', 1),
(14, '2017-03-10 21:44:08', 'http://www.spiegel.de/auto/aktuell/bussgeldrechner-was-zu-schnelles-fahren-kostet-a-244772.html', 1),
(15, '2017-03-10 21:44:08', 'http://www.spiegel.de/einestages/archiv.html', 1),
(16, '2017-03-10 21:44:08', 'http://www.spiegel.de/einestages/thema/ddr/', 1),
(17, '2017-03-10 21:44:08', 'http://www.spiegel.de/einestages/thema/film/', 1),
(18, '2017-03-10 21:44:08', 'http://www.spiegel.de/einestages/thema/fotografie/', 1),
(19, '2017-03-10 21:44:08', 'http://www.spiegel.de/einestages/thema/musik/', 1),
(20, '2017-03-10 21:44:08', 'http://www.spiegel.de/einestages/thema/zweiter_weltkrieg/', 1),
(21, '2017-03-10 21:44:08', 'http://www.spiegel.de/gesundheit/diagnose/gebaermutterhalskrebs-frauen-ab-35-sollen-nur-noch-alle-drei-jahre-getestet-werden-a-1138051.html', 1),
(22, '2017-03-10 21:44:08', 'http://www.spiegel.de/politik/ausland/recep-tayyip-erdogan-bei-wladimir-putin-russland-und-tuerkei-brauchen-einander-a-1137721.html', 1),
(23, '2017-03-10 21:44:08', 'http://www.spiegel.de/politik/ausland/recep-tayyip-erdogan-uno-wirft-tuerkei-verbrechen-an-kurden-vor-a-1138171.html', 1),
(24, '2017-03-10 21:44:08', 'http://www.spiegel.de/politik/ausland/suedkorea-tote-bei-protesten-gegen-amtsenthebung-von-park-geun-hye-a-1138142.html', 1),
(25, '2017-03-10 21:44:08', 'http://www.spiegel.de/spiegel/', 1),
(26, '2017-03-10 21:44:08', 'http://www.spiegel.de/spiegel/literaturspiegel/index-2017-3.html', 1),
(27, '2017-03-10 21:44:08', 'http://www.spiegel.de/spiegel/unispiegel/index-2017-1.html', 1),
(28, '2017-03-10 21:44:08', 'http://www.spiegel.de/sport/fussball/xabi-alonso-beendet-laufbahn-bei-bayern-muenchen-a-1138049.html', 1),
(29, '2017-03-10 21:44:08', 'http://www.spiegel.de/story/', 1),
(30, '2017-03-10 21:44:08', 'http://www.spiegel.de/thema/buchrezensionen/', 1),
(31, '2017-03-10 21:44:08', 'http://www.spiegel.de/thema/daten/', 1),
(32, '2017-03-10 21:44:08', 'http://www.spiegel.de/thema/elterncouch/', 1),
(33, '2017-03-10 21:44:08', 'http://www.spiegel.de/thema/eu/', 1),
(34, '2017-03-10 21:44:08', 'http://www.spiegel.de/thema/meinung/', 1),
(35, '2017-03-10 21:44:08', 'http://www.spiegel.de/thema/mittelstand/', 1),
(36, '2017-03-10 21:44:08', 'http://www.spiegel.de/thema/stil_design/', 1),
(37, '2017-03-10 21:44:08', 'http://www.spiegel.de/thema/stil_hotels/', 1),
(38, '2017-03-10 21:44:08', 'http://www.spiegel.de/thema/stil_kochen/', 1),
(39, '2017-03-10 21:44:08', 'http://www.spiegel.de/thema/stil_mode/', 1),
(40, '2017-03-10 21:44:08', 'http://www.spiegel.de/thema/stil_reisen/', 1),
(41, '2017-03-10 21:44:08', 'http://www.spiegel.de/wirtschaft/service/brutto-netto-rechner-was-von-ihrem-lohn-noch-uebrig-bleibt-a-223811.html', 1),
(42, '2017-03-10 21:44:08', 'http://www.spiegel.de/wirtschaft/service/streik-an-berliner-flughaefen-tegel-und-schoenefeld-die-fakten-a-1138128.html', 1),
(43, '2017-03-10 21:44:08', 'http://www.spiegel.de/wirtschaft/unternehmen/windkraft-traege-rotorregler-fuehrten-laut-analyse-zu-mysterioeser-havarie-serie-a-1137530.html', 1),
(44, '2017-03-28 07:07:46', 'http://news.google.com/', 0),
(45, '2017-03-28 07:07:46', 'http://www.spiegel.de/gesundheit/diagnose/hodenkrebs-vorsorge-nimm-die-eier-in-die-hand-a-1140635.html', 0),
(46, '2017-03-28 07:07:46', 'http://www.spiegel.de/panorama/justiz/germanwings-absturzopfer-verklagen-fluggesellschaft-a-1140692.html?google_editors_picks=true', 0),
(47, '2017-03-28 07:07:46', 'http://www.spiegel.de/panorama/justiz/koeln-hells-angels-prozess-gestartet-beifall-fuer-mutmassliche-rocker-vor-gericht-a-1140680.html', 0),
(48, '2017-03-28 07:07:46', 'http://www.spiegel.de/politik/ausland/london-anschlag-attentaeter-hatte-laut-polizei-keine-verbindung-zum-is-a-1140685.html?google_editors_picks=true', 0),
(49, '2017-03-28 07:07:46', 'http://www.spiegel.de/politik/deutschland/angela-merkel-kann-nach-saarland-wahl-aufatmen-a-1140584.html', 0),
(50, '2017-03-28 07:07:46', 'http://www.spiegel.de/politik/deutschland/muenchen-vierter-abschiebeflug-nach-afghanistan-a-1140696.html', 0),
(51, '2017-03-28 07:07:46', 'http://www.spiegel.de/politik/deutschland/saarland-wahl-hohe-wahlbeteiligung-dank-gegenmobilisierung-der-mitte-a-1140632.html', 0),
(52, '2017-03-28 07:07:46', 'http://www.spiegel.de/politik/deutschland/sahra-wagenknecht-bezeichnet-recep-tayyip-erdogan-als-terroristen-a-1140689.html?google_editors_picks=true', 0),
(53, '2017-03-28 07:07:46', 'http://www.spiegel.de/reise/europa/paris-eiffelturm-bekommt-schusssichere-glaswand-a-1140694.html?google_editors_picks=true', 0),
(54, '2017-03-28 07:07:46', 'http://www.spiegel.de/sport/sonst/tennis-roger-federer-bezwingt-auch-juan-martin-del-potro-a-1140695.html?google_editors_picks=true', 0),
(55, '2017-03-28 07:07:46', 'http://www.spiegel.de/wirtschaft/unternehmen/ryanair-droht-ueberpruefung-scheinselbststaendiger-piloten-a-1140492.html', 0),
(56, '2017-03-28 07:07:46', 'http://www.spiegel.de?google_editors_picks=true', 0),
(57, '2017-03-28 07:12:31', 'http://news.google.com/', 0),
(58, '2017-03-28 07:12:31', 'http://www.spiegel.de/gesundheit/diagnose/hodenkrebs-vorsorge-nimm-die-eier-in-die-hand-a-1140635.html', 0),
(59, '2017-03-28 07:12:31', 'http://www.spiegel.de/panorama/justiz/koeln-hells-angels-prozess-gestartet-beifall-fuer-mutmassliche-rocker-vor-gericht-a-1140680.html', 0),
(60, '2017-03-28 07:12:31', 'http://www.spiegel.de/politik/deutschland/angela-merkel-kann-nach-saarland-wahl-aufatmen-a-1140584.html', 0),
(61, '2017-03-28 07:12:31', 'http://www.spiegel.de/politik/deutschland/muenchen-vierter-abschiebeflug-nach-afghanistan-a-1140696.html', 0),
(62, '2017-03-28 07:12:31', 'http://www.spiegel.de/wirtschaft/unternehmen/ryanair-droht-ueberpruefung-scheinselbststaendiger-piloten-a-1140492.html', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `images`
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
-- Daten für Tabelle `images`
--

INSERT INTO `images` (`imageID`, `title`, `description`, `copyright`, `link`, `imagePath`) VALUES
(1, 'Zerschelltes Windrad in Niedersachsen', '', 'spiegel', 'http://cdn4.spiegel.de/images/image-1090923-860_poster_16x9-webs-1090923.jpg', 'C:/xampp/htdocs/nuuws/portal/assets/images/sp/c19ecea3bf182b5ce449dc4b6641d8bc3566.jpg'),
(2, 'Anzeigetafel am Flughafen Tegel ', '', 'spiegel', 'http://cdn2.spiegel.de/images/image-1116409-860_poster_16x9-perz-1116409.jpg', 'C:/xampp/htdocs/nuuws/portal/assets/images/sp/80ad3fde8f7560d12f1e3d2dfef11ac3890.jpg'),
(3, 'Günstig tanken: Nutzen Sie unseren Benzinpreisvergleich', '', 'spiegel', 'http://cdn2.spiegel.de/images/image-333831-breitwandaufmacher-clsg-333831.jpg', 'C:/xampp/htdocs/nuuws/portal/assets/images/sp/ca026a182171c360c87c51e041378b7e1832.jpg'),
(4, 'Gehaltsverhandlungen: Sieben goldene Regeln', '', 'spiegel', 'http://cdn2.spiegel.de/images/image-1091699-breitwandaufmacher-jvda-1091699.jpg', 'C:/xampp/htdocs/nuuws/portal/assets/images/sp/f47bc351770dc5dcff5dc511ce689c618171.jpg'),
(5, 'Video abspielen...', '', 'spiegel', 'http://cdn2.spiegel.de/images/image-1116249-860_poster_16x9-nixe-1116249.jpg', 'C:/xampp/htdocs/nuuws/portal/assets/images/sp/541892477383f9e2848197d1f67cfde01692.jpg'),
(6, 'Video abspielen...', '', 'spiegel', 'http://cdn2.spiegel.de/images/image-1116421-860_poster_16x9-ktbt-1116421.jpg', 'C:/xampp/htdocs/nuuws/portal/assets/images/sp/e6ee7857835250470505c6482397cb002006.jpg'),
(7, 'Zerstörungen in Nusaybin', '', 'spiegel', 'http://cdn1.spiegel.de/images/image-1116544-860_poster_16x9-ybhs-1116544.jpg', 'C:/xampp/htdocs/nuuws/portal/assets/images/sp/6d3b437b2def70e7b813121fff0eec8c6698.jpg'),
(8, 'Wladimir Putin und Recep Tayyip Erdogan (r.)', '', 'spiegel', 'http://cdn1.spiegel.de/images/image-1115368-860_poster_16x9-yjxc-1115368.jpg', 'C:/xampp/htdocs/nuuws/portal/assets/images/sp/edbc204e3fa60b8f71c4b1673e6c64f49824.jpg'),
(9, 'Patientin beim Gynäkologen ', '', 'spiegel', 'http://cdn3.spiegel.de/images/image-1116262-860_poster_16x9-qliq-1116262.jpg', 'C:/xampp/htdocs/nuuws/portal/assets/images/sp/b18a3b82d2065ed3e7f76b940500a707111.jpg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `navigation`
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
-- Tabellenstruktur für Tabelle `news`
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
-- Daten für Tabelle `news`
--

INSERT INTO `news` (`newsID`, `title`, `content`, `createdTS`, `userID`, `published`, `crawlerURI`, `priority`) VALUES
(1, 'Windkraft Träge Rotorregler führten laut Analyse zu mysteriöser Havarie-Serie', '<p>Die Windkraft ist für viele Menschen wahlweise eine friedliche, saubere Lösung der Energieerzeugung oder ein landschaftliches Ärgernis. Mit Bildern der Zerstörung dagegen wurden die oft mehr als hundert Meter hohen und Dutzende Tonnen schweren Rotortürme bislang kaum in Verbindung gebracht. </p><p>Um die Jahreswende, zwischen dem 11. Dezember und dem 3. Januar, änderte sich das. Binnen 24 Tagen gingen gleich vier Windanlagen kaputt. Zeitungen und TV-Sender zeigten wahlweise Windmasten, die umgeknickt und auf Feldern zerschellt waren, oder ein abgeknicktes Rotorblatt in unmittelbarer Nähe einer Bundesstraße, die aus Sicherheitsgründen einen halben Tag gesperrt werden musste. </p><p>Bald stellte sich heraus, dass die Windräder allesamt recht alt waren. Konkret wurden sie zwischen 1999 und 2002 errichtet. Die Betreiber der Anlagen versprachen baldige Aufklärung, bestellten Gutachter - lieferten aber keine Ergebnisse. Das Rätsel der Havarie-Serie blieb ungelöst. Gerade dadurch aber wuchs die Sorge, dass bald noch mehr von den Tausenden Windrädern aus dieser Zeit umknicken könnten.</p><p>Nun, knapp drei Monate nach den Vorfällen, verdichten sich nach SPIEGEL-Informationen die Anzeichen, dass alle vier Windradschäden dieselbe Ursache hatten. Bei allen vier Anlagen ist ein Problem mit der sogenannten Pitch-Regelung im Gespräch. Diese dient unter anderem dazu, die Rotorblätter automatisch aus dem Wind zu drehen, wenn dieser zu stark weht. </p><p>Die Firma Enertrag, ein technischer Dienstleister, der für die Wartung von zwei der havarierten Anlagen verantwortlich ist, hat dazu eine Analyse verfasst und deren zentrale Ergebnisse an mehr als hundert Betreiber ähnlicher Windräder verschickt. In dem Schreiben, das dem SPIEGEL vorliegt, heißt es, eine Anlage nahe der Gemeinde Grischow in Mecklenburg-Vorpommern und eine Anlage nahe der Gemeinde Neu Wulmstorf in Niedersachsen seien höchstwahrscheinlich umgeknickt, weil die Rotorblätter zu spät aus dem Wind gedreht worden seien. </p><p>Die dabei auftretenden Kräfte hätten sich auf die Windmasten übertragen, heißt es in der Analyse weiter. Diese seien dann aufgrund von "plötzlich auftretender Überlast" umgeknickt. "Die Pitch-Regelung hat zu spät reagiert", bestätigt ein Enertrag-Sprecher auf Anfrage. Die Betreiber der kaputten Windräder äußerten sich nicht zu der Analyse. </p><p>Bei den zwei anderen Anlagen hat es offenbar ähnliche Probleme gegeben: Hans Körner, Geschäftsführer der Rasmus GmbH, teilte auf Anfrage mit, sein Windrad nahe der sächsischen Stadt Leisnig sei ebenfalls wegen einer zu trägen Pitch-Regelung umgeknickt. </p><p>Und auch die Energiekontor AG, der am 3. Januar nahe der Gemeinde Zichow in Brandenburg ein Rotorblatt brach, vermutet nach eigenen Angaben "einen Sensordefekt in der Pitch-Regelung" als Ursache. Das habe ein Gutachten ergeben, teilte ein Sprecher auf Anfrage mit.</p><p> <b>Eine umfassende Übersicht der Windradschäden und der bisherigen Erklärungsversuche können Sie der folgenden Karte entnehmen. Klicken Sie auf die roten Punkte, um mehr zu erfahren.</b> </p><p>Vollständig abgeschlossen ist die Ursachenforschung noch nicht. Es ist aber offenbar kein Zufall, dass hinter allen vier Schäden dasselbe Problem vermutet wird. "Träge Pitch-Regler sind bei alten Anlagen weit verbreitet", sagt Windrad-Betreiber Körner. Das Risiko einer Havarie ließe sich durch den Einbau modernerer Regler leicht minimieren. Doch viele Betreiber sträubten sich dagegen, unter anderem aus Kostengründen. </p><p>Beim Bundesverband Windenergie hält man einen Austausch nicht unbedingt für nötig. "Ältere Pitch-Regler brauchen regelmäßige Wartung", sagt ein Sprecher. Dann aber funktionierten sie tadellos. Bei zwei der vier havarierten Windräder sei jedoch eine besonders fehleranfällige Pitch-Regelung verbaut gewesen. Beide Anlagen gehören zum Typ D4 der Firma DeWind; laut Schätzungen aus Branchenkreisen sind in Deutschland noch bis zu 150 D4-Windräder in Betrieb.</p><p>Die anderen zwei Windräder sind Anlagen vom Typ Tacke TW 1,5 beziehungsweise GE 1.5. Beide Modelle sind fast identisch. Der Hersteller Tacke war zunächst vom Energiekonzern Enron aufgekauft worden. Nach dessen Insolvenz übernahm das US-Unternehmen General Electric im Juni 2002 die Windsparte. Die Tacke TW 1,5 wurde dabei in GE 1.5 umbenannt. </p><p>Laut Schätzungen aus Branchenkreisen sind in Deutschland noch bis zu 1800 Anlagen dieses Typs aktiv. Viele davon dürften alte Pitch-Regler haben, heißt es. Laut Bundesverband Windenergie sind bei diesem Anlagentyp bislang noch keine Probleme mit der Pitch-Regelung bekannt gewesen. </p>', '2017-03-10 14:18:00', 0, 1, 'http://www.spiegel.de/wirtschaft/unternehmen/windkraft-traege-rotorregler-fuehrten-laut-analyse-zu-mysterioeser-havarie-serie-a-1137530.html', 0),
(2, 'Berlin Streik an Flughäfen Schönefeld und Tegel - die Fakten', '<p>An den Berliner Flughäfen fallen am Freitag wegen eines Streiks des Bodenpersonals nahezu alle Flüge aus. In Tegel seien 455 Verbindungen gestrichen worden und in Schönefeld 204, teilte der Betreiber der beiden Airports mit.</p><p>Die Gewerkschaft Ver.di hatte die rund 2000 Beschäftigten des Bodenpersonals an den Berliner Flughäfen <b>Tegel</b> und <b>Schönefeld</b> zum Streik aufgerufen. Der Ausstand hat am Freitagmorgen gegen 4 Uhr begonnen und soll <b>bis Samstagmorgen 5 Uhr</b> dauern.</p><p>Der Streik beeinträchtigt auch die Berliner <b>Tourismus-Messe ITB</b>, die nach Angaben des Veranstalters jährlich bis zu 200.000 Menschen besuchen.</p><p>Die <b>Fluggesellschaften</b> sind <b>grundsätzlich verpflichtet</b>, ihre Passagiere ans Ziel zu bringen - zur Not müssen sie eine Übernachtung im Hotel zahlen. Kunden, deren Flüge ausfallen, können ihre <b>Tickets </b>meist <b>gegen eine Bahnfahrt eintauschen</b>; die Bahn will bei Bedarf Sonderzüge einsetzen. Verspätet sich der Flug um mehr als fünf Stunden, können Kunden aber auch den <b>kompletten Ticketpreis zurückfordern</b>.</p><p> <b>Hintergrund</b> der Arbeitsniederlegungen ist der andauernde Tarifstreit zwischen Ver.di und dem Forum der Bodenverkehrsdienstleister, in dem die an den Flughäfen tätigen Unternehmen organisiert sind. Seit die Branche vor gut zehn Jahren privatisiert wurde, ist der Wettbewerb deutlich gestiegen - die Löhne sind entsprechend gefallen.</p><p>Die Gewerkschaft fordert eine Erhöhung des durchschnittlichen Stundenlohns von elf auf zwölf Euro - sie begründet das mit der hohen Arbeitsbelastung des Personals. Die Arbeitgeber haben bisher ein Plus von 27 Cent geboten - sie begründen das mit den schwierigen Marktbedingungen an den Flughäfen.</p><p>Bereits im Februar hatten mehrere Warnstreiks für hunderte Flugausfälle und Verspätungen gesorgt, nachdem frühere Tarifrunden ergebnislos gescheitert waren. <a href="http://www.tagesspiegel.de/wirtschaft/berliner-flughaefen-was-reisende-jetzt-ueber-den-streik-wissen-muessen/19497692.html" target="_blank" title="Laut Tagesspiegel" class="spTextlinkExt text-link-ext lp-text-link-ext">Laut "Tagesspiegel"</a> bereitet Ver.di <b>für Anfang der kommenden Woche weitere Streiks</b> vor, die den gesamten Flugbetrieb lahmlegen sollen.</p>', '2017-03-10 19:17:00', 0, 1, 'http://www.spiegel.de/wirtschaft/service/streik-an-berliner-flughaefen-tegel-und-schoenefeld-die-fakten-a-1138128.html', 0),
(3, 'Benzinpreise aktuell Die günstigste Tankstelle in Ihrer Nähe', '<p> <b>Super, Super E10, SuperPlus und Diesel - Vergleichen Sie bei uns die aktuellen Benzinpreise und finden Sie die günstigste Tankstelle in ihrer Nähe. Tanken Sie künftig immer günstig!</b> </p><p>So geht''s: Wählen Sie den gewünschten Kraftstoff aus und geben Sie die Postleitzahl <b>oder</b> den Namen der gesuchten Stadt ein (Städtenamen müssen mit Umlauten geschrieben werden, also "Lüneburg" statt "Lueneburg") - schon sehen Sie das Ergebnis. Alle Preise ohne Gewähr.</p><p> <a class="aGo" onclick="submitBPV();return false;" type="submit">Suche starten!</a> </p><p> <b>Mysterium Spritpreis - so tanken Sie günstig</b> </p><p>Einmal voll tanken für einen Euro - der Traum eines jeden Autofahrers. Und er ist seit fast zwanzig Jahren Wirklichkeit: allerdings in Venezuela. Dort wird der Treibstoff zu 90 Prozent vom Staat subventioniert, was dazu führt, dass ein Liter Benzin umgerechnet weniger als zwei Cent kostet. Davon können deutsche Autofahrer nur träumen. Im vergangenen Jahr kostete ein Liter <a href="http://spiegel.de/thema/benzin/" target="_blank" title="Benzin" class="text-link-int lp-text-link-int">Benzin</a> in Deutschland 1,549 Euro für Super E10 und 1,420 für <a href="http://spiegel.de/thema/diesel/" target="_blank" title="Diesel" class="text-link-int lp-text-link-int">Diesel</a>. Seit Ende August 2013 müssen mehr als 14.000 Tankstellen in Deutschland ihre aktuellen Preise melden. Wie sich der Spritpreis zusammensetzt, wodurch er beeinflusst wird und wie man die Spritkosten möglichst gering halten kann - das wird im Folgenden kurz und bündig erklärt.</p><p> <b>? Wie setzt sich der Benzinpreis zusammen?</b> </p><p>Den größten Anteil am Benzinpreis machen Steuern aus, nämliche die Energiesteuer von 65,45 Cent pro Liter sowie die 19 Prozent Mehrwertsteuer. Hinzu kommt der Produktpreis, der für Europa an der Rohöl-Börse des Hafens in Rotterdam ermittelt wird, wo auch die Preise für Benzin, Diesel und Heizöl festgelegt werden. Des weiteren schlagen die Mineralölgesellschaften und Tankstellen ihre jeweiligen Betriebs- und Lagerkosten auf den Preis auf. </p><p>Hier ein Beispiel: Im Januar dieses Jahres kostete ein Liter Benzin für Autofahrer durchschnittlich 151,9 Cent pro Liter. Dieser Betrag setzt sich zusammen aus: 65,45 Cent Energiesteuer, zirka 51 Cent Produktpreis, 24,25 Cent Mehrwertsteuer und rund 11 Cent, die als Deckungsbeitrag bezeichnet werden. In diesen 11 Cent sind unter anderem die Betriebskosten und der Gewinn der Tankstellen enthalten.</p><p> <b>? Welche Faktoren beeinflussen die Benzinpreise?</b> </p><p>Der Benzinpreis unterliegt laufenden Schwankungen und variiert inzwischen mehrmals täglich. Die Preisentwicklung wird dabei vom Rohölpreis, von der Fördermenge, von der weltweiten Nachfrage, vom Wechselkurs des Euro (denn Rohöl wird in Dollar gehandelt), dem von den Mineralölgesellschaften festgelegten Produktpreis und dazu von globalen, politischen und ökonomischen Entwicklungen beeinflusst. </p><p>Steigt der Preis pro Barrel Rohöl (ein Barrel sind exakt 158,987 Liter) auf dem Weltmarkt, steigt auch der Preis des Benzins an den heimischen Tankstellen.</p><p>Ein Barrel der für den europäischen Rohölmarkt wichtigen Nordseesorte Brent kostete Anfang 2009 noch 40 Dollar, aktuell sind es rund 90 Dollar.</p><p> <b>? Ist der Benzinpreis verantwortlich für steigende Mobilitätskosten?</b> </p><p>Nach Angaben des Verbraucherpreisindex des Statistischen Bundesamts stiegen die Preise für die allgemeinen Mobilitätskosten im Zeitraum von 2009 bis 2013 um mehr als zehn Prozent. Dieser Preisanstieg liegt jedoch nicht allein daran, dass im gleichen Zeitraum die Preise für Diesel und Benzin um mehr als 23 Prozent gestiegen sind. </p><p>Denn zusätzlich kletterten auch die weiteren Betriebskosten für einen Pkw - etwa Reparaturen, Inspektionen sowie Kfz-Versicherungen - um durchschnittlich jeweils gut acht Prozent. Teurer wurden in diesem Zeitraum zudem Gebrauchtwagen (+0,8%), Neuwagen (+2,8 %) sowie Ersatzteile und Pflegemittel (+5,5%). Insgesamt entfällt etwa ein Drittel der gesamten Betriebskosten eines Pkw auf die Kraftstoffkosten.</p><p> <b>? Was kann man tun, um die Spritkosten möglichst gering zu halten?</b> </p><p>Den größten Einfluss auf den Spritverbrauch eines Fahrzeugs hat, sofern man die jeweilige Größe und Antriebskonfiguration eines Pkw als gegeben hinnimmt, das Fahrverhalten. Durch eine vorausschauende Fahrweise ohne extreme Beschleunigungen oder Verzögerungen, durch frühzeitiges Schalten in den nächst höheren Gang sowie den zurückhaltenden Einsatz von Nebenverbrauchern, wie etwa der Klimaanlage, können erhebliche Spriteinsparungen realisiert werden.</p><p>Darüber hinaus kann auch durch das Tanken zum richtigen Zeitpunkt Geld gespart werden, wie aus einer Langzeitstudie des Automobilclubs ADAC hervor geht. Die niedrigsten Spritpreise an den Tankstellen sind demnach am frühen Abend <a href="http://spiegel.de/wirtschaft/unternehmen/spritpreis-beobachter-wer-sparen-will-tankt-am-fruehen-abend-a-979930.html" target="_blank" title="zwischen 18 und 20 Uhr zu erwarten" class="text-link-int lp-text-link-int">zwischen 18 und 20 Uhr zu erwarten</a>. Laut der Markttransparenzstelle (MTS) zufolge kann ein Autofahrer in einer Stadt im Schnitt 15 bis 20 Cent pro Liter Kraftstoff sparen, wenn er die günstigste Tankstelle zum günstigsten Zeitpunkt des Tages anfährt.</p><p>Als Faustregel gilt, dass früh morgens der Sprit am teuersten ist und der Preis im Tagesverlauf eher fällt, da die Tankstellen häufig versuchen, sich gegenseitig zu unterbieten. </p><p>In den Nachtstunden wiederum sind die Preise meist hoch, weil einige - vor allem freie - Tankstellen schließen und die durchgehend geöffneten Stationen diese fehlende Konkurrenz meist nutzen, um einen höheren Preis zu verlangen. Was die Wochentage betrifft, so ist der Sonntag eine Ausnahme, denn sonntags sind die Preisschwankungen meist sehr gering. </p><p>Generell gilt, dass das Tanken am Sonntagabend nicht so billig und in der Sonntagnacht nicht so teuer ist wie zu den gleichen Zeiten von Montag bis Samstag.</p><p> <b>? Woher bezieht Deutschland sein Rohöl?</b> </p><p>Nach den Statistiken des Bundesministeriums für Wirtschaft und Technologie betrugen die Rohölimporte nach Deutschland in den vergangenen Jahren rund 95 Millionen Tonnen (2012: 93,4 Mio. Tonnen). Der Löwenanteil, nämlich 37,1 Prozent des importierten Rohöls, kam aus Russland; die weiteren großen Lieferanten waren Großbritannien (14,2 Prozent), Norwegen (10,0 Prozent), Libyen (9,2 Prozent) und Nigeria (7,1 Prozent). Aus dem Nahen Osten (Saudi-Arabien, Irak, Iran) stammten nach Angaben des Ministeriums im Jahr 2012 lediglich 4,2 Prozent der Rohöl-Gesamteinfuhr. </p><p> <b>? Lohnen sich Benzinpreis-Apps? </b> </p><p>Wer sparen will, muss Preise vergleichen. Wie für zahlreiche Konsumgüter gibt es auch für Treibstoff entsprechende Spritpreisvergleich-Apps für das Smartphone. Angeblich informiert sich jeder vierte Deutsche auf diese Weise über die aktuellen Spritpreise. </p><p>Doch auch wenn solche Apps eine günstige Tankstelle in der näheren Umgebung anzeigen - der Umweg wegen geringer Preisunterschiede ist nicht immer sinnvoll und wirklich billiger. Ein Beispiel: Beträgt der Unterschied beim Preis pro Liter zweier Tankstellen zwei Cent, bringt das bei einer Tankfüllung von 50 Liter exakt einen Euro Ersparnis. Angenommen, der betankte Wagen verbraucht im Schnitt 6,5 Liter pro 100 Kilometer, ist bei einem Umweg von zehn Kilometern zur billigeren Tankstelle die Ersparnis durch den Mehrverbrauch schon wieder verloren.</p>', '2017-03-10 21:44:52', 0, 1, 'http://www.spiegel.de/auto/aktuell/benzinpreisvergleich-die-guenstigste-tankstelle-in-ihrer-naehe-a-185826.html', 0),
(4, 'Brutto-Netto-Rechner 2017 Was von Lohn und Gehalt übrig bleibt', '<p>Das Gehalt für den neuen Job hört sich gut an. Doch wie viel Geld bleibt netto davon übrig? Welche Steuerklasse ist die günstigste, wenn beide Ehepartner arbeiten? Und wie wirkt sich ein Kinderfreibetrag aus?</p><p>All diese Fragen lassen sich mit dem Brutto-Netto-Rechner beantworten. Tragen Sie einfach Ihren Bruttolohn und Freibetrag ein, wählen Sie Steuerklasse, Bundesland und Krankenkasse. Falls Sie Kinder haben, geben Sie mögliche Kinderfreibeträge an. Je mehr Angaben Sie machen, desto genauer ist das Ergebnis.</p><p> <b>In Kooperation mit Steuerfachanwalt Disqué</b> </p><p> <span class="spTextSmaller"> Für die Richtigkeit und Vollständigkeit der Tabelle sowie des ermittelten Auswertungsergebnisses wird keine Gewährleistung übernommen. </span> </p><p>Um den Rechner benutzen zu können, müssen Sie zunächst ihre Lohnsteuerklasse kennen. Hier eine kurze Übersicht, in welche Klasse Sie gehören.</p><p>Die <b>Lohnsteuerklasse I</b> gilt für die folgenden Arbeitnehmer:<br/>  -Ledige<br/>  -Verwitwete ab dem übernächsten Jahr nach dem Tod des Ehepartners oder eingetragenen Lebenspartners<br/>  -Geschiedene<br/>  -Verheiratete oder in Partnerschaft lebende, die dauernd getrennt leben<br/>  -Verheiratete oder in Partnerschaft lebende, deren Ehegatte oder eingetragener Lebenspartner in der Bundesrepublik nur beschränkt steuerpflichtig ist (in der Regel, weil er oder sie nicht in Deutschland lebt)</p><p>Die<b> Lohnsteuerklasse II</b> gilt für Alleinerziehende, die die Voraussetzungen der Steuerklasse I erfüllen und die zusätzlich Anspruch auf den Entlastungsbetrag für Alleinerziehende haben.</p><p>In die<b> Lohnsteuerklasse III</b> fallen folgende Arbeitnehmer:<br/>  -Verheiratete und eingetragene Lebenspartner, die nicht dauernd getrennt leben und nicht die Steuerklasse IV gewählt haben. Der ebenfalls berufstätige Ehepartner oder Lebenspartner erhält dann die Steuerklasse V. Wenn der andere Partner nicht berufstätig oder selbstständig ist, gilt für ihn ebenfalls die Lohnsteuerklasse III.<br/>  -Verwitwete bis zum Ende des auf den Tod des Ehegatten/Lebenspartners folgenden Kalenderjahres. Der verstorbene Ehegatte oder Lebenspartner muss zum Zeitpunkt seines Todes unbeschränkt einkommensteuerpflichtig gewesen sein. Die Ehegatten oder Lebenspartner dürfen bis zum Zeitpunkt des Todes nicht dauernd getrennt gelebt haben.</p><p>In die<b> Lohnsteuerklasse IV </b>fallen verheiratete oder in Partnerschaft lebende Arbeitnehmer, wenn beide Partner unbeschränkt einkommensteuerpflichtig sind und nicht dauernd getrennt leben. Wenn allerdings für einen Partner die Steuerklasse III gilt, fällt der andere nicht in Steuerklasse IV, sondern in Steuerklasse V. Ehegatten oder Lebenspartner, die beide berufstätig sind, können die Steuerklasse einmal im Jahr ändern lassen.</p><p>Die <b>Steuerklasse V</b> wird angewendet, wenn beide Ehegatten oder Lebenspartner beantragen, den jeweils anderen Ehegatten oder Lebenspartner in die Steuerklasse III einzureihen (siehe oben)</p><p>Die<b> Lohnsteuerklasse VI </b>wird in der Regel eingetragen, wenn ein Arbeitnehmer mehr als ein Arbeitsverhältnis hat.</p><p> <b>Wie ändern sich Ihre Finanzen, wenn Sie Ihr Leben ändern?</b> </p><p>Mit Hilfe dieses Rechners können Sie zum Beispiel schnell und unkompliziert herausfinden, wie sich ein Jobwechsel oder eine Gehaltserhöhung auf Ihr Nettogehalt auswirken. So vermeiden sie Überraschungen, wenn sie dann tatsächlich die ersten neue Gehaltsabrechnung in Händen halten. Auch andere Veränderungen im Leben lassen sich mit Hilfe des Rechners auf ihre finanziellen Auswirkungen hin abklopfen.</p><p> <b>Sie wollen heiraten?</b> Dann müssen Sie sich zusammen mit Ihrem Partner überlegen, in welchen Steuerklassen Sie arbeiten wollen: Entweder der eine in III oder der andere in V oder beide in IV. Die Steuerklasse IV für beide Partner ist empfehlenswert, wenn beide ähnlich viel verdienen. Sonst eher die Kombination aus III für den einen Partner und V für den anderen. Die Steuerklassen unterscheiden sich aber nur dadurch, wie viel Steuer monatlich automatisch vom Gehalt abgezogen wird. Wer zu viel gezahlt hat, bekommt das Geld einmal im Jahr nach Abgabe seiner Steuererklärung zurück.</p><p> <b>Sie erwarten ein Kind?</b> Dann erhöht sich in der Regel ihr Nettogehalt durch Kinderfreibeträge und ein höheres Kindergeld.</p><p> <b>Sie sind vom Glauben abgefallen?</b> Dann können Sie überprüfen, ob die gesparte Kirchensteuer den Verzicht aufs ewige Seelenheil wett machen kann.</p><p> <b>Sie erwägen, von der gesetzlichen in die private Krankenkasse wechseln?</b> Wenn sie wissen, welchen Beitragssatz ihre neue Versicherung verlangt, können Sie anhand des Rechners überprüfen, wie sich dadurch ihr Netto-Gehalt verändert.</p><p>Allerdings sollten Sie die Frage der richtigen Krankenversicherung auf keinen Fall allein von steuerlichen Erwägungen abhängig machen. Die mögliche Steuerersparnis fällt gering aus gegenüber den gewaltigen Kosten, die eine schlecht gewählte private Krankenversicherung im Laufe der Jahre verursacht. Welche Versicherungen für Sie generell sinnvoll sind, <a href="http://spiegel.de/wirtschaft/service/versicherung-check-fuer-haftpflicht-hausrat-berufsunfaehigkeit-a-960380.html" target="_blank" title="finden Sie in unserem Überblick" class="text-link-int lp-text-link-int">finden Sie in unserem Überblick</a>.</p><p>Die allermeisten Möglichkeiten zur Steuerersparnis erschließen sich nur dem, der auch eine Steuererklärung abgibt. Gerade für junge Arbeitnehmer kann das eine ziemliche Herausforderung sein. <a href="http://spiegel.de/wirtschaft/service/steuererklaerung-hilfe-bei-einkommensteuer-fuer-berufseinsteiger-a-969128.html" target="_blank" title="Eine Hilfestellung finden Sie hier" class="text-link-int lp-text-link-int">Eine Hilfestellung finden Sie hier</a>.</p>', '2016-02-02 00:49:00', 0, 1, 'http://www.spiegel.de/wirtschaft/service/brutto-netto-rechner-was-von-ihrem-lohn-noch-uebrig-bleibt-a-223811.html', 0),
(5, 'Xabi Alonso beendet Laufbahn bei Bayern München', '<p>Seinen Abschied verkündete Xabi Alonso in einem öffentlichen Brief an seine Fans. "Das Schwerste ist immer, zu wissen, wann man Adiós sagen soll", war zu lesen, und weiter hieß es: "Nach vielem Nachdenken denke ich, dass dieser Moment nun gekommen ist." So stand es geschrieben, im August 2014, als Xabi Alonso seinen Rücktritt aus der spanischen Nationalmannschaft und noch am selben Tag seinen Wechsel von Real Madrid zum FC Bayern erklärte. </p><p>Keine drei Jahre später macht er <a href="http://spiegel.de/sport/fussball/bayern-muenchen-xabi-alonso-kuendigt-seinen-ruecktritt-an-a-1138004.html" target="_blank" title="nun wirklich Schluss" class="text-link-int lp-text-link-int">nun wirklich Schluss</a>. Endgültig. Diesmal reichten kurze sieben Worte auf Twitter, mit denen er auf Englisch seine Entscheidung bekannt gab. Übersetzt: "Lebte es, liebte es. Lebwohl, wunderbares Spiel." Darunter ein Schwarz-Weiß-Foto, es zeigt Xabi Alonso mit Designer-Mantel am Fußballplatz. Ein melancholischer Blick zurück über die Schulter, ein lässiges Winken mit der linken Hand, zwei Stollenschuhe in der rechten. Ein Bild mit Größe, Stil und Eleganz. Xabi Alonso eben. Adiós, hombre.</p><p>Dass der 35-Jährige zum Saisonende seine große Karriere beendet, kam nicht mehr überraschend. Während Franck Ribéry und Arjen Robben, ebenfalls zwei Altmeister aus der Ü30-Abteilung, schon längst ihre Verträge bis 2018 verlängert hatten, erkannte Xabi Alonso, dass das bei ihm aus seiner Sicht keinen Sinn mehr machen würde. </p><p lang="en" dir="ltr">Lived it. Loved it. <br><br>Farewell beautiful game. <a href="https://t.co/1aSN7GGNzZ">pic.twitter.com/1aSN7GGNzZ</a></p><p>Sicher hätte er noch ein weiteres Jahr herausschlagen und ein paar Millionen Euro Jahresgehalt mitnehmen können. Hätte aber nicht gepasst zu ihm. Er weiß, dass es gut ist für ihn, jetzt zu gehen. Schon Anfang 2016 sagte er einmal: "Wenn es Zeit ist aufzuhören, werde ich es spüren." In dieser Saison hat er es gespürt. Denn Alonso ist in die Jahre gekommen - und die Konkurrenz im eigenen Kader inzwischen zu groß. </p><p>Dass die Bayern einen 32-Jährigen holen, das rief schon 2014 zahlreiche Skeptiker auf den Plan. Doch dann überzeugte Alonso mit brillanten Leistungen, vor allem beim Spiel in Köln, als er mit 206 Ballkontakten einen neuen Bundesliga-Rekord aufstellte und mit 175 geglückten Pässen mehr erfolgreiche Zuspiele hatte als die gesamte Kölner Mannschaft zusammen. </p><p> <b>Können blitzte immer noch auf</b> </p><p>Besser wurde es danach aber auch nicht mehr. Alonso baute ab, vor allem in der Geschwindigkeit, zu sehen war das immer beim schnellen Umschaltspiel. Wenn es bei Ballverlusten in des Gegners Hälfte darum ging, schnell ins defensive Mittelfeld zurückzueilen, kam Alonso einfach nicht mehr mit. Mitunter zeigte er sein Vermögen noch, bei präzisen 60-Meter-Pässen aus dem Fußgelenk, mit denen er das Zentrum eines Bierdeckels getroffen hätte, und das alles mit einer Erhabenheit, die an die besten Zeiten von Franz Beckenbauer erinnerte. Ansonsten aber wurde er <a href="http://spiegel.de/sport/fussball/fc-bayern-muenchen-bei-borussia-dortmund-der-nimbus-broeckelt-a-1121886.html" target="_blank" title="allmählich zu langsam" class="text-link-int lp-text-link-int">allmählich zu langsam</a>.</p><p>Carlo Ancelotti wird Alonsons Rücktritt sicher bedauern, denn die beiden verband eine besondere Beziehung. Alonso war einer der absoluten Lieblingsspieler des Trainers, obwohl Alonso 2005 noch für eine der schlimmsten Niederlagen Ancelottis verantwortlich gewesen war: Beim Champions League-Finale, als Alonso mit dem FC Liverpool nach einem 0:3-Rückstand noch gegen Ancelottis AC Mailand triumphierte. </p><p>Später arbeiteten sie gemeinsam bei Real Madrid, bis 2014, und so war Xabi Alonso auch Ancelottis erste Personalie beim FC Bayern, lange bevor er im Sommer 2016 in München Josep Guardiola beerbte. Schon Anfang 2016 hatte sich der Italiener bei den Klub-Bossen für eine Vertragsverlängerung Alonsos um ein Jahr bis 2017 eingesetzt. Immer wieder nahm Ancelotti Alonso in Schutz, auch nach ganz schwachen Spielen wie im Oktober beim 2:2 in Frankfurt, und erklärte noch vor zwei Monaten: "Ich hoffe, Alonso wird auch noch nächste Saison bei uns sein." Daraus wird nun nichts.</p><p> <b>Abschied von Lahm wiegt schwerer</b> </p><p>Und doch kann Ancelotti den Abschied von Xabi Alonso besser verkraften als den von Philipp Lahm, dem zweiten Weltmeister, der <a href="http://spiegel.de/sport/fussball/philipp-lahm-tritt-zurueck-ein-schlag-fuer-die-maechtigen-maenner-a-1133604.html" target="_blank" title="nach Saisonende beim FC Bayern aufhört" class="text-link-int lp-text-link-int">nach Saisonende beim FC Bayern aufhört</a> und eine Lücke auf der rechten Abwehrseite hinterlässt. Wenn Ancelotti irgendwo einen Spieler weniger verschmerzen kann, dann auf der Position des Sechsers. Als ausgewiesene Fachkräfte bieten sich hier Artúro Vidal und Javi Martinez an, der beim anstehenden Comeback von Jérome Boateng aus der Innenverteidigung wieder ein Stück nach vorne rückt, dazu Joshua Kimmich und auch Renato Sanches, der in den ersten Monaten in München noch nicht glücklich geworden ist.</p><p>Dennoch verliert der FC Bayern mehr als nur einen Spieler, er verliert eine Persönlichkeit. Denn Xabi Alonso stach auch abseits des Platzes immer aus der Mannschaft heraus, meist wirkte er dabei wie ein Einzelgänger. Xabi Alonso war auch nie einer jener Profis, die etwa für albernen Selfie-Klamauk zu haben waren oder der seine Ohren unter überdimensionierten Kopfhörern versteckte. Xabi Alonso schritt auch durch die Mixed Zone immer mit Eleganz und Grandezza, meistens allein, manchmal auch mit seinen drei Kindern, Jontxu, Ane, Emma. </p><p>Das Bild auf Alonsos Startseite bei Twitter zeigt eine Filmszene aus dem Klassiker "Casablanca": Claude Rains als Capitaine Renault, an der Wand der Schatten des rauchenden Rick Blaine alias Humphrey Bogart. </p><p>Zwei Mal hat Alonso schon die Champions League gewonnen, womöglich wird das Endspiel am 3. Juni in Cardiff sein allerletztes Spiel, sein finaler Triumph. Spiel''s noch einmal, Xabi.</p>', '2017-03-10 01:12:00', 0, 1, 'http://www.spiegel.de/sport/fussball/xabi-alonso-beendet-laufbahn-bei-bayern-muenchen-a-1138049.html', 0),
(6, 'Südkorea Tote bei Protesten gegen Amtsenthebung von Park Geun Hye', '<p>Die Ära Park ist vorbei: Das Verfassungsgericht in Seoul hat <a href="http://spiegel.de/politik/ausland/suedkorea-praesidentin-park-guen-hye-des-amtes-enthoben-a-1138123.html" target="_blank" title="einstimmig für eine Amtsenthebung der südkoreanischen Präsidentin gestimmt" class="text-link-int lp-text-link-int">einstimmig für eine Amtsenthebung der südkoreanischen Präsidentin gestimmt</a>. Vor dem Gebäude kam es daraufhin zu Tumulten, Proteste eskalierten. Dabei sind mindestens zwei Menschen ums Leben gekommen, berichtet die nationale Nachrichtenagentur Yonhap.</p><p>Ein 72-jähriger Mann sei in der Nähe des Verfassungsgerichts am Kopf blutend gefunden worden. Auf dem Weg ins Krankenhaus sei er gestorben. Dem Bericht zufolge war er wahrscheinlich aus einem Polizeibus gefallen. Mit den Fahrzeugen hatten die Sicherheitskräfte versucht, das Gerichtsgebäude gegen die Protestierenden abzuschirmen. Zudem soll ein 60 Jahre alter Mann in der Nähe des Gerichts gestorben sein. Details zu dem Fall gab es zunächst nicht. </p><p>Hunderte von Anhängern - die meisten von ihnen ältere Menschen - hatten bereits am Donnerstag bei Kundgebungen vor dem Gericht gefordert, dass Park wieder ihre Amtsgeschäfte übernehmen solle. Der Skandal wühlt das Land seit Monaten auf. Im Dezember hatte das Parlament die <a href="http://spiegel.de/politik/ausland/suedkorea-parlament-stimmt-fuer-amtsenthebung-von-praesidentin-park-a-1125112.html" target="_blank" title="Amtsenthebung Parks eingeleitet" class="text-link-int lp-text-link-int">Amtsenthebung Parks eingeleitet</a>. Ihre Befugnisse wurden dadurch zunächst ausgesetzt. Die endgültige Entscheidung hatte das Verfassungsgericht am Freitag zu fällen.</p><p>Die Verfassungsrichter sahen es als erwiesen an, dass Park Geun Hye es zugelassen hatte, dass sich ihre <a href="http://spiegel.de/politik/ausland/suedkorea-skandal-um-park-geun-hye-verhaengnisvolle-freundschaft-a-1121227.html" target="_blank" title="Freundin Choi Soon Sil in die Regierungsgeschäfte einmischte" class="text-link-int lp-text-link-int">Freundin Choi Soon Sil in die Regierungsgeschäfte einmischte</a>, obwohl Choi nie ein öffentliches Amt inne hatte. Außerdem wird Choi vorgeworfen, dank ihrer Beziehung zur Präsidentin zahlreiche Unternehmen genötigt zu haben, ihre Stiftungen und Organisatoren zu sponsern und sich damit persönlich bereichert zu haben. Die Richter hofften, dass das "politische Chaos" durch ihr Urteil ein Ende nehme, sagte die geschäftsführende Vorsitzende Richterin Lee Jung Mi.</p><p>Park droht nun ein Strafverfahren. Solange sie noch Präsidentin war, genoss sie Immunität. Sie ist das erste Staatsoberhaupt des Landes, das per Gerichtsbeschluss abgesetzt wurde. Die ursprünglich für Dezember geplante Wahl muss nun spätestens bis zum 9. Mai vorgezogen werden. Parks fünfjährige Amtszeit wäre regulär im Februar 2018 zu Ende gegangen. </p><p>In den Umfragen zu den Kandidaten für die nächste Präsidentenwahl liegt derzeit der linksliberale Oppositionspolitiker Moon Jae In vorn, der 2012 die Wahl gegen Park verloren hatte. Nach mehr als neun Jahren konservativer Regierung <a href="http://spiegel.de/politik/ausland/suedkorea-verfassungsgericht-entscheidet-ueber-amtsenthebung-von-park-geun-hye-a-1138061.html" target="_blank" title="deutet sich damit ein Machtwechsel" class="text-link-int lp-text-link-int">deutet sich damit ein Machtwechsel</a> in der viertgrößten Volkswirtschaft Asiens an.</p>', '2017-03-10 17:50:00', 0, 1, 'http://www.spiegel.de/politik/ausland/suedkorea-tote-bei-protesten-gegen-amtsenthebung-von-park-geun-hye-a-1138142.html', 0),
(7, 'Recep Tayyip Erdogan Uno wirft Türkei Verbrechen an Kurden vor', '<p>Das türkische Militär hat seit Juli 2015 im Südosten des Landes schwere Menschenrechtsverletzungen begangen. Zu diesem Ergebnis kommt ein Bericht des <a href="http://spiegel.de/thema/uno/" target="_blank" title="Uno" class="text-link-int lp-text-link-int">Uno</a>-Hochkommissariats für Menschenrechte, <a href="http://www.ohchr.org/Documents/Countries/TR/OHCHR_South-East_TurkeyReport_10March2017.pdf" target="_blank" title="Office of the United Nations High Commissioner for Human Rights: Report on the human rights situation in South-East Turkey" class="spTextlinkExt text-link-ext lp-text-link-ext">der am Freitag in Genf vorgestellt wurde</a>.</p><p>Mehr als 30 Städte und Viertel seien von den Militäroperationen betroffen. Zwischen 335.000 und 500.000 Menschen wurden demnach vertrieben. Die meisten von ihnen sind <a href="http://spiegel.de/thema/kurden/" target="_blank" title="Kurden" class="text-link-int lp-text-link-int">Kurden</a>.</p><p>Allein in der Stadt Nusaybin an der türkisch-syrischen Grenze seien fast 1800 Häuser beschädigt oder zerstört worden. In Sur, einem Stadtteil von Diyarbakir, habe die türkische Armee 70 Prozent der Gebäude systematisch beschossen und zerstört. Ganze Häuserblöcke <a href="http://spiegel.de/politik/ausland/tuerkei-und-kurden-amnesty-spricht-von-exzessiver-gewalt-a-1073093.html" target="_blank" title="seien dem Erdboden gleichgemacht worden" class="text-link-int lp-text-link-int">seien dem Erdboden gleichgemacht worden</a>.</p><p>Laut Erkenntnissen der Uno gingen die Zerstörungen ziviler Infrastruktur sogar noch weiter, nachdem die Sicherheitsoperationen offiziell für beendet erklärt worden waren. </p><p>Bei dem Militäreinsatz wurden demnach rund 2000 Menschen getötet, unter ihnen 800 Angehörige der Sicherheitskräfte und 1200 Zivilisten.</p><p>Da dem Hochkommissariat von der <a href="http://spiegel.de/thema/tuerkei/" target="_blank" title="Türkei" class="text-link-int lp-text-link-int">Türkei</a> nach Uno-Angaben nicht erlaubt wurde, Vertreter in die Region zu schicken, erstellte es den Bericht auf der Basis von Satellitenaufnahmen zerstörter Ortschaften, Interviews von Opfern und Augenzeugen sowie Angaben von Nichtregierungsorganisationen.</p><p> <a href="http://spiegel.de/politik/ausland/tuerkei-nach-putschversuch-kurden-haben-angst-vor-neuer-gewalt-a-1103696.html" target="_blank" title="Der Südosten der Türkei" class="text-link-int lp-text-link-int">Der Südosten der Türkei</a> wird seit dem Scheitern der Waffenruhe im Sommer 2015 regelmäßig von gewaltsamen Auseinandersetzungen zwischen Kämpfern der verbotenen Arbeiterpartei Kurdistans (<a href="http://spiegel.de/thema/pkk/" target="_blank" title="PKK" class="text-link-int lp-text-link-int">PKK</a>) und türkischen Sicherheitskräften erschüttert.</p><p>Seit der Niederschlagung des Militärputsches vom 15. Juli 2016 hat sich die Lage auch im Südosten der Türkei weiter verschärft. So seien seither 10.000 Lehrer <a href="http://spiegel.de/politik/ausland/tuerkei-recep-tayyip-erdogan-entlaesst-per-dekret-weitere-10-000-staatsdiener-a-1122438.html" target="_blank" title="wegen angeblicher PKK-Verbindungen entlassen worden" class="text-link-int lp-text-link-int">wegen angeblicher PKK-Verbindungen entlassen worden</a>. Zudem beklagt die Uno, dass die Regierung von Staatschef <a href="http://spiegel.de/thema/recep_tayyip_erdogan/" target="_blank" title="Recep Tayyip Erdogan" class="text-link-int lp-text-link-int">Recep Tayyip Erdogan</a> demokratisch gewählte Politiker von ihren Posten enthob.</p><p>Der Hohe Kommissar für Menschenrechte warf der Türkei vor, dass die Verantwortlichen für die Verbrechen straffrei davonkämen. "Ich bin besorgt über Berichte, dass die Hinweise auf außergerichtliche Tötungen, besonders von Frauen und Kindern, in den 13 Monaten zwischen Juli 2015 und August 2016 nicht glaubhaft untersucht wurde", sagte Zeid Raad Al Hussein bei der Vorstellung des Uno-Berichts in Genf. "Es sieht so aus, als sei kein einziger Verdächtiger festgenommen oder angeklagt worden." </p>', '2017-03-10 20:14:00', 0, 1, 'http://www.spiegel.de/politik/ausland/recep-tayyip-erdogan-uno-wirft-tuerkei-verbrechen-an-kurden-vor-a-1138171.html', 0),
(8, 'Recep Tayyip Erdogan bei Wladimir Putin Türkei und Russland brauchen einander', '<p style="line-height:1em;"> <span class="spTextSmaller">Wenig Zeit? Am Textende gibt''s eine Zusammenfassung. </span> </p><p> <hr noshade="1"/> </p><p>Recep Tayyip Erdogan setzt auf Konfrontation: Der türkische Präsident wettert gegen Deutschland und bemüht sogar Nazi-Vergleiche, er droht der EU, die Grenzen für Flüchtlinge wieder zu öffnen. Und während sich die europäischen Staats- und Regierungschefs in Brüssel versammelten, reiste <a href="http://spiegel.de/thema/recep_tayyip_erdogan/" target="_blank" title="Erdogan" class="text-link-int lp-text-link-int">Erdogan</a> am Donnerstag nach Moskau zu Wladimir Putin und signalisierte damit: Auf euch im Westen bin ich nicht angewiesen.</p><p>Die Präsidenten Russlands und der Türkei zelebrieren nach schwierigen Monaten den Schulterschluss. Erdogan und <a href="http://spiegel.de/thema/wladimir_putin/" target="_blank" title="Putin" class="text-link-int lp-text-link-int">Putin</a> eint die Enttäuschung über den Westen. Die Zeiten der alten Weltordnung, die seit dem Ende des Kalten Krieges gegolten hatte, sind vorbei, die Beziehungen unübersichtlich geworden. Man braucht einander. US-Präsident Donald Trump ist vor allem mit sich und seinem Land beschäftigt.</p><p>Es ist das vierte hochrangige Treffen beider Regierungschefs binnen weniger Monate: Im September trafen sich Putin und Erdogan auf dem G-20-Gipfel im chinesischen Hangzhou, im August redeten sie in Sankt Petersburg, und im Oktober tauschten sie sich auf dem Weltenergie-Kongress in Istanbul aus. Nun also Gespräche im Kreml.</p><p> <b>Türkisch-russischer Pragmatismus</b> </p><p>Erdogan und Putin pflegen ein Zweckbündnis, das auf Pragmatismus in wirtschaftlichen und geopolitischen Fragen basiert. Dabei standen die beiden Länder erst vor 16 Monaten fast vor einem Krieg.</p><p>Damals, im November 2015, schoss die Türkei einen russischen Kampfjet ab, der auf dem Weg nach Syrien angeblich unerlaubt <a href="http://spiegel.de/politik/ausland/tuerkei-militaer-veroeffentlicht-mitschnitt-von-warnungen-a-1064597.html" target="_blank" title="durch türkischen Luftraum geflogen war" class="text-link-int lp-text-link-int">durch türkischen Luftraum geflogen war</a>. Putin sprach von einem "Stoß in den Rücken". Nach einem halben Jahr gelang es Ankara, die Beziehungen nach einer Entschuldigung Erdogans auf diplomatischem Wege einigermaßen zu reparieren.</p><p>Im Dezember 2016 erschoss ein türkischer Polizist den russischen Botschafter in Ankara, Andrej Karlow, <a href="http://spiegel.de/politik/ausland/ankara-mord-an-russischem-botschafter-was-wollte-der-attentaeter-von-ankara-a-1126765.html" target="_blank" title="während der Eröffnung einer Fotoausstellung" class="text-link-int lp-text-link-int">während der Eröffnung einer Fotoausstellung</a>. Der Täter war ein Islamist, der unmittelbar nach der Tat von Sicherheitskräften getötet wurde.</p><p>Doch anders als bei dem Flugzeugabschuss fiel die Reaktion verhaltener aus. Das gegenseitige Verhältnis schien wichtiger zu sein als eine erneute Konfrontation. Das zeigte sich auch Anfang Februar, als <a href="http://spiegel.de/politik/ausland/syrien-tuerkische-soldaten-bei-russischem-luftschlag-getoetet-a-1133877.html" target="_blank" title="bei einem russischen Luftangriff im nordsyrischen al-Bab" class="text-link-int lp-text-link-int">bei einem russischen Luftangriff im nordsyrischen al-Bab</a> mindestens drei türkische Soldaten getötet und elf weitere verletzt wurden. Putin sprach Erdogan sein Beileid aus für den "tragischen Zwischenfall".</p><p>Umkämpfte syrische Stadt al-Bab</p><p> <br clear="all"/> Im Syrienkonflikt ist Ankara ohnehin auf den Kreml angewiesen. Russland hat seit Beginn seiner Militärintervention im September 2015 die Oberhand gewonnen (<a href="http://spiegel.de/politik/ausland/syrienkrieg-wie-russland-und-die-tuerkei-taktieren-a-1124447.html" target="_blank" title="lesen Sie hier mehr" class="text-link-int lp-text-link-int">lesen Sie hier mehr</a>). "Beide - Russland und die Türkei - wollen gegen die IS-Terroristen vorgehen und die territoriale Integrität Syriens bewahren, das ist die momentane Schnittmenge", sagt Amur Gadschiew vom Moskauer Orientalistik-Institut.</p><p>Erdogan und Putin haben eine Art Stillhalteabkommen geschlossen, obwohl Ankara sich lange für einen Sturz von Machthaber <a href="http://spiegel.de/thema/baschar_al_assad/" target="_blank" title="Baschar al-Assad" class="text-link-int lp-text-link-int">Baschar al-Assad</a> ausgesprochen hatte. Russland lässt die Türkei im syrischen Grenzgebiet gewähren. Die türkische Armee konzentriert sich ihrerseits darauf, eine autonome kurdische Provinz im Norden Syriens zu verhindern. Im Gegenzug duldet die Türkei Assad als Teil einer syrischen Übergangsregierung und unterstützt die von Russland organisierten Friedensgespräche in Astana.</p><p> <b>Türkei will russische Touristen locken</b> </p><p>Gleichzeitig erhofft sich die Türkei, die seit dem Putschversuch wirtschaftlich angeschlagen ist, dass Russland Handelsbeschränkungen etwa für landwirtschaftliche Produkte aufhebt, die Moskau nach dem Abschuss des Kampfjets verhängt hatte. "Für Ankara ist der russische Markt sehr wichtig, für die Gemüse- und Obstexporte, aber auch die Bauindustrie" sagt Natalja Ultchenko, Leiterin der Türkei-Studien am Orientalistik-Institut. Zudem braucht die Türkei die russischen Touristen. Nach der Krise im November 2015 mieden viele das Land, Hunderte Hotels mussten schließen.</p><p>Russland wiederum will sein Gas exportieren, Erdogan und Putin haben das Abkommen für die geplante Gaspipeline aus Russland durch das Schwarze Meer unterzeichnet. Die Leitung wird an der Ukraine vorbeiführen. In Akkoyun planen die Russen außerdem ein Atomkraftwerk.</p><p> <b>Boden-Luft-Raketen für die Türkei?</b> </p><p>Auf der türkischen Seite gibt man sich vor der Reise nach Moskau wortkarg zu der Frage, was genau Erdogan mit Putin besprechen will. Präsidentenberater Ilnur Cevik sprach im russischen Staatssender Rossija 24 lediglich von "ökonomischen Angelegenheiten", er nannte auch Rüstungsgeschäfte.</p><p>Ankara ist interessiert am russischen S-400-Flugabwehrsystem - also Boden-Luft-Raketen, um Kampfflugzeuge, Marschflugkörper und andere Raketen abzufangen. Zuvor schon hatten das russische Staatsunternehmen Rostec und der türkische Außenminister Mevlüt Cavusoglu entsprechende Pläne bestätigt. Bisher verfügt die Türkei nicht über solche Waffensysteme, weshalb die Bundeswehr bis Ende 2015 das Abwehrsystem Patriot im türkischen Kahramanmaras stationiert hatte, zum Schutz vor syrischen Luftangriffen.</p><p>Manch einer in Russland träumt bereits davon, dass die Türkei der Nato den Rücken kehren könnte. "Dann würde die Südflanke der Nato kollabieren. Der Verlust der Südflanke wird ein spürbarer Schlag gegen das Militärbündnis als Ganzes", tönt der Rechtspopulist Wladimir Schirinowski von der nationalistischen Scheinoppositionspartei LDPR. </p><p>Expertin Ultchenko sieht die russisch-türkischen Beziehungen dagegen nüchterner. Beide Länder verfolgten vor allem ihre Interessen, meint sie. Die außenpolitischen Zeiten könnten sich wieder ändern. "Erdogan kann der Nato den Rücken kehren, aber austreten wird er nicht."</p><p> <i> <b>Zusammengefasst:</b> Der türkische Präsident Recep Tayyip Erdogan besucht am Donnerstag und Freitag Moskau. Er trifft auch seinen russischen Kollegen Wladimir Putin, mit dem er ein Zweckbündnis geschlossen hat - trotz Spannungen in den vergangenen Monaten. Beide eint eine Abneigung gegen den Westen, zudem braucht Ankara Russland im Syrien-Krieg und den russischen Absatzmarkt. Moskau wiederum will seine Gaspipeline bauen.</i> </p>', '2017-03-10 20:42:00', 0, 1, 'http://www.spiegel.de/politik/ausland/recep-tayyip-erdogan-bei-wladimir-putin-russland-und-tuerkei-brauchen-einander-a-1137721.html', 0),
(9, 'Gebärmutterhalskrebs Frauen ab 35 sollen nur noch alle drei Jahre getestet werden', '<p>Jede Frau sollte einmal im Jahr zum Frauenarzt gehen. Dort wird unter anderem am Muttermund ein Abstrich entnommen und unter dem Mikroskop untersucht. "Seit diese Untersuchung von den Krankenkassen bezahlt wird, erkranken rund 75 Prozent weniger Frauen an <a href="http://spiegel.de/thema/gebaermutterhalskrebs/" target="_blank" title="Gebärmutterhalskrebs" class="text-link-int lp-text-link-int">Gebärmutterhalskrebs</a>", erklärt der Gynäkologe Joachim Neis aus Saarbrücken.</p><p>Trotz des Erfolgs soll die <a href="http://spiegel.de/thema/frueherkennung/" target="_blank" title="Früherkennung" class="text-link-int lp-text-link-int">Früherkennung</a> für Frauen ab 35 Jahren <a href="http://spiegel.de/gesundheit/diagnose/gebaermutterhalskrebs-wie-viel-kontrolle-ist-notwendig-a-1118069.html" target="_blank" title="verändert werden" class="text-link-int lp-text-link-int">verändert werden</a>. Statt in jedem Jahr sollen die Betroffenen nur noch alle drei Jahre mit einem solchen Pap-Test auf Gebärmutterhalskrebs untersucht werden - dafür kommt für sie ein Test auf Humane Papillom Viren (HPV) hinzu.</p><p> <b>Humane Papillom Viren</b> </p><p>90 Prozent der weltweiten Gebärmutterhalskrebserkrankungen werden von HPV verursacht. Auf genau diese Viren kann man seit einigen Jahren testen. Den HPV-Test bezahlen die gesetzlichen Krankenkassen bisher aber nur, wenn der Abstrich einen sehr auffälligen Befund gezeigt hat. Das soll sich für Frauen ab 35 nun ändern. Sie bekommen den HPV-Test zusätzlich zu dem herkömmlichen Pap-Test kostenlos. Dafür wird nicht mehr jedes Jahr auf Gebärmutterhalskrebs getestet, sondern nur noch alle drei Jahre. </p><p>Die Frauen können aber weiterhin auf Kosten der <a href="http://spiegel.de/thema/krankenkassen/" target="_blank" title="Krankenkasse" class="text-link-int lp-text-link-int">Krankenkasse</a> einmal jährlich zur Routineuntersuchung beim Frauenarzt gehen. Dabei wird die Brust abgetastet und die Eierstöcke sowie die Gebärmutter werden untersucht. Es wird nur kein Krebsabstrich mehr gemacht.</p><p> <b>Warum betrifft das nur Frauen nach dem 35. Geburtstag?</b> </p><p>"Jüngere Frauen stecken sich recht häufig mit HPV an - der Körper wehrt die Viren aber meist erfolgreich wieder ab", erklärt Neis. Ein positiver Test würde sie nur unnötig verunsichern. Bei diesen Frauen bleibt deswegen alles wie zuvor. Sie erhalten auch weiterhin jedes Jahr einen Pap-Test, einen HPV-Test aber müssen sie in der Regel selbst zahlen.</p><p>"Frauen im mittleren Alter stecken sich viel seltener mit HPV an - auch, weil sie dann häufig einen festen Partner haben", sagt Neis. Weist der Test bei diesen Frauen Viren nach, ist die Wahrscheinlichkeit groß, dass es sich um eine Infektion handelt, die nicht von allein heilt. "Gebärmutterhalskarzinome entstehen meist sehr, sehr langsam", erläutert Neis. Deswegen genügten aus Sicht der Gynäkologen die Tests alle drei Jahre.</p><p>Neis war an der Ausarbeitung der neuen Richtlinie beteiligt und hat das Screening-Programm auf dem Frauenärztekongress Foko in <a href="http://spiegel.de/thema/duesseldorf/" target="_blank" title="Düsseldorf" class="text-link-int lp-text-link-int">Düsseldorf</a> vorgestellt. Die Neuerung wurde bereits vom Gemeinsamen Bundesausschuss der <a href="http://spiegel.de/thema/aerzte/" target="_blank" title="Ärzte" class="text-link-int lp-text-link-int">Ärzte</a> und Krankenkassen beschlossen. Sie soll umgesetzt werden, sobald das Institut für Qualität und Wirtschaftlichkeit im Gesundheitswesen (IQWiG) einen Patienten-Flyer dazu erstellt hat. Außerdem soll der Nutzen des neuen Programms von Anfang an überwacht werden. Ein entsprechendes Monitoring wird gerade erarbeitet.</p>', '2017-03-10 02:01:00', 0, 1, 'http://www.spiegel.de/gesundheit/diagnose/gebaermutterhalskrebs-frauen-ab-35-sollen-nur-noch-alle-drei-jahre-getestet-werden-a-1138051.html', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `newsimage`
--

CREATE TABLE `newsimage` (
  `images` int(10) NOT NULL,
  `news` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `newsimage`
--

INSERT INTO `newsimage` (`images`, `news`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9);

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
-- Tabellenstruktur für Tabelle `session`
--

CREATE TABLE `session` (
  `sessionID` int(10) NOT NULL,
  `userID` int(10) NOT NULL,
  `createdTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sessions`
--

CREATE TABLE `sessions` (
  `sessionID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `sessions`
--

INSERT INTO `sessions` (`sessionID`, `userID`) VALUES
(0, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tags`
--

CREATE TABLE `tags` (
  `tagsID` int(10) NOT NULL,
  `tagsName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `tags`
--

INSERT INTO `tags` (`tagsID`, `tagsName`) VALUES
(1, 'Wirtschaft'),
(2, 'Unternehmen & Märkte'),
(3, 'Windenergie'),
(4, 'Verbraucher & Service'),
(5, 'Streiks'),
(6, 'Auto'),
(7, 'Aktuell'),
(8, 'Benzin'),
(9, 'Löhne und Gehälter'),
(10, 'Sport'),
(11, 'Fußball-News'),
(12, 'Fußball-Bundesliga'),
(13, 'Politik'),
(14, 'Ausland'),
(15, 'Südkorea'),
(16, 'Türkei'),
(17, 'Bürgerkrieg in Syrien'),
(18, 'Gesundheit'),
(19, 'Diagnose & Therapie');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tagsinnews`
--

CREATE TABLE `tagsinnews` (
  `news` int(10) NOT NULL,
  `tags` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `tagsinnews`
--

INSERT INTO `tagsinnews` (`news`, `tags`) VALUES
(1, 3),
(2, 5),
(3, 8),
(4, 9),
(5, 12),
(6, 15),
(7, 16),
(8, 17),
(9, 19);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
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
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `isAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`userID`, `userName`, `password`, `fName`, `lName`, `birthDat`, `createdTS`, `email`, `isActive`, `isAdmin`) VALUES
(1, '', 'sdskdfkdsfkdsh4', 'nikja', 'mylvakanam', '0000-00-00', '2017-01-24 10:01:51', '', 0, 0),
(3, 'marvin', 'e99a18c428cb38d5f260853678922e03', 'marvin', 'muxfeld', '1993-09-24', '2017-03-28 07:04:30', 'mmuxi@gmx.de', 1, 0);

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
-- Indizes für die Tabelle `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`imageID`);

--
-- Indizes für die Tabelle `navigation`
--
ALTER TABLE `navigation`
  ADD PRIMARY KEY (`parentID`);

--
-- Indizes für die Tabelle `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`newsID`);

--
-- Indizes für die Tabelle `newsimage`
--
ALTER TABLE `newsimage`
  ADD PRIMARY KEY (`images`,`news`);

--
-- Indizes für die Tabelle `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`rankID`);

--
-- Indizes für die Tabelle `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`sessionID`);

--
-- Indizes für die Tabelle `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tagsID`);

--
-- Indizes für die Tabelle `tagsinnews`
--
ALTER TABLE `tagsinnews`
  ADD PRIMARY KEY (`news`,`tags`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `category`
--
ALTER TABLE `category`
  MODIFY `catID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `crawleruri`
--
ALTER TABLE `crawleruri`
  MODIFY `uriID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT für Tabelle `images`
--
ALTER TABLE `images`
  MODIFY `imageID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT für Tabelle `navigation`
--
ALTER TABLE `navigation`
  MODIFY `parentID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `news`
--
ALTER TABLE `news`
  MODIFY `newsID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT für Tabelle `ranking`
--
ALTER TABLE `ranking`
  MODIFY `rankID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `session`
--
ALTER TABLE `session`
  MODIFY `sessionID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `tags`
--
ALTER TABLE `tags`
  MODIFY `tagsID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
