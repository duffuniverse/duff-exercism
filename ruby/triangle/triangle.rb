class Triangle
  attr_reader :kind

  def initialize(*sides)
    @sides = sides

    raise TriangleError unless is_triangle?

    @kind = case @sides.uniq.length
       when 1 then :equilateral
       when 2 then :isosceles
       else :scalene
       end
  end

  private

  def is_triangle?
    sorted = @sides.sort
    greatest_side = sorted.pop
    greatest_side < sorted.reduce(:+)
  end
end

class TriangleError < StandardError; end

