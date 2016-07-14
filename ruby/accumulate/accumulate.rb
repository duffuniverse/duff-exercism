class Array
  def accumulate
    # It is typical to call #to_enum when defining methods for a generic Enumerable, in case no block is passed.
    # http://ruby-doc.org/core-2.3.1/Object.html#method-i-to_enum
    return to_enum(__method__) unless block_given? # __method__ is :accumulate here

    reduce([]) { |memo, element|
      memo << yield(element)
    }
  end
end
