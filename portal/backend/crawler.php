<?php
/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 12/15/2016
 * Time: 12:34 PM
 */

require '../../_functions/_init.php';

$srt = new ScriptRunTime;

# Spiegel URIs
Crawler::addToWhitelist('#^https?:\/\/\w+\.spiegel\.#');

$crawler = new Crawler('http://news.google.de');

Debugger::dump($crawler->listLinks());

