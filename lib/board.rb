class Board
  attr_reader(:state)
  def initialize(default_symbol)
    @state = Array.new(6) {Array.new(7, default_symbol)}
  end
end