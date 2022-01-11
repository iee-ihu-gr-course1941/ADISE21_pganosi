<?php
    header("Content-Type: text/plain");
    print $method;
    print "\nprinted from cards.php";

    function show_status()
    {
        global $mysqli;

        $sql = 'select * from game_status';
        $stmt = $mysqli->prepare($sql);

        $stmt->execute();
        $result = $stmt->get_result();

        header('Content-type: application/json');
        print json_encode($result->fetch_all(MYSQLI_ASSOC),
            JSON_PRETTY_PRINT);
    }

    function init_game_status()
    {
        global $mysqli;

        $sql = "insert into game_status values('started', elt(floor(rand()*2) + 1, 'player1', 'player2'), 'draw', now())";
        $stmt = $mysqli->prepare($sql);

        $stmt->execute();
        $result = $stmt->get_result();
    }
?>