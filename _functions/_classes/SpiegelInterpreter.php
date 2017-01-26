<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 1/25/2017
 * Time: 10:14 AM
 */
class SpiegelInterpreter extends Interpreter
{
    public function __construct($uri, $id)
    {
        parent::__construct($uri, $id);
        self::detectTitle();
    }

    private function detectTitle()
    {
        exit("$this->html");
    }

    public function getInsetQuery()
    {
        return "spiegel";
    }
}