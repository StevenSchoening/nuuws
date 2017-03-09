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

    div.nuuwsPrev, div.nuuwsPrev div, div.nuuwsPrev a
    {
        display: block;
        float:left;
    }

    div.nuuwsPrev
    {
        float: left;
        width: 100%;
        margin-bottom: 10px;
        border-bottom: 1px dotted rgba(0,0,0,.33);
    }

    div.nuuwsPrev div
    {
        clear: both;
    }

    div.nuuwsImg
    {
        float:left;
        padding-right: 15px;
    }

    div.nuuwsPrev a
    {
        padding: 5px 0px 0px 5px;
    }

    .nuuwsImg p
    {
        clear: both;
        margin-left: 25px;
    }

    .nuuwsImg a img
    {
        -webkit-box-shadow: 0px 5px 15px 0.5px rgba(0,0,0,0.75);
        -moz-box-shadow: 0px 5px 15px 0.5px rgba(0,0,0,0.75);
        box-shadow: 0px 5px 15px 0.5px rgba(0,0,0,0.75);
    }

    p.ts
    {
        padding: 0;
        margin-bottom: 1px;
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
        <div class="nuuwsPrev">
            <div class="nuuwsImg">
                <a href="/nuuws/nachrichten/{$k}/{$v[1]}.html">
                    <img src="{$v[2]}" title="{$v[3]}" width=175 height=100>
                </a>
            </div>
            <a href="/nuuws/nachrichten/{$k}/{$v[1]}.html" target="_blank" title="{$v[0]}">{$v[0]|truncate:60}</a>
            <br />
            <p class="ts">{$v[5]}</p>
            <p>{$v[4]|strip_tags|truncate:140}</p>
        </div>
        <br />
    {/foreach}
</div>

{include file='portal/frontend/templates/footer/footer.tpl'}