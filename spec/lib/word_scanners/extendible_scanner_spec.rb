require "spec_helper"

describe WordScanners::ExtendibleScanner do
  let(:dictionary) {
    ScanningDictionaries.small_dictionary_with_duplications
  }
  let(:scanner) { described_class.new(scanning_engine) }
  let(:scanning_engine) { double(scan: scan_result) }
  
  let(:scan_result) {
    ScanningResults.small_dictionary_scan_result
  }

  context "when not provided with any post processors" do
    it "returns correct unmodified scanning result" do
      expect(scanner.scan(dictionary)).to eq scan_result
    end
  end

  context "when provided with a collection of post processors" do
    class TestFormatProcessor
      def self.process(result)
        result.map do |data_set|
          "#{data_set[0]} + #{data_set[1]} => #{data_set[2]}"
        end
      end
    end

    class TestLineIndenterProcessor
      def self.process(result)
        result.map do |data_set|
          "    " + data_set
        end
      end
    end
    
    let(:post_processors) {
      [ TestFormatProcessor,TestLineIndenterProcessor ]
    }
    let(:modified_scan_result) {
      ["    al + bums => albums",
       "    bar + ely => barely",
       "    be + foul => befoul"]
    }
    it "returns correctly modified scanning result" do
      expect(scanner.scan(dictionary,post_processors)).to eq modified_scan_result
    end
  end
end