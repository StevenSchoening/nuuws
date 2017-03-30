<?php
/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 3/30/2017
 * Time: 2:09 PM
 */

if(isset($_POST['edit']))
{
    echo "<article>";
    Debugger::dump($_POST);die;
}

$user = $nuuws->getUser($_GET['id'])[0];

$smarty->assign('user', $user);

$smarty->display('portal/backend/templates/edit_user.tpl');