<?php
/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 12/13/2016
 * Time: 10:45 AM
 */

require_once '_functions/_init.php';

$page    = isset($_GET['page']) ? $_GET['page'] : FALSE;

$isAdmin = $nuuws->getActiveUser() != FALSE ? $nuuws->getActiveUser()->isAdmin() : FALSE;

$isLogedIn = $nuuws->getActiveUser() != FALSE;

$smarty->assign('isAdmin', $isAdmin);
$smarty->assign('isLogedIn', $isLogedIn);

switch($page)
{
    case 'login' :

        $failure = isset($_GET['failure']) && $_GET['failure'] === "1";

        $smarty->assign('failure', $failure);

        $smarty->display('portal/frontend/templates/pages/login.tpl');

        break;

    case 'register' :

        $smarty->display('portal/frontend/templates/pages/register.tpl');

        break;

    case 'articleManagement' :

        $smarty->display('portal/frontend/templates/article/articleManagement.tpl');

        break;

    case 'article' :

        $articleContent = $nm->getArticleContent();

        $smarty->assign('articleContent', $articleContent);

        $smarty->display('portal/frontend/templates/article/article.tpl');

        break;

    case 'articles' :

        include 'portal/frontend/pages/news.php';

        break;

    default :

        $smarty->display('portal/frontend/templates/index.tpl');

        break;
}
?>
