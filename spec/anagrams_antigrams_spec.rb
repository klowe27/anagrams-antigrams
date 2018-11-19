require 'rspec'
require 'anagrams_antigrams'

describe('Words#anagrams') do
  it('will compare two words and return whether they are anagrams') do
    words = Words.new()
    expect(words.anagram_check('ruby', 'bury')).to(eq('ruby and bury are anagrams'))
  end
end
