<?php
/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 1/25/2017
 * Time: 9:42 AM
 */

require '../../_functions/_init.php';

error_reporting(E_ALL);

$srt = new ScriptRunTime;

ini_set('max_execution_time', -1);

#=================== finding uninterpreted URI's ====================

$query = "SELECT * FROM `crawleruri` WHERE `interpreted` LIKE 0 ORDER BY createdTS DESC LIMIT 10";

$result = $db->query($query);

if($db->mysqli_num_rows($result))

    while($row = $db->fetch_object($result))
    {
        switch($publisher = Interpreter::getHost($row->uri))
        {
            case 'Spiegel' :

                $interpreter = new SpiegelInterpreter($row->uri, $row->uriID);

                break;

            case 'Weser-kurier' :

                $interpreter = new WeserKurierInterpreter($row->uri, $row->uriID);

                break;

            default :

                $query = "UPDATE `crawleruri` SET `interpreted` = '1' WHERE `uriID` LIKE '{$row->uriID}'";

                Database::getLastInstance()->query($query);

                break;
        }

        flush();ob_flush();flush();ob_flush();
    }

else echo "Keine Neuen Urls!";

//Nuuws::reloadPageIn(3000);