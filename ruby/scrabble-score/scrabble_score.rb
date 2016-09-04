class Scrabble
  DEFAULT_SCORE = 0
  LETTER_VALUES = {
    ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
    ["D", "G"] => 2,
    ["B", "C", "M", "P"] => 3,
    ["F", "H", "V", "W", "Y"] => 4,
    ["K"] => 5,
    ["J", "X"] => 8,
    ["Q", "Z"] => 10
  }.freeze

  def self.score(word)
    return DEFAULT_SCORE unless word

    word.
      upcase.
      chars.
      map do |char| 
        LETTER_VALUES.keys.find do |key|
          key.include?(char)
        end
      end.
      compact.
      map { |key| LETTER_VALUES[key] }.
      reduce(DEFAULT_SCORE, :+)
  end

  def initialize(word)
    @word = word
  end

  def score
    self.class.score(@word)
  end
end
