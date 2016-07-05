module Hamming
  def self.compute(one_strand, another_strand)
    raise ArgumentError, 'Strands must have same length' unless one_strand.length == another_strand.length
    one_strand.chars.zip(another_strand.chars).count{ |ary| ary.first != ary.last }
  end
end

module BookKeeping
  VERSION = 3 
end
