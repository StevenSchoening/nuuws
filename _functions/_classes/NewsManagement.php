<?php
/**
 * Created by PhpStorm.
 * User: Fa15schoening
 * Date: 25.01.2017
 * Time: 09:11
 */

class NewsManagement{

    private $database;

    function __construct($db = NULL)
    {
        $this->database = isset($db) ? $db : Database::getLastInstance();

        if(isset($_POST['title']))

            self::createArticle();
    }

    public function getArticles()
    {
        $articles = [];

        $selectedCategoryID = isset($_GET['cat']) ? $_GET['cat'] : FALSE;

        $query = "SELECT news.*, images.copyright, images.imagePath, images.title as imgTitle FROM `news`
                            
                  INNER JOIN `newsimage` ON newsimage.news = news.newsID
                    
                  INNER JOIN `images` ON newsimage.images = images.imageID";

        if($selectedCategoryID)

            $query .= " WHERE `newsID` IN (SELECT `news` FROM `categorynews` WHERE `category` LIKE '$selectedCategoryID')";

        else

            $query .= " ORDER BY `createdTS`";

        $query .= " LIMIT 5";

        $result = $this->database->query($query);

        if($this->database->mysqli_num_rows($result))

            while($row = $this->database->fetch_object($result))

                $articles[$row->newsID] =

                    [
                        strip_tags($row->title),
                        self::getHtmlTitle($row->title),
                        str_replace(DEFAULT_PATH_LOCAL, DEFAULT_PATH_WEB, $row->imagePath),
                        $row->imgTitle,
                        $row->content
                    ];

        return $articles;
    }

    private function getHtmlTitle($title)
    {
        $search  = [' ', '.', '"', "'", '<br>', '</br>'];
        $replace = ['_', '_', '', '', '', ''];

        return strip_tags(str_replace($search, $replace, $title));
    }

    public function getCategories()
    {
        $categories = [];

        $query      = "SELECT * FROM `category` WHERE `catName` 
                       IN ('Wirtschaft', 'Politik', 'Panorama', 'Kultur')";

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

    public function createArticle(){

        //todo add user id value
        $title =   $this->database->real_escape($_POST['title']);
        $content = $this->database->real_escape($_POST['content']);


        //todo add headerImage path and name to db, save image to path
    //    $headerImage = $database->real_escape($_FILES['headerImage']);
        //$destination = 'images-folder/';
        //$img=file_get_contents($link);
        //file_put_contents($destdir.substr($link, strrpos($link,'/')), $img);


        $sql = "INSERT INTO `news`(`newsID`, `title`, `content`, `createdTS`, `userID`, `published`, `crawlerURI`) VALUES (NULL,'$title','$content', NULL, '0','0', '')";

        $this->database->query($sql);

        if($this->database->query($sql) === true){
            echo "data was sent successfully!";
        }else{
            echo "somehow you got an unexpected error...but we are surely already working on it";
        }

        // todo redirect
    }

    public function searchArticle(){

        $database = Database::getLastInstance();
        $searchArticleTitle = $database->real_escape($_POST['searchArticleFromTitle']);
        $submitSearchArticle = $database->real_escape($_POST['submitSearchArticle']);


        $sqlSearch = "SELECT * FROM `news` WHERE `title` LIKE '%$searchArticleTitle%'";

        //$sql = "INSERT INTO `news`(`newsID`, `title`, `content`, `createdTS`, `userID`, `published`, `crawlerURI`) VALUES (NULL,'$title','$content', NULL, '0','0', '')";

        $result = $database->query($sqlSearch);

        if(isset($submitSearchArticle))
        {
            $articles = array();
            while($row=mysqli_fetch_assoc($result))
            {

                $date = date_create($row['createdTS']);
                $dateFormat = date_format($date,'d.m.Y');

                if(!empty($row['newID'])) {
                    $articles[$row['newsID']] = $row['newsID'];
                }
                if(!empty($row['title'])) {
                    $articles[$row['newsID']] = $row['title'];
                }
                if(!empty($dateFormat)) {
                    $articles[$row['newsID']] = $dateFormat;
                }
                if(!empty($row['content'])) {
                    $articles[$row['newsID']] = $row['content'];
                }


                echo '<div class="textBox">';
                echo "<br>";
                echo "Titel:";
                echo '<h1 class="article_'.$row['newsID'].'">';
                echo "{$row['title']}";echo"</h1><br>";
                //echo "Autor:";
                //echo "{$row['author']}";echo"<br>";
                echo "erstellt am:";echo" $dateFormat";
                echo "<br>";
                echo "<br>";
                echo "{$row['content']}";
                echo "<br>";

            }
            var_dump($articles);
            die();
        }



        if($database->query($sqlSearch) === true){
            echo "data was sent successfully!";
        }else{
            echo "somehow you got an unexpected error...but we are surely already working on it";
        }

    }
}










