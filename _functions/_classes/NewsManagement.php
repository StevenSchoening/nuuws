<?php
/**
 * Created by PhpStorm.
 * User: Fa15schoening
 * Date: 25.01.2017
 * Time: 09:11
 */

class NewsManagement{

    private $database;

    const displayedCategories = "('Wirtschaft', 'Politik', 'Panorama', 'Kultur', 'Sport', 'Gesundheit')";

    function __construct($db = NULL)
    {
        $this->database = isset($db) ? $db : Database::getLastInstance();

        if(isset($_POST['title']))
        {
            self::createArticle();
        }
    }

    public function getArticles()
    {
        $articles = [];

        $selectedCategoryID = isset($_GET['cat']) ? $_GET['cat'] : FALSE;

        $query = "SELECT news.*, images.copyright, images.imagePath, images.title as imgTitle FROM `news`
                            
                  INNER JOIN `newsimage` ON newsimage.news = news.newsID
                    
                  INNER JOIN `images` ON newsimage.images = images.imageID WHERE news.published LIKE 1";

        if(is_numeric($selectedCategoryID))

            $query .= " WHERE `newsID` IN (SELECT `news` FROM `categorynews` WHERE `category` LIKE '$selectedCategoryID')";

        else if($selectedCategoryID == "a")

            $query .= " WHERE `newsID` IN 
                       (SELECT `news` FROM `categorynews` WHERE `category` IN 
                            (SELECT `catID` FROM `category` WHERE `catName` NOT IN " . self::displayedCategories
                    . "))";

        $query .= " ORDER BY `createdTS` DESC LIMIT 5";

        $result = $this->database->query($query);

        if($this->database->mysqli_num_rows($result))

            while($row = $this->database->fetch_object($result))

                $articles[$row->newsID] =

                    [
                        strip_tags($row->title),
                        self::getHtmlTitle($row->title),
                        str_replace(DEFAULT_PATH_LOCAL, DEFAULT_PATH_WEB, $row->imagePath),
                        $row->imgTitle,
                        $row->content,
                        date('d.m.Y', strtotime($row->createdTS))
                        . ' '
                        . Interpreter::getHost($row->crawlerURI)
                    ];

        return $articles;
    }

    private function getHtmlTitle($title)
    {
        $search  = [' ', '.', '"', "'", '<br>', '</br>'];
        $replace = ['_', '_', '', '', '-', '-'];

        return strip_tags(str_replace($search, $replace, $title));
    }

    public function getCategories()
    {
        $categories = [];

        $query      = "SELECT * FROM `category` WHERE `catName` IN " . self::displayedCategories;

        $result = $this->database->query($query);

        if($this->database->mysqli_num_rows($result) > 0)

            while($row = $this->database->fetch_object($result))

                $categories[$row->catID] = $row->catName;

        return $categories;
    }

    public function getArticleContent()
    {
        $id             = $this->database->real_escape($_GET['id']);

        if(!is_numeric($id)) return FALSE;

        $query          = "SELECT news.*, images.copyright, images.imagePath, images.title as imgTitle FROM `news`
                            
                           INNER JOIN `newsimage` ON newsimage.news = news.newsID
                            
                           INNER JOIN `images` ON newsimage.images = images.imageID
                            
                           WHERE `newsID` LIKE '$id'";

        $result         = $this->database->query($query);

        if($this->database->mysqli_num_rows($result) && $row = $this->database->fetch_object($result))
        {
            $articleContent = [
                'title'      => $row->title,
                'content'    => $row->content,
                'creator'    => $row->userID == 0 ? $row->copyright : "",
                'imagePath'  => str_replace(DEFAULT_PATH_LOCAL, DEFAULT_PATH_WEB, $row->imagePath),
                'imageTitle' => $row->imgTitle,
            ];

            if(strlen($row->crawlerURI) > 4)

                $articleContent['timestamp']  = "<a href='$row->crawlerURI' target='_blank'>"
                                              . Interpreter::getHost($row->crawlerURI)
                                              . "</a> am $row->createdTS";

            else $articleContent['timestamp'] = $row->createdTS;

            $articleContent['creator'][0] = strtoupper($articleContent['creator'][0]);

            return $articleContent;
        }

        return FALSE;
    }

    public function createArticle()
    {

        //todo add user id value currently no userID function
        $title     = $this->database->real_escape($_POST['title']);
        $copyright = $this->database->real_escape($_POST['copyright']);
        $content   = $this->database->real_escape($_POST['content']);

        //copyright for Image (autor name)
        //todo add headerImage path and name to db, save image to path
        //$headerImage = $database->real_escape($_FILES['headerImage']);
        //$destination = 'images-folder/';
        //$img=file_get_contents($link);
        //file_put_contents($destdir.substr($link, strrpos($link,'/')), $img);

        $sql =
            "INSERT INTO `news`(`newsID`, `title`, `content`, `createdTS`, `userID`, `published`, `crawlerURI`) VALUES (NULL,'$title','$content', NULL, '0','0', '')";
        $this->database->query($sql);
        // todo redirect
    }

    public function searchArticle()
    {
        $searchArticleTitle = $this->database->real_escape($_POST['searchArticleFromTitle']);
        $database           = Database::getLastInstance();

        $sqlSearch = "SELECT news.*, images.copyright, images.imagePath, images.title as imgTitle FROM `news`
                            
                           INNER JOIN `newsimage` ON newsimage.news = news.newsID
                            
                           INNER JOIN `images` ON newsimage.images = images.imageID
                            
                           WHERE news.`title` LIKE '%$searchArticleTitle%'";

        $result = $database->query($sqlSearch);

        if($this->database->mysqli_num_rows($result) && $row = $this->database->fetch_object($result))
        {

            $date           = date_create($row->createdTS);
            $dateFormat     = date_format($date, 'd.m.Y');
            $articleContent = [
                'title'      => $row->title,
                'content'    => $row->content,
                'creator'    => $row->userID == 0 ? $row->copyright : "",
                'imagePath'  => str_replace(DEFAULT_PATH_LOCAL, DEFAULT_PATH_WEB, $row->imagePath),
                'imageTitle' => $row->imgTitle,
                'timestamp'  => $dateFormat,
                'newsId'     => $row->newsId,
            ];

            //todo copyright for createArticle

            return $articleContent;
        } else
        {
            return [];
        }
    }
}










