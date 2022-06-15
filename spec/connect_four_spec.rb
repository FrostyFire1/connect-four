require "connect_four.rb"
require "display.rb"
require "player.rb"

describe ConnectFour do
  let(:player1) { Player.new("Marcus", "red")}
  let(:player2) { Player.new("John", "yellow")}
  subject(:connect_game) {described_class.new(player1, player2)}
  describe "#place_circle" do

    context "when a valid column is provided" do

      it "places the circle as far down as possible" do
        board_state = connect_game.instance_variable_get(:@board).state
        connect_game.place_circle(player1,1)
        affected_cell = board_state.last.first
        expect(affected_cell).to eq(player1.symbol)
      end
    end

    context "when there's a circle at the bottom" do
      it "places it one column up" do
        board_state = connect_game.instance_variable_get(:@board).state
        board_bound = board_state.length - 1
        connect_game.place_circle(player1,1)
        connect_game.place_circle(player1,1)
        affected_cell = board_state[board_bound-1].first
        expect(affected_cell).to eq(player1.symbol)
      end
    end
  end

  describe "#next_player" do
    it "switches the current player" do
      connect_game.instance_variable_set(:@current_player, player1)
      connect_game.next_player
      cur_player = connect_game.instance_variable_get(:@current_player)
      expect(cur_player).to eq(player2)
    end
  end

  describe "#play_turn" do
    context "when the input is valid" do
      before do
        display = connect_game.instance_variable_get(:@display)
        allow(display).to receive(:gets).and_return('1')
      end

      it "sends message to place_circle" do
        expect(connect_game).to receive(:place_circle)
        connect_game.play_turn
      end
      it "sends message to next_player" do
        expect(connect_game).to receive(:next_player)
        connect_game.play_turn
      end
    end
  end

  describe "#play_game" do
    it "sends message to play_turn" do
      expect(connect_game).to receive(:play_turn)
      connect_game.play_game
    end
    it "sends message to win?" do
      board = connect_game.instance_variable_get(:@board)
      expect(board).to receive(:win?)
      connect_game.play_game
    end
  end
end
