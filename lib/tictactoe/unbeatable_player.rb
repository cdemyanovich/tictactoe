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
      
      if board["a1"] != "O" && board["a1"] != " " && board["c3"] == " "
        board.mark("c3", "O")
        return
      elsif board["c3"] != "O" && board["c3"] != " " && board["a1"] == " "
        board.mark("a1", "O")
        return
      elsif board["a3"] != "O" && board["a3"] != " " && board["c1"] == " "
        board.mark("c1", "O")
        return
      elsif board["c1"] != "O" && board["c1"] != " " && board["a3"] == " "
        board.mark("a3", "O")
        return
      end
      
      if board.number_of_xs == 2 && board.number_of_os == 1 && board["b2"] == "O" &&
         ( (board["a1"] == "X" && board["c3"] == "X") || (board["a3"] == "X" && board["c1"] == "X") )
        square = ["a2", "b3", "c2", "b1"][rand(4)]
        board.mark(square, "O")
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