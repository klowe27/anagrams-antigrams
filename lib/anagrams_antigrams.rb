require 'pry'

class Words
  def anagram_check(word_one, word_two)
    word_one_array = word_one.split("")
    word_two_array = word_two.split("")
    anagram = word_one_array.all? { |letter| word_two_array.include?(letter) }
    if anagram
      "#{word_one} and #{word_two} are anagrams"
    else
      "#{word_one} and #{word_two} are not anagrams"
    end
  end
end
