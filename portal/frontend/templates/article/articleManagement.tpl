{include file='portal/frontend/templates/header/header.tpl'}

<article>
<div class="articleOptions">
    <input type="submit" id="createArticle" name="createArticle" value="Beiträge erstellen">
    <input type="submit" id="searchArticle" name="searchArticle" value="Beiträge suchen">
</div>


<br>
    <form method="post" class="hideCreateArticle" name="create_article" id="newsForm">
        <label>Titel des Artikels</label><br>
        <input type="text" name="title" class="title"><br><br>
        {*<label>Header Image hinzufügen</label>*}
        {*<input name="image" accept="image/jpeg" type="file"><br><br>*}
        <label>Inhalt des Artikels</label><br>
        <textarea name="content" rows="4" cols="50" class="content">
        </textarea><br>

        <input type="submit" name="submit" label="Beitrag erstellen">
    </form>
<br>
    <form method="post" class="hideSearchArticle" name="search_article" id="newsFormSearch">
        <label>Geben Sie hier den Titel des Artikels ein um den gewünschten Artikel zu finden!</label><br>
        <input type="text" name="searchArticleFromTitle" class="searchArticle" id="searchArticleFromTitle"><br><br>
        <input type="submit" name="submitSearchArticle" value="Beitrag suchen!">
    </form>


</article>


{include file='portal/frontend/templates/footer/footer.tpl'}
