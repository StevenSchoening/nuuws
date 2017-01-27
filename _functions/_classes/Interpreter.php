<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 1/25/2017
 * Time: 9:27 AM
 * todo link in content???
 * todo relative paths
 */
abstract class Interpreter implements IInterpreter
{
    protected $uri, $id, $title, $content, $headerImage, $headerImageInfo,
              $author, $publisher, $html, $isArticle, $summary, $tags;

    const newsTable = "`article`";

    const uriTable  = "`crawleruri`";

    public function __construct($uri, $id)
    {
        $this->isArticle       = FALSE;
        $this->uri             = $uri;
        $this->id              = $id;
        $this->html            = file_get_contents($uri);
        $this->isArticle       = $this->isArticle();
        $this->headerImageInfo = $this->tags = [];
    }

    public static function getPublisher($uri)
    {
        // parse url to retrieve host
        $host = parse_url($uri)["host"];

        $host = explode(".", $host);

        return strtolower($host[sizeof($host) - 2]); // -1 = top level domain, -2 = domain
    }

    private function getUpdateUriQuery()
    {
        return "UPDATE `crawleruri` SET `interpreted` = '1' WHERE `uriID` LIKE '{$this->id}'";
    }

    public function __destruct()
    {
//        if(!$this->isArticle) // todo remove

            Database::getLastInstance()->query($this->getUpdateUriQuery());

        if($this->isArticle)

            Database::getLastInstance()->query($this->getInsertQuery());
    }

    public static function trimTitle($title)
    {
        $search  = [
            '#^[^\w]+#ix',
            '#(\w)[^\w]+$#ix'
        ];
        $replace = [
            '',
            '$1'
        ];

        return preg_replace($search, $replace, trim($title));
    }
}