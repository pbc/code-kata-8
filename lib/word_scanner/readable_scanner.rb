module WordScanner
  class ReadableScanner
    def initialize
      @matching_word_length = 6
      reset_dictionary_data
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
    attr_reader :partial_words
    attr_reader :potential_results

    def find_composite_words(target_word)
      results = []
      matching_word_length.times do |idx|
        splitted_word = split_word_in_two(target_word, idx)

        if both_words_are_valid_partials?(splitted_word)
          puts splitted_word.inspect
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

    def reset_dictionary_data
      @partial_words = []
      @potential_results = []
    end

  end
end