require 'rspec'
require 'anagrams_antigrams'

describe('Words#anagram') do

  it('will compare two words and return whether they are anagrams') do
    words = Words.new()
    expect(words.anagram('ruby', 'bury')).to(eq('ruby and bury are anagrams'))
  end

  it('will account for the possibility that words may have different cases, but are still anagrams') do
    words = Words.new()
    expect(words.anagram('Tea', 'Eat')).to(eq('Tea and Eat are anagrams'))
  end

end
