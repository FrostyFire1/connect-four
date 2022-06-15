require_relative "board.rb"
class Display
  def initialize(board)
    @board = board
  end

  def show_state
    vertical_line = ' │'
    horizontal_line = '─'
    @board.state.each do |row|
      row_state = row.join(vertical_line)
      puts "#{vertical_line}#{row_state}#{vertical_line}"
    end
    rows = @board.state.length
    bottom_line = horizontal_line * (rows * 3 + 2)
    puts " └#{bottom_line}┘"
  end
end
