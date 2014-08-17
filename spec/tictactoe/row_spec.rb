require 'spec_helper'

module TicTacToe

  describe Board::Row, '#winner' do

    it "returns X if all squares contain X" do
      row = Board::Row.new(["X", "X", "X"])
      expect(row.winner).to eq("X")
    end

    it "returns O if all squares contain O" do
      row = Board::Row.new(["O", "O", "O"])
      expect(row.winner).to eq("O")
    end

    it "returns nil if squares are mixed" do
      row = Board::Row.new(["X", "O", "X"])
      expect(row.winner).to be_nil
    end

    it "returns nil if some squares are empty" do
      row = Board::Row.new([" ", " ", "X"])
      expect(row.winner).to be_nil
    end

    it "returns nil if all squares are empty" do
      row = Board::Row.new([" ", " ", " "])
      expect(row.winner).to be_nil
    end

  end

end
