require 'spec_helper'

module TicTacToe
  
  describe Board, '#[]' do
    
    it "gives the piece at the given square when it contains a piece" do
      board = Board.new("b3" => "X")
      board["b3"].should == "X"
    end
    
  end
  
  describe Board, '#mark' do
  
    it "fills the given square with the given piece" do
      board = Board.new({})
      board.mark("b3", "X")
      board["b3"].should == "X"
    end
  
  end
  
end