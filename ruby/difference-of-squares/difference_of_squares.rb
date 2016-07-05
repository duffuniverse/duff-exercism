module BookKeeping
  VERSION = 3
end

class Squares
  def initialize(num)
    @number = num
  end
  
  def square_of_sum
    range.reduce(:+)**2
  end

  def sum_of_squares
    range.map { |n| n**2 }.reduce(:+)
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private 

  def range
    return (0..0) unless @number > 0
    (1..@number)
  end
end
