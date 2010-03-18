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
    end
    
  private
  
    def win_or_block_win(board)
      if row = board.threatening_row
        row.first_empty_square
      end
    end
    
  end
  
end