<?php
/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 2/17/2017
 * Time: 12:20 PM
 */

setcookie("developer", 'Steven', time()+(3600*24*365));

header("Location: /nuuws/portal/developer/setcookies.php");