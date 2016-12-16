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

ini_set('max_execution_time', 300);

# Spiegel URIs
Crawler::addToWhitelist('#^https?:\/\/\w+\.spiegel\.#');

#========================= start locations ========================

$uris = [
    'http://www.spiegel.de/' => NULL,
];

#========================== crawling ==============================

foreach($uris as $uri => &$crawler)

    $crawler = new Crawler($uri);