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
    case 'articleManagement':

        $smarty->display('portal/frontend/templates/article/articleManagement.tpl');

        break;
    case 'article':

        $test = "abc";

        $articleContent = $nm->getArticleContent();

//        Debugger::dump($articleContent);

        $smarty->assign('articleContent', $articleContent);

        $smarty->display('portal/frontend/templates/article/article.tpl');

        break;
    default :

        $smarty->display('portal/frontend/templates/index.tpl');

        break;
}
?>
