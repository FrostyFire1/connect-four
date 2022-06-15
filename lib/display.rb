require_relative "board.rb"
class Display
  def initialize(board)
    @board = board
  end

  def show_state
    vertical_line = ' │'
    horizontal_line = '─'
    row_length = @board.state[0].length
    column_inputs = Array.new(row_length) {|i| i+1}
    puts "  #{column_inputs.join("  ")}"
    @board.state.each do |row|
      row_state = row.join(vertical_line)
      puts "#{vertical_line}#{row_state}#{vertical_line}"
    end
    rows = @board.state.length
    bottom_line = horizontal_line * (rows * 3 + 2)
    puts " └#{bottom_line}┘"
  end

  def get_column
    input = gets.chomp.to_i
    row_length = @board.state[0].length
    return input if input.between?(1, row_length)
  end
end