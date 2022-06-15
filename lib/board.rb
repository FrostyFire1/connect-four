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
end