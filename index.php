<?php
/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 12/13/2016
 * Time: 10:45 AM
 */

require_once '_functions/_init.php';

$page = isset($_GET['page']) ? $_GET['page'] : FALSE;

switch($page)
{
    case 'login' :

        $smarty->display('portal/frontend/templates/pages/login.tpl');

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
