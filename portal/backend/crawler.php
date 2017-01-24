<?php
/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 12/15/2016
 * Time: 12:34 PM
 */

require '../../_functions/_init.php';

$srt = new ScriptRunTime;

#=================== result filters & settings ====================

ini_set('max_execution_time', -1);

$uriWhiteList = [
    '#^https?:\/\/\w+\.spiegel\.#i',
    '#^https?:\/\/\w+\.sueddeutsche\.#i',
];

# Spiegel URIs
Crawler::addToWhiteList($uriWhiteList);

#========================= start locations ========================

$uris = [
    'http://news.google.com/' => NULL,
    'http://m.spiegel.de' => NULL,
];

#========================== crawling ==============================

echo "<h2>Starte Crawling!</h2>";

flush();ob_flush();flush();ob_flush();

foreach($uris as $uri => &$crawler)

    $crawler = new Crawler($uri);