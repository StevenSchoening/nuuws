<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 10/15/2016
 * Time: 11:41 AM
 */
class Database implements iSql
{
    use tLastInstance;

    private $link;

    private $error_reporting, $log;

    private $query_count = 0;

    /**
     * Database constructor.
     *
     * @param string $hostname
     * @param string $username
     * @param string $password
     */
    public function __construct($hostname="localhost", $username="root", $password="")
    {
        $this->log = new Log('database');
        $this->error_reporting = TRUE;

        $this->setInstance();

        $this->link = mysqli_connect($hostname, $username, $password) or $this->dberror();

        if ($this->link != null)

            mysqli_set_charset($this->link, 'utf8');
    }

    /**
     * selects which database we're using
     *
     * @param string $database
     *
     * @return bool
     */
    function select_db($database)
    {
        return @mysqli_select_db($this->link, $database) or $this->dberror();
    }

    /**
     * output a database
     *
     * @param string $string
     */
    private function dberror($string="")
    {
        if($this->error_reporting)
        {
            $message = $org = "MySQL error: ";

            $errno = @mysqli_errno($this->link);

            if($errno != NULL)

                $message .= $errno . ";";

            $error = @mysqli_error($this->link);

            if($error != NULL)

                $message .= $error . ";";

            if($string != '' )

                $message .= " Error: $string;";

            if($message == $org)

                $message = 'Unknown Error!';

            echo nl2br(str_replace(";", "\n", $message));

            $this->log->append($message);

            if(false)
            {
                $loc_string = str_replace(' AND', '<br>AND', $string);
                $loc_string = str_replace(' OR', '<br>OR', $loc_string);
                $loc_string = str_replace('WHERE (', 'WHERE<br>(', $loc_string);
                $loc_string = str_replace(' WHERE', '<br>WHERE', $loc_string);
                $loc_string = str_replace(' ORDER BY', '<br>ORDER BY', $loc_string);
                $loc_string = str_replace(' LIMIT', '<br>LIMIT', $loc_string);
                $loc_string = str_replace(' FROM', '<br>FROM', $loc_string);

                echo '==============================================================<br>'.
                     'SQL Fehler: <b>' . mysqli_errno($this->link) . '</b><br><br>'.
                     '<b>' . mysqli_error($this->link).'</b><br>'.
                     '==============================================================<br>'.
                     'Query:<br><b style="color:#F00">'.$loc_string.'</b><br>'.
                     '==============================================================';
            }

            exit();
        }
    }

    /**
     * query the database
     *
     * @param $string
     *
     * @return bool|mysqli_result
     */
    function query($string)
    {
        $timer = new Stopwatch;

        $result = $this->link->query($string) or $this->dberror();

        $queryTime = $timer->getTime(FALSE);

        if($queryTime > .00075)

            $this->log->append("Query: $string; time: $queryTime");

        $this->query_count++;

        return $result;
    }

    /**
     * @param $query mysqli_result
     *
     * @return array|null
     * @throws Exception Exception
     */
    function fetch_array($query)
    {
        if(gettype($query) == "string")

            throw new CException('fetch_array requires query result not query string');

        return $this->mysqli_fetch_array($query);
    }

    private function mysqli_fetch_array($query)
    {
        $result = NULL;

        $result = mysqli_fetch_array($query);

        if($this->errno())
        {
            $debug = debug_backtrace();

            foreach($debug as $aCallerData)

                if($aCallerData['file'] != __FILE__)
                {
                    $debug = $aCallerData;
                    break;
                }

            $this->dberror($debug);
        }

        return $result;
    }

    /**
     * @return int error number
     */
    private function errno()
    {
        return mysqli_errno($this->link);
    }

    /**
     * Escapes a string
     * @param $string string
     * @return string string escaped
     */
    public function real_escape($string)
    {
        return mysqli_real_escape_string($this->link, $string);
    }

    /**
     * @return mixed mysqli insert id
     */
    public function insert_id()
    {
        return $this->link->insert_id;
    }

    /**
     * @param $result
     *
     * @return null|object
     * @throws CException only query results
     */
    public function fetch_object($result)
    {
        if(gettype($result) == "string")

            throw new CException('fetch_object requires query result not query string');

        return $this->mysqli_fetch_object($result);
    }

    private function mysqli_fetch_object($query)
    {
        $result = NULL;

        $result = mysqli_fetch_object($query);

        if($this->errno())
        {
            $debug = debug_backtrace();

            foreach($debug as $aCallerData)

                if($aCallerData['file'] != __FILE__)
                {
                    $debug = $aCallerData;
                    break;
                }

            $this->dberror($debug);
        }

        return $result;
    }

