<style>
    img.premium
    {
        position : absolute;
        bottom   : 11px;
    }
</style>

       <footer>
           <div class="footer_content">
                <a href="">Startseite</a> - <a href="">Nachrichten</a> - <a href="">Impressum</a> - <a href="#" id="kontakt">Kontakt</a>
                {if !$isPremium}
                    <span id="formatPremium">&nbsp;-&nbsp;</span><a href="" class="premiumLink">Jetzt Premium werden!<img class="premium" src="/nuuws/portal/assets/images/nuuws_premium_Figur.png" title="Jetzt Premium-Mitgliedschaft erwerben!" width="40" height="50"></a>
                {/if}
           </div>
        </footer>
    </body>
</html>