class PhoneNumber
  INVALID = '0000000000'

  attr_reader :number

  def initialize(number)
    @number = validate(number)
  end

  def area_code
    number[0, 3]
  end

  def to_s
    "(#{number[0, 3]}) #{number[3, 3]}-#{number[6, 4]}"
  end

  private 

  def validate(number)
    return INVALID unless number.match(/\A[()0-9 -.]*\z/)
    clean_number = number.gsub(/\D/, '')
    clean_number.slice!(0) if clean_number.length == 11 && clean_number[0] == '1'
    return INVALID if clean_number.length != 10
    clean_number
  end
end
