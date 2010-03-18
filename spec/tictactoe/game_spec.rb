require 'spec_helper'

module TicTacToe
  describe Game, '#play' do
    
    before(:each) do
      board = double('board').as_null_object
      @output = double('output').as_null_object
      @game = Game.new(board, @output)
    end
    
    it "draws an initial board" do
      @output.should_receive(:puts).with("a    |   |  ")
      @output.should_receive(:puts).with("  ---+---+---")
      @output.should_receive(:puts).with("b    |   |  ")
      @output.should_receive(:puts).with("  ---+---+---")
      @output.should_receive(:puts).with("c    |   |  ")
      @output.should_receive(:puts).with("   1   2   3")
      
      @game.play
    end
    
    it "prompts for the first move" do
      @output.should_receive(:puts).with("Your move? (format: b3) ")
      
      @game.play
    end
    
  end
  
  describe Game, '#mark' do
    
    it "marks the board" do
      board = mock(Board)
      output = double('output').as_null_object
      game = Game.new(board, output)
      
      board.should_receive(:mark).with("b3", "X")
      game.mark("b3", "X")
    end
    
  end
  
  describe Game, '#board' do
    
    it "returns its board" do
      board = Board.new({})
      output = double('output').as_null_object
      game = Game.new(board, output)
      game.board.should == board
    end
    
  end
end
