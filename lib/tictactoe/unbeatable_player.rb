module TicTacToe
  
  class UnbeatablePlayer
    
    MAX_DEPTH = 9
    OPPONENT_OF = { "X" => "O", "O" => "X" }
    WINNING_MOVE_SCORE = 1000
    
    def move(board)
      square = best_move(board)
      board.mark(square, "O")
    end
    
  private

    def best_move(board)
      possible_moves = board.empty_squares.sort_by do |square|
        board_copy = board.dup
        board_copy.mark(square, "O")
        score_move(board_copy, 1, OPPONENT_OF["O"])
      end
      possible_moves.first
    end
    
    def score_move(board, depth, piece)
      winner = board.winner
      if winner == piece
        return WINNING_MOVE_SCORE - depth
      elsif winner == OPPONENT_OF[piece]
        return -WINNING_MOVE_SCORE + depth
      elsif winner == " " || depth > MAX_DEPTH
        return depth
      end
      
      max_score = -WINNING_MOVE_SCORE
      board.empty_squares.each do |square|
        board_copy = board.dup
        board_copy.mark(square, piece)
        score = -score_move(board_copy, depth + 1, OPPONENT_OF[piece])
        max_score = [max_score, score].max
      end
      return max_score
    end
        
  end
  
end