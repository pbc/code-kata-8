require "spec_helper"

describe WordScanner::ReadableScanner do
  context "looking for six letter words which are composed of two concatenated smaller words" do
    context "when required words can be found" do
      let(:dictionary) {
        [
          "tailor", 
          "albums", "al", "bums",
          "somelongword",
          "barely", "bar", "ely",
          "abc",
          "befoul", "be", "foul"
        ]
      }
      let(:scan_result) { ["albums","barely","befoul"] }
      let(:scanner) { described_class.new }
      it "returns all the words" do
        expect(scanner.scan(dictionary)).to eq scan_result
      end
    end
  end
end