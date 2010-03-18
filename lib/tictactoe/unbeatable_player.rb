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
    end
    
  private
  
    def win_or_block_win(board)
      if row = board.threatening_row
        row.first_empty_square
      end
    end
    
  end
  
end