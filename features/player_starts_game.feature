Feature: Player starts game

In order to play the game
As a player
I want to start the game

@future
Scenario: start game
  Given I am not yet playing
  When I start a new game
  Then I should see the board
  And I should see "Your move? (format: b3) "
