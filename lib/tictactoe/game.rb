module TicTacToe
  class Game
    
    attr_reader :board
    
    def initialize(board, output)
      @board = board
      @output = output
    end
    
    def start
      @output.puts "a    |   |  "
      @output.puts "  ---+---+---"
      @output.puts "b    |   |  "
      @output.puts "  ---+---+---"
      @output.puts "c    |   |  "
      @output.puts "   1   2   3"
      
      @output.puts "Your move? (format: b3) "
    end
    
    def mark(square, piece)
      @board.mark(square, piece)
    end
  end
end
