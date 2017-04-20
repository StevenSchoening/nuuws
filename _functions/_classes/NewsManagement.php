<?php
/**
 * Created by PhpStorm.
 * User: Fa15schoening
 * Date: 25.01.2017
 * Time: 09:11
 */

class newsmanagement
{
    private $database, $displayedCategories = '(';

    function __construct($db = NULL)
    {
        $this->database = isset($db) ? $db : Database::getLastInstance();

        if(sizeof($this->getCategories()) > 0)
        {
            foreach($this->getCategories() as $cat)

                $this->displayedCategories .= "'$cat', ";

            $this->displayedCategories = substr($this->displayedCategories, 0, -2) . ')';
        }

        else

            $this->displayedCategories = '()';

        if(isset($_POST['title']))

            self::createArticle();

        if(isset($_POST['saveCategories']))

            self::saveCategories();

        if(isset($_POST['addCategory']))

            self::addCategory();
    }

    private function addCategory()
    {
        $name   = $this->database->real_escape($_POST['catName']);

        $query  = "SELECT * FROM `category` WHERE `catName` LIKE '$name'";

        $result = $this->database->query($query);

        if(!$this->database->mysqli_num_rows($result))

            $this->database->query("INSERT INTO `category`(`catID`, `catName`) VALUES (NULL, '$name')");

        header("Location: " . DEFAULT_PATH_WEB . 'backend');
    }

    private function saveCategories()
    {
        $this->database->query("TRUNCATE TABLE `categorytags`");

        $query     = "INSERT INTO `categorytags`(`category`, `tag`) VALUES ";

        $sendQuery = FALSE;

        foreach($_POST as $name => $value)
        {
            if(preg_match('#^cat\_(\d+)#', $name, $rgx))
            {
                $sendQuery = TRUE;

                $catID     = $rgx[1];

                foreach($value as $val)

                    $query .= "('$catID', '$val'), ";
            }
        }

        if($sendQuery)
        {
            $this->database->query(substr($query, 0, -2));

            header("Location: " . DEFAULT_PATH_WEB . 'backend');
        }
    }

    public function getSelectedTags($catID)
    {
        $tags = [];

        $query  = "SELECT * FROM `categorytags` WHERE `category` LIKE '$catID'";

        $result = $this->database->query($query);

        if($this->database->mysqli_num_rows($result))

            while($row = $this->database->fetch_object($result))

                $tags[] = $row->tag;

        return $tags;
    }

    public function getArticles()
    {
        $articles = [];

        $selectedCategoryID = isset($_GET['cat']) ? $_GET['cat'] : FALSE;

        $query = "SELECT news.*, images.copyright, images.imagePath, images.title as imgTitle FROM `news`
                            
                  INNER JOIN `newsimage` ON newsimage.news = news.newsID
                    
                  INNER JOIN `images` ON newsimage.images = images.imageID";



        if(is_numeric($selectedCategoryID))

            $query .= " WHERE `newsID` IN (SELECT `news` FROM `tagsinnews` WHERE `tags` IN 
                        (SELECT tag FROM `categorytags` WHERE `category` LIKE '$selectedCategoryID')
                        ) AND `news`.published LIKE 1";


        else if($selectedCategoryID == "a") // todo
        {
            $query .= " WHERE `newsID` IN (SELECT `news` FROM `tagsinnews` WHERE `tags` NOT IN
                        (SELECT `category` FROM `categorynews` WHERE `category` IN 
                        (SELECT `catID` FROM `category` WHERE `catName` NOT IN " . $this->displayedCategories . ")
                        )
                        ) AND `news`.published LIKE 1";
        }

        else

            $query .= ' WHERE `news`.published LIKE 1';



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

        $query      = "SELECT * FROM `category`";

        $result = $this->database->query($query);

        if($this->database->mysqli_num_rows($result) > 0)

            while($row = $this->database->fetch_object($result))

                $categories[$row->catID] = $row->catName;

        return $categories;
    }

    public function getAllTags()
    {
        $tags   = [];

        $query  = "SELECT * FROM `tags`";

        $result = $this->database->query($query);

        if($this->database->mysqli_num_rows($result) > 0)

            while($row = $this->database->fetch_object($result))

                $tags[$row->tagsID] = $row->tagsName;

        return $tags;
    }

    public function getAllCategories()
    {
        $categories = [];

        $query      = "SELECT * FROM `category` ORDER BY `catID`";

        $result     = $this->database->query($query);

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



        //uploading headerImages to the image directory
        $uploadDir = "F:/xamppAndPHP7/htdocs/nuuws/portal/assets/images/headerImages/";
        $uploadFileTo = $uploadDir . basename($_FILES['headerImage']['name']);

        move_uploaded_file($_FILES['headerImage']['tmp_name'], $uploadFileTo);

        //todo add headerImage path and name to db
        //copyright for Image (autor name)



        $sql = "INSERT INTO `news`(`newsID`, `title`, `content`, `createdTS`, `userID`, `published`, `crawlerURI`) VALUES (NULL,'$title','$content', NULL, '0','0', '')";
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










