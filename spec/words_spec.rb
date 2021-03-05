require ('rspec')
require ('word')

describe '#Words' do

  before(:each) do
    Word.clear
  end

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

  describe('#definitions') do
    it('returns a words defintions') do
      word = Word.new('booger', nil)
      word.save
      definition = Definition.new('a stinky garbage can', word.id, nil)
      definition.save
      definition2 = Definition.new('a scenic view', word.id, nil)
      definition2.save
      expect(word.definitions).to(eq([definition, definition2]))
    end
  end

  describe('#update') do
    it('will change the current word') do
      word = Word.new('booger', nil)
      word.save
      word.update('hats')
      expect(word.word).to(eq('hats'))
    end
  end

  describe('#delete') do
    it('will delete the current word from the list') do
      word = Word.new('booger', nil)
      word.save()
      word2 = Word.new('hat', nil)
      word2.save
      word.delete
      expect(Word.all).to(eq([word2]))
    end
  end
  
end