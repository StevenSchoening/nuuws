<?php
/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 10/15/2016
 * Time: 10:53 AM
 */

error_reporting(0);

session_start();

ini_set("max_execution_time", 180);

define("LOGDEFAULTPATH", 'c://xampp/htdocs/logs/');

# Smarty

require_once 'plugins/smarty-3.1.30/libs/Smarty.class.php';

$smarty = new Smarty;

# Autoload function

spl_autoload_register(function ($class)         # gets called if a class is used but not defined
{
    @include "_classes/$class.php";
    @include "_classes/interfaces/$class.php";
    @include "_classes/traits/$class.php";

    $log = new Log("classInclude");

    $log->append("loading: $class");
});

# Database

$db = new Database;
$db->select_db("nuuws");