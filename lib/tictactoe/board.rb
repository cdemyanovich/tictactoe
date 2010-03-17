module TicTacToe
  class Board
    
    def initialize(squares)
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