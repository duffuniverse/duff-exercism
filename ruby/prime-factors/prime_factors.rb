require 'ostruct'

module PrimeFactors
  def self.for(number)
    return [] unless number > 1

    (2..number).inject(
      OpenStruct.new(
        prime_factors: [], 
        quotient: number
      )
    ) { |memo, divisor|
      break memo if memo.quotient == 1

      loop do
        quotient, remainder = memo.quotient.divmod(divisor) 

        break unless remainder.zero?

        memo.prime_factors << divisor
        memo.quotient = quotient
      end
      
      memo
    }.prime_factors
  end
end
