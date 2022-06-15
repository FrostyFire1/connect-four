require_relative "display.rb"
require_relative "player.rb"
class ConnectFour
  def initialize(player1, player2)
    @board = Board.new('◯')
    @display = Display.new(@board)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def place_circle(player, column)
    column -= 1 # Arrays start at 0, player chooses from 1 to length of board
    upper_bound = @board.state.length - 1
    upper_bound.downto(0) do |row|
      if @board.state[row][column] == @board.default_symbol
        @board.state[row][column] = player.symbol
        return
      end
    end
  end

  def next_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def play_turn
    @display.show_state
    column = @display.get_column
    return if column.nil?
    place_circle(@current_player, column)
    next_player 
  end

  def play_game
    play_turn until @board.win?
  end
end