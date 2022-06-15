require "display.rb"
require "board.rb"
describe Display do
  let(:board) { Board.new('◯')}
  subject(:display) { described_class.new(board)}
  describe "#get_column" do
    context "when the provided column is valid" do
      before do
        allow(display).to receive(:gets).and_return('7')
      end
      it "returns the column" do
        result = display.get_column
        expect(result).to eq(7)
      end
    end

    context "when the provided column is invalid once" do
      before do
        allow(display).to receive(:gets).and_return('asdf','7')
      end
      it "displays error message" do
        expect(display).to receive(:puts).with("Invalid column! Please try again").once
        display.get_column
      end
    end
  end
end