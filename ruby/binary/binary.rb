class Binary
  def initialize(string)
    raise ArgumentError, 'Input string must contain only 1 and 0.' unless string.match(/\A[01]+\z/)  

    @string = string 
  end

  def to_decimal
    @string.reverse.each_char.with_index(0).map { |char, index| char.to_i * 2**index }.reduce(:+)
  end
end

module BookKeeping
  VERSION = 2
end
