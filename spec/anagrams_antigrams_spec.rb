require 'rspec'
require 'anagrams_antigrams'

describe('Words#anagram') do

  it('will compare two words and return whether they are anagrams') do
    words = Words.new()
    expect(words.anagram('ruby', 'bury')).to(eq('ruby and bury are anagrams'))
  end

  it('will account for the possibility that words may have different cases but are still anagrams') do
    words = Words.new()
    expect(words.anagram('Tea', 'Eat')).to(eq('Tea and Eat are anagrams'))
  end

  it('will determine if inputs are words by checking to see if they contain vowels') do
    words = Words.new()
    expect(words.anagram('brwn', 'rnbw')).to(eq('You need to input actual words!'))
  end

  it('will determine if a word is an atigram') do
    words = Words.new()
    expect(words.anagram('space', 'blink')).to(eq('space and blink have no letter matches and are antigrams'))
  end

  it('will account for multiple words being anagrams or antigrams') do
    words = Words.new()
    expect(words.anagram('Young lad.', 'An old guy.')).to(eq('Young lad. and An old guy. are anagrams'))
  end

end
