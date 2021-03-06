require "connect_four.rb"
require "display.rb"
require "player.rb"

describe ConnectFour do
  let(:player1) {instance_double(Player,name: "John", symbol:"\e[38;5;9m⬤\e[0m")}
  let(:player2) {instance_double(Player,name: "Mark", symbol:"\e[38;5;12m⬤\e[0m")}
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
    before do
      board = connect_game.instance_variable_get(:@board)
      allow(connect_game).to receive(:play_turn).and_return(nil)
      allow(board).to receive(:win?).and_return(false,true)
      connect_game.instance_variable_set(:@potential_winner, player1)
    end
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

  describe "#valid_input?" do
    context "when a valid column is provided" do
      it "returns true" do
        input = 7
        result = connect_game.valid_input?(input)
        expect(result).to be true
      end
    end
    context "when an invalid column is provided" do
      it "returns false" do
        invalid_1 = 12
        invalid_2 = -23
        result1 = connect_game.valid_input?(invalid_1)
        result2 = connect_game.valid_input?(invalid_2)
        expect(result1).to be false
        expect(result2).to be false
      end
    end
    context "when a non-numeric value is provided" do
      it "returns false" do
        not_valid = 'asdf'
        result = connect_game.valid_input?(not_valid)
        expect(result).to be false
      end
    end
  end

end
