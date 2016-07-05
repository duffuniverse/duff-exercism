module BookKeeping
  VERSION = 3
end

module Gigasecond
  SECONDS_IN_GIGASECOND = 10**9

  def self.from(starting_time)
    starting_time + SECONDS_IN_GIGASECOND 
  end
end
