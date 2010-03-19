module TicTacToe
  
  class UnbeatablePlayer
    
    def move(board)
      square = win_or_block_win(board) ||
               take_center(board) ||
               take_opposite_corner(board) ||
               prevent_fork(board) ||
               board.empty_squares[rand(board.empty_squares.size)]
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
    
    def take_center(board)
      return board.empty_squares.include?("b2") ? "b2" : nil
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
    
    def prevent_fork(board)
      if board.number_of_xs == 2 && board.number_of_os == 1 && board["b2"] == "O" &&
         ( (board["a1"] == "X" && board["c3"] == "X") || (board["a3"] == "X" && board["c1"] == "X") )
        return ["a2", "b3", "c2", "b1"][rand(4)]
      end
      return nil
    end
    
  end
  
end