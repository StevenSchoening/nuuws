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

        if($this->isArticle)
        {
            self::detectTitle();
        }
    }





    private function detectTitle()
    {
        $pattern = '/<title [^>]* > ([^<]*) <\/title>/ix';
        preg_match_all($pattern, $this->html, $matches);

        $pattern = '/^[^:]+:[^\-]+/ix';

        Debugger::dump($matches);die;
    }

    public function getInsetQuery()
    {
        return "spiegel";
    }

    public function isArticle()
    {
        return preg_match('#\\d+\\.html#i', $this->uri);
    }
}