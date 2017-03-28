<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 12/22/2016
 * Time: 12:56 PM
 */
class Debugger
{
    /**
     * @param $input mixed input to dump
     */
    static function dump($input)
    {
        $collapse = FALSE;

        echo "<br />";

        $recursive = function($data, $level = 0) use (&$recursive, $collapse)
        {
            global $argv;
            $isTerminal = isset($argv);
            if(!$isTerminal && $level == 0 && !defined("DUMP_DEBUG_SCRIPT"))
            {
                define("DUMP_DEBUG_SCRIPT", TRUE);
                echo '<script language="Javascript">function toggleDisplay(id) {';
                echo 'var state = document.getElementById("container"+id).style.display;';
                echo 'document.getElementById("container"+id).style.display = state == "inline" ? "none" : "inline";';
                echo 'document.getElementById("plus"+id).style.display = state == "inline" ? "inline" : "none";';
                echo '}</script>' . "\n";
            }
            $type = !is_string($data) && is_callable($data) ? "Callable" : ucfirst(gettype($data));
            $type_data = NULL;
            $type_color = NULL;
            $type_length = NULL;
            switch($type)
            {
                case "String":
                    $type_color = "green";
                    $type_length = strlen($data);
                    $type_data = "\"" . htmlentities($data) . "\"";
                    break;
                case "Double":
                case "Float":
                    $type = "Float";
                    $type_color = "#0099c5";
                    $type_length = strlen($data);
                    $type_data = htmlentities($data);
                    break;
                case "Integer":
                    $type_color = "red";
                    $type_length = strlen($data);
                    $type_data = htmlentities($data);
                    break;
                case "Boolean":
                    $type_color = "#92008d";
                    $type_length = strlen($data);
                    $type_data = $data ? "TRUE" : "FALSE";
                    break;
                case "NULL":
                    $type_length = 0;
                    break;
                case "Array":
                    $type_length = count($data);
            }
            if(in_array($type, ["Object", "Array"]))
            {
                $notEmpty = FALSE;
                foreach($data as $key => $value)
                {
                    if(!$notEmpty)
                    {
                        $notEmpty = TRUE;

                        if($isTerminal)
                        {
                            echo $type . ($type_length !== NULL ? "(" . $type_length . ")" : "") . "\n";
                        }

                        else
                        {
                            $id = substr(md5(rand() . ":" . $key . ":" . $level), 0, 8);
                            echo "<a href=\"javascript:toggleDisplay('" . $id . "');\" style=\"text-decoration:none\" class='dump_debug'>";
                            echo "<span style='color:#666666'>" . $type . ($type_length !== NULL ? "(" . $type_length . ")" : "") . "</span>";
                            echo "</a>";
                            echo "<span id=\"plus" . $id . "\" style=\"display: " . ($collapse ? "inline" : "none") . ";\">&nbsp;&#10549;</span>";
                            echo "<div id=\"container" . $id . "\" style=\"display: " . ($collapse ? "" : "inline") . ";\">";
                            echo "<br />";
                            // Test
                            if($collapse) echo "<script>toggleDisplay('$id');</script>";
                        }

                        for($i = 0; $i <= $level; $i++)
                        {
                            echo $isTerminal ? "|    " : "<span style='color:black'>|</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                        }
                        echo $isTerminal ? "\n" : "<br />";
                    }
                    for($i = 0; $i <= $level; $i++)
                    {
                        echo $isTerminal ? "|    " : "<span style='color:black'>|</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                    }
                    echo $isTerminal ? "[" . $key . "] => " : "<span style='color:black'>[" . $key . "]&nbsp;=>&nbsp;</span>";
                    call_user_func($recursive, $value, $level + 1);
                }
                if($notEmpty)
                {
                    for($i = 0; $i <= $level; $i++)
                    {
                        echo $isTerminal ? "|    " : "<span style='color:black'>|</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                    }
                    if(!$isTerminal)
                    {
                        echo "</div>";
                    }
                } else
                {
                    echo $isTerminal ?
                        $type . ($type_length !== NULL ? "(" . $type_length . ")" : "") . "  " :
                        "<span style='color:#666666'>" . $type . ($type_length !== NULL ? "(" . $type_length . ")" : "") . "</span>&nbsp;&nbsp;";
                }
            } else
            {
                echo $isTerminal ?
                    $type . ($type_length !== NULL ? "(" . $type_length . ")" : "") . "  " :
                    "<span style='color:#666666'>" . $type . ($type_length !== NULL ? "(" . $type_length . ")" : "") . "</span>&nbsp;&nbsp;";
                if($type_data != NULL)
                {
                    echo $isTerminal ? $type_data : "<span style='color:" . $type_color . "'>" . $type_data . "</span>";
                }
            }
            echo $isTerminal ? "\n" : "<br />";
        };
        call_user_func($recursive, $input);
    }

    static function backtrace()
    {
        self::dump(debug_backtrace());
    }

    static function classes()
    {
        self::dump(get_declared_classes());
    }

    static function interfaces()
    {
        self::dump(get_declared_interfaces());
    }

    static function includes()
    {
        self::dump(get_included_files());
    }

    static function functions($type = "user")
    {
        $index = $type == "user" ? "user" : "internal";

        self::dump(get_defined_functions()[$index]);
    }

    static function constants($type = "user")
    {
        $constants = get_defined_constants($type == "all" ? FALSE : TRUE);

        if($type == "all")

            self::dump($constants);

        else if(isset($constants[$type]))

            self::dump($constants[$type]);

        else

            throw new CException("Category '$type' does not exist");
    }

    static function extensions()
    {
        self::dump(get_loaded_extensions());
    }

    static function headers()
    {
        self::dump(headers_list());
    }

    static function phpini()
    {
        self::dump(ini_get_all());
    }
}