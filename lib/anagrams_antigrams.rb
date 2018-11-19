require 'pry'

class Words
  def anagram(word_one, word_two)
    word_one_array = word_one.downcase.split("")
    word_two_array = word_two.downcase.split("")
    array_compare = word_one_array & word_two_array

    if array_compare == word_one_array
      "#{word_one} and #{word_two} are anagrams"
    else
      "#{word_one} and #{word_two} are not anagrams"
    end

  end

  def word? (word_one_array, word_two_array)
    vowels = ["a","e","i","o", "u", "y"]
  end

end
