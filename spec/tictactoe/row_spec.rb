require 'spec_helper'

module TicTacToe
  
  describe Board::Row, '#threatening?' do
    
    it "is true if there are 2 adjacent X's and an empty square in the row" do
      row = Board::Row.new("a1" => "X", "a2" => "X", "a3" => " ")
      row.should be_threatening("X")
    end
    
    it "is true if there are 2 non-adjacent X's and an empty square in the row" do
      row = Board::Row.new("a1" => "X", "a2" => " ", "a3" => "X")
      row.should be_threatening("X")
    end
    
    it "is true if there are 2 adjacent O's and an empty square in the row" do
      row = Board::Row.new("a1" => "O", "a2" => "O", "a3" => " ")
      row.should be_threatening("O")
    end
    
    it "is true if there are 2 non-adjacent O's and an empty square in the row" do
      row = Board::Row.new("a1" => "O", "a2" => " ", "a3" => "O")
      row.should be_threatening("O")
    end
    
    it "is false if there row contains an X, an O and a blank square" do
      row = Board::Row.new("a1" => "X", "a2" => "O", "a3" => " ")
      row.should_not be_threatening("X")
      row.should_not be_threatening("O")
    end
    
  end
  
  describe Board::Row, '#winner' do
    
    it "returns X if all squares contain X" do
      row = Board::Row.new("a1" => "X", "a2" => "X", "a3" => "X")
      row.winner.should == "X"
    end
    
    it "returns O if all squares contain O" do
      row = Board::Row.new("a1" => "O", "a2" => "O", "a3" => "O")
      row.winner.should == "O"
    end
    
    it "returns nil if squares are mixed" do
      row = Board::Row.new("a1" => "X", "a2" => "O", "a3" => "X")
      row.winner.should be_nil
    end
    
    it "returns nil if some squares are empty" do
      row = Board::Row.new("a1" => " ", "a2" => " ", "a3" => "X")
      row.winner.should be_nil
    end
    
    it "returns nil if all squares are empty" do
      row = Board::Row.new("a1" => " ", "a2" => " ", "a3" => " ")
      row.winner.should be_nil
    end
    
  end
  
end