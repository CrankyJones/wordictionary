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


end