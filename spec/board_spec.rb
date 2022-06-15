require "board.rb"
require "player.rb"
describe Board do
  subject(:board) { described_class.new('O')}
  let(:player1) {instance_double(Player, symbol:"\e[38;5;9m⬤\e[0m")}
  let(:player2) {instance_double(Player, symbol:"\e[38;5;12m⬤\e[0m")}
  describe "#win_row?" do
    context "when player has 4 circles in a row" do
      before do
        state = board.instance_variable_get(:@state)
        state[5][3] = player1.symbol
        state[5][4] = player1.symbol
        state[5][5] = player1.symbol
        state[5][6] = player1.symbol
      end
      it "returns true" do
        expect(board.win_row?).to be true
      end
    end

    context "when neither player has 4 circles in a row" do
      before do
        state = board.instance_variable_get(:@state)
        state[1][1] = player1.symbol
        state[2][2] = player1.symbol
        state[1][3] = player1.symbol
        state[1][0] = player1.symbol
      end
      it "returns false" do
        expect(board.win_row?).to be false
      end
    end
  end

  describe "#win_column?" do
    context "when a player has 4 circles in a column" do
      before do
        state = board.instance_variable_get(:@state)
        state[1][1] = player1.symbol
        state[2][1] = player1.symbol
        state[3][1] = player1.symbol
        state[4][1] = player1.symbol
      end
      it "returns true" do
        expect(board.win_column?).to be true
      end
    end

    context "when neither player has 4 circles in a column" do
      before do
        state = board.instance_variable_get(:@state)
        state[1][1] = player1.symbol
        state[2][2] = player2.symbol
        state[3][1] = player1.symbol
        state[4][3] = player2.symbol
      end
      it "returns false" do
        expect(board.win_column?).to be false
      end
    end

  end

  describe "#win_diagonal?" do
    context "when a player has 4 circles diagonally down" do
      before do
        state = board.instance_variable_get(:@state)
        state[2][3] = player1.symbol
        state[3][4] = player1.symbol
        state[4][5] = player1.symbol
        state[5][6] = player1.symbol
      end
      it "returns true" do
        expect(board.win_diagonal?).to be true
      end
    end

    context "when a player has 4 circles diagonally up" do
      before do
        state = board.instance_variable_get(:@state)
        state[5][3] = player1.symbol
        state[4][4] = player1.symbol
        state[3][5] = player1.symbol
        state[2][6] = player1.symbol
      end
      it "returns true" do
        expect(board.win_diagonal?).to be true
      end
    end

    context "when neither player has 4 circles in a diagonal" do
      before do
        state = board.instance_variable_get(:@state)
        state[5][3] = player1.symbol
        state[4][4] = player2.symbol
        state[2][5] = player2.symbol
        state[2][6] = player1.symbol
      end
      it "returns false" do
        expect(board.win_diagonal?).to be false
      end
    end
  end

  describe "#column_full?" do
    context "when a column is full" do
      before do
        state = board.instance_variable_get(:@state)
        row_count = state.length - 1
        0.upto(row_count) do |row|
          state[row][0] = player1.symbol
        end
      end
      it "returns true" do
        result = board.column_full?(1)
        expect(result).to be true
      end
    end

    context "when a column isn't full" do
      it "returns false" do
        result = board.column_full?(1)
        expect(result).to be false
      end
    end
  end
end