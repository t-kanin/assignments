class TreeNode
  attr_accessor :val, :l, :r

  def initialize(arr)
    @val = arr[0]

    @l =  if arr[1].is_a?(Array)
            @l = TreeNode.new(arr[1])
          else
            @l = arr[1]
          end

    @r =  if arr[2].is_a?(Array)
            @r = TreeNode.new(arr[2])
          else
            @r = arr[2]
          end
  end
end

class Tree
  def solution(tree)
    return 0 if tree.nil?

    traverse(tree, tree.val)
  end
  
  def traverse(tree, max)
    tree.val >= max ? calculate_sum(1, tree, tree.val) : calculate_sum(0, tree, tree.val)
  end

  def calculate_sum(sum, tree, val)
    sum += traverse(tree.l, val) unless tree.l.nil?
    sum += traverse(tree.r, val) unless tree.r.nil?
    sum
  end
end
