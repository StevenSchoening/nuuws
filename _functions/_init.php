<?php
/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 02/14/2017
 * Time: 10:53 AM
 */
//todo http://jiri.hybek.cz/wa-mediabox/
error_reporting(E_ALL);

session_name('nuuws');
session_start();

//  Paths
if(isset($_COOKIE['developer']) && $_COOKIE['developer'] == 'Steven')

    define('DEFAULT_PATH_LOCAL', 'C:/xampp/htdocs/nuuws/');

else if(isset($_COOKIE['developer']) && $_COOKIE['developer'] == 'StevenHome')

    define('DEFAULT_PATH_LOCAL', 'C:/xampp/htdocs/nuuws/');

else

    define('DEFAULT_PATH_LOCAL', 'C:/xampp/htdocs/nuuws/');


define('DEFAULT_PATH_WEB', 'http://localhost/nuuws/');
define('NAVITPL', DEFAULT_PATH_LOCAL . "portal/frontend/templates/nav/navigation.tpl");

ini_set("max_execution_time", -1);

define("LOGDEFAULTPATH", realpath("logs"));

# Smarty

# http://www.php-lernen.org/php-smarty-variablen-uebergeben.html

require_once 'plugins/smarty-3.1.30/libs/Smarty.class.php';

$smarty = new Smarty;

# DOM Interpreter

require_once 'plugins/htmlparser/simple_html_dom.php';

# Autoload function

spl_autoload_register(function ($class)         # gets called if a class is used but not defined
{
    @include "_classes/$class.php";
    @include "_classes/interfaces/$class.php";
    @include "_classes/traits/$class.php";

    # create log
    $log = new Log("classInclude");
    $log->append("loading: $class");
});

# load database
$db    = new Database;
$db->select_db("nuuws");

$nm    = new NewsManagement;
$nuuws = new Nuuws;

$isAdmin   = $nuuws->getActiveUser() != FALSE ? $nuuws->getActiveUser()->isAdmin() : FALSE;
$isLogedIn = $nuuws->getActiveUser() != FALSE;
$isPremium = $nuuws->getActiveUser() != FALSE ? $nuuws->getActiveUser()->userIsPremium() : FALSE;

$smarty->assign('isAdmin', $isAdmin);
$smarty->assign('isLogedIn', $isLogedIn);
$smarty->assign('isPremium', $isPremium);