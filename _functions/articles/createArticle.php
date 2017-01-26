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

    //todo add user id value
    $title = $database->real_escape($_POST['title']);
    $content = $database->real_escape($_POST['content']);

    $database->query("INSERT INTO `news`(`newsID`, `title`, `content`, `createdTS`, `userID`, `published`, `crawlerURI`) VALUES (NULL,'$title','$content', NULL, NULL,'0', NULL)");
   // ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7])




}

createArticle();










