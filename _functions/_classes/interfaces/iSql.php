<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 02/17/2017
 * Time: 4:19 PM
 */
interface iSql
{
    public function select_db($database);

    public function query($string);

    public function fetch_array($query);

    public function real_escape($string);

    public function insert_id();

    public function fetch_object($result);

    public function explain_query($string, $qtime = 0);

    public function mysqli_num_rows($result);
}