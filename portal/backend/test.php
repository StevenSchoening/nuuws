<?php
/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 1/27/2017
 * Time: 12:52 PM
 */

require '../../_functions/_init.php';

$srt = new ScriptRunTime;

$id = $_GET['id'];

$query = "SELECT * FROM `news` WHERE `newsID` LIKE '$id'";

$result = $db->query($query);

if($db->mysqli_num_rows($result))
{
    $row = $db->fetch_object($result);



    echo "$row->title<br />$row->content";
}
