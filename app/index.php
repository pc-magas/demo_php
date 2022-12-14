<?php

$db_host = getenv("DB_HOST");
$db_name = getenv("DB_NAME");
$db_passwd = getenv("DB_PASSWD");
$db_usr = getenv("DB_USER");
$db_port = getenv("DB_PORT");

$dsn="mysql:dbname=$db_name;host=$db_host:$db_port";
try {
    $pdo = new PDO($dsn,$db_usr,$db_passwd);
    $sql = "SELECT COUNT(*) from mytable";    
    $stmt = $pdo->query($sql);
    $items = $stmt->fetch();
    echo $items[0];
} catch(Exception $e){
    echo "DB_ERROR";
}

?>
