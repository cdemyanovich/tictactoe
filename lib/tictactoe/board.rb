module TicTacToe
  class Board
    
    EMPTY_SQUARES = { "a1" => "", "a2" => "", "a3" => "", "b1" => "", "b2" => "", "b3" => "", "c1" => "", "c2" => "", "c3" => "" }
    
    attr_reader :squares
    
    def initialize(squares = EMPTY_SQUARES)
      @squares = squares
    end
    
    def mark(square, piece)
      @squares[square] = piece
    end
    
    def [](square)
      @squares[square]
    end
    
  end
end