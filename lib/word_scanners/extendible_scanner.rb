module WordScanners
  class ExtendibleScanner
    def initialize(scanning_engine)
      @scanning_engine = scanning_engine
    end

    def scan(dictionary, post_processors = [])
      result  = scanning_engine.scan(dictionary)
      post_processors.each do |processor|
        result = processor.process(result)
      end
      result
    end

    private

    attr_reader :scanning_engine

  end
end