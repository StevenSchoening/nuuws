<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 12/15/2016
 * Time: 12:37 PM
 */
class Crawler
{
    private        $content;

    private static $whitelist     = [], # Pattern collection about blacklisted Domains/Pages
                   $requestedURIs = []; # Uris that we're already crawled

    function __construct($uri)
    {
        $this->content         = file_get_contents($uri);

        if(!in_array($uri, self::$requestedURIs))

            self::$requestedURIs[] = $uri;
    }

    public function listLinks()
    {
        $result = $lvl1Result = $this->extractUris($this->content);

        foreach($lvl1Result as $uri)
        {
            if(!in_array($uri, self::$requestedURIs))

                self::$requestedURIs[] = $uri;

            else

                continue;

            $result = array_merge($result, $this->extractUris(file_get_contents($uri)));
        }

        $result = array_unique($result);

        asort($result); # sort array in ascending order, according to the value

        return $result;
    }

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

                foreach(self::$whitelist as $pattern)

                    if(preg_match($pattern, $uri))

                        $uriValid = TRUE;

                if($uriValid)

                    $result[] = $uri;
            }
        }

        return $result;
    }

    public static function addToWhitelist($pattern)
    {
        if(!in_array($pattern, self::$whitelist))

            self::$whitelist[] = $pattern;
    }
}