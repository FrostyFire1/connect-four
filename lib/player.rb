class Player
  attr_reader(:symbol,:name)
  def initialize(name, color, symbol = '⬤')
    @name = name
    @color = to_ansii(color)
    @symbol = @color+symbol+"\e[0m"
  end

  def to_ansii(color)
    foreground = "\e[38;5;"
    case color
    when "red"
      foreground << "9m"
    when "blue"
      foreground << "12m"
    when "yellow"
      foreground << "11m"
    when "green"
      foreground << "10m"
    end
  end
end