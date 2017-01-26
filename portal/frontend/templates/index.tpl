<html>
<head>
    <link rel="stylesheet" href="portal/assets/styles/style.css" type="text/css">
</head>
<body>
<header>
    {include file='portal/frontend/templates/nav/navigation.tpl'}
</header>

<article>
    <form method="post" action="_functions/articles/createArticle.php" name="create_article" id="newsForm">
        <label>Titel des Artikels</label><br>
        <input type="text" name="title" class="title"><br><br>
        <label>Inhalt des Artikels</label><br>
        <textarea name="content" rows="4" cols="50" class="content">
        </textarea><br>



        <input type="submit" name="submit" label="Beitrag erstellen">
</form>
</article>





{assign var="name" value="test"}
Hello {$name}
</body>
</html>