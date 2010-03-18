module TicTacToe
  
  class UnbeatablePlayer
    
    def initialize
      @piece = "O"
    end
    
    def move(board)
      if square = win_or_block_win(board)
        board.mark(square, @piece)
        return
      end
      
      # take center if open
      if board.empty_squares.include?("b2")
        board.mark("b2", @piece)
        return
      end
      
      if board["a1"] != @piece && board["a1"] != " " && board["c3"] == " "
        board.mark("c3", @piece)
      elsif board["c3"] != @piece && board["c3"] != " " && board["a1"] == " "
        board.mark("a1", @piece)
      elsif board["a3"] != @piece && board["a3"] != " " && board["c1"] == " "
        board.mark("c1", @piece)
      elsif board["c1"] != @piece && board["c1"] != " " && board["a3"] == " "
        board.mark("a3", @piece)
      end
    end
    
  private
  
    def win_or_block_win(board)
      if row = board.threatening_row
        row.first_empty_square
      end
    end
    
  end
  
end