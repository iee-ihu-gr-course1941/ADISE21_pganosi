<?php

    require_once "../lib/db/dbconnect.php";
    require_once "../lib/ent/cards.php";
    require_once "../lib/ent/status.php";
    require_once "../lib/ent/users.php";

    $method = $_SERVER['REQUEST_METHOD'];
    $request = explode('/', trim($_SERVER['PATH_INFO'], '/'));
    $input = json_decode(file_get_contents('php://input'), true);

    header("Content-Type: text/plain");
    // print "method=$method\n";
    // print "Path_info=".$_SERVER['PATH_INFO']."\n";
    // print_r ($request);

    switch($r = array_shift($request)) {
        case 'status' : show_status();
            break;
        case 'cards' : hande_cards($method);
            break;
        case 'swap_card' : swap_card($method, $request[0]);
            break;
        case 'users' : handle_user($method, $request[0]);
            break;
        case 'my_cards': show_my_cards();
            break;
        // case 'users' : handle_user($method, $request[0], $request[1], $input);
        default : header("HTTP/1.1 404 Not Found");
        exit;
    }


?>