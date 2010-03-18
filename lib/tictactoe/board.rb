module TicTacToe
  class Board
    
    EMPTY_SQUARES = { "a1" => " ", "a2" => " ", "a3" => " ", "b1" => " ", "b2" => " ", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => " " }
    
    attr_reader :squares
    
    def initialize(squares = EMPTY_SQUARES)
      @squares = squares
    end
    
    def draw(output)
      output.puts "a  #{@squares['a1']} | #{@squares['a2']} | #{@squares['a3']}"
      output.puts "  ---+---+---"
      output.puts "b  #{@squares['b1']} | #{@squares['b2']} | #{@squares['b3']}"
      output.puts "  ---+---+---"
      output.puts "c  #{@squares['c1']} | #{@squares['c2']} | #{@squares['c3']}"
      output.puts "   1   2   3"
    end
    
    def mark(square, piece)
      @squares[square] = piece
    end
    
    def [](square)
      @squares[square]
    end
    
  end
end