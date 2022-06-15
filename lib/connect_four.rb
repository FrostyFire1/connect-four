require_relative "display.rb"
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
    column = @display.get_column
    place_circle(@current_player, column) unless column.nil?
    next_player
  end
end