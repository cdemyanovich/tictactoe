require 'spec_helper'

module TicTacToe
  
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