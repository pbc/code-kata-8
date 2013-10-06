module WordScanners
  class ExtendibleScanner
    def initialize(scanner_options)
      @scanner_options = scanner_options
    end
    
    def scan(dictionary)
      create_scanning_engine.scan(dictionary)
    end

    private

    attr_reader :scanner_options

    def prepare_engine_options
      {
        matching_word_length: scanner_options[:matching_word_length]
      }
    end

    def create_scanning_engine
      ::WordScanners::ScanningEngine.new(prepare_engine_options)
    end

  end
end