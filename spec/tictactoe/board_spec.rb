require 'spec_helper'

module TicTacToe
  
  describe Board, '.new' do
    
    it "makes a board with all empty squares" do
      squares = Board.new.squares
      squares.should == { "a1" => "", "a2" => "", "a3" => "", "b1" => "", "b2" => "", "b3" => "", "c1" => "", "c2" => "", "c3" => "" }
    end
    
  end
  
  describe Board, '#[]' do
    
    it "gives the piece at the given square when it contains a piece" do
      board = Board.new("b3" => "X")
      board["b3"].should == "X"
    end
    
  end
  
  describe Board, '#mark' do
  
    it "fills the given square with the given piece" do
      board = Board.new
      board.mark("b3", "X")
      board["b3"].should == "X"
    end
  
  end
  
end