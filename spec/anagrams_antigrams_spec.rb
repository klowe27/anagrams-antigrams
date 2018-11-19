require 'rspec'
require 'anagrams_antigrams'

describe('Words#anagram') do
  words = Words.new()

  it('will compare two words and return whether they are anagrams') do
    expect(words.anagram('ruby', 'bury')).to(eq('ruby and bury are anagrams.'))
  end

  it('will account for the possibility that words may have different cases but are still anagrams') do
    expect(words.anagram('Tea', 'Eat')).to(eq('Tea and Eat are anagrams.'))
  end

  it('will determine if inputs are words by checking to see if they contain vowels') do
    expect(words.anagram('brwn', 'rnbw')).to(eq('You need to input actual words!'))
  end

  it('will determine if a word is an atigram') do
    expect(words.anagram('space', 'blink')).to(eq('space and blink have no letter matches and are antigrams.'))
  end

  it('will account for multiple words being anagrams or antigrams') do
    expect(words.anagram('Young lad.', 'An old guy.')).to(eq('Young lad. and An old guy. are anagrams.'))
  end

  it('will check if a phrase is a palindrome') do
    expect(words.anagram('Mad? Am I, Madam?', 'Dam maid mama.')).to(eq('Mad? Am I, Madam? and Dam maid mama. are anagrams. Mad? Am I, Madam? is a palindrome.'))
  end

  it('will list letters in common for phrases that are not anagrams or antigrams') do
    expect(words.anagram('This is a sentence.','Present tense.')).to(eq('This is a sentence. and Present tense. are not anagrams or antigrams, but they do have these letters in common: t s s e n t e n e.'))
  end

end
