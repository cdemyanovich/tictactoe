require 'spec_helper'

module TicTacToe
  describe Game, '#start' do
    
    before(:each) do
      @output = double('output').as_null_object
      @game = Game.new(@output)
    end
    
    it "draws an initial board" do
      @output.should_receive(:puts).with("a    |   |  ")
      @output.should_receive(:puts).with("  ---+---+---")
      @output.should_receive(:puts).with("b    |   |  ")
      @output.should_receive(:puts).with("  ---+---+---")
      @output.should_receive(:puts).with("c    |   |  ")
      @output.should_receive(:puts).with("   1   2   3")
      
      @game.start
    end
    
    it "prompts for the first move" do
      @output.should_receive(:puts).with("Your move? (format: b3) ")
      
      @game.start
    end
    
  end
end
