# ADISE21_pganosi
## Moutzouris Card Game


![image info](https://w7.pngwing.com/pngs/800/271/png-transparent-king-of-clubs-computer-icons-hearts-playing-card-king-of-diamonds-card-angle-king-text-thumbnail.png)

## Creator : Paraskevi Ganosi

# Table of Contents
1. [Technologies & Tools](#Technologies-&-Tools)
2. [Game Description](#Game-Description)
3. [Database & Tables Design](#Database-&-Tables-Design)
4. [API Endpoints](#API-Endpoints)



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
If a new game is initialised all cards are distributed randomly to the players and one of the two players is randomly selected to begin the game. From that point, each player can either swap a card from the opponent, see the cards in his/her hand. 
Each player has 1 minute to do a move(swap). After 1 minute the game state is changed to aborted (This is handled by stored procedures and events in mysql, included in the schema.sql file). By making a move after that, the game is being resumed from the previous state.
Note that in order for a game to start, or a card to be swapped, a user must be logged in. Otherwise the game cannot start.

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
| Start New Game | [curl -X POST  https://users.iee.ihu.gr/~it134089/ADISE21_pganosi/www/game.php/status] |
| Swap Card | [curl -X POST  https://users.iee.ihu.gr/~it134089/ADISE21_pganosi/www/game.php/swap_card/{number}] |
| Login | [curl -X POST https://users.iee.ihu.gr/~it134089/ADISE21_pganosi/www/game.php/users/{username}] |
| Logout | [curl -X GET https://users.iee.ihu.gr/~it134089/ADISE21_pganosi/www/game.php/users/{username}] |
| Show Active Player's Cards | [curl -X GET https://users.iee.ihu.gr/~it134089/ADISE21_pganosi/www/game.php/my_cards] |

