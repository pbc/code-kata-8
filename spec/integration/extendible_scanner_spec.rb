require "spec_helper"

describe WordScanners::ExtendibleScanner do
  context "looking for six letter words which are composed of two concatenated smaller words" do
    context "when required words can be found" do
      let(:dictionary) {
        ::ScanningDictionaries.word_list_dictionary        
      }
      let(:scan_result) { ::ScanningResults.word_list_scan_result }
      
      let(:scanner) { described_class.new(scanning_engine) }
      let(:scanning_engine) { WordScanners::ScanningEngine.new }
      
      it "returns all required words with no duplicates" do
        expect(scanner.scan(dictionary)).to eq scan_result
      end
    end
  end
end