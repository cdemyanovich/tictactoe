require 'spec_helper'

# a    |   |  
#   ---+---+---
# b    |   |  
#   ---+---+---
# c    |   |  
#    1   2   3

module TicTacToe
  
  describe UnbeatablePlayer, '#move' do
    
    context "when 2 of 3 squares in a row are marked the same" do
      
      it "takes the last square to block/win in row a1,a2,a3" do
        board = Board.new("a1" => "X", "a2" => "X", "a3" => " ", "b1" => " ", "b2" => "O", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => " ")
        player = UnbeatablePlayer.new
        player.move(board)
        board["a3"].should == "O"
      end
      
      it "takes the last square to block/win in row b1,b2,b3" do
        board = Board.new("a1" => "O", "a2" => " ", "a3" => " ", "b1" => " ", "b2" => "X", "b3" => "X", "c1" => " ", "c2" => " ", "c3" => " ")
        player = UnbeatablePlayer.new
        player.move(board)
        board["b1"].should == "O"
      end
      
      it "takes the last square to block/win in row c1,c2,c3" do
        board = Board.new("a1" => " ", "a2" => " ", "a3" => " ", "b1" => " ", "b2" => " ", "b3" => "O", "c1" => "X", "c2" => "X", "c3" => " ")
        player = UnbeatablePlayer.new
        player.move(board)
        board["c3"].should == "O"
      end
      
      it "takes the last square to block/win in row a1,b1,c1" do
        board = Board.new("a1" => "X", "a2" => " ", "a3" => " ", "b1" => "X", "b2" => " ", "b3" => "O", "c1" => " ", "c2" => " ", "c3" => " ")
        player = UnbeatablePlayer.new
        player.move(board)
        board["c1"].should == "O"
      end
      
      it "takes the last square to block/win in row a2,b2,c2" do
        board = Board.new("a1" => " ", "a2" => " ", "a3" => " ", "b1" => " ", "b2" => "X", "b3" => " ", "c1" => "O", "c2" => "X", "c3" => " ")
        player = UnbeatablePlayer.new
        player.move(board)
        board["a2"].should == "O"
      end
      
      it "takes the last square to block/win in row a3,b3,c3" do
        board = Board.new("a1" => " ", "a2" => " ", "a3" => "X", "b1" => " ", "b2" => "O", "b3" => "X", "c1" => " ", "c2" => " ", "c3" => " ")
        player = UnbeatablePlayer.new
        player.move(board)
        board["c3"].should == "O"
      end
      
      it "takes the last square to block/win in row a1,b2,c3" do
        board = Board.new("a1" => "X", "a2" => " ", "a3" => "O", "b1" => " ", "b2" => "X", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => " ")
        player = UnbeatablePlayer.new
        player.move(board)
        board["c3"].should == "O"
      end
      
      it "takes the last square to block/win in row a3,b2,c1" do
        board = Board.new("a1" => "O", "a2" => " ", "a3" => "X", "b1" => " ", "b2" => "X", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => " ")
        player = UnbeatablePlayer.new
        player.move(board)
        board["c1"].should == "O"
      end
      
    end
    
    it "takes the center if open" do
      board = Board.new("a1" => "X", "a2" => " ", "a3" => " ", "b1" => " ", "b2" => " ", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => " ")
      player = UnbeatablePlayer.new
      player.move(board)
      board["b2"].should == "O"
    end
    
    context "when opposite corners are open" do
      
      it "takes the opposite corner in row a1,b2,c3" do
        board = Board.new("a1" => "X", "a2" => " ", "a3" => " ", "b1" => " ", "b2" => "O", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => " ")
        player = UnbeatablePlayer.new
        player.move(board)
        board["c3"].should == "O"
      end
      
      it "takes the opposite corner in row c3,b2,a1" do
        board = Board.new("a1" => " ", "a2" => " ", "a3" => " ", "b1" => " ", "b2" => "O", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => "X")
        player = UnbeatablePlayer.new
        player.move(board)
        board["a1"].should == "O"
      end
      
      it "takes the opposite corner in row a3,b2,c1" do
        board = Board.new("a1" => " ", "a2" => " ", "a3" => "X", "b1" => " ", "b2" => "O", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => " ")
        player = UnbeatablePlayer.new
        player.move(board)
        board["c1"].should == "O"
      end
      
      it "takes the opposite corner in row c1,b2,a3" do
        board = Board.new("a1" => " ", "a2" => " ", "a3" => " ", "b1" => " ", "b2" => "O", "b3" => " ", "c1" => "X", "c2" => " ", "c3" => " ")
        player = UnbeatablePlayer.new
        player.move(board)
        board["a3"].should == "O"
      end
      
    end
    
  end
  
end