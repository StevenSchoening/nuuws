<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 1/25/2017
 * Time: 9:27 AM
 */
abstract class Interpreter
{
    private $uri, $title, $content, $headerImage, $headerImageInfo, $author, $publisher;

    public function __construct($uri)
    {
        $this->uri = $uri;
    }
}