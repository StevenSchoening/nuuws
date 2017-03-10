<nav>
    <ul class="navigation_list">
        <a href="/nuuws"><li>Startseite</li></a>
        <a href="/nuuws/nachrichten"><li>Nachrichten</li></a>
        <a href=""><li>Test</li></a>
        <a href=""><li>Test</li></a>
        <a href=""><li>Test</li></a>
        {if $isAdmin}
            <a href="/nuuws/artikel-einreichen.html"><li>Artikel verwalten</li></a>
        {else}
            <a href="/nuuws/login"><li>Einlogen</li></a>
        {/if}
        <a href=""><li>Test</li></a>
    </ul>
</nav>