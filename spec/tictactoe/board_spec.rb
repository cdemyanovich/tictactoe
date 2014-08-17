require 'spec_helper'

module TicTacToe

  describe Board, '.new' do

    it "makes a board with all empty squares" do
      expect(Board.new.squares).to eq({
        a1: " ", a2: " ", a3: " ",
        b1: " ", b2: " ", b3: " ",
        c1: " ", c2: " ", c3: " "
      })
    end

  end

  describe Board, '#dup' do

    it "creates a copy of the board" do
      squares = {
        a1: "X", a2: " ", a3: "O",
        b1: " ", b2: "O", b3: " ",
        c1: " ", c2: " ", c3: "X"
      }
      board = Board.new(squares)
      board_copy = board.dup
      expect(board_copy.squares).to eq(squares)
    end

  end

  describe Board, '#draw' do

    before(:each) do
      @output = double('output').as_null_object
    end

    it "draws an empty board" do
      board = Board.new

      expect(@output).to receive(:puts)
      expect(@output).to receive(:puts).with("a    |   |  ")
      expect(@output).to receive(:puts).with("  ---+---+---")
      expect(@output).to receive(:puts).with("b    |   |  ")
      expect(@output).to receive(:puts).with("  ---+---+---")
      expect(@output).to receive(:puts).with("c    |   |  ")
      expect(@output).to receive(:puts).with("   1   2   3\n\n")

      board.draw(@output)
    end

    it "draws a partially filled board" do
      board = Board.new(
        a1: "X", a2: " ", a3: "O",
        b1: " ", b2: "O", b3: " ",
        c1: " ", c2: " ", c3: "X"
      )

      expect(@output).to receive(:puts)
      expect(@output).to receive(:puts).with("a  X |   | O")
      expect(@output).to receive(:puts).with("  ---+---+---")
      expect(@output).to receive(:puts).with("b    | O |  ")
      expect(@output).to receive(:puts).with("  ---+---+---")
      expect(@output).to receive(:puts).with("c    |   | X")
      expect(@output).to receive(:puts).with("   1   2   3\n\n")

      board.draw(@output)
    end

    it "draws a filled board" do
      board = Board.new(
        a1: "X", a2: "X", a3: "O",
        b1: "O", b2: "O", b3: "X",
        c1: "X", c2: "O", c3: "X"
      )

      expect(@output).to receive(:puts)
      expect(@output).to receive(:puts).with("a  X | X | O")
      expect(@output).to receive(:puts).with("  ---+---+---")
      expect(@output).to receive(:puts).with("b  O | O | X")
      expect(@output).to receive(:puts).with("  ---+---+---")
      expect(@output).to receive(:puts).with("c  X | O | X")
      expect(@output).to receive(:puts).with("   1   2   3\n\n")

      board.draw(@output)
    end

  end

  describe Board, 'empty_squares' do

    it "returns all squares when the board is empty" do
      board = Board.new
      expect(board.empty_squares).to include(:a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3)
    end

    it "returns only the empty squares when the board is partially filled" do
      board = Board.new(
        a1: "X", a2: " ", a3: "O",
        b1: " ", b2: "O", b3: " ",
        c1: " ", c2: " ", c3: "X"
      )
      expect(board.empty_squares).to include(:a2, :b1, :b3, :c1, :c2)
      expect(board.empty_squares).not_to include(:a1, :a3, :b2, :c3)
    end

    it "returns an empty list when the board is filled" do
      board = Board.new(
        a1: "X", a2: "X", a3: "O",
        b1: "O", b2: "O", b3: "X",
        c1: "X", c2: "O", c3: "X"
      )
      expect(board.empty_squares).to eq([])
    end

  end

  describe Board, '#[]' do

    it "gives the piece at the given square when it contains a piece" do
      board = Board.new(b3: "X")
      expect(board[:b3]).to eq("X")
    end

  end

  describe Board, '#mark' do

    it "fills the given square with the given piece" do
      board = Board.new
      board.mark(:b3, "X")
      expect(board[:b3]).to eq("X")
    end

  end

  describe Board, '#winner' do

    it "returns nil if game is not over" do
      board = Board.new(
        a1: "X", a2: " ", a3: " ",
        b1: " ", b2: "O", b3: " ",
        c1: " ", c2: " ", c3: " "
      )
      expect(board.winner).to be_nil
    end

    it "returns X if X has 3 in a row" do
      board = Board.new(
        a1: "X", a2: "X", a3: "X",
        b1: " ", b2: " ", b3: " ",
        c1: " ", c2: " ", c3: " "
      )
      expect(board.winner).to eq("X")
    end

    it "returns O if O has 3 in a row" do
      board = Board.new(
        a1: " ", a2: " ", a3: "O",
        b1: " ", b2: " ", b3: "O",
        c1: " ", c2: " ", c3: "O"
      )
      expect(board.winner).to eq("O")
    end

    it "returns ' ' if neither X nor O has 3 in a row" do
      board = Board.new(
        a1: "X", a2: "X", a3: "O",
        b1: "O", b2: "O", b3: "X",
        c1: "X", c2: "O", c3: "X"
      )
      expect(board.winner).to eq(" ")
    end

  end

end
