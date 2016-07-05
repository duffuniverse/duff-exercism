class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    return [] unless @limit > 1

    unmarked_numbers = range.to_a

    range.each_with_object([]) do |number, memo|
      next unless unmarked_numbers.include?(number)  
      unmarked_numbers.delete_if { |i| i % number == 0 }
      memo << number
    end
  end

  private

  def range
    (2..@limit)
  end
end
