module Grains
  SQUARES_TOTAL = 64

  def self.square(square_number)
    2**(square_number - 1)
  end

  def self.total
    (1..SQUARES_TOTAL).inject { |sum, n| sum + square(n) }
  end
end
