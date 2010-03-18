module TicTacToe
  class Game
    
    attr_reader :board
    
    def initialize(board, output = $stdout)
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
  end
end
