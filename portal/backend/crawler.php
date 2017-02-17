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

Crawler::addToWhiteList([
    '#[^s]spiegel\.de#i',
//    '#sueddeutsche\.de#i',
]);

#========================= start locations ========================

$uris = [
    'http://news.google.com/' => NULL,
//    'http://spiegel.de' => NULL,
];

#========================== RESET & TRUNCATE ==============================

//  Database::getLastInstance()->query("TRUNCATE TABLE `crawleruri`");
//  Database::getLastInstance()->query("TRUNCATE TABLE `news`");
//  Database::getLastInstance()->query("TRUNCATE TABLE `tags`");
//  Database::getLastInstance()->query("TRUNCATE TABLE `tagsinnews`");
//  Database::getLastInstance()->query("TRUNCATE TABLE `images`");
//  Database::getLastInstance()->query("TRUNCATE TABLE `newsimage`");

#========================== crawling ==============================

echo "<h2>Starte Crawling!</h2>";

flush();ob_flush();flush();ob_flush();

foreach($uris as $uri => &$crawler)
{
    $crawler = new Crawler($uri);
    $crawler->save();
}

Crawler::cleanDatabase();