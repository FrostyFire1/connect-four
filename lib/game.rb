require_relative "connect_four.rb"
require_relative "player.rb"
player1 = Player.new("John", "red")
player2 = Player.new("Mark","yellow")

game = ConnectFour.new(player1, player2)

game.play_game