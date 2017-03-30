<style>
    div#registerWrapper
    {
        width            : 340px;
        margin           : 2px auto;
        background-color : transparent;
        padding          : 7px;
        height           : inherit;
        min-height       : 240px;
    }

    div#registerWrapper form div input,
    div#registerWrapper form div select
    {
        width : 45%;
        float : right;
    }

    div#registerWrapper form div
    {
        float         : left;
        width         : 100%;
        margin-bottom : 13px;
    }

    div#registerWrapper form div label
    {
        float : left;
    }

    ::-webkit-datetime-edit-fields-wrapper { background: #2e2d30; }
    ::-webkit-datetime-edit-text { color: red; padding: 0 0.3em; }
    ::-webkit-datetime-edit-month-field { color: white; }
    ::-webkit-datetime-edit-day-field { color: white; }
    ::-webkit-datetime-edit-year-field { color: white; }
    ::-webkit-calendar-picker-indicator { background: orange; }

</style>


<article>
    <h2>{$user['userName']}</h2>

    <div id="registerWrapper">

        <form method="post" id="registerForm">

            <div>
                <label>Benutzername</label>
                <input type="text" name="username" placeholder="Benutzername" value="{$user['userName']}">
            </div>

            <div>
                <label>E-Mail</label>
                <input type="email" name="email" placeholder="E-Mail" value="{$user['email']}">
            </div>

            <div>
                <label>Vorname</label>
                <input type="text" name="fname" value="{$user['fName']}">
            </div>

            <div>
                <label>Nachname</label>
                <input type="text" name="nname" value="{$user['lName']}">
            </div>

            <div>
                <label>Geburtsdatum</label>
                <input type="date" name="birthdate" value="{$user['birthDat']}">
            </div>

            <div>
                <label>Admin</label>
                <select name="admin">
                    {*todo if else*}
                    <option value="1">Ja</option>
                    <option value="2">Nein</option>
                </select>
            </div>

            <div>
                <label>Konto aktiviert</label>
                <select name="admin">
                    <option value="1">Ja</option>
                    <option value="2">Nein</option>
                </select>
            </div>

            <div>
                <input type="submit" name="edit" value="Benutzer bearbeiten">
            </div>

            <input type="hidden" name="id" value="{$user['userID']}" />

        </form>

    </div>


</article>

{include file='portal/frontend/templates/footer/footer.tpl'}