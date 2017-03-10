{include file='portal/frontend/templates/header/header.tpl'}

<section id="headerImage">
    <img title='{$articleContent['imageTitle']}' src="{$articleContent['imagePath']}">
</section>

<article>
    <h1>{$articleContent['title']}</h1>

    <section>
        <div class="article_description"><div class="article_creationTimestamp">{$articleContent['timestamp']}</div>
            {$articleContent['content']}
        </div>
    </section>
</article>


{include file='portal/frontend/templates/footer/footer.tpl'}
