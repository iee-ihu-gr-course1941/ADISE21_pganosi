<?php
    require_once "../lib/ent/status.php";
    require_once "../lib/ent/users.php";
    ini_set('display_errors', 1);

    function hande_cards($method)
    {
        header("Content-Type: text/plain");
       
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
        //TODO: rewrite functionallity 
        $sql = "DELETE t1 FROM current_cards t1
        INNER JOIN current_cards t2 
        WHERE 
            t1.id < t2.id AND 
            t1.name = t2.name AND
            t1.holder = 'player1' 
            AND
            t2.holder = 'player1'
            ;";
        // print($sql);
        global $mysqli;
        $stmt = $mysqli->prepare($sql);

        $stmt->execute();
        $result = $stmt->get_result();

        $sql = "DELETE t1 FROM current_cards t1
        INNER JOIN current_cards t2 
        WHERE 
            t1.id < t2.id AND 
            t1.name = t2.name AND
            t1.holder = 'player2' 
            AND
            t2.holder = 'player2'
            ;";
        // print($sql);
        global $mysqli;
        $stmt = $mysqli->prepare($sql);

        $stmt->execute();
        $result = $stmt->get_result();

    }

    function swap_card($method, $card_id)
    {
        if(!is_logged_in())
        { 
            print "\nPlease log in in order to play";
            return false;
        }
        if($method=='GET') return false;

        find_if_game_was_aborted();

        arrange_cards();
        $active_player = show_next_player();
        if($active_player == 'player1') $opponent = 'player2';
        else $opponent = 'player1';

        $sql="update current_cards
        set holder = '$active_player'
        where id=$card_id and holder='$opponent'";

        execute_query($sql);
        print("\nCard swapped\n");

        hadle_duplicates();
        print("\nDupplicates dropped\n");

        if(!check_for_winner()) print("\nNo winner, game continuing...\n");
        else return;

        update_game_status();
    }

    function check_for_winner()
    {
        global $mysqli;
        $current_player = show_next_player();
        $result=mysqli_query($mysqli, "SELECT count(*) as total from current_cards");
        $data=mysqli_fetch_assoc($result);
        if($data['total'] <= 1){
            print("\nPLAYER $current_player IS WINNER\n");
            update_winner($current_player);
            return true;
        }
    }

    function init_game()
    {
        if(!is_logged_in())
        { 
            print "\nPlease log in in order to play";
            return false;
        }

        $sql = 'SET SQL_SAFE_UPDATES = 0';
        execute_query($sql);

        // //updated
        // $sql = "use adise";
        // global $mysqli;

        // $stmt = $mysqli->prepare($sql);

        // $stmt->execute();
        // //updated

        $sql = 'DELETE FROM current_cards';
        // execute_query($sql);
        global $mysqli;
        $result = mysqli_query($mysqli, $sql);
        
        $sql = 'INSERT INTO current_cards SELECT * FROM CARDS';
        execute_query($sql);

        distribute_cards();

        print "\nNew game initialized\n";
        
        hadle_duplicates();
        
        init_game_status();

        show_first_player();
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

        $mysqli->close();
    }

    function arrange_cards()
    {
        //player1
        $sql="SET @code=0";
        execute_query($sql);
        $sql = "UPDATE IGNORE current_cards SET id = (SELECT @code:=@code+1 AS code)
        where holder='player1'";
        execute_query($sql);

        //player2
        $sql="SET @code=0";
        execute_query($sql);
        $sql = "UPDATE IGNORE current_cards SET id = (SELECT @code:=@code+1 AS code)
        where holder='player2'";
        execute_query($sql);
    }

    function hadle_duplicates()
    {
        global $mysqli;
        $cards = array();
        $players = array("player1", "player2");

        $result=mysqli_query($mysqli, "SELECT DISTINCT name FROM cards WHERE name!='king'");
        while(($row =  mysqli_fetch_array($result))) $cards[] = $row['name'];

        foreach($players as $player)
        {
            foreach ($cards as $cardName) 
            {
                update_even_card_holders($player, $cardName);
            }
        }
        
        delete_null_holders();

        drop_duplicate_cards();

    }

    function update_even_card_holders($player, $cardName)
    {
        $query = "update current_cards set holder = null
            where  exists ( select * from (select * from current_cards) as tbl
            where holder='$player' and name='$cardName'
            having count(*) = 4 || count(*) = 2
            )
            and holder='$player' and name='$cardName'";

            execute_query($query);
    }

    function delete_null_holders()
    {
        $bigQuery = "SET SQL_SAFE_UPDATES = 0;
        DELETE FROM current_cards WHERE holder is NULL;";
        global $mysqli;
        $mysqli->multi_query($bigQuery);
        do {
            if ($result = $mysqli->store_result()) {
                var_dump($result->fetch_all(MYSQLI_ASSOC));
                $result->free();
            }
        } while ($mysqli->next_result());
    }

    function show_my_cards()
    {
        $player = show_next_player();
        global $mysqli;
        $sql = "select name, cardgroup, holder from current_cards
        where holder='$player'";

        $stmt = $mysqli->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();

        header('Content-type: application/json; charset=utf-8');
        $json = json_encode($result->fetch_all(MYSQLI_ASSOC),
            JSON_PRETTY_PRINT);
        
        print $json;
        // header('Content-Type: application/json; charset=utf-8');
        // echo json_encode($json);

    }

    function find_if_game_was_aborted()
    {
        global $mysqli;

        $sql = 'select * from game_status order by last_change desc limit 1';
        $stmt = $mysqli->prepare($sql);

        $stmt->execute();
        $result = $stmt->get_result();

        $row = $result -> fetch_array(MYSQLI_ASSOC);
        
        $status = $row["status"];
        if($status=="aborted")
        {
            print("\nResuming aborted game\n");
            $sql = "SET SQL_SAFE_UPDATES = 0";
            execute_query($sql);

            $sql = "update game_status set status='started' where
            status = 'aborted' and last_change = (
            select last_change from (select * from game_status) as tbl order by last_change desc limit 1
            )";
            execute_query($sql);
        }
    }

    function update_winner($current_player)
    {
        global $mysqli;
        $sql = "insert into game_status values('ended', '$current_player', '$current_player', now())";
        $stmt = $mysqli->prepare($sql);
        $stmt->execute();
    }
?>