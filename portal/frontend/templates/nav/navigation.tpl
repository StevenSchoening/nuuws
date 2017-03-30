<nav>
    <ul class="navigation_list">
        <a href="/nuuws"><li>Startseite</li></a>
        <a href="/nuuws/nachrichten"><li>Nachrichten</li></a>
        {if $isAdmin}
            <a href="/nuuws/artikel-einreichen.html"><li>Artikel verwalten</li></a>
        {/if}
        {if !$isLogedIn}
            <a href="/nuuws/login"><li>Einloggen</li></a>
        {/if}
    </ul>
</nav>