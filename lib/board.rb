class Board
  attr_reader(:state,:default_symbol)
  def initialize(default_symbol)
    @default_symbol = default_symbol
    @state = Array.new(6) {Array.new(7, default_symbol)}
  end

  def win?
    false
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
end