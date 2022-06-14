require './display.rb'
class ConnectFour
  def initialize(player1, player2)
    @board = Display.new
    @player1 = player1
    @player2 = player2
  end
end