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
    public function getImageQuery();
    public function getTagInsertQuery();
    public function getTagInNewsQuery();
    public function getNewsImageQuery();
    public function isArticle();
    public function resultIsValid();
    public function getRootUri();
    public function getPublisher();
    public function getCategoryQuery();
    public function getCategoryInNewsQuery();
//    public function
}