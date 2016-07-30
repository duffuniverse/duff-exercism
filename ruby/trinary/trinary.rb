class Trinary
  def initialize(trinary_number)
    @trinary = trinary_number  
  end

  def to_decimal
    return 0 unless valid?
    @trinary.reverse.chars.map(&:to_i).each_with_index.inject(0) { |sum, (digit, index)| 
      sum + digit * 3 ** index 
    }
  end

  private 

  def valid?
    @trinary.match(/\A[012]+\z/)
  end
end

module BookKeeping
  VERSION = 1
end
