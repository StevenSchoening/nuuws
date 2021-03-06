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

if(isset($_POST['submit']))
{
    Debugger::dump($_POST);die;
}

//  ==================================
//  Backend
//  ==================================

//$isAdmin   = $nuuws->getActiveUser() != FALSE ? $nuuws->getActiveUser()->isAdmin() : FALSE;
//$isLogedIn = $nuuws->getActiveUser() != FALSE;
//
//$smarty->assign('isAdmin', $isAdmin);
//$smarty->assign('isLogedIn', $isLogedIn);

$smarty->display('portal/frontend/templates/header/header.tpl');

//  ==================================
//  Benutzerverwaltung
//  ==================================

if(isset($_GET['page']) && $_GET['page'] === "edit_user")
{
    include 'portal/backend/pages/edit_user.php';
    die;
}

?>

<style>
    #user-control
    {
        /*display: none;*/
    }

    thead tr td
    {
        padding : 5px 0;
    }

    thead
    {
        margin-bottom: 5px;
    }

    #user-control-left,
    #user-control-right
    {
        width : 50%;
        float : left;
        /*background: red;*/
        margin : 3px 0;
    }

    #user-control-right
    {
        text-align: right;
    }

    #user-control-right h2
    {
        text-align: left;
    }

</style>

<article>Benutzerverwaltung:<br />

    <table id="user-control">
        <thead>
            <tr>
                <td style="padding-right: 5px;">Username</td>
                <td>Vorname</td>
                <td>Nachname</td>
                <td>Registriert am</td>
                <td>email</td>
                <td>Geburtsdatum</td>
                <td>Adminrechte</td>
                <td>Bearbeiten</td>
                <td>Löschen</td>
            </tr>
        </thead>
        <tbody>

<?php

$deleteImg  = '<img src="/nuuws/portal/assets/images/x.png" width="32" height="32">';
$editImg    = '<img src="/nuuws/portal/assets/images/bearbeiten.png" width="32" height="32">';
$ampelRot   = '<img class="ampel" src="/nuuws/portal/assets/images/nicht_zugelassen.png" width="64" height="64">';
$ampelGruen = '<img class="ampel" src="/nuuws/portal/assets/images/zugelassen.png" width="64" height="64">';

foreach($nuuws->getUser() as $user)
{
    echo '<tr>';

    echo "<td>{$user['userName']}</td>";
    echo "<td>{$user['fName']}</td>";
    echo "<td>{$user['lName']}</td>";
    echo "<td>{$user['createdTS']}</td>";
    echo "<td>{$user['email']}</td>";
    echo "<td>{$user['birthDat']}</td>";
    echo "<td>";
    echo $user['isAdmin'] == "0" ? $ampelRot : $ampelGruen;
    echo "</td>";

    echo "<td><a href='/nuuws/backend/user/{$user['userID']}/{$user['userName']}.html'>$editImg</a></td>";
    echo "<td>$deleteImg</td>";

    echo '</tr>';
}

echo "</tbody></table>";


//  ==================================
//  Kategorien
//  ==================================

?>

<br />

<form method="post" action="/nuuws/backend">

    <label for="new-category">Kategorie:&nbsp;</label>

    <input type="text" placeholder="Neue Kategorie" id="new-category" name="catName">

    <input type="submit" name="addCategory">

</form>

<form method="post" action="/nuuws/backend">

<br />

<table>
    <thead>
        <tr>
            <td style="min-width: 225px;">Kategorie</td>
            <td>Verknüpfte Tags</td>
        </tr>
    </thead>
    <tbody>

<?php

foreach($nm->getAllCategories() as $id => $cat)
{
    echo "<tr><td>$cat</td><td>";

    echo "<select multiple name='cat_{$id}[]' style='min-height: 150px;'>";

    $selectedTags = $nm->getSelectedTags($id);

    foreach($nm->getAllTags() as $tagID => $tag)
    {
        $selected = in_array($tagID, $selectedTags) ? " selected" : "";

        echo "<option value='$tagID'$selected>$tag</option>";
    }
    echo "</select></td></tr>";
}

echo '</tbody></table><input type="submit" name="saveCategories" /></form></article>';

$smarty->display('portal/frontend/templates/footer/footer.tpl');
