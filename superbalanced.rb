# Write a method to see if a binary tree is "superbalanced" (a new tree property we just made up).
# A tree is "superbalanced" if the difference between the depths of any two leaf nodes is no greater than one.

class BinaryTreeNode
  attr_accessor :value
  attr_reader :left, :right

  def initialize(value)
    @value = value
    @left  = nil
    @right = nil
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value)
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value)
  end
end

# -- Brainstorming --
# we'll need to check the depths of each terminal node
# as we go, keep track of those depths and return false if any of them have a difference of two
# just keep track of the min/max depth? 
# a node is terminal if !node.left && !node.right
# DFS should be a good approach for finding leaves- lets try that while keeping track of depths
# we can return false if the difference between any two depths is > 1
# also can return false if we have more than two unique depths in our array


def superbalanced?(root)
  return true if !root.left && !root.right
  depths = []
  nodes = [[root, 0]]
  until nodes.empty?
    node, cur_depth = nodes.pop
    if !node.left && !node.right
      unless depths.include?(cur_depth)
        depths << cur_depth
        if depths.length > 2 || 
        depths.length == 2 && (depths[0] - depths[1]).abs > 1
          return false
        end
      end
    else
      nodes << [node.left, cur_depth + 1] if node.left
      nodes << [node.right, cur_depth + 1] if node.right
    end
  end
  true
end


tree = BinaryTreeNode.new(1)
left = tree.insert_left(2)
left_left = left.insert_left(3)
left.insert_right(4)
left_left.insert_left(5)
left_left.insert_right(6)
right = tree.insert_right(7)
right_right = right.insert_right(8)
right_right_right = right_right.insert_right(9)
right_right_right.insert_right(10)
p superbalanced?(tree)
