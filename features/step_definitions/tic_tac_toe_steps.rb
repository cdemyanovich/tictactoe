Given /^I am not yet playing$/ do
end



When /^I start a new game$/ do
  game = TicTacToe::Game.new(output)
  game.start
end



Then /^I should see the board$/ do
  output.messages.should include("a    |   |  ")
  output.messages.should include("  ---+---+---")
  output.messages.should include("b    |   |  ")
  output.messages.should include("  ---+---+---")
  output.messages.should include("c    |   |  ")
  output.messages.should include("   1   2   3")
end

Then /^I should see "([^\"]*)"$/ do |text|
  output.messages.should include(text)
end

# a    |   |  
#   ---+---+---
# b    |   |  
#   ---+---+---
# c    |   |  
#    1   2   3

class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end
