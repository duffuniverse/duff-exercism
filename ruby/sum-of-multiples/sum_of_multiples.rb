class SumOfMultiples
  attr_reader :divisors

  def initialize(*divisors)
    @divisors = divisors
  end

  def to(limit)
    (0...limit).select { |n| 
      divisors.any? { |d| n % d == 0 }
    }.reduce(:+) 
  end
end
