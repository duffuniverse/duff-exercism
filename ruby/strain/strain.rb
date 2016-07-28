module Enumerable
  def keep
    return to_enum(__method__) unless block_given?
    inject([]) do |memo, element| 
      memo << element if yield element 
      memo
    end
  end

  def discard
    return to_enum(__method__) unless block_given?
    inject([]) do |memo, element| 
      memo << element unless yield element 
      memo
    end
  end
end

=begin
# Awesome method_missing solution
module Strain
  def method_missing(m, *args, &blk)
    case m
    when :keep, :discard
      partition {|e| e if yield(e)}[m == :keep && 0 || 1]
    else
      super
    end
  end

  def respond_to_missing?(*arg)
    [:keep, :discard].include? arg[0]
  end
end

include Strain
=end
