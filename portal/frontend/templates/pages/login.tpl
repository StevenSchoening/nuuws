{include file='portal/frontend/templates/header/header.tpl'}

<article>

    <div id="loginWraper">
        <h1>Log In</h1>
        {if $failure}
            <p style="color: #F00">Login Informationen inkorrekt</p>
        {/if}
        <form method="post">
            <input type="text" placeholder="Benutzername / E-Mail" name="username" /><br />
            <input type="password" placeholder="Passwort" name="password" /><br />
            <input type="submit" name="logMeIn" />
        </form>
    </div>

</article>


{include file='portal/frontend/templates/footer/footer.tpl'}