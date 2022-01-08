<?php

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'], '/'));
$input = json_decode(file_get_contents('php://input'), true);

header("Content-Type: text/plain");
print "method=$method\n";
print "Path_info=".$_SERVER['PATH_INFO']."\n";
print_r ($request);

switch($r = array_shift($request)) {
    case 'status' :
        print("Something");
        break;
    default:    header("HTTP/1.1 404 Not Found");
    exit;
}


?>