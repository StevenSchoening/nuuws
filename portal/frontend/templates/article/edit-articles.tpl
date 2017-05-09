{include file='portal/frontend/templates/header/header.tpl'}

<section id="headerImage">
    <img class="articleManagementHeader" src="portal/assets/images/headerImages/artikelverwaltung.png">
</section>

<article>
    <div id="articlesWrapper">

        <h1><u>Ergebnisse:</u></h1>

        {foreach from=$content key=k item=v}

            <div class="nuuwsPrev">
                <div class="changeArticleOptions">
                    <form method="post" action="nachricht-bearbeiten" name="changeArticleOptions">
                        <input type="submit" name="changeArticle" value="Beitrag bearbeiten">
                    </form>
                    <form method="post" action="nachricht-entfernen" name="changeArticleOptions">
                        <input type="submit" name="changeArticle" value="Beitrag entfernen">
                    </form>
                </div>
                <div class="nuuwsImg">
                    <a href="/nuuws/nachrichten/{$k}/{$v[1]}.html">
                        <img src="{$v[2]}" title="{$v[3]}" width=175 height=115>
                    </a>
                </div>

                <div class="nuuwsContent">
                    <a href="/nuuws/nachrichten/{$k}/{$v[1]}.html" target="_blank" title="{$v[0]}">
                        {$v[0]|truncate:60}
                    </a>
                    <br />
                    <p class="ts">{$v[5]}</p>
                    <p>{$v[4]|strip_tags|truncate:140}</p>
                </div>

            </div>
            <br />

        {/foreach}
    </div>
</article>
{include file='portal/frontend/templates/footer/footer.tpl'}