<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 2/17/2017
 * Time: 1:57 PM
 */
class Nuuws
{
    private $database, $activeUser = NULL;

    public function __construct()
    {
        $this->database = Database::getLastInstance();

        if(isset($_POST['logMeIn']))

            $this->logIn($_POST['username'], $_POST['password']);

        if(isset($_POST['register']))

            $this->register();

        $this->setActiveUser();
    }

    private function register()
    {
        $username  = Database::getLastInstance()->real_escape($_POST['username']);
        $password  = md5($_POST['password']);
        $email     = Database::getLastInstance()->real_escape($_POST['email']);
        $birthdate = Database::getLastInstance()->real_escape($_POST['birthdate']);
        $fName     = Database::getLastInstance()->real_escape($_POST['fname']);
        $nName     = Database::getLastInstance()->real_escape($_POST['nname']);

        $query = "INSERT INTO `user`(`userID`, `userName`, `password`, `fName`, `lName`, `birthDat`, `createdTS`, `email`, `isActive`, `isAdmin`) 
                  VALUES (NULL, '$username', '$password', '$fName', '$nName', '$birthdate', NULL, '$email', '1', '0')";

        Database::getLastInstance()->query($query);

        header("Location: " . DEFAULT_PATH_WEB . 'registered');
    }

    private function setActiveUser()
    {
        if(!isset($_SESSION['ID']) && !isset($_SESSION['userID']))

            return;

        $query  = "SELECT * FROM `user` WHERE `userID` LIKE '{$_SESSION['userID']}';";
        $result = $this->database->query($query);

        if($this->database->mysqli_num_rows($result) && $row = $this->database->fetch_object($result))

            $this->activeUser = new User($row);
    }

    private function logIn($username, $password)
    {
    //  escaping user input
        $username = $this->database->real_escape($username);
        $password = md5($password);

        $query = "SELECT * FROM `user` WHERE (`userName` LIKE '$username' OR `email` LIKE '$username') 
                  AND `password` LIKE '$password'";

        $result = $this->database->query($query);

        if($this->database->mysqli_num_rows($result) && $row = $this->database->fetch_object($result))
        {
            $userID = $row->userID;

            $query = "INSERT INTO `session`(`userID`) VALUES ('$userID')";

            $this->database->query($query);

            $_SESSION['ID']     = $this->database->insert_id();

            $_SESSION['userID'] = $userID;

            header("Location: " . DEFAULT_PATH_WEB);
        }

        else

            header("Location: " . DEFAULT_PATH_WEB . 'login/failed');
    }

    public function getUser()
    {
        $query  = "SELECT `userID`, `userName`, `fName`, `lName`, `birthDat`, `createdTS`, `email`, `isActive`, `isAdmin` 
                   FROM `user` ORDER BY `userID`";

        $result = $this->database->query($query);

        $user   = [];

        if($this->database->mysqli_num_rows($result))

            while($row = $this->database->fetch_object($result))

                $user[] =
                    [
                        'userID'    => $row->userID,
                        'userName'  => $row->userName,
                        'fName'     => $row->fName,
                        'lName'     => $row->lName,
                        'birthDat'  => $row->birthDat,
                        'createdTS' => $row->createdTS,
                        'email'     => $row->email,
                        'isActive'  => $row->isActive,
                        'isAdmin'   => $row->isAdmin,
                    ];

        return $user;
    }

    /**
     * @return User
     */
    public function getActiveUser()
    {
        return $this->activeUser;
    }

    public static function reloadPageIn($ms)
    {
        echo "<script>";

        echo "setTimeout(function(){ location.reload(); }, $ms);";

        echo "</script>";
    }
}