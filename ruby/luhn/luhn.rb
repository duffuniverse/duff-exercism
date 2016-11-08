class Luhn
  def self.create(partial_number)
    number = partial_number * 10
    luhn = new(number)
    if luhn.valid?
      number
    else 
      number + 10 - luhn.checksum % 10
    end
  end

  def initialize(num)
    @number = num
  end

  def addends
    @addends ||= digits.
      reverse.
      map.
      with_index { |digit, index| convert(digit, index) }.
      reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  private

  def digits
    @number.
      to_s.
      chars.
      map(&:to_i)
  end

  def convert(digit, index)
    if index % 2 == 0
      digit
    else
      (digit * 2 > 10) ? ((digit * 2) - 9) : (digit * 2)
    end
  end
end
