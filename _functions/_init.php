<?php
/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 10/15/2016
 * Time: 10:53 AM
 */

//error_reporting(0);

session_start();

ini_set("max_execution_time", 180);

define("LOGDEFAULTPATH", 'c://xampp/htdocs/logs/');

spl_autoload_register(function ($class)
{
    include $path = "_classes/$class.php";

    $log = new Log("classInclude");

    $log->append("loading: $path");
});

