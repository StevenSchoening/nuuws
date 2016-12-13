<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 10/15/2016
 * Time: 7:46 PM
 */
class CaseReverse
{
    private static $uppercaseArray = [
        'A', 'B', 'C', 'D', 'E', 'F',
        'G', 'H', 'I', 'J', 'K', 'L',
        'M', 'N', 'O', 'P', 'Q', 'R',
        'S', 'T', 'U', 'V', 'W', 'X',
        'Y', 'Z',
    ];

    private static $lowercaseArray = [
        'a', 'b', 'c', 'd', 'e', 'f',
        'g', 'h', 'i', 'j', 'k', 'l',
        'm', 'n', 'o', 'p', 'q', 'r',
        's', 't', 'u', 'v', 'w', 'x',
        'y', 'z',
    ];

    /**
     * @param $str string
     *
     * @return string
     */
    private static function reverseCaseStr(string $str)
    {
        $strOut = "";

        for($x = 0; $x < strlen($str); $x++)

            if(in_array($str[$x], self::$uppercaseArray))

                $strOut .= self::$lowercaseArray[array_search($str[$x], self::$uppercaseArray)];

            else if(in_array($str[$x], self::$lowercaseArray))

                $strOut .= self::$uppercaseArray[array_search($str[$x], self::$lowercaseArray)];

            else

                $strOut .= $str[$x];

        return $strOut;
    }

    /**
     * @param $str string
     *
     * @return string
     */
    public static function reverseStr(string $str)
    {
        $i      = strlen($str);
        $newStr = "";

        while($i--)

            $newStr .= $str[$i];

        return $newStr;
    }

    /**
     * @param $array array with string
     *
     * @return array reverseCaseStr
     */
    private static function reverseCaseArray(array $array)
    {
        foreach($array as $key => $value)

            $array[$key] = self::reverseCase($value);

        return $array;
    }

    public static function reverseCase($input)
    {
        switch($type = gettype($input))
        {
            case 'array':
                return static::reverseCaseArray($input);
                break;

            case 'string':
                return static::reverseCaseStr($input);
                break;

            default :
                throw new Exception("Can't handle type '$type'");
                break;
        }
    }

}