{include file='portal/frontend/templates/header/header.tpl'}

<article>
    <div id="articlesWrapper">

        <h1><u>Nachrichten</u></h1>

        <div class="tabs">
            <a href="/nuuws/nachrichten/"><b>Alles</b></a>

            {foreach from=$categories key=k item=v}
                <a href="/nuuws/nachrichten/{$k}/{$v}/">{$v}</a>
            {/foreach}

            <a href="/nuuws/nachrichten/andere/">Andere</a>
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
</article>
{include file='portal/frontend/templates/footer/footer.tpl'}