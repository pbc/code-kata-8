module WordScanners
  class ReadableScanner
    def initialize
      @matching_word_length = 6
    end

    def scan(dictionary)
      process_dictionary(dictionary)

      result = []
      potential_results.each do |target_word|
        composite_words = find_composite_words(target_word)
        if composite_words.length > 0
          result << target_word
        end
      end

      reset_dictionary_data
      
      result
    end

    private

    attr_reader :matching_word_length

    def reset_dictionary_data
      @partial_words = []
      @potential_results = []
    end

    def partial_words
      @partial_words ||= []
    end

    def potential_results
      @potential_results ||= []
    end

    def process_dictionary(dictionary)
      reset_dictionary_data

      dictionary.each do |word|
        if word.length == matching_word_length
          potential_results << word
        elsif word.length < matching_word_length
          partial_words << word
        end
      end
    end
    
    def find_composite_words(target_word)
      results = []
      matching_word_length.times do |idx|
        splitted_word = split_word_in_two(target_word, idx)

        if both_words_are_valid_partials?(splitted_word)
          results << [splitted_word[0], splitted_word[1]]
        end
      end
      results
    end

    def both_words_are_valid_partials?(two_words)
      both_words_present?(two_words) &&
        is_partial_word?(two_words[0]) &&
        is_partial_word?(two_words[1])      
    end

    def both_words_present?(two_words)
      two_words[0].length > 0 && two_words[1].length > 0
    end

    def split_word_in_two(word, letter_idx)
      start_range = 0..letter_idx
      end_range = (letter_idx + 1)..-1
      [ word[start_range], word[end_range] ]
    end

    def is_partial_word?(word)
      partial_words.include? word
    end

  end
end