require 'spec_helper'

module TicTacToe
  describe Game, '#play' do
    
    before(:each) do
      @board = double('board').as_null_object
      @output = double('output').as_null_object
      @game = Game.new(@board, @output)
    end
    
    it "draws an initial board" do
      @board.should_receive(:draw).with(@output)
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
      board = Board.new
      output = double('output').as_null_object
      game = Game.new(board, output)
      game.board.should == board
    end
    
  end
  
  describe Game, '#announce_winner' do
    
    before(:each) do
      @board = double('board').as_null_object
      @output = double('output').as_null_object
      @game = Game.new(@board, @output)
    end
    
    it "shamefully admits defeat if X wins" do
      @output.should_receive(:puts).with("X wins. Looks like I need to work on the 'un' in 'unbeatable'. :-/")
      @game.announce_winner("X")
    end
    
    it "boastfully declares victory if O wins" do
      @output.should_receive(:puts).with("O wins! I'm unbeatable!")
      @game.announce_winner("O")
    end
    
    it "casually notes a tie" do
      @output.should_receive(:puts).with("Draw. Let's play again.")
      @game.announce_winner(" ")
    end
    
  end
end
