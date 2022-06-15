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
      start = 0
      finish = 3
      finish.upto(row.length-1) do 
        symbols = row[start..finish]
        p symbols, start, finish
        return true if symbols.uniq.length == 1 && symbols[0] != @default_symbol
        start += 1
        finish += 1
      end
    end
    false
  end
end