<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 12/15/2016
 * Time: 12:37 PM
 */
class Crawler
{
    public         $results       = [];

    private static $whiteList     = [], # Pattern collection about white listed domains/pages
                   $requestedUris = []; # Uris that were already crawled

    /**
     * Crawler constructor.
     *
     * @param     $uri string start point
     * @param int $recursion
     */
    function __construct($uri, $recursion = 2)
    {
        $this->results[] = $uri;

        while($recursion--)

            $this->results = $this->crawl($this->results);
    }

    /**
     * @param $uris string[] uris
     *
     * @return string[] $uris & collected uris
     */
    private function crawl($uris)
    {
        $result = $uris;

        foreach($uris as $uri)
        {
            if(!in_array($uri, self::$requestedUris))

                self::$requestedUris[] = $uri;

            else

                continue;

            $result = array_merge($result, $this->extractUris(file_get_contents($uri)));
        }

        $result = array_unique($result);

        asort($result); # sort array in ascending order, according to the value

        return $result;
    }

    /**
     * @param $content string source code
     *
     * @return array of uris
     */
    private function extractUris($content)
    {
        $aTagPat = '/\< a \s [^\>]+ \>/xi'; # alle <a....> tags
        $hrefPat = '/href \s? = \s? "
                    (https?:\/\/[\w\.\/?!=\-_]+) "/xi';

        preg_match_all($aTagPat, $content, $hrefs);

        $result  = [];

        foreach($hrefs[0] as $href)
        {
            preg_match_all($hrefPat, $href, $matches);

            if(isset($matches[1][0]))
            {
                $uriValid = FALSE;
                $uri      = $matches[1][0];

                foreach(self::$whiteList as $pattern)

                    if(preg_match($pattern, $uri))

                        $uriValid = TRUE;

                if($uriValid)

                    $result[] = $uri;
            }
        }

        return $result;
    }

    /**
     * if link results true to pattern
     * the link will be saved
     *
     * @param $pattern string regex pattern
     */
    public static function addToWhitelist($pattern)
    {
        if(!in_array($pattern, self::$whiteList))

            self::$whiteList[] = $pattern;
    }

    /**
     * @return array
     */
    public function getResults()
    {
        return $this->results;
    }
}