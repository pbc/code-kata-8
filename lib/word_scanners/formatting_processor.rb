module WordScanners
  class FormatingProcessor
    def self.process(result)
      result.map do |data_set|
        "#{data_set[0]} + #{data_set[1]} => #{data_set[2]}"
      end
    end
  end
end