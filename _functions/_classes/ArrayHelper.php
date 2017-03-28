<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 01/17/2017
 * Time: 11:11 PM
 */
class ArrayHelper
{
    /**
     * @param array $array
     */
    public static function orderArrayByStringLength(Array &$array)
    {
        usort($array, function($a, $b)
        {
            return strlen($b) - strlen($a);
        });
    }

    /**
     * @param       $search
     * @param       $replace
     * @param array $array
     */
    public static function str_replace_json($search, $replace, Array &$array)
    {
        return json_decode(str_replace($search, $replace, json_encode($array)));
    }

}