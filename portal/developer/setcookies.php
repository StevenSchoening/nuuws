<html>
<head></head>
<body>
<?php
if(isset($_COOKIE['developer']))

    echo "<h2>Du bist {$_COOKIE['developer']}</h2>";
?>
<a href="cookies_mavin.php">Ich bin Marvin</a><br />
<a href="cookies_steven.php">Ich bin Steven</a><br />
<a href="cookies_steven_home.php">Ich bin Steven@home</a><br />
</body>
</html>