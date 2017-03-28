<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 1/25/2017
 * Time: 09:08
 */
class Stopwatch
{
    private $startTime, $decimalPlaces;

    /**
     * Stopwatch constructor.
     *
     * @param int $decimalPlaces
     */
    public function __construct($decimalPlaces = 2)
    {
        $this->decimalPlaces = $decimalPlaces;
        $this->startTime     = $this->time();
    }

    /**
     * @param bool $formatted
     *
     * @return string time - starting time
     */
    public function getTime($formatted = TRUE)
    {
        return $formatted ? $this->format($this->time() - $this->startTime) : ($this->time() - $this->startTime);
    }

    /**
     * resets starting time
     */
    public function reset()
    {
        $this->startTime = $this->time();
    }

    /**
     * server time
     *
     * @return mixed time
     */
    private static function time()
    {
        return microtime(TRUE);
    }

    /**
     * @param $time float
     *
     * @return string readable
     */
    private function format($time)
    {
        $time = round($time, $this->decimalPlaces);

        return $time <= 60 ? $time . " Sekunden" : $time / 60 . " Minuten";
    }

    /**
     * Hours:Minutes:Seconds
     *
     * @return string Uhrzeit
     */
    public static function getCurrentTime()
    {
        return date('H:i:s', static::time());
    }

    /**
     * Hours:Minutes:Seconds
     *
     * @return string Uhrzeit
     */
    public static function getCurrentDateTime()
    {
        return date('Y-m-d H:i:s', static::time());
    }


    /**
     * pauses php for $time seconds
     *
     * @param $time double
     */
    public function wait($time)
    {
        $start = $this->time();

        while(($this->time() - $start) < $time) ;

        return;
    }
}