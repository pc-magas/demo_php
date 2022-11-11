<?php

$db_host = env("DB_HOST");
$db_name = env("DB_NAME");
$db_password = env("DB_PASSWD");
$db_usr = env("DB_USR");
$db_port = env("DB_PORT");

$dsn="mysql:dbname=$db_name;host=$db_host:$db_port";

try {
    $pdo = new PDO($dsn,$db_host,$db_usr,$db_passwd);
    $sql = "SELECT COUNT(*) from mytable";    
    $stmt = $pdo->query($sql);
    $items = $stmt->fetch();
    echo $items;
} catch(Exception $e){
    echo "DB_ERROR";
}

?>
