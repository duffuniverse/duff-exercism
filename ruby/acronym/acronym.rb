module Acronym
  def self.abbreviate(long_phrase)
    long_phrase.
      scan(/[A-Z]*[a-z]*/).
      reject { |word| word.empty? }.
      map { |word| word[0] }.
      join.
      upcase
  end
end

module BookKeeping
  VERSION = 1
end
