<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 2/17/2017
 * Time: 1:57 PM
 */
class Nuuws
{
    private $database;

    public function __construct()
    {
        $this->database = Database::getLastInstance();

        if(isset($_POST['logMeIn']))

            $this->logIn($_POST['username'], $_POST['password']);
    }

    private function logIn($username, $password)
    {
    //  escaping user input
        $username = $this->database->real_escape($username);
        $password = md5($password);

        $query = "SELECT * FROM `user` WHERE `userName` LIKE '$username' AND `password` LIKE '$password'";

        $result = $this->database->query($query);

        if($this->database->mysqli_num_rows($result))
        {
        //  todo Session insert

            return TRUE;
        }

        else return FALSE;
    }
}