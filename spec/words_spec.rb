require ('rspec')
require ('word')

describe '#Words' do

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a word') do
      word = Word.new('booger', nil)
      word.save()
      word2 = Word.new('hat', nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe ('#==') do
    it('is the same word, if the word is the same') do
      word = Word.new('booger', nil)
      word.save()
      word2 = Word.new('booger', nil)
      word2.save
      expect(word).to(eq(word2))
    end
  end

  describe ('.find') do
    it('finds a word by id') do
      word = Word.new('booger', nil)
      word.save()
      word2 = Word.new('hat', nil)
      word2.save
      expect(Word.find(word.id)).to(eq(word))
    end
  end


end