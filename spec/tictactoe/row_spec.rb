require 'spec_helper'

module TicTacToe

  describe Board::Row, '#winner' do

    it "returns X if all squares contain X" do
      row = Board::Row.new(["X", "X", "X"])
      row.winner.should == "X"
    end

    it "returns O if all squares contain O" do
      row = Board::Row.new(["O", "O", "O"])
      row.winner.should == "O"
    end

    it "returns nil if squares are mixed" do
      row = Board::Row.new(["X", "O", "X"])
      row.winner.should be_nil
    end

    it "returns nil if some squares are empty" do
      row = Board::Row.new([" ", " ", "X"])
      row.winner.should be_nil
    end

    it "returns nil if all squares are empty" do
      row = Board::Row.new([" ", " ", " "])
      row.winner.should be_nil
    end

  end

end
