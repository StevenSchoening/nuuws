<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 1/25/2017
 * Time: 9:27 AM
 */
abstract class Interpreter implements IInterpreter
{
    protected $uri, $id, $title, $content, $headerImage, $headerImageInfo, $author, $publisher, $html;

    const table = "`article`";

    public function __construct($uri, $id)
    {
        $this->uri  = $uri;
        $this->id   = $id;
        $this->html = file_get_contents($uri);
    }

    public static function getPublisher($uri)
    {
        // parse url to retrieve host
        $host = parse_url($uri)["host"];

        $host = explode(".", $host);

        return strtolower($host[sizeof($host) - 2]); // -1 = top level domain, -2 = domain
    }

    public function __destruct()
    {
        Debugger::dump($this->getInsetQuery());
    }
}