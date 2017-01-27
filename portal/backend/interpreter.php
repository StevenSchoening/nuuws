<?php
/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 1/25/2017
 * Time: 9:42 AM
 */

require '../../_functions/_init.php';

$srt = new ScriptRunTime;

ini_set('max_execution_time', -1);

#=================== finding uninterpreted URI's ====================

$query = "SELECT * FROM `crawleruri` WHERE `interpreted` LIKE 0 ORDER BY createdTS DESC LIMIT 25";

$result = $db->query($query);

$i = 0;

if($db->mysqli_num_rows($result))

    while($row = $db->fetch_object($result))
    {
        switch($publisher = Interpreter::getPublisher($row->uri))
        {
            case 'spiegel' :

                $interpreter = new SpiegelInterpreter($row->uri, $row->uriID);

                break;

            default :

                $query = "UPDATE `crawleruri` SET `interpreted` = '1' WHERE `uriID` LIKE '{$row->uriID}'";

                Database::getLastInstance()->query($query);

                break;
        }

        echo "<p>".$i++."</p>";

        flush();ob_flush();flush();ob_flush();
    }