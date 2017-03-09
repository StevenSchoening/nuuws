{include file='portal/frontend/templates/header/header.tpl'}

<style>
    p.spacer
    {
        margin-top: 80px;
    }

    div#articlesWrapper
    {
        width: 760px;
        margin: 0px auto;
    }
</style>


<p class="spacer" ></p>

<div id="articlesWrapper">
    <h1>Nachrichten</h1>
    <div class="tabs">
        <a href="/nuuws/nachrichten/">Alles</a>

        {foreach from=$categories key=k item=v}
            <a href="/nuuws/nachrichten/{$k}/{$v}">{$v}</a>
        {/foreach}
    </div>

    <p style="margin-top: 15px"></p>

    {foreach from=$content key=k item=v}
    <a href="/nuuws/nachrichten/{$k}/{$v[1]}.html">{$v[0]}</a><br />
    {/foreach}
</div>

{include file='portal/frontend/templates/footer/footer.tpl'}