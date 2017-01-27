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

            if(!$this->isArticle())

                return;
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
        {
            $this->isArticle = FALSE;
            return;
        }

        echo "<p>$this->uri</p>";       // todo entfernen

//      Summary content

        $this->summary = $summary[0]->innertext;

//      Full content

        foreach($articles as $article)

            foreach($article->find('p') as $p)

                $this->content .= $p;

//      Header Image

        if(sizeof($image = $html->find('.image-buttons-panel')) !== 0)
        {
            $this->headerImage = $image[0]->find('a')[0]->innertext;

//          Header Image info

            preg_match_all('#((width|height)="(\d+)")#i', $this->headerImage, $imgInfo);

            foreach($imgInfo[1] as $i => $property)

                $this->headerImageInfo[$property] = $imgInfo[2][$i];

            preg_match('#(title)="([\d\w\s\-:&;]+)"#i', $this->headerImage, $title);

            $this->headerImageInfo['title'] = $title[2];

            preg_match('#(src)="([\d\w\s\-:&;\/\.]+)"#i', $this->headerImage, $src);

            $this->headerImageInfo['orgHtml'] = $this->headerImage;

            $this->headerImage                = $src[2];
        }

//      Category

        if(sizeof($breadcrumb = $html->find('.breadcrumb-history')) !== 0)
        {
            $li = $breadcrumb[0]->find('li');

            for($i = 1; $i < sizeof($li) - 1; $i++)

                $this->tags[] = trim(str_replace('&gt;', '', strip_tags($li[$i]->innertext)));
        }
    }

    public function getInsertQuery()
    {
        $escapedTitle   = Database::getLastInstance()->real_escape($this->title);
        $escapedContent = Database::getLastInstance()->real_escape($this->content);

        return "INSERT INTO `news`(`newsID`, `title`, `content`, `createdTS`, `userID`, `published`, `crawlerURI`) 
                VALUES (
                NULL, '$escapedTitle', '$escapedContent', NULL, '0', '1', '$this->uri');";
    }

    public function isArticle()
    {
        if(preg_match('#\\d+\\.html#i', $this->uri))

            return !strpos($this->uri, "spiegeltv");

        else

            return FALSE;
    }
}