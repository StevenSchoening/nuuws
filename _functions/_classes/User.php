<?php

/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 3/9/2017
 * Time: 10:42 AM
 */
class User
{
    private $userName, $email, $vorName, $nachName, $birthdate, $isAdmin, $premiumDate;

    public function User($dbRow)
    {
        $this->userName    = $dbRow->userName;
        $this->vorName     = $dbRow->fName;
        $this->nachName    = $dbRow->lName;
        $this->birthdate   = $dbRow->birthDat;
        $this->isAdmin     = $dbRow->isAdmin == 1;
        $this->email       = $dbRow->email;
        $this->premiumDate = $this->convertMysqlDateTimeToUnixTimeStamp($dbRow->premiumvalid);
    }

    public function getPremiumDateStr()
    {
        $date = new DateTime();
        $date->setTimestamp($this->premiumDate);

        return $date->format('Y-m-d H:i:s');
    }

    public function userIsPremium()
    {
        $today = new DateTime;

        return $today->getTimestamp() < $this->premiumDate;
    }

    private function convertMysqlDateTimeToUnixTimeStamp($date)
    {
        $yr = strval(substr($date, 0, 4));
        $mo = strval(substr($date, 5, 2));
        $da = strval(substr($date, 8, 2));
        $hr = strval(substr($date, 11, 2));
        $mi = strval(substr($date, 14, 2));
        $se = strval(substr($date, 17, 2));

        return mktime($hr,$mi,$se,$mo,$da,$yr);
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
    public function isAdmin()
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