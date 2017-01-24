<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 12/15/2016
 * Time: 12:37 PM
 */
class Crawler
{
    private        $results       = [];

    private static $whiteList     = [],     # Pattern collection about white listed domains/pages
                   $requestedUris = [],     # Uris that were already crawled
                   $debugMode     = TRUE;   # echo progress
    /**
     * Crawler constructor.
     *
     * @param     $uri string start point
     * @param int $recursion
     */
    function __construct($uri, $recursion = 2)
    {
        $this->results[] = $uri;

        $counter         = 0;

        while($recursion--)
        {
            if(self::$debugMode)
            {
                $counter++;

                echo "<p>Loop #$counter</p>";

                flush();ob_flush();flush();ob_flush();
            }

            $this->results = $this->crawl($this->results);
        }
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

            $result = array_merge($result, $this->extractUris($this->getSource($uri)));
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
    public static function addToWhiteList($pattern)
    {
        if(is_array($pattern))
        {
            foreach($pattern as $pat)

                self::addToWhiteList($pat);

            return;
        }

        if(!in_array($pattern, self::$whiteList))

            self::$whiteList[] = $pattern;
    }

    /**
     * @return boolean
     */
    public static function isDebugMode()
    {
        return self::$debugMode;
    }

    /**
     * @param boolean $debugMode
     */
    public static function setDebugMode($debugMode)
    {
        self::$debugMode = $debugMode;
    }

    /**
     * @return array
     */
    public function getResults()
    {
        return $this->results;
    }

    private function getInsertQuery()
    {
        $query = 'INSERT INTO TABLE_NAME (`id`, `uri`, `ts`) VALUES ';

        foreach($this->results as $result)

            if(!in_array($result, self::$requestedUris))

                $query .= "(NULL, '$result', NULL), ";

        return substr($query, 0, -2);
    }

    function __destruct()
    {
        Debugger::dump($this->results);
    }

    private function getSource($uri)
    {
        $sw     = new Stopwatch;
        $source = file_get_contents($uri);

        if(self::$debugMode)
        {
            echo "<p>{$sw->getTime()}: $uri</p>";

            flush(); ob_flush(); flush(); ob_flush();
        }

        return $source;
    }

}