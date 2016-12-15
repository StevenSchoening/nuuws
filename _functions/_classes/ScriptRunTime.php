<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 12/15/2016
 * Time: 2:28 PM
 */
class ScriptRunTime extends Stopwatch
{
    function __destruct()
    {
        echo "<p>Script benötigte {$this->getTime()}</p>";
    }
}