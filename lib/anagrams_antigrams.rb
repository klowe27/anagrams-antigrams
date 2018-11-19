require 'pry'

class Words
  
  def anagram(word_one, word_two)
    word_one_array = word_one.downcase.split("")
    word_two_array = word_two.downcase.split("")
    array_compare = word_one_array & word_two_array

    if word?(word_one_array) & word?(word_two_array)
      if array_compare == word_one_array
        "#{word_one} and #{word_two} are anagrams"
      else
        "#{word_one} and #{word_two} are not anagrams"
      end
    else
      'You need to input actual words!'
    end
  end

  def word? (word_array)
    vowels = ["a","e","i","o", "u", "y"]
    vowels_in_word = vowels & word_array
    vowels_in_word.length > 0
  end

end
