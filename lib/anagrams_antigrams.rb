require 'pry'

class Words

  def anagram(phrase_one, phrase_two)
    phrase_one_words = remove_punctuation(phrase_one)
    phrase_two_words = remove_punctuation(phrase_two)

    phrase_one_clean = remove_space(phrase_one_words)
    phrase_two_clean = remove_space(phrase_two_words)

    letters_in_common = compare_arrays(phrase_one_clean, phrase_two_clean)
    message =""

    if (phrase_one_words.all? { |word| word?(word)}) & (phrase_two_words.all? { |word| word?(word)})
      if letters_in_common == phrase_one_clean
        message += "#{phrase_one} and #{phrase_two} are anagrams."
      elsif letters_in_common.length == 0
        message +="#{phrase_one} and #{phrase_two} have no letter matches and are antigrams."
      else
        message +="#{phrase_one} and #{phrase_two} are not anagrams or antigrams."
      end

      if palindrome?(phrase_one_clean) | palindrome?(phrase_two_clean)
        message += " "
        message += (palindrome?(phrase_one_clean) ? "#{phrase_one}" : "#{phrase_two}")
        message += " is a palindrome."
      end

    else
      message +='You need to input actual words!'
    end
    message
  end

  def compare_arrays(array_one, array_two)
    letters_in_common = []
    one = array_one.dup
    two = array_two.dup
    one.each do |letter|
      if two.include?(letter)
        letters_in_common.push(letter)
        two.slice!(two.index(letter))
      end
    end
    letters_in_common
  end

  def remove_punctuation(phrase)
    punctuation = [".","\,","!","\;",":","-","\(","\)","\'","\"","...", "\{","\}","\[","\]","?"]
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

  def palindrome? (word)
    word == word.reverse()
  end

end
