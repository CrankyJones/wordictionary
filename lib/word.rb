class Word

  attr_reader :id
  attr_accessor :word
  @@words = {}
  @@total_count = 0

  def initialize (word, id)
    @word = word
    @id = (id || @@total_count += 1)
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new(self.word, self.id)
  end

  def ==(word_to_compare)
    self.word() == word_to_compare.word()
  end

end