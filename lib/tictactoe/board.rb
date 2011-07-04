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

    def dup
      Board.new(@squares.dup)
    end

    def draw(output)
      output.puts
      output.puts "a  #{@squares['a1']} | #{@squares['a2']} | #{@squares['a3']}"
      output.puts "  ---+---+---"
      output.puts "b  #{@squares['b1']} | #{@squares['b2']} | #{@squares['b3']}"
      output.puts "  ---+---+---"
      output.puts "c  #{@squares['c1']} | #{@squares['c2']} | #{@squares['c3']}"
      output.puts "   1   2   3\n\n"
    end

    def empty_squares
      @squares.reject { |key, value| value != " " }.keys
    end

    def winner
      each_row do |row|
        return row.winner if row.winner
      end
      return " " if full?
      nil
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

    class Row

      def initialize(squares)
        @squares = squares
      end

      def winner
        return "X" if @squares.values.all? { |s| s == "X" }
        return "O" if @squares.values.all? { |s| s == "O" }
        return nil
      end

    end

  private

    def full?
      @squares.values.none? { |s| s == " " }
    end

  end
end
