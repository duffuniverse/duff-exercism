class Anagram
  attr_reader :subject 

  def initialize(subject)
    @subject = subject.downcase
  end

  def match(candidates)
    candidates.select do |candidate|
      subject != candidate.downcase &&
        char_count(subject) == char_count(candidate.downcase)
    end
  end

  private 

  def char_count(word)
    word.chars.reduce({}) { |hash, char| hash.merge(char => hash.fetch(char, 0) + 1) }
  end
end
