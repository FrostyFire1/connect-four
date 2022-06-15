require_relative "connect_four.rb"
require_relative "player.rb"

puts "Welcome to connect four!"
puts "Player #1, please enter your name"
player1_name = gets.chomp
puts "Player #2, please enter your name"
player2_name = gets.chomp
player1 = Player.new(player1_name, "red")
player2 = Player.new(player2_name,"yellow")

game = ConnectFour.new(player1, player2)

game.play_game