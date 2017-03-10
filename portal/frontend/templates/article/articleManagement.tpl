{include file='portal/frontend/templates/header/header.tpl'}

<section id="headerImage">
    <img src="portal/assets/images/loipen.jpeg">
</section>

<article>


    <div class="tabs">
        <a href="javascript:void(0)" id="articleOption_create">Artikel erstellen</a>
        <a href="javascript:void(0)" id="articleOption_search">Artikel suchen</a>
        <a href="javascript:void(0)" id="articleOption_change">Artikel bearbeiten</a>
        <a href="javascript:void(0)" id="articleOption_delete"">Artikel löschen</a>
    </div>

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
    <div id="searchArticleContent" class="tabcontent">
        <form method="post" name="search_article" id="newsFormSearch">
            <label>Geben Sie hier den Titel des Artikels ein um den gewünschten Artikel zu finden!</label><br>
            <input type="text" name="searchArticleFromTitle" class="searchArticle" id="searchArticleFromTitle"><br><br>
            <input type="submit" name="submitSearchArticle" value="Beitrag suchen!">
        </form>
    </div>
    <div id="changeArticle">

    </div>
    <div id="deleteArticle">

    </div>

</article>


{include file='portal/frontend/templates/footer/footer.tpl'}

