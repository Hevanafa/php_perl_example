<?php

$perl_exec = "C:\\Strawberry\\perl\\bin\\perl.exe";
$root_path = realpath(__DIR__);

exec("$perl_exec $root_path\\select.pl", $output);

echo("<ol>");
foreach ($output as $row)
    echo("<li>$row</li>");

echo("</ol>");
// var_dump($output);