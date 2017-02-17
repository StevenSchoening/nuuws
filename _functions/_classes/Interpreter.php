<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 1/25/2017
 * Time: 9:27 AM
 * todo relative paths
 */
abstract class Interpreter implements IInterpreter
{
    protected $uri, $crawlerId, $title, $content, $headerImage, $headerImageInfo,
              $author, $publisher, $html, $summary, $tags, $newsId = FALSE,
              $imgId = FALSE, $isArticle;

    const imageRoot = 'C:/xampp/htdocs/nuuws/portal/assets/images/';

    /**
     * Interpreter constructor.
     *
     * @param $uri string unique request identifier
     * @param $uriId string id from crawler Table
     */
    public function __construct($uri, $uriId)
    {
        $this->isArticle       = FALSE;
        $this->uri             = $uri;
        $this->crawlerId       = $uriId;
        $this->html            = file_get_contents($uri);
        $this->isArticle       = $this->isArticle();
        $this->headerImageInfo = $this->tags = [];
    }

    /**
     * transforms an array into a MySql conform string
     *
     * @param $arr
     *
     * @return string 'val1', 'val2', 'val3'
     */
    protected function valueArrToMySqlString($arr)
    {
        $str = '';

        foreach($arr as &$value)

            $str .= "'$value', ";

        return substr($str, 0, -2);
    }

    /**
     * @param $uri
     *
     * @return string publisher / host
     */
    public static function getPublisher($uri)
    {
        // parse url to retrieve host
        $host = parse_url($uri)["host"];

        $host = explode(".", $host);

        return strtolower($host[sizeof($host) - 2]); // -1 = top level domain, -2 = domain
    }

    /**
     * Crawler database entry will be set to `interpreted` = 1
     *
     * The interpreter will only not interpret it twice
     *
     * @return string MySql query
     */
    private function getUpdateUriQuery()
    {
        return "UPDATE `crawleruri` SET `interpreted` = '1' WHERE `uriID` LIKE '{$this->crawlerId}';";
    }

    /**
     * results will be stored in the database automatically
     */
    public function __destruct()
    {
        Database::getLastInstance()->query($this->getUpdateUriQuery());

        if($this->isArticle && $this->resultIsValid())
        {
            $this->repairLinks();

            echo "<p><b>$this->uri</b> als Artikel gespeichert!</p>";

        //  News creation
            $query = $this->getInsertQuery();

            if($query !== "")

                Database::getLastInstance()->query($this->getInsertQuery());

            $this->newsId = Database::getLastInstance()->insert_id();

        //  Image
            $query = $this->getImageQuery();

            if($query !== "")

                Database::getLastInstance()->query($query);

            $this->imgId = Database::getLastInstance()->insert_id();

        //  Tags
            $query = $this->getTagInsertQuery();

            if($query !== "")

                Database::getLastInstance()->query($query);

            $query = $this->getTagInNewsQuery();

            if($query !== "")

                Database::getLastInstance()->query($query);

        //  linking news and image
            $query = $this->getNewsImageQuery();

            if($query !== "")

                Database::getLastInstance()->query($query);
        }

        else echo "<p>$this->uri <b>nicht</b> gespeichert!</p>";

        flush();ob_flush();
        flush();ob_flush();
    }

    private function repairLinks()
    {
        return;

        $html = str_get_html($this->content);

        if(sizeof($links = $html->find('a'))  !== 0)
        {
            foreach($links as $link)

                if(isset($link->attr['href']) && $link->attr['href'][0] == '/')

                    $this->content =
                        preg_replace('#(\'|")' . preg_quote($link->attr['href']) . '#', '$1' . $this->getRootUri() . $link->attr['href'], $this->content);
        }
    }

    /**
     * @param $title string
     *
     * @return mixed trimmed $title
     */
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