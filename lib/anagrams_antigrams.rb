require 'pry'

class Words

  def anagram(phrase_one, phrase_two)
    phrase_one_words = remove_punctuation(phrase_one)
    phrase_two_words = remove_punctuation(phrase_two)

    phrase_one_clean = remove_space(phrase_one_words)
    phrase_two_clean = remove_space(phrase_two_words)

    array_compare = phrase_one_clean & phrase_two_clean

    if (phrase_one_words.all? { |word| word?(word)}) & (phrase_two_words.all? { |word| word?(word)})
      if array_compare == phrase_one_clean
        "#{phrase_one} and #{phrase_two} are anagrams"
      elsif array_compare.length == 0
        "#{phrase_one} and #{phrase_two} have no letter matches and are antigrams"
      else
        "#{phrase_one} and #{phrase_two} are not anagrams or antigrams"
      end
    else
      'You need to input actual words!'
    end
  end

  def remove_punctuation(phrase)
    punctuation = [".","\,","!","\;",":","-","\(","\)","\'","\"","...", "\{","\}","\[","\]"]
    phrase_array = phrase.split("")
    phrase_without_punctuation = phrase_array.reject{ |letter| punctuation.include?(letter)}
    phrase_without_punctuation.join.split(" ")
  end

  def remove_space(phrase)
    phrase_array = phrase.join.downcase.split("")
    phrase_array.reject{ |char| char == " "}
  end

  def word? (word)
    word_array = word.downcase.split("")
    vowels = ["a","e","i","o", "u", "y"]
    vowels_in_word = vowels & word_array
    vowels_in_word.length > 0
  end

end
