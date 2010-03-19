module TicTacToe
  class Game
    
    attr_reader :board
    
    def initialize(board = Board.new, output = $stdout)
      @board = board
      @output = output
      @o_player = UnbeatablePlayer.new
    end
    
    def play
      @board.draw @output
      @output.print "Your move? (format: b3) "
      
      square = $stdin.gets
      square = square.chomp.downcase
      until @board.empty_squares.include?(square)
        print "Invalid move. Try again. "
        square = $stdin.gets
        square = square.chomp.downcase
      end
      
      @board.mark(square, "X")
      @o_player.move(@board)
      @board.draw(@output)
    end
    
    def mark(square, piece)
      @board.mark(square, piece)
    end
    
    def announce_winner(winner)
      if winner == "X"
        @output.puts "X wins. Looks like I need to work on the 'un' in 'unbeatable'. :-/"
      elsif winner == "O"
        @output.puts "O wins! I'm unbeatable!"
      elsif winner == " "
        @output.puts "Draw. Let's play again."
      end
    end
  end
end
