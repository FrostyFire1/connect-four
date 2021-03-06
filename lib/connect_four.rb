require_relative "display.rb"
require_relative "player.rb"
class ConnectFour
  def initialize(player1, player2)
    @board = Board.new('◯')
    @display = Display.new(@board)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @potential_winner = nil
  end

  def place_circle(player, column)
    column -= 1 # Arrays start at 0, player chooses from 1 to length of board
    upper_bound = @board.state.length - 1
    upper_bound.downto(0) do |row|
      if @board.at(row,column) == @board.default_symbol
        @board.update(row, column, player.symbol)
        return true
      end
    end
    false
  end

  def next_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def play_turn
    @display.show_state
    puts "Current player: #{@current_player.name}"
    input = @display.get_column
    unless valid_input?(input)
      puts "You selected an invalid column! Please try again"
      sleep 0.75
      return
    end
    column = input.to_i
    place_circle(@current_player, column)
    @potential_winner = @current_player
    next_player 
  end

  def valid_input?(column)
    column = Integer(column) rescue nil
    return false if column.nil? || @board.column_full?(column)
    row_length = @board.state[0].length
    return true if column.between?(1, row_length)
    false
  end

  def play_game
    play_turn until @board.win?
    @display.show_state
    @display.win_message(@potential_winner.name)
  end
end