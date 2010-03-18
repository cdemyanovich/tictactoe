require 'spec_helper'

module TicTacToe
  
  describe Board::Row, '#threatening?' do
    
    it "is true if there are 2 adjacent X's and an empty square in the row" do
      row = Board::Row.new("a1" => "X", "a2" => "X", "a3" => " ")
      row.should be_threatening
    end
    
    it "is true if there are 2 non-adjacent X's and an empty square in the row" do
      row = Board::Row.new("a1" => "X", "a2" => " ", "a3" => "X")
      row.should be_threatening
    end
    
    it "is true if there are 2 adjacent O's and an empty square in the row" do
      row = Board::Row.new("a1" => "O", "a2" => "O", "a3" => " ")
      row.should be_threatening
    end
    
    it "is true if there are 2 non-adjacent O's and an empty square in the row" do
      row = Board::Row.new("a1" => "O", "a2" => " ", "a3" => "O")
      row.should be_threatening
    end
    
    it "is false if there row contains an X, an O and a blank square" do
      row = Board::Row.new("a1" => "X", "a2" => "O", "a3" => " ")
      row.should_not be_threatening
    end
    
  end
  
end