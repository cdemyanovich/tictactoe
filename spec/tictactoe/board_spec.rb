require 'spec_helper'

module TicTacToe
  
  describe Board, '.new' do
    
    it "makes a board with all empty squares" do
      squares = Board.new.squares
      squares.should == { "a1" => " ", "a2" => " ", "a3" => " ", "b1" => " ", "b2" => " ", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => " " }
    end
    
  end
  
  describe Board, '#draw' do
    
    before(:each) do
      @output = double('output').as_null_object
    end
    
    it "draws an empty board" do
      board = Board.new
      
      @output.should_receive(:puts).with("a    |   |  ")
      @output.should_receive(:puts).with("  ---+---+---")
      @output.should_receive(:puts).with("b    |   |  ")
      @output.should_receive(:puts).with("  ---+---+---")
      @output.should_receive(:puts).with("c    |   |  ")
      @output.should_receive(:puts).with("   1   2   3")
      
      board.draw(@output)
    end
    
    it "draws a partially filled board" do
      board = Board.new("a1" => "X", "a2" => " ", "a3" => "O", "b1" => " ", "b2" => "O", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => "X")
      
      @output.should_receive(:puts).with("a  X |   | O")
      @output.should_receive(:puts).with("  ---+---+---")
      @output.should_receive(:puts).with("b    | O |  ")
      @output.should_receive(:puts).with("  ---+---+---")
      @output.should_receive(:puts).with("c    |   | X")
      @output.should_receive(:puts).with("   1   2   3")
      
      board.draw(@output)
    end
    
    it "draws a filled board" do
      board = Board.new("a1" => "X", "a2" => "X", "a3" => "O", "b1" => "O", "b2" => "O", "b3" => "X", "c1" => "X", "c2" => "O", "c3" => "X")
      
      @output.should_receive(:puts).with("a  X | X | O")
      @output.should_receive(:puts).with("  ---+---+---")
      @output.should_receive(:puts).with("b  O | O | X")
      @output.should_receive(:puts).with("  ---+---+---")
      @output.should_receive(:puts).with("c  X | O | X")
      @output.should_receive(:puts).with("   1   2   3")
      
      board.draw(@output)
    end
    
  end
  
  describe Board, 'empty_squares' do
    
    it "returns all squares when the board is empty" do
      board = Board.new
      board.empty_squares.should include("a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3")
    end
      
    it "returns only the empty squares when the board is partially filled" do
      board = Board.new("a1" => "X", "a2" => " ", "a3" => "O", "b1" => " ", "b2" => "O", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => "X")
      board.empty_squares.should include("a2", "b1", "b3", "c1", "c2")
      board.empty_squares.should_not include("a1", "a3", "b2", "c3")
    end
      
    it "returns an empty list when the board is filled" do
      board = Board.new("a1" => "X", "a2" => "X", "a3" => "O", "b1" => "O", "b2" => "O", "b3" => "X", "c1" => "X", "c2" => "O", "c3" => "X")
      board.empty_squares.should == []
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
  
  describe Board, '#number_of_xs' do
    
    it "is 0 when there are none" do
      board = Board.new
      board.number_of_xs.should == 0
    end
    
    it "is 1 when there is 1" do
      board = Board.new("a1" => "X", "a2" => " ", "a3" => " ", "b1" => " ", "b2" => " ", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => " ")
      board.number_of_xs.should == 1
    end
    
    it "is 2 when there are 2" do
      board = Board.new("a1" => "X", "a2" => "X", "a3" => " ", "b1" => " ", "b2" => " ", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => " ")
      board.number_of_xs.should == 2
    end
    
  end
  
  describe Board, '#number_of_os' do
    
    it "is 0 when there are none" do
      board = Board.new
      board.number_of_os.should == 0
    end
    
    it "is 1 when there is 1" do
      board = Board.new("a1" => "O", "a2" => " ", "a3" => " ", "b1" => " ", "b2" => " ", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => " ")
      board.number_of_os.should == 1
    end
    
    it "is 2 when there are 2" do
      board = Board.new("a1" => "O", "a2" => "O", "a3" => " ", "b1" => " ", "b2" => " ", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => " ")
      board.number_of_os.should == 2
    end
    
  end
  
end