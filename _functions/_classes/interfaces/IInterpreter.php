<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 1/25/2017
 * Time: 10:34 AM
 */
interface IInterpreter
{
    public function getInsertQuery();
    public function isArticle();
}