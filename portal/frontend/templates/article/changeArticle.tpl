{include file='portal/frontend/templates/header/header.tpl'}

<!--<section id="headerImage">
    <img src="portal/assets/images/loipen.jpeg">
</section>-->

<article>

    <br>
    <div id="createArticleContent" class="tabcontent">
        <form method="post" name="create_article" id="newsForm">
            <label>Titel des Artikels</label><br>
            <input type="text" name="title" class="title"><br><br>
            {*<label>Header Image hinzufügen</label>*}
            {*<input name="image" accept="image/jpeg" type="file"><br><br>*}
            <label>Inhalt des Artikels</label><br>
            <textarea name="content" rows="4" cols="50" class="content">
            </textarea><br>

            <input type="submit" name="submit" label="Beitrag erstellen">
        </form>
    </div>
    <br>
</article>

{*include file='portal/frontend/templates/footer/footer.tpl'*}


</body>
</html>
