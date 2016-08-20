class Bst
  VERSION = 1

  def initialize(number)
    @root = Node.new(number) 
  end

  def insert(number)
    create_descendant(@root, number)
  end

  def method_missing(method_name, *arguments, &block)
    case method_name 
    when :data, :left, :right, :each
      @root.send(method_name, *arguments, &block)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    [:data, :left, :right, :each].include?(method_name) || super
  end

  private

    def create_descendant(node, number)
      subtree = (number <= node.data) ? :left : :right

      child = node.send(subtree)
      if child
        create_descendant(child, number)
      else
        create_child(node, subtree, number)
      end
    end

    def create_child(parent, subtree, number)
      parent.send(subtree.to_s + '=', Node.new(number)) 
    end
end

class Node
  include Enumerable

  attr_accessor :data, :left, :right

  def initialize(number)
    @data = number
  end

  def each(&block)
    return to_enum(__method__) unless block_given?

    left.each(&block) if left
    block.call(self.data)
    right.each(&block) if right
  end
end
