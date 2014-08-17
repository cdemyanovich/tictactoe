require 'spec_helper'

# a    |   |
#   ---+---+---
# b    |   |
#   ---+---+---
# c    |   |
#    1   2   3

module TicTacToe

  describe UnbeatablePlayer, '#move' do

    context "when opponent starts in center" do

      it "takes a corner" do
        board = Board.new(
          a1: " ", a2: " ", a3: " ",
          b1: " ", b2: "X", b3: " ",
          c1: " ", c2: " ", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:a1] == "O" || board[:a3] == "O" || board[:c1] == "O" || board[:c3] == "O").to be true
      end

    end

    context "when opponent starts in a corner" do

      it "takes the center if opponent starts in a1" do
        board = Board.new(
          a1: "X", a2: " ", a3: " ",
          b1: " ", b2: " ", b3: " ",
          c1: " ", c2: " ", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:b2]).to eq("O")
      end

      it "takes the center if opponent starts in a3" do
        board = Board.new(
          a1: " ", a2: " ", a3: "X",
          b1: " ", b2: " ", b3: " ",
          c1: " ", c2: " ", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:b2]).to eq("O")
      end

      it "takes the center if opponent starts in c3" do
        board = Board.new(
          a1: " ", a2: " ", a3: " ",
          b1: " ", b2: " ", b3: " ",
          c1: " ", c2: " ", c3: "X"
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:b2]).to eq("O")
      end

      it "takes the center if opponent starts in c1" do
        board = Board.new(
          a1: " ", a2: " ", a3: " ",
          b1: " ", b2: " ", b3: " ",
          c1: "X", c2: " ", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:b2]).to eq("O")
      end

    end

    context "when opponent starts on an edge" do

      it "takes the center, an adjacent corner or the opposite edge for a2" do
        board = Board.new(
          a1: " ", a2: "X", a3: " ",
          b1: " ", b2: " ", b3: " ",
          c1: " ", c2: " ", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:b2] == "O" || board[:a1] == "O" || board[:a3] == "O" || board[:c2] == "O").to be true
      end

      it "takes the center, an adjacent corner or the opposite edge for b3" do
        board = Board.new(
          a1: " ", a2: " ", a3: " ",
          b1: " ", b2: " ", b3: "X",
          c1: " ", c2: " ", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:b2] == "O" || board[:a3] == "O" || board[:c3] == "O" || board[:b1] == "O").to be true
      end

      it "takes the center, an adjacent corner or the opposite edge for c2" do
        board = Board.new(
          a1: " ", a2: " ", a3: " ",
          b1: " ", b2: " ", b3: " ",
          c1: " ", c2: "X", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:b2] == "O" || board[:c1] == "O" || board[:c3] == "O" || board[:a2] == "O").to be true
      end

      it "takes the center, an adjacent corner or the opposite edge for b1" do
        board = Board.new(
          a1: " ", a2: " ", a3: " ",
          b1: "X", b2: " ", b3: " ",
          c1: " ", c2: " ", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:b2] == "O" || board[:a1] == "O" || board[:c1] == "O" || board[:b3] == "O").to be true
      end

    end

    context "when 2 of 3 squares in a row are marked the same" do

      it "takes the last square to block/win in row a1,a2,a3" do
        board = Board.new(
          a1: "X", a2: "X", a3: " ",
          b1: " ", b2: "O", b3: " ",
          c1: " ", c2: " ", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:a3]).to eq("O")
      end

      it "takes the last square to block/win in row b1,b2,b3" do
        board = Board.new(
          a1: "O", a2: " ", a3: " ",
          b1: " ", b2: "X", b3: "X",
          c1: " ", c2: " ", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:b1]).to eq("O")
      end

      it "takes the last square to block/win in row c1,c2,c3" do
        board = Board.new(
          a1: " ", a2: " ", a3: " ",
          b1: " ", b2: " ", b3: "O",
          c1: "X", c2: "X", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:c3]).to eq("O")
      end

      it "takes the last square to block/win in row a1,b1,c1" do
        board = Board.new(
          a1: "X", a2: " ", a3: " ",
          b1: "X", b2: " ", b3: "O",
          c1: " ", c2: " ", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:c1]).to eq("O")
      end

      it "takes the last square to block/win in row a2,b2,c2" do
        board = Board.new(
          a1: " ", a2: " ", a3: " ",
          b1: " ", b2: "X", b3: " ",
          c1: "O", c2: "X", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:a2]).to eq("O")
      end

      it "takes the last square to block/win in row a3,b3,c3" do
        board = Board.new(
          a1: " ", a2: " ", a3: "X",
          b1: " ", b2: "O", b3: "X",
          c1: " ", c2: " ", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:c3]).to eq("O")
      end

      it "takes the last square to block/win in row a1,b2,c3" do
        board = Board.new(
          a1: "X", a2: " ", a3: "O",
          b1: " ", b2: "X", b3: " ",
          c1: " ", c2: " ", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:c3]).to eq("O")
      end

      it "takes the last square to block/win in row a3,b2,c1" do
        board = Board.new(
          a1: "O", a2: " ", a3: "X",
          b1: " ", b2: "X", b3: " ",
          c1: " ", c2: " ", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:c1]).to eq("O")
      end

      it "takes the last square to win before taking the last square to block" do
        board = Board.new(
          a1: "X", a2: " ", a3: " ",
          b1: " ", b2: "O", b3: " ",
          c1: "X", c2: "O", c3: "X"
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect(board[:a2]).to eq("O")
      end

    end

    context "when fork is imminent (X O X on a diagonal)" do

      it "takes an empty side for diagonal a1,b2,c3" do
        board = Board.new(
          a1: "X", a2: " ", a3: " ",
          b1: " ", b2: "O", b3: " ",
          c1: " ", c2: " ", c3: "X"
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect([ board[:a2], board[:b3], board[:c2], board[:b1] ]).to include("O")
      end

      it "takes an empty side for diagonal a3,b2,c1" do
        board = Board.new(
          a1: " ", a2: " ", a3: "X",
          b1: " ", b2: "O", b3: " ",
          c1: "X", c2: " ", c3: " "
        )
        player = UnbeatablePlayer.new
        player.move(board)
        expect([ board[:a2], board[:b3], board[:c2], board[:b1] ]).to include("O")
      end

    end

  end

end
