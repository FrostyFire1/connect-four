require "connect_four.rb"
require "display.rb"
require "player.rb"

describe ConnectFour do

  describe "#place_circle" do
    let(:player1) { Player.new("Marcus", "red")}
    let(:player2) { Player.new("John", "yellow")}
    subject(:connect_game) {described_class.new(player1, player2)}
    context "when a valid column is provided" do

      it "places the circle as far down as possible" do
        board_state = connect_game.instance_variable_get(:@board).state
        connect_game.place_circle(player1,1)
        affected_cell = board_state.last.first
        expect(affected_cell).to eq(player1.symbol)
      end
    end
  end
end
