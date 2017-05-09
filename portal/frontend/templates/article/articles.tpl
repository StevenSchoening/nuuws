{include file='portal/frontend/templates/header/header.tpl'}

<section id="headerImage">

    {if isset($smarty.get.cat)}
        {if $smarty.get.cat == 1}
            <img class="category-{$smarty.get.cat}" title='Kategorie Wirtschaft' src="/nuuws/portal/assets/images/headerImages/Wirtschaft_weiss.png">
        {elseif $smarty.get.cat ==2}
            <img class="category-{$smarty.get.cat}" title='Kategorie Politik' src="/nuuws/portal/assets/images/headerImages/Politik_weiss.png">
        {elseif $smarty.get.cat == 3}
            <img class="category-{$smarty.get.cat}" title='Kategorie Digital' src="/nuuws/portal/assets/images/headerImages/Digital_weiss.png">
        {elseif $smarty.get.cat == 4}
            <img class="category-{$smarty.get.cat}" title='Kategorie Sport' src="/nuuws/portal/assets/images/headerImages/Sport_weiss.png">
        {/if}
    {else}
        <img class="category" title='Kategorie' src="/nuuws/portal/assets/images/headerImages/Anderes_weiss.png">
    {/if}
</section>

<article>
    <div id="articlesWrapper">

        <h1><u>Nachrichten</u></h1>

        <div class="tabs">
            <a href="/nuuws/nachrichten/" class="tabMarker"><b>Alles</b></a>

            {foreach from=$categories key=k item=v}
                <a href="/nuuws/nachrichten/{$k}/{$v}/" class="tabMarker">{$v}</a>
            {/foreach}

            <a href="/nuuws/nachrichten/andere/" class="tabMarker">Andere</a>
        </div>

        <p style="margin-top: 15px"></p>

        {foreach from=$content key=k item=v}

            <div class="nuuwsPrev">

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

    {include file='portal/frontend/templates/aside/premium.tpl'}
</article>
{include file='portal/frontend/templates/footer/footer.tpl'}