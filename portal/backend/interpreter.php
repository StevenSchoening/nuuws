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

$query = "SELECT * FROM `crawleruri` WHERE `interpreted` LIKE 0 ORDER BY createdTS DESC LIMIT 10";

$result = $db->query($query);

if($db->mysqli_num_rows($result))

    while($row = $db->fetch_object($result))
    {
        switch($publisher = Interpreter::getPublisher($row->uri))
        {
            case 'spiegel' :

                $interpreter = new SpiegelInterpreter($row->uri, $row->id);

                break;

            default :

                echo "<p>$publisher Unkown</p>";

                break;
        }
    }