class Hexadecimal
  BASE = 16
  SYMBOLS = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    'A' => 10,
    'B' => 11,
    'C' => 12,
    'D' => 13,
    'E' => 14,
    'F' => 15
  }.freeze

  def initialize(hexadecimal_string)
    @hexadecimal_string = hexadecimal_string.upcase
  end

  def to_decimal
    return 0 unless @hexadecimal_string.chars.all? { |c| SYMBOLS.has_key?(c) }

    @hexadecimal_string.
      reverse.
      chars.
      each_with_index.
      inject(0) do |result, (char, index)|
        result + SYMBOLS[char] * BASE**index  
    end
  end
end
