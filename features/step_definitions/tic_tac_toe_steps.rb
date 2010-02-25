Given /^I am not yet playing$/ do
end



When /^I start a new game$/ do
  TicTacToe::Game.new.start
end
