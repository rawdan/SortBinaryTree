require 'spec_helper'
require_relative '../bin/node'
require_relative '../bin/empty_node'
require_relative '../bin/binary_tree'

RSpec.describe BinaryTree::Node do

  it 'can instantiate a node with a value' do
    tree       = BinaryTree::Node.new(3)
    tree.left  = BinaryTree::Node.new(6)
    tree.right = BinaryTree::Node.new(9)

    expect(tree.value).to eq 3
    expect(tree.left.value).to eq 6
    expect(tree.right.value).to eq 9
  end

  it 'can insert values in the proper order' do
    tree = BinaryTree::Node.new(3)
    [1, 9, 6].each {|value| tree.push(value)}

    expect(tree.include?(3)).to be true
    expect(tree.include?(1)).to be true
    expect(tree.include?(9)).to be true
    expect(tree.include?(6)).to be true
    expect(tree.include?(10)).to be false
  end

  it 'can sort a binary tree into an array in order' do
    array = [92, 96, 32, 24, 42, 46, 72, 15, 4]
    tree = BinaryTree.from_array(array)
    expect(tree.to_a).to eq [4, 15, 24, 32, 42, 46, 72, 92, 96]
  end
end