<nav>


    <ul class="navigation_list">


        <a href="/nuuws/nachrichten"><li>Nachrichten</li></a>
        {if $isLogedIn}
            <a href="/nuuws/artikel-einreichen.html"><li>Artikel verwalten</li></a>
        {/if}
        <a href="/nuuws/kontakt"><li>Kontakt</li></a>
        <a href="/nuuws/impressum"><li>Impressum</li></a>
        {if !$isLogedIn}
            <a href="/nuuws/login" class="navigation_login"><li>Einloggen</li></a>
        {/if}
    </ul>

    <div class="dropdown">
        <input type="checkbox" id="checkbox_toggle">
        <label for="checkbox_toggle">Click to Expand</label>
        <ul>
            <li><a href="/nuuws/nachrichten">Nachrichten</a></li>
            {if !$isLogedIn}<li><a href="/nuuws/artikel-einreichen.html">Artikel verwalten</a></li>{/if}
            <li><a href="/nuuws/kontakt">Kontakt</a></li>
            <li><a href="/nuuws/impressum">Impressum</a></li>
            {if !$isLogedIn}
            <li><a href="/nuuws/login">Einloggen</a></li>
            {/if}
        </ul>
    </div>




</nav>