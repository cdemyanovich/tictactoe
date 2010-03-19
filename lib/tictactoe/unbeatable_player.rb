module TicTacToe
  
  class UnbeatablePlayer
    
    def move(board)
      if square = win_or_block_win(board)
        board.mark(square, "O")
        return
      end
      
      # take center if open
      if board.empty_squares.include?("b2")
        board.mark("b2", "O")
        return
      end
      
      if square = take_opposite_corner(board)
        board.mark(square, "O")
        return
      end
      
      if board.number_of_xs == 2 && board.number_of_os == 1 && board["b2"] == "O" &&
         ( (board["a1"] == "X" && board["c3"] == "X") || (board["a3"] == "X" && board["c1"] == "X") )
        square = ["a2", "b3", "c2", "b1"][rand(4)]
        board.mark(square, "O")
        return
      end
      
      square = board.empty_squares[rand(board.empty_squares.size)]
      board.mark(square, "O")
    end
    
  private
  
    def win_or_block_win(board)
      board.each_row do |row|
        return row.first_empty_square if row.threatening?("O")
      end
      board.each_row do |row|
        return row.first_empty_square if row.threatening?("X")
      end
      return nil
    end
    
    def take_opposite_corner(board)
      if board["a1"] == "X" && board["c3"] == " "
        return "c3"
      elsif board["c3"] == "X" && board["a1"] == " "
        return "a1"
      elsif board["a3"] == "X" && board["c1"] == " "
        return "c1"
      elsif board["c1"] == "X" && board["a3"] == " "
        return "a3"
      else
        return nil
      end
    end
    
  end
  
end