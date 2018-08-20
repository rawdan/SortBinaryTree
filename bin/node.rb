require_relative '../bin/empty_node'

module BinaryTree

  class Node

    attr_reader :value
    attr_accessor :left
    attr_accessor :right

    def initialize(value)
      @value = value
      @left = BinaryTree::EmptyNode.new
      @right = BinaryTree::EmptyNode.new
    end

    def push(my_value)
      case value <=> my_value
      when 1 then push_left(my_value)
      when -1 then push_right(my_value)
      when 0 then false
      end
    end
    alias_method :<<, :push

    def inspect
      "{#{value}::#{left.inspect}|#{right.inspect}}"
    end

    def include?(my_value)
      case value <=> my_value
      when 1 then left.include?(my_value)
      when -1 then right.include?(my_value)
      when 0 then true
      end
    end

    def to_a
      left.to_a + [value] + right.to_a
    end


    private

    def push_left(value)
      left.push(value) || self.left = Node.new(value)
    end

    def push_right(value)
      right.push(value) || self.right = Node.new(value)
    end
  end
end