    /**
     * @param     $string
     * @param int $qtime
     */
    public function explain_query($string, $qtime = 0)
    {
        $msg = "";

        if(preg_match("#^select#i", $string))
        {
            $query = mysqli_query($this->link, "EXPLAIN $string");
            $msg .= "<table bgcolor=\"#666666\" width=\"95%\" cellpadding=\"4\" cellspacing=\"1\" align=\"center\">\n".
                "<tr>\n".
                "<td colspan=\"8\" bgcolor=\"#cccccc\"><strong>#".$this->query_count." - Select Query</strong></td>\n".
                "</tr>\n".
                "<tr>\n".
                "<td colspan=\"8\" bgcolor=\"#fefefe\"><span style=\"font-family: Courier; font-size: 14px;\"></span></td>\n".
                "</tr>\n".
                "<tr>\n".
                "<td colspan=\"8\" bgcolor=\"#fefefe\"><span style=\"font-family: Courier; font-size: 14px;\">".$string."</span></td>\n".
                "</tr>\n".
                "<tr bgcolor=\"#efefef\">\n".
                "<td><strong>table</strong></td>\n".
                "<td><strong>type</strong></td>\n".
                "<td><strong>possible_keys</strong></td>\n".
                "<td><strong>key</strong></td>\n".
                "<td><strong>key_len</strong></td>\n".
                "<td><strong>ref</strong></td>\n".
                "<td><strong>rows</strong></td>\n".
                "<td><strong>Extra</strong></td>\n".
                "</tr>\n";

            while($table = mysqli_fetch_array($query))
            {
                $msg .=
                    "<tr bgcolor=\"#ffffff\">\n".
                    "<td>".$table['table']."</td>\n".
                    "<td>".$table['type']."</td>\n".
                    "<td>".$table['possible_keys']."</td>\n".
                    "<td>".$table['key']."</td>\n".
                    "<td>".$table['key_len']."</td>\n".
                    "<td>".$table['ref']."</td>\n".
                    "<td>".$table['rows']."</td>\n".
                    "<td>".$table['Extra']."</td>\n".
                    "</tr>\n";
            }

            $msg .= "<tr bgcolor=\"#ffffff\"><td colspan='8'>Result:</td></tr>";

            $msg .= "<tr bgcolor=\"#ffffff\"><td colspan='8'>";
            $msg .= "<table style='width: 100%;'>";

            $qresult = $this->query($string);

            $counter = 0;

            while($row = $this->fetch_object($qresult))
            {
                if($counter == 0)
                {
                    $msg .= "<tr>";

                    foreach($row as $field => $value)

                        $msg .= "<td>$field</td>";

                    $msg .= "</tr>";

                }

                if($counter <= 15)
                {
                    $msg .= "<tr>";

                    foreach($row as $field => $value)

                        $msg .= "<td>$value</td>";

                    $msg .= "</tr>";
                }

                else if ($counter == 16)
                {
                    $msg .= "<tr><td>... weitere Ergebnisse ausgeblendet</td></tr>";
                }

                $counter++;
            }

            $msg .= "</table></tr>";

            $msg .=
                "<tr>\n".
                "<td colspan=\"8\" bgcolor=\"#ffffff\">Query Time: ".$qtime."</td>\n".
                "</tr>\n".
                "</table>\n".
                "<br>\n";
        }
        else
        {
            $msg .= "<table bgcolor=\"#666666\" width=\"95%\" cellpadding=\"4\" cellspacing=\"1\" align=\"center\">\n".
                "<tr>\n".
                "<td bgcolor=\"#cccccc\"><strong>#".$this->query_count." - Write Query</strong></td>\n".
                "</tr>\n".
                "<tr bgcolor=\"#fefefe\">\n".
                "<td><span style=\"font-family: Courier; font-size: 14px;\"></span></td>\n".
                "</tr>\n".
                "<tr bgcolor=\"#fefefe\">\n".
                "<td><span style=\"font-family: Courier; font-size: 14px;\">".$string."</span></td>\n".
                "</tr>\n".
                "<tr>\n".
                "<td bgcolor=\"#ffffff\">Query Time: ".$qtime."</td>\n".
                "</tr>\n".
                "</table>\n".
                "</table>\n".
                "<br>\n";
        }

        echo $msg;
    }

    /**
     * @param $result
     *
     * @return bool|int result count
     */
    public function mysqli_num_rows($result)
    {
        if (is_array($result))
        {
            return count($result[0]);
        }
        else if($result)
        {

            return mysqli_num_rows($result);
        }
        else
        {
            $debug = debug_backtrace();
            $this->errno($debug);
            return false;
        }
    }

}

