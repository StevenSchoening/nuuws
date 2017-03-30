<?php
/**
 * Created by PhpStorm.
 * User: Marvin
 * Date: 3/29/2017
 * Time: 9:11 AM
 */

require_once '_functions/_init.php';

$user = $nuuws->getActiveUser();

if(!$user || !$user->isAdmin())

    header('Location: ' . DEFAULT_PATH_WEB);

//  ==================================
//  Backend
//  ==================================

$isAdmin   = $nuuws->getActiveUser() != FALSE ? $nuuws->getActiveUser()->isAdmin() : FALSE;
$isLogedIn = $nuuws->getActiveUser() != FALSE;

$smarty->assign('isAdmin', $isAdmin);
$smarty->assign('isLogedIn', $isLogedIn);

$smarty->display('portal/frontend/templates/header/header.tpl');

?>

<style>
    thead tr td
    {
        color   : red;
        padding : 5px 0;
    }

    thead
    {
        margin-bottom: 5px;
    }
</style>

<article>Benutzerverwaltung:<br />

    <table>
        <thead>
            <tr>
                <td>Username</td>
                <td>Vorname</td>
                <td>Nachname</td>
                <td>Registriert am</td>
                <td>email</td>
                <td>Geburtsdatum</td>
            </tr>
        </thead>
        <tbody>

<?php



foreach($nuuws->getUser() as $user)
{

    echo '<tr>';

    echo "<td>{$user['userName']}</td>";
    echo "<td>{$user['fName']}</td>";
    echo "<td>{$user['lName']}</td>";
    echo "<td>{$user['createdTS']}</td>";
    echo "<td>{$user['email']}</td>";
    echo "<td>{$user['birthDat']}</td>";

    echo '</tr>';
}

echo "</tbody></table></article>";

$smarty->display('portal/frontend/templates/footer/footer.tpl');
