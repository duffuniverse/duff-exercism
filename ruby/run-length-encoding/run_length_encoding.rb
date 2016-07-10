module RunLengthEncoding
  def self.encode(input)
    input.gsub(/(.)\1+/) { |s| "#{s.length}#{s[0]}" }
  end

  def self.decode(input)
    input.gsub(/\d+./) { |s| s[-1] * s.to_i }
  end
end

module BookKeeping
  VERSION = 2
end
