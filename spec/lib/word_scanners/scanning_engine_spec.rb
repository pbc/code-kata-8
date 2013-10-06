require "spec_helper"

describe WordScanners::ScanningEngine do
  context "looking for six letter words which are composed of two concatenated smaller words" do
    context "when required words can be found" do
      let(:dictionary) {
        ScanningDictionaries.small_dictionary_with_duplications
      }
      let(:scan_result) {
        ScanningResults.small_dictionary_scan_result
      }
      let(:scanner) { described_class.new }
      
      it "returns all required words with no duplicates" do
        expect(scanner.scan(dictionary)).to eq scan_result
      end
    end
  end
end