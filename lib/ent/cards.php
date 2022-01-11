<?php
    function hande_cards($method)
    {
        header("Content-Type: text/plain");
        print $method;
        print "\nprinted from cards.php";
        if($method=='GET') fetch_cards();
        else if($method=='POST') init_game();
    }

    function fetch_cards()
    {
        global $mysqli;

        $sql = 'select * from current_cards where holder is not null';
        $stmt = $mysqli->prepare($sql);

        $stmt->execute();
        $result = $stmt->get_result();

        header('Content-type: application/json');
        print json_encode($result->fetch_all(MYSQLI_ASSOC),
            JSON_PRETTY_PRINT);

        //if select count < 41 game is active
        check_for_winner();
    }

    function drop_duplicate_cards()
    {
        $sql = "DELETE t1 FROM current_cards t1
        INNER JOIN current_cards t2 
        WHERE 
            t1.id < t2.id AND 
            t1.name = t2.name;";
        
        global $mysqli;
        $stmt = $mysqli->prepare($sql);

        $stmt->execute();
        $result = $stmt->get_result();

        check_for_winner();
    }

    function swap_card()
    {
        //code for swapping cards
        drop_duplicate_cards();
    }

    function check_for_winner()
    {
        global $mysqli;
        $result=mysqli_query($mysqli, "SELECT count(*) as total from current_cards");
        $data=mysqli_fetch_assoc($result);
        if($data['total'] <= 1) print("\nWINNER\n");
    }

    function init_game()
    {
        $sql = 'SET SQL_SAFE_UPDATES = 0';
        execute_query($sql);

        $sql = 'DELETE FROM current_cards';
        execute_query($sql);

        $sql = 'INSERT INTO current_cards SELECT * FROM CARDS';
        execute_query($sql);

        distribute_cards();

        print "\nNew game initialized";
        
        drop_duplicate_cards();
        
    }

    function distribute_cards()
    {
        global $mysqli;
        $data['total'] = 0;
        while($data['total']!=21 || $data['total']!=20)
        {
            $sql = "update current_cards set holder = elt(floor(rand()*2) + 1, 'player1', 'player2')"; 
            execute_query($sql);

            $result=mysqli_query($mysqli, "SELECT count(*) as total from current_cards where holder='player1'");
            $data=mysqli_fetch_assoc($result);
            if($data['total'] == 21 || $data['total'] == 20) break;
        }
        
    }

    function execute_query($sql)
    {
        global $mysqli;
        $stmt = $mysqli->prepare($sql);

        $stmt->execute();
        $result = $stmt->get_result();

    }
?>