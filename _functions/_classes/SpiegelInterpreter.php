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
            self::detectContent();
        }
    }

    private function detectTitle()
    {
        $pattern = '/<title [^>]* > ([^<]*) <\/title>/ix';
        preg_match_all($pattern, $this->html, $matches);

        $titleTag = $matches[1][0];

        $titleArray = explode("SPIEGEL", $titleTag);

        if(sizeof($titleArray) == 4)

            $this->title = self::trimTitle($titleArray[1]);

        else

            $this->title = self::trimTitle($titleArray[0]);
    }

    private function detectContent()
    {
        $html = str_get_html($this->html);

        if(sizeof($articles = $html->find('.article-section'))  === 0
        || sizeof($summary  = $html->find('.article-intro'))    === 0)

            return $this->isArticle = false;

        echo "<p>$this->uri</p>";

//      Summary content

        $this->summary = $summary[0]->innertext;

//      Full content

        foreach($articles as $article)

            foreach($article->find('p') as $p)

                $this->content .= $p;

        echo "$this->summary<br />$this->content";

        die;

    }

    public function getInsertQuery()
    {
        return "spiegel";
    }

    public function isArticle()
    {
        if(preg_match('#\\d+\\.html#i', $this->uri))

            return !strpos($this->uri, "spiegeltv");

        else

            return FALSE;
    }
}