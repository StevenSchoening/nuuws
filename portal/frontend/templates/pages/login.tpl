{include file='portal/frontend/templates/header/header.tpl'}

<style>
    div#loginWraper
    {
        display: block;

        margin: 70px auto 0px auto;

        width: 600px;

        height: 200px;

        padding: 20px;

        background-color: rgba(0, 0, 0, .022);

        border: 1px solid rgba(0, 0, 0, .33);

        border-top: 0px;

        -webkit-box-shadow: 0px 10px 43px -3px rgba(0, 0, 0, 0.75);

        -moz-box-shadow: 0px 10px 43px -3px rgba(0, 0, 0, 0.75);

        box-shadow: 0px 10px 43px -3px rgba(0, 0, 0, 0.75);
    }

    div#loginWraper h1
    {
        margin: 0;
    }

    div#loginWraper form input
    {
        margin-top: 15px;
    }
</style>



<div id="loginWraper">
    <h1>Log In</h1>
    <form method="post">
        <input type="text" placeholder="Benutzername / E-Mail" name="username" /><br />
        <input type="password" placeholder="Passwort" name="password" /><br />
        <input type="submit" name="logMeIn" />
    </form>
</div>



{include file='portal/frontend/templates/footer/footer.tpl'}