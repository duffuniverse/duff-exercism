module Enumerable
  def keep
    each_with_object([]) { |element, memo| memo << element if yield(element) }
  end

  def discard
    each_with_object([]) { |element, memo| memo << element unless yield(element) }
  end
end
