<?php
    header("Content-Type: text/plain");
    // print $method;
    print "\nprinted from cards.php";

    function show_status()
    {

        // update_game_status();
        global $mysqli;

        $sql = 'select * from game_status';
        $stmt = $mysqli->prepare($sql);

        $stmt->execute();
        $result = $stmt->get_result();

        header('Content-type: application/json');
        $json = json_encode($result->fetch_all(MYSQLI_ASSOC),
            JSON_PRETTY_PRINT);
        
        print $json;
        
    }

    function init_game_status()
    {
        global $mysqli;

        $sql = "insert into game_status values('started', elt(floor(rand()*2) + 1, 'player1', 'player2'), 'draw', now())";
        $stmt = $mysqli->prepare($sql);

        $stmt->execute();
        $result = $stmt->get_result();
    }

    function get_latest_game_state()
    {
        global $mysqli;
        $sql = "select * from game_status
        order by last_change desc
        limit 1";

        $stmt = $mysqli->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();

        header('Content-type: application/json');
        $json = json_encode($result->fetch_all(MYSQLI_ASSOC),
            JSON_PRETTY_PRINT);
        
        print $json;
    }

    function show_next_player()
    {
        global $mysqli;

        $sql = 'select * from game_status order by last_change desc limit 1';
        $stmt = $mysqli->prepare($sql);

        $stmt->execute();
        $result = $stmt->get_result();

        $row = $result -> fetch_array(MYSQLI_ASSOC);
        printf ("Next Player: %s\n", $row["p_turn"]);
        return $row["p_turn"];
    }

    function update_game_status()
    {
        $current_player = show_next_player();
        print($current_player);
        if($current_player == 'player2') $next_player = 'player1';
        else $next_player = 'player2';
        print("\nCurrent player :" . " $current_player");
        print("\nNext player :" . " $next_player");

        global $mysqli;

        $sql = "insert into game_status values('started', $next_player, 'draw', now())";
        $stmt = $mysqli->prepare($sql);

        $stmt->execute();
        $result = $stmt->get_result();
    }
?>