module TicTacToe
  class Game
    
    attr_reader :board
    
    def initialize(board = Board.new, output = $stdout)
      @board = board
      @output = output
    end
    
    def play
      @board.draw @output
      @output.puts "Your move? (format: b3) "
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
