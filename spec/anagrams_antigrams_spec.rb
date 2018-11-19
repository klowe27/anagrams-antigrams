require 'rspec'
require 'anagrams_antigrams'

describe('Words#anagram') do

  it('will compare two words and return whether they are anagrams') do
    words = Words.new('ruby')
    expect(words.anagram('bury')).to(eq('ruby and bury are anagrams.'))
  end

  it('will account for the possibility that words may have different cases but are still anagrams') do
    words = Words.new('Tea')
    expect(words.anagram('Eat')).to(eq('Tea and Eat are anagrams.'))
  end

  it('will determine if inputs are words by checking to see if they contain vowels') do
    words = Words.new('brwn')
    expect(words.anagram('rnbw')).to(eq('You need to input actual words!'))
  end

  it('will determine if a word is an atigram') do
    words = Words.new('space')
    expect(words.anagram('blink')).to(eq('space and blink have no letter matches and are antigrams.'))
  end

  it('will account for multiple words being anagrams or antigrams') do
    words = Words.new('Young lad.')
    expect(words.anagram('An old guy.')).to(eq('Young lad. and An old guy. are anagrams.'))
  end

  it('will check if a phrase is a palindrome') do
    words = Words.new('Mad? Am I, Madam?')
    expect(words.anagram('Dam maid mama.')).to(eq('Mad? Am I, Madam? and Dam maid mama. are anagrams. Mad? Am I, Madam? is a palindrome.'))
  end

  it('will list letters in common for phrases that are not anagrams or antigrams') do
    words = Words.new('This is a sentence.')
    expect(words.anagram('Present tense.')).to(eq('This is a sentence. and Present tense. are not anagrams or antigrams, but 9 letters match: t, s, s, e, n, t, e, n, e.'))
  end

end
