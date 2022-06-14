class Display
  def initialize
    @default_symbol = '⬤'
    @state = Array.new(6) {Array.new(7, @default_symbol)}
  end

  def show_state
    vertical_line = ' │'
    horizontal_line = '─'
    @state.each do |row|
      row_state = row.join(vertical_line)
      puts "#{vertical_line}#{row_state}#{vertical_line}"
    end
    rows = @state.length
    bottom_line = horizontal_line * (rows * 3 + 2)
    puts " └#{bottom_line}┘"
  end
end
