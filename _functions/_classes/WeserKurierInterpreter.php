<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 4/2/2017
 * Time: 11:46 AM
 */
class WeserKurierInterpreter extends Interpreter
{
    public function __construct($uri, $uriId)
    {
        parent::__construct($uri, $uriId);

        if($this->isArticle)
        {
            self::detectTitle();
            self::detectContent();
        }
    }

    private function detectContent()
    {
        $html = str_get_html($this->html);

        if(sizeof($summary = $html->find('.article_teaser'))  === 0
        || sizeof($articles = $html->find('#onlineText'))  === 0 )
        {
            $this->isArticle = FALSE;
            return;
        }

//      Summary content

        $this->summary = $summary[0]->innertext;

//      Full content

        foreach($articles as $article)

            foreach($article->find('p') as $p)

                $this->content .= $p;

        self::detectImages($html);

//      tags  servicebox_text

        $servicebox = $html->find('.servicebox_text')[0]->innertext;

        $this->tags = explode(' ', $servicebox);
    }

    private function detectTitle()
    {
        $pattern = '/<title [^>]* > ([^<]*) <\/title>/ix';
        preg_match_all($pattern, $this->html, $matches);

        $this->title = explode(' - ', $matches[1][0])[0];
    }

    private function detectImages($html)
    {
//      Header Image
        if(sizeof($image = $html->find('.article_img_small')) !== 0)
        {
            $imageProperties       = @$image[0]->find('img')[0]->parent->children[0]->attr;

            $this->headerImage     = "{$this->getRootUri()}{$imageProperties['src']}";

            $this->headerImageInfo = [
                'title'   => $imageProperties['title'],
                'width'   => $imageProperties['width'],
                'height'  => $imageProperties['height'],
                'orgHtml' => "",
            ];

            if($this->headerImage !== NULL)

                return;
        }
    }

    public function isArticle()
    {
        return preg_match('#\\d+\\.html#i', $this->uri);
    }

    public function resultIsValid()
    {
        return substr_count($this->content, '<input') == 0 && substr_count($this->content, '<script') == 0;
    }

    public function getRootUri()
    {
        return "http://weser-kurier.de";
    }

    public function getPublisher()
    {
        return "Weser Kurier";
    }
}