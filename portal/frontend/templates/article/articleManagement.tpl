{include file='portal/frontend/templates/header/header.tpl'}

<section id="headerImage">
    <img class="shadow" src="portal/assets/images/loipen.jpeg">
</section>

<article>


    <div class="tabs articleManagement">
        <a href="javascript:void(0)" id="articleOption_create" class="tabMarker">Artikel erstellen</a>
        <a href="javascript:void(0)" id="articleOption_search">Artikel suchen & bearbeiten</a>
    </div>

    <br>
    <div id="createArticleContent" class="tabcontent">
        <form method="post" enctype="multipart/form-data" name="create_article" id="newsForm">
            <label>Autor</label><br>
            <input type="text" name="copyright" class="autor"><br><br>

            <label>Titel des Artikels</label><br>
            <input type="text" name="title" class="title"><br><br>

            <label>Bild hinzufügen</label>
            <input name="headerImage" accept="image/jpeg" maxlength="255" size="200" type="file"><br><br>

            <label>Inhalt des Artikels</label><br>
            <textarea name="content" rows="4" cols="50" class="content">
            </textarea><br>

            <input type="submit" name="submit" label="Beitrag erstellen">
        </form>
    </div>
    <br>
    <div id="searchArticleContent" class="tabcontent">
        <form method="post" action="nachrichten-bearbeiten" name="searchArticleContent" id="newsFormSearch">
            <label>Geben Sie hier den Titel des Artikels ein um den gewünschten Artikel zu finden!</label><br>
            <input type="text" name="searchArticleFromTitle" class="searchArticle" id="searchArticleFromTitle"><br><br>
            <input type="submit" name="submitSearchArticle" value="Beitrag suchen!">
        </form>
    </div>
</article>


{include file='portal/frontend/templates/footer/footer.tpl'}

