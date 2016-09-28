module BookKeeping
  VERSION = 3
end

class Brackets
  BRACKET_SYMBOLS = {
    '(' => ')',
    '[' => ']',
    '{' => '}'
  }.freeze

  def self.paired?(text)
    text.chars.each_with_object([]) do |char, stack|
      if BRACKET_SYMBOLS.keys.include?(char)
        stack.push(char)
      elsif BRACKET_SYMBOLS.values.include?(char)
        return false unless BRACKET_SYMBOLS[stack.pop] == char
      end
    end.empty?
  end
end

