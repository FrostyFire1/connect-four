require "board.rb"
describe Board do
  describe "#win_row?" do
    subject(:board) { described_class.new('O')}
    context "when player has 4 circles in a row" do
      before do
        board.update(5,3,'B')
        board.update(5,4,'B')
        board.update(5,5,'B')
        board.update(5,6,'B')
      end
      it "returns true" do
        expect(board.win_row?).to be true
      end
    end

    context "when neither player has 4 circles in a row" do
      before do
        board.update(1,1,'A')
        board.update(1,2,'B')
        board.update(1,3,'A')
        board.update(1,4,'A')
      end
      it "returns false" do
        expect(board.win_row?).to be false
      end
    end
  end
end