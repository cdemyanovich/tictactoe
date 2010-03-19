module TicTacToe
  class Board
    
    EMPTY_SQUARES = {
      "a1" => " ", "a2" => " ", "a3" => " ",
      "b1" => " ", "b2" => " ", "b3" => " ",
      "c1" => " ", "c2" => " ", "c3" => " "
    }
    
    attr_reader :squares
    
    def initialize(squares = EMPTY_SQUARES)
      @squares = squares.dup
    end
    
    def draw(output)
      output.puts "a  #{@squares['a1']} | #{@squares['a2']} | #{@squares['a3']}"
      output.puts "  ---+---+---"
      output.puts "b  #{@squares['b1']} | #{@squares['b2']} | #{@squares['b3']}"
      output.puts "  ---+---+---"
      output.puts "c  #{@squares['c1']} | #{@squares['c2']} | #{@squares['c3']}"
      output.puts "   1   2   3"
    end
    
    def empty_squares
      @squares.reject { |key, value| value != " " }.keys
    end
    
    def number_of_xs
      @squares.values.find_all { |s| s == "X" }.size
    end
    
    def number_of_os
      @squares.values.find_all { |s| s == "O" }.size
    end
    
    def mark(square, piece)
      @squares[square] = piece
    end
    
    def [](square)
      @squares[square]
    end
    
    def each_row
      rows = [
        { "a1" => @squares["a1"], "a2" => @squares["a2"], "a3" => @squares["a3"] },
        { "b1" => @squares["b1"], "b2" => @squares["b2"], "b3" => @squares["b3"] },
        { "c1" => @squares["c1"], "c2" => @squares["c2"], "c3" => @squares["c3"] },
        { "a1" => @squares["a1"], "b1" => @squares["b1"], "c1" => @squares["c1"] },
        { "a2" => @squares["a2"], "b2" => @squares["b2"], "c2" => @squares["c2"] },
        { "a3" => @squares["a3"], "b3" => @squares["b3"], "c3" => @squares["c3"] },
        { "a1" => @squares["a1"], "b2" => @squares["b2"], "c3" => @squares["c3"] },
        { "a3" => @squares["a3"], "b2" => @squares["b2"], "c1" => @squares["c1"] }
      ]
      
      rows.each do |squares|
        yield Row.new(squares)
      end
    end
    
    def threatening_row
      each_row do |row|
        return row if row.threatening?
      end
      return nil
    end
    
    class Row
      
      def initialize(squares)
        @squares = squares
      end
      
      def threatening?
        @squares.values.find_all { |s| s == " " }.size == 1 &&
        (@squares.values.find_all { |s| s == "X" }.size == 2 || @squares.values.find_all { |s| s == "O" }.size == 2)
      end
      
      def first_empty_square
        @squares.each_pair do |key, value|
          return key if value == " "
        end
      end
      
    end
    
  end
end