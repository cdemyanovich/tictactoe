module TicTacToe
  class Game
    def initialize(output)
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
  end
end
