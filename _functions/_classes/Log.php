<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 10/15/2016
 * Time: 11:45 AM
 */
class Log
{
    public $path, $data = [];

    private static $maxLogSizeInBits = 1024 * 1024;

    /**
     * Log constructor.
     *
     * @param string $name logfile will be named $name.log
     * @param bool   $path path to logfile parent folder
     *
     * @throws Exception
     */
    function __construct(string $name, $path = FALSE)
    {
        if(!$path && !defined('LOGDEFAULTPATH'))

            throw new CException('No path is defined. Define LOGDEFAULTPATH or provide class with a path');

        else if (!$path)

            $path = LOGDEFAULTPATH;

        if(!(($path_end = $path[strlen($path) - 1]) == "/" || $path_end == "\\"))
        {
            if(strpos($path, "/"))

                $path .= "/";

            else if(strpos($path, "\\"))

                $path .= "\\";
        }

        $this->path = $path . "$name.log";
    }

    public function reset()
    {
        fputs($file = fopen($this->path, 'w'), '');
        fclose($file);
    }

    /**
     * @param int $maxLogSizeInBits
     */
    public static function setMaxLogSizeInBits(int $maxLogSizeInBits)
    {
        self::$maxLogSizeInBits = $maxLogSizeInBits;
    }

    /**
     * Appends new line with timestamp to log file
     *
     * @param $nl string new line
     */
    function append($nl)
    {
        $this->data[] = Stopwatch::getCurrentTime() . ": $nl";
    }

    /**
     *  Writing content to text file after object gets destroyed
     */
    function __destruct()
    {
        $this->checkLogFile();

        for($i = 0; $i < sizeof($this->data); $i++)

            file_put_contents($this->path,$val = file_get_contents($this->path) . "{$this->data[$i]}\n");
    }

    /**
     * Checks if
     * log file is bigger than set and renames it
     * log fire does exist
     *          if not the file will be created
     */
    private function checkLogFile()
    {
        if(self::$maxLogSizeInBits > 0 && @filesize($this->path) >= self::$maxLogSizeInBits)
        {
            $newName = str_replace(".log", "_" . date("Y-m-d__h") . ".log", $this->path);
            rename($this->path, $newName);
        }

        if(!file_exists($this->path))
        {
            $logFile = fopen($this->path, 'wb');
            fclose($logFile);
        }
    }
}