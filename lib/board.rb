class Board
  attr_reader(:state,:default_symbol)
  def initialize(default_symbol)
    @default_symbol = default_symbol
    @state = Array.new(6) {Array.new(7, default_symbol)}
  end

  def win?
    [win_row?, win_column?, win_diagonal?].any?
  end
  
  def at(row,column)
    @state[row][column]
  end

  def update(row,column,value)
    @state[row][column] = value
  end

  def win_row?
    @state.each do |row|
      3.upto(row.length-1) do |finish|
        start = finish-3
        symbols = row[start..finish]
        return true if symbols.uniq.length == 1 && symbols[0] != @default_symbol
      end
    end
    false
  end

  def win_column? 
    row_length = @state.length - 1
    column_height = @state[0].length - 1
    0.upto(column_height) do |column|
      3.upto(row_length) do |row_finish|
        start = row_finish - 3
        symbols = []
        start.upto(row_finish) do |row|
          symbols << @state[row][column]
        end
        return true if symbols.uniq.length == 1 && symbols[0] != @default_symbol
      end
    end
    false
  end

  def win_diagonal?
    row_count = @state.length - 1
    column_count = @state[0].length - 1
    0.upto(row_count-3) do |row|
      0.upto(column_count) do |column|
        symbols_down = []
        0.upto(3) do |i|
          symbols_down << @state[row+i][column+i]
        end
        return true if symbols_down.uniq.length == 1 && symbols_down[0] != @default_symbol
      end
    end

    row_count.downto(3) do |row|
      0.upto(column_count) do |column|
        symbols_up = []
        0.upto(3) do |i|
          symbols_up << @state[row-i][column+i]
        end
        return true if symbols_up.uniq.length == 1 && symbols_up[0] != @default_symbol
      end
    end
    false
  end

  def column_full?(column)
    column -= 1 #Arrays start at 0, Player selection starts at 1
    column_symbols = []
    row_count = @state.length - 1
    0.upto(row_count) do |row|
      column_symbols << @state[row][column]
    end
    column_symbols.none? {|symbol| symbol == @default_symbol}
  end
end