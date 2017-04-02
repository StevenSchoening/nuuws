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
              $imgId = FALSE, $isArticle, $timestamp = FALSE, $catID = FALSE, $published;

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
        $this->published       = '1';
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
     * News insert query. Will be automatically called and executed by the __destruct function
     *
     * @return string MySql query
     */
    public function getInsertQuery()
    {
        $escapedTitle   = Database::getLastInstance()->real_escape($this->title);
        $escapedContent = Database::getLastInstance()->real_escape($this->content);

        $tsStr = $this->timestamp === FALSE ? "NULL" : "'$this->timestamp'";

        return "INSERT INTO `news`(`newsID`, `title`, `content`, `createdTS`, `userID`, `published`, `crawlerURI`) 
                VALUES (
                NULL, '$escapedTitle', '$escapedContent', $tsStr, '0', '$this->published', '$this->uri');";
    }

    /**
     * Saves an images from a page locally and
     * returns an insert query with the information
     *
     * @return string MySql query
     */
    public function getImageQuery()
    {
        if(!isset($this->headerImage) || ($ext = pathinfo($this->headerImage)['extension']) == "")
        {
            $image = self::imageRoot . 'fallback.png';

            return "INSERT INTO `images`(`title`, `description`, `copyright`, `link`, `imagePath`) 
                VALUES ('Nuuws', 'Nuuws', 'spiegel', '', '$image');";
        }

        //  Saving Image locally
        $img = self::imageRoot . "sp/" . md5($this->headerImage) . rand(12,10000) . ".$ext";

        echo "<p>Speichere $this->headerImage als $img</p>";

        file_put_contents($img, file_get_contents($this->headerImage));

        $this->headerImageInfo['title'] = Database::getLastInstance()->real_escape($this->headerImageInfo['title']);

        //  Insert to Database
        return "INSERT INTO `images`(`title`, `description`, `copyright`, `link`, `imagePath`) 
                VALUES ('{$this->headerImageInfo['title']}', '', 'spiegel', '{$this->headerImage}', '$img');";
    }

    /**
     * @return string MySql query with all new tags.
     */
    public function getTagInsertQuery()
    {
        $db = Database::getLastInstance();

        $tagsToInsert = $this->tags;

        $query  = "SELECT * FROM `tags` WHERE `tagsName` IN (". self::valueArrToMySqlString($this->tags) .")";

        $result = $db->query($query);

        if($db->mysqli_num_rows($result))

            while($row = $db->fetch_object($result))

                foreach($tagsToInsert as $i => $tag)

                    if($tag == $row->tagsName)

                        unset($tagsToInsert[$i]);

        if(sizeof($tagsToInsert) == 0) return "";

        $query = "INSERT INTO `tags`(`tagsName`) VALUES ";

        foreach($tagsToInsert as $tag)

            $query .= "('$tag'), ";

        return substr($query, 0, -2) . ';';
    }

    /**
     * @return string MySql query with every tag used in news
     */
    public function getTagInNewsQuery()
    {
        $db     = Database::getLastInstance();

        $query  = "SELECT `tagsID` FROM `tags` WHERE `tagsName` IN (". self::valueArrToMySqlString($this->tags) .")";

        $result = $db->query($query);

        $tagIds = [];

        if($db->mysqli_num_rows($result))

            while($row = $db->fetch_object($result))

                $tagIds[] = $row->tagsID;

        $query = "INSERT INTO `tagsinnews`(`news`, `tags`) VALUES ";

        foreach($tagIds as $id);

        $query .= "('{$this->newsId}', '$id'), ";

        return substr($query, 0, -2) . ';';
    }

    /**
     * @return string
     */
    public function getNewsImageQuery()
    {
        return is_numeric($this->imgId) && is_numeric($this->newsId) ? "INSERT INTO `newsimage`(`images`, `news`) VALUES ('$this->imgId', '$this->newsId');"
            : "";
    }

    /**
     * @param $uri
     *
     * @return string publisher / host
     */
    public static function getHost($uri)
    {
    //  parse url to retrieve host
        $host    = parse_url($uri)["host"];

        $host    = explode(".", $host);

        $host    = strtolower($host[sizeof($host) - 2]); // -1 = top level domain, -2 = domain

        $host[0] = strtoupper($host[0]);

        return $host;
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
        $html = str_get_html($this->content);

        if(sizeof($links = $html->find('a'))  !== 0)

            foreach($links as $link)

                if(isset($link->attr['href']) && $link->attr['href'][0] == '/')
                {
                    $pattern = '#(\'|")' . preg_quote($link->attr['href']) . '(\'|")#';

                //  If no target is set we will add _blank

                    $replace = isset($link->attr['target']) ? '$1' . $this->getRootUri() . $link->attr['href'] . '$2'
                                                            : '$1' . $this->getRootUri() . $link->attr['href'] . '$2 target="_blank"';

                    $this->content = preg_replace($pattern, $replace, $this->content);
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