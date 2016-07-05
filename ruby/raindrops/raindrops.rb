module BookKeeping
  VERSION = 2
end

module Raindrops
  PRIME_FACTOR_TO_STRING = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze

  def self.convert(number)
    result = PRIME_FACTOR_TO_STRING.keys.each_with_object('') { |key, acc| 
      acc << PRIME_FACTOR_TO_STRING[key] if number % key == 0
    }
    return number.to_s if result.empty?
    result
  end
end


