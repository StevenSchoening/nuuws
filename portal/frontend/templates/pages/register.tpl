

{include file='portal/frontend/templates/header/header.tpl'}

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

    div#registerWrapper form div input
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

    <div id="registerWrapper">

        <form method="post" id="registerForm">

            <div>
                <label>Benutzername</label>
                <input type="text" name="username" placeholder="Benutzername">
            </div>

            <div>
                <label>Passwort</label>
                <input type="password" name="password">
            </div>

            <div>
                <label>Passwort bestätigen</label>
                <input type="password" name="passwordConf">
            </div>

            <div>
                <label>E-Mail</label>
                <input type="email" name="email" placeholder="E-Mail">
            </div>

            <div>
                <label>Geburtsdatum</label>
                <input type="date" name="birthdate">
            </div>

            <div>
                <input type="submit" name="birthdate" value="Registrieren">
            </div>

        </form>

    </div>

</article>

{include file='portal/frontend/templates/footer/footer.tpl'}