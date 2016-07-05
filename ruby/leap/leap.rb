module Year
  def self.leap?(value)
    (value % 4).zero? && (value % 100).nonzero? || (value % 400).zero?
  end
end

module BookKeeping
  VERSION = 2 
end

