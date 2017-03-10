<?php
/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 3/9/2017
 * Time: 12:19 PM
 */

$categories = $nm->getCategories();
$content    = $nm->getArticles();

$smarty->assign('categories', $categories);
$smarty->assign('content', $content);

$smarty->display('portal/frontend/templates/article/articles.tpl');