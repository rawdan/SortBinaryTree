module BinaryTree

  def self.from_array(array)
    Node.new(array.first).tap do |tree|
      array.each {|value| tree.push value }
    end
  end

end