require ('rspec')
require ('definition')

describe '#Definition' do

  before(:each) do
    Definition.clear()
    Word.clear()
    @word = Word.new('booger', nil)
    @word.save
  end

  describe('.all') do
    it("returns an empty array when there are no definitions") do
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a definition') do
      definition = Definition.new('a stinky garbage can', @word.id, nil)
      definition.save()
      definition2 = Definition.new('a scenic view', @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe ('#==') do
    it('is the same word, if the word is the same') do
      definition = Definition.new('a stinky garbage can', @word.id, nil)
      definition.save()
      definition2 = Definition.new('a stinky garbage can', @word.id, nil)
      definition2.save()
      expect(definition).to(eq(definition2))
    end
  end

  describe ('.find') do
    it('finds a word by id') do
      definition = Definition.new('a stinky garbage can', @word.id, nil)
      definition.save()
      definition2 = Definition.new('a scenic view', @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe ('#update') do
    it ('updates a definition') do
      definition = Definition.new('a stinky garbage can', @word.id, nil)
      definition.save
      definition.update('a pleasant garbage can', @word.id)
      expect(definition.definition).to(eq('a pleasant garbage can'))
    end
  end

  describe('#delete') do
    it ('deletes a definition') do
      definition = Definition.new('a stinky garbage can', @word.id, nil)
      definition.save
      definition2 = Definition.new('a scenic view', @word.id, nil)
      definition2.save
      definition.delete
      expect(Definition.all).to(eq([definition2]))
    end
  end

end
