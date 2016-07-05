module BookKeeping
  VERSION = 1
end

class Phrase
  def initialize(expression)
    @words = expression.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    @words.reduce({}) { |hash, word| hash.merge(word => hash.fetch(word, 0) + 1) }
  end
end
