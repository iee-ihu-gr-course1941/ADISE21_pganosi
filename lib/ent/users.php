<?php

    require_once "../lib/ent/cards.php";

    function handle_user($method, $username/*, $password, $input*/)
    {
        // print("Method: ".$method."\n");
        // print("Param1: ".$param1."\n");
        // print("Param2: ".$param2."\n");
        // print("Input: ".$input."\n");
        if($method=='GET') logout($username);
        else if($method=='POST') login($username);
    }

    function is_logged_in()
    {
        global $mysqli;

        $sql = 'select * from users';
        $stmt = $mysqli->prepare($sql);

        $stmt->execute();
        $result = $stmt->get_result();

        $row = $result -> fetch_array(MYSQLI_ASSOC);
        // printf ("logged_in: %s\n", $row["logged_in"]);
        return $row["logged_in"];
    }

    function login($username)
    {
        $sql = "update users set logged_in = true where username='".$username."'";

        execute_query($sql);
    }

    function logout($username)
    {
        $sql = "update users set logged_in = false where username='".$username."'";
        
        execute_query($sql);
    }

?>