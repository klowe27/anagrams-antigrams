require 'pry'

class Words
  def initialize(phrase)
    @phrase_one = phrase
  end

  def anagram(phrase_two)
    phrase_one_words = remove_punctuation(@phrase_one)
    phrase_two_words = remove_punctuation(phrase_two)

    phrase_one_clean = remove_space(phrase_one_words)
    phrase_two_clean = remove_space(phrase_two_words)

    letters_in_common = compare_arrays(phrase_one_clean, phrase_two_clean)
    message = "#{@phrase_one} and #{phrase_two}"

    if (phrase_one_words.all? { |word| word?(word)}) & (phrase_two_words.all? { |word| word?(word)})
      if (letters_in_common == phrase_one_clean) & (phrase_one_clean.length == phrase_two_clean.length)
        message += " are anagrams."
      elsif letters_in_common.length == 0
        message +=" have no letter matches and are antigrams."
      else
        message +=" are not anagrams or antigrams, but #{letters_in_common.length} letters match: #{letters_in_common.join(', ')}."
      end

      if palindrome?(phrase_one_clean) | palindrome?(phrase_two_clean)
        message += (palindrome?(phrase_one_clean) ? " #{@phrase_one}" : " #{phrase_two}")
        message += " is a palindrome."
      end

    else
      message ='You need to input actual words!'
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
    punctuation = [".","\,","!","\;",":","-","\(","\)","\'","\"","...","\{","\}","\[","\]","?"]
    phrase_no_punctuation = phrase.split("").reject{ |letter| punctuation.include?(letter)}
    phrase_no_punctuation.join.split(" ")
  end

  def remove_space(phrase)
    phrase_array = phrase.join.downcase.split("")
    phrase_array.reject{ |char| char == " "}
  end

  def word? (word)
    word_array = word.downcase.split("")
    vowels = ["a","e","i","o", "u", "y"]
    vowels_in_word = vowels & word_array
    three_consecutive_letters = word_array.any? {|letter| (letter == (word_array[word_array.index(letter) + 1])) & (letter == (word_array[word_array.index(letter) + 2]))}

    (vowels_in_word.length > 0) & !three_consecutive_letters
  end

  def palindrome? (word)
    word == word.reverse()
  end

end
