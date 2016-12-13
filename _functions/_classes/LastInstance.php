<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 11/11/2016
 * Time: 9:23 PM
 */
trait LastInstance
{
    private static $instance;

    /**
     * Must be called in __construct
     *
     * Saves the latest instance
     */
    protected function setInstance()
    {
        self::$instance = $this;
    }

    /**
     * Newest Instance of object
     *
     * @return self
     */
    final public static function getLastInstance()
    {
        return self::$instance;
    }
}