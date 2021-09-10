class TreeNode
  attr_accessor :val, :l, :r

  def initialize(val, l = nil, r = nil)
    @val = val
    @l = l
    @r = r
  end
end

class Tree
  def solution(tree)
    return 0 if tree.val.nil?

    traverse(tree, tree.val)
  end

  def traverse(tree, max)
    tree.val >= max ? calculate_sum(1, tree, tree.val) : calculate_sum(0, tree, max)
  end

  def calculate_sum(sum, tree, val)
    sum += traverse(tree.l, val) unless tree.l.nil?
    sum += traverse(tree.r, val) unless tree.r.nil?
    sum
  end
end
