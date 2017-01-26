<?php
/**
 * Created by PhpStorm.
 * User: Fa15schoening
 * Date: 25.01.2017
 * Time: 09:11
 */
require_once "../_init.php";

function createArticle(){

    $database = Database::getLastInstance();
   // $database = new Database;
   // $database->select_db("nuuws");

    //todo add user id value
    $title = $database->real_escape($_POST['title']);
    $content = $database->real_escape($_POST['content']);
    $sql = "INSERT INTO `nuuws.news`(`newsID`, `title`, `content`, `createdTS`, `userID`, `published`, `crawlerURI`) VALUES (NULL,'$title','$content', NULL, '0','0', '')";

    $database->query($sql);

    if($database->query($sql) === true){
        echo "data was sent successfully!";
    }else{
        echo "somehow you got an unexpected error...but we are surely already working on it";
    }

}

createArticle();










