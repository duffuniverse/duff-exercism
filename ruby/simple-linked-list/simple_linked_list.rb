class Element
  attr_reader :datum, :next

  def initialize(value, next_element = nil)
    @datum = value
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :size, :head

  def self.from_a(values)
    values.
      to_a.
      reverse.
      each_with_object(new) { |value, list| list.push(value) }
  end

  def initialize
    @size = 0
    @head = nil
  end

  def empty?
    size.zero?
  end

  def peek
    head.datum if head
  end

  def push(value)
    @head = Element.new(value, @head)
    @size += 1
  end

  def pop
    return if empty?

    @size -= 1
    value = @head.datum
    @head = @head.next
    value
  end

  def each
    return enum_for(:each) unless block_given?

    element = head
    until element.nil?
      yield element.datum
      element = element.next
    end
  end

  def to_a
    each.to_a
  end

  def reverse
    each.with_object(self.class.new) { |value, list| list.push(value) }
  end
end
