Feature: Player makes move

In order to win the game
As a player
I want to make a move

a    |   |  
  ---+---+---
b    |   |  
  ---+---+---
c    |   |  
   1   2   3

Background:
  Given the following game in progress:
    | a1 | a2 | a3 | b1 | b2 | b3 | c1 | c2 | c3 |
    | X  |    |    |    | O  |    |    |    |    |

@future
Scenario: legal move
  When I mark "c3"
  Then I should see "X" in "c3"

@future
Scenario: illegal move
  When I mark "b2"
  Then I should see "Invalid move. Try again. "
