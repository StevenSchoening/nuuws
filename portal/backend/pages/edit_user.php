<?php
/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 3/30/2017
 * Time: 2:09 PM
 */

$user = $nuuws->getUser($_GET['id'])[0];

$smarty->assign('user', $user);

$smarty->display('portal/backend/templates/edit_user.tpl');