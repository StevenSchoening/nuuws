<nav>
    <ul class="navigation_list">
        <a href="/nuuws/nachrichten"><li>Nachrichten</li></a>

        {if $isAdmin}
            <a href="/nuuws/artikel-einreichen.html"><li>Artikel verwalten</li></a>
        {/if}
        <a href="/nuuws/kontakt"><li>Kontakt</li></a>
        <a href="/nuuws/impressum"><li>Impressum</li></a>
        {if !$isLogedIn}
            <a href="/nuuws/login" class="navigation_login"><li>Einloggen</li></a>
        {/if}
    </ul>
</nav>