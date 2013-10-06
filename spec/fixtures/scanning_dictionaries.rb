module ScanningDictionaries
  class << self
    def word_list_path
      WORD_LIST_PATH
    end

    def small_dictionary_with_duplications
      [
        "tailor", 
        "albums", "al", "bums",
        "somelongword",
        "barely", "bar", "ely",
        "barely", "bar", "ely",
        "barely", "bar", "ely",
        "abc",
        "befoul", "be", "foul"
      ]
    end

    def word_list_dictionary
      File.read(word_list_path).split("\r\n")
    end
  end
end