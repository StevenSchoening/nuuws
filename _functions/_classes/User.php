<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 3/9/2017
 * Time: 10:42 AM
 */
class User
{
    private $userName, $email, $vorName, $nachName, $birthdate, $isAdmin;

    public function User($dbRow)
    {
        $this->userName  = $dbRow->userName;
        $this->vorName   = $dbRow->fName;
        $this->nachName  = $dbRow->lName;
        $this->birthdate = $dbRow->birthDat;
        $this->isAdmin   = $dbRow->isAdmin == 1;
        $this->email     = $dbRow->email;
    }

    /**
     * @return mixed
     */
    public function getUserName()
    {
        return $this->userName;
    }

    /**
     * @return mixed
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @return mixed
     */
    public function getVorName()
    {
        return $this->vorName;
    }

    /**
     * @return mixed
     */
    public function getNachName()
    {
        return $this->nachName;
    }

    /**
     * @return boolean
     */
    public function isIsAdmin()
    {
        return $this->isAdmin;
    }

    /**
     * @return mixed
     */
    public function getBirthdate()
    {
        return $this->birthdate;
    }
}