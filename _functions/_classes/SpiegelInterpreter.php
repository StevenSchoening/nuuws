<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 1/25/2017
 * Time: 10:14 AM
 */
class SpiegelInterpreter extends Interpreter
{
    /**
     * SpiegelInterpreter constructor.
     *
     * @param $uri string unique request identifier
     * @param $uriId string id from crawler Table
     */
    public function __construct($uri, $uriId)
    {
        parent::__construct($uri, $uriId);

        if($this->isArticle)
        {
            self::detectTitle();
            self::detectContent();

            if(!$this->isArticle())

                return;
        }
    }

    /**
     * Detect the title of the page from html
     */
    private function detectTitle()
    {
        $pattern = '/<title [^>]* > ([^<]*) <\/title>/ix';
        preg_match_all($pattern, $this->html, $matches);

        $titleTag = $matches[1][0];

        $patterns = [
            '#\s?\-\sSPIEGEL\sONLINE#',
            '#\:\s#',
            '#\,\s#'
        ];

        $replace = [
            '',
            ' ',
            '<br />'
        ];

        $this->title = preg_replace($patterns, $replace, $titleTag);
    }

    /**
     *  Detect the content (text, images and tags) from the loaded html source
     */
    private function detectContent()
    {
        $html = str_get_html($this->html);

        if(sizeof($articles = $html->find('.article-section'))  === 0
        || sizeof($summary  = $html->find('.article-intro'))    === 0)
        {
            $this->isArticle = FALSE;
            return;
        }

//      Summary content

        $this->summary = $summary[0]->innertext;

//      Full content

        foreach($articles as $article)

            foreach($article->find('p') as $p)

                $this->content .= $p;

        self::detectImages($html);

//      Category

        if(sizeof($breadcrumb = $html->find('.breadcrumb-history')) !== 0)
        {
            $li = $breadcrumb[0]->find('li');

            for($i = 1; $i < sizeof($li) - 1; $i++)

                $this->tags[] = trim(str_replace('&gt;', '', strip_tags($li[$i]->innertext)));
        }

    //  Timestamp
        if(sizeof($timestamp = $html->find('.timeformat')) !== 0 && isset($timestamp[0]->attr['datetime']))

            $this->timestamp = $timestamp[0]->attr['datetime'];
    }

    /**
     * extracts teaser images and information about them
     *
     * is automatically called by detectContent()
     *
     * @param $html object from detectContent()
     */
    private function detectImages($html)
    {
//      Header Image
        if(sizeof($image = $html->find('.image-buttons-panel')) !== 0)
        {
            self::extractImage($image);

            if($this->headerImage !== NULL)

                return;
        }

        if(sizeof($image = $html->find('.spPanoImageTeaserPic')) !== 0)
        {
            self::extractImage($image);

            if($this->headerImage !== NULL)

                return;
        }
    }

    /**
     * internal function of detectImages()
     *
     * @param $image object
     */
    private function extractImage($image)
    {
        $this->headerImage = @$image[0]->find('a')[0]->innertext;

        if($this->headerImage === NULL && is_object($image[0]->children[0]))
        {
            $imgArr = $image[0]->children[0]->attr;

            $this->headerImage                = $imgArr['src'];
            $this->headerImageInfo['title']   = $imgArr['title'];
            $this->headerImageInfo['width']   = $imgArr['width'];
            $this->headerImageInfo['height']  = $imgArr['height'];
            $this->headerImageInfo['orgHtml'] = "<img src='$this->headerImage' width={$this->headerImageInfo['width']} 
                                                      height={$this->headerImageInfo['height']} title='{$this->headerImageInfo['title']}'>";

            return;
        }

//      Header Image info

        preg_match_all('#((width|height)="(\d+)")#i', $this->headerImage, $imgInfo);

        foreach($imgInfo[1] as $i => $property)

            $this->headerImageInfo[$property] = $imgInfo[2][$i];

        preg_match('#(title)="([\d\w\s\-:&;]+)"#i', $this->headerImage, $title);

        $this->headerImageInfo['title'] = $title[2];

        preg_match('#(src)="([\d\w\s\-:&;\/\.]+)"#i', $this->headerImage, $src);

        $this->headerImageInfo['orgHtml'] = $this->headerImage;

        $this->headerImage                = $src[2];
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
                NULL, '$escapedTitle', '$escapedContent', $tsStr, '0', '1', '$this->uri');";
    }

    /**
     * Determines if this URI is a usable news-story
     *
     * @return bool
     */
    public function isArticle()
    {
        if(preg_match('#\\d+\\.html#i', $this->uri))

            return !strpos($this->uri, "spiegeltv") && !strpos($this->uri, "extras");

        else

            return FALSE;
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

    public function resultIsValid()
    {
        return substr_count($this->content, '<input') == 0 && substr_count($this->content, '<script') == 0;
    }

    public function getRootUri()
    {
        return 'http://spiegel.de';
    }

    public function getPublisher()
    {
        return "Spiegel";
    }

    public function getCategoryQuery()
    {
        if(sizeof($this->tags) === 0)

            return "";

        $cat    = Database::getLastInstance()->real_escape($this->tags[0]);

        $query  = "SELECT * FROM `category` WHERE `catName` LIKE '$cat'";

        $result = Database::getLastInstance()->query($query);

        if(Database::getLastInstance()->mysqli_num_rows($result) == 0)

            return "INSERT INTO `category`(`catName`) VALUES ('$cat')";

        else
        {
            $row = Database::getLastInstance()->fetch_object($result);

            $this->catID = $row->catID;

            return "";
        }
    }

    public function getCategoryInNewsQuery()
    {
        return "INSERT INTO `categorynews`(`category`, `news`) 
                VALUES ('$this->catID', '$this->newsId')";
    }
}