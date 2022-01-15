# ADISE21_pganosi
## Moutzouris Card Game


![image info](https://w7.pngwing.com/pngs/800/271/png-transparent-king-of-clubs-computer-icons-hearts-playing-card-king-of-diamonds-card-angle-king-text-thumbnail.png)

## Creator : Paraskevi Ganosi

# Table of Contents
1. [Technologies & Tools](#Technologies-&-Tools)
2. [Game Description](#Game-Description)
3. [Game Rules](#Game-Rules)
4. [Database & Tables Design](#Database-&-Tables-Design)
5. [API Endpoints](#API-Endpoints)



## Technologies & Tools

- PHP
- MySql
- Json
- Mysql Workbench
- VsCode
- XAMMP
- ✨Magic ✨

## Game Description

At the beggining of the game, players can continue an older game or create a new one. 
If he chooses to continue a previous game he will continue playing the previous game saved in the database.
If a new game is initialized all cards are distributed randomly to the players and one of the two players is randomly selected to begin the game. From that point, each player can either swap a card from the opponent, see the cards in his/her hand. 
Each player has 1 minute to do a move(swap). After 1 minute the game state is changed to aborted (This is handled by stored procedures and events in mysql, included in the schema.sql file). By making a move after that, the game is being resumed from the previous state.
Note that in order for a game to start, or a card to be swapped, a user must be logged in. Otherwise the game cannot start.

## Game Rules
The object of the game is to run out of cards. The one who will be left with a card is the loser. 
Before you start, remove all the figures from the deck and keep only King of Clubs.
After mixing well, we deal the whole deck to the players so that they all have the same number of cards (or + - 1). 
Each player removes from the cards he has in his hands the pairs, that is, 2 Aces 2 doubles 2 threes etc. 
We hold the rest in our hands so that the other player can choose, without seeing them, one of them. 
The first player draws a card from his opponent. If he pairs the new card with one of his own then he throws it, otherwise his opponent keeps it and continues.
Whoever pairs all his cards leaves the game.
Whoever stays last with the King of Clubs (Moutzouris) in his hand is the loser. 

## Database & Tables Design

Table users:

|Attribute  |  Short Description   |  Values |
|-----------|----------------|---------|
|id         | player's id   | int     |	
|username   | player's username	     | varchar |
|password   | player's password       | varchar |
|logged_in  | shows if player is logged in | tinyint |

Table cards:
|Attribute  |  Short Description   |  Values |
|-----------|----------------|---------|
|id         | card's id       | int     |	
|name   | card's name (e.g. ace, two, etc)	     | varchar |
|cardgroup   | card's group (e.g. clubs, diamonds, etc)  | varchar |
|holder  | shows who holds a particular card | enum |

Table current_cards: same as table cards (table cards is used to save all cards and initialise a new game)
|Attribute  |  Short Description   |  Values |
|-----------|----------------|---------|
|id         | card's id       | int     |	
|name   | card's name (e.g. ace, two, etc)	     | varchar |
|cardgroup   | card's group (e.g. clubs, diamonds, etc)  | varchar |
|holder  | shows who holds a particular card | enum |

Table game_status:
|Attribute  |  Short Description   |  Values |
|-----------|----------------|---------|
|status         | game status (e.g. started, aborted etc)       | enum     |	
|p_turn   |player's turn	     | enum |
|result   | game result (e.g. draw, player1(If win), player2(If win))  | enum |
|last_change  | shows latest game status update | timestamp |


## API Endpoints

| Action | Endpoint |
| ------ | ------ |
| Show Game Status | [curl -X GET https://users.iee.ihu.gr/~it134089/ADISE21_pganosi/www/game.php/status] |
| Show all cards in Game | [curl -X GET https://users.iee.ihu.gr/~it134089/ADISE21_pganosi/www/game.php/cards] |
| Start New Game | [curl -X POST  https://users.iee.ihu.gr/~it134089/ADISE21_pganosi/www/game.php/cards] |
| Swap Card | [curl -X POST  https://users.iee.ihu.gr/~it134089/ADISE21_pganosi/www/game.php/swap_card/{number}] |
| Login | [curl -X POST https://users.iee.ihu.gr/~it134089/ADISE21_pganosi/www/game.php/users/{username}] |
| Logout | [curl -X GET https://users.iee.ihu.gr/~it134089/ADISE21_pganosi/www/game.php/users/{username}] |
| Show Active Player's Cards | [curl -X GET https://users.iee.ihu.gr/~it134089/ADISE21_pganosi/www/game.php/my_cards] |

