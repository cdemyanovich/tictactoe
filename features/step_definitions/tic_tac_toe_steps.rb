Given /^I am not yet playing$/ do
end

Given /^the following game in progress:$/ do |table|
  board = TicTacToe::Board.new(table.hashes.first)
  @game = TicTacToe::Game.new(board, output)
  @game.start
end



When /^I start a new game$/ do
  board = TicTacToe::Board.new
  game = TicTacToe::Game.new(board, output)
  game.start
end



Then /^I should see the board$/ do
  output.messages.should include("a    |   |  ")
  output.messages.should include("  ---+---+---")
  output.messages.should include("b    |   |  ")
  output.messages.should include("  ---+---+---")
  output.messages.should include("c    |   |  ")
  output.messages.should include("   1   2   3\n\n")
end

Then /^I should see "([^\"]*)"$/ do |text|
  output.messages.should include(text)
end
