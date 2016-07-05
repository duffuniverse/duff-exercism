# Check out Pat Shaughnessy’s great primer on lazy enumerators
# http://patshaughnessy.net/2013/4/3/ruby-2-0-works-hard-so-you-can-be-lazy 

module Prime
  def self.nth(num)
    raise ArgumentError, 'Number must be more than 0' unless num > 0
    primes = Enumerator.new do |y|
      n = 2
      loop do
        y.yield n

        is_prime = false
        until is_prime
          n += 1

          is_prime = (2..Math.sqrt(n).floor).all? { |i| n % i != 0 }
        end
      end
    end
    primes.lazy.first(num).last
  end
end

