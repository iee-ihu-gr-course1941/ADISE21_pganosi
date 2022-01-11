<?php
    function hande_cards($method)
    {
        header("Content-Type: text/plain");
        print $method;
        print "\nprinted from cards.php";
        if($method=='GET') fetch_cards();
        else if($method=='POST') init_game();
    }

    function drop_duplicate_cards()
    {

    }

    function swap_card()
    {
        //code for swapping cards
        drop_duplicate_cards();
    }

    function check_for_winner()
    {

    }

    function init_game()
    {
        drop_duplicate_cards();
        //rest of code
    }
?>