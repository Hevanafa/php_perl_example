<?php

$perl_exec = "C:\\Strawberry\\perl\\bin\\perl.exe";
$root_path = realpath(__DIR__);

exec("$perl_exec $root_path\\select.pl", $output);
var_dump($output);