require "player.rb"

describe Player do

  describe "#to_ansii" do
    subject(:ansii_encoder) { described_class.new("John", "green")}
    context "when supported ansii color is chosen" do

      it "returns correct ansii code for red" do
        ansii_color = ansii_encoder.to_ansii("red")
        expect(ansii_color).to eq("\e[38;5;9m")
      end

      it "returns correct ansii code for blue" do
        ansii_color = ansii_encoder.to_ansii("blue")
        expect(ansii_color).to eq("\e[38;5;12m")
      end

      it "returns correct ansii code for yellow" do
        ansii_color = ansii_encoder.to_ansii("yellow")
        expect(ansii_color).to eq("\e[38;5;11m")
      end

      it "returns correct ansii code for green" do
        ansii_color = ansii_encoder.to_ansii("green")
        expect(ansii_color).to eq("\e[38;5;10m")
      end
    end
  end
end