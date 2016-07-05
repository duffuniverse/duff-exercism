module Pangram
  def self.is_pangram?(sentence)
    ('a'..'z').all? { |letter| sentence.downcase.include?(letter) }
  end
end

module BookKeeping
  VERSION = 2
end
