require 'spec_helper'

module TicTacToe

  describe Game, '#announce_winner' do

    before(:each) do
      @board = double('board').as_null_object
      @output = double('output').as_null_object
      input = double('input').as_null_object
      @game = Game.new(@board, @output, input)
    end

    it "shamefully admits defeat if X wins" do
      expect(@output).to receive(:puts).with("X wins. Looks like I need to work on the 'un' in 'unbeatable'. :-/")
      @game.announce_winner("X")
    end

    it "boastfully declares victory if O wins" do
      expect(@output).to receive(:puts).with("O wins! I'm unbeatable!")
      @game.announce_winner("O")
    end

    it "casually notes a tie" do
      expect(@output).to receive(:puts).with("Draw. Let's play again.")
      @game.announce_winner(" ")
    end

  end

end
