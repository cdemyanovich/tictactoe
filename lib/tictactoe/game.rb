module TicTacToe
  class Game

    def initialize(board, output, input)
      @board = board
      @output = output
      @input = input
      @o_player = UnbeatablePlayer.new
    end

    def play
      until @board.winner
        @board.draw @output
        @output.print "Your move? (format: b3) "

        square = @input.gets.chomp.downcase
        until @board.empty_squares.include?(square.to_sym)
          print "Invalid move. Try again. "
          square = @input.gets.chomp.downcase
        end

        @board.mark(square, "X")
        break if @board.winner

        @o_player.move(@board)
      end

      @board.draw(@output)
      announce_winner(@board.winner)
    end

    def announce_winner(winner)
      if winner == "X"
        @output.puts "X wins. Looks like I need to work on the 'un' in 'unbeatable'. :-/"
      elsif winner == "O"
        @output.puts "O wins! I'm unbeatable!"
      elsif winner == " "
        @output.puts "Draw. Let's play again."
      end
      @output.puts
    end
  end
end
