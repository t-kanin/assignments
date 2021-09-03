class TreeNode 
  attr_accessor :val, :l, :r

  def initialize(val, l=nil, r=nil)
    @val = val
    @l = l
    @r = r
  end
end
  
# max = root node 
def traverse(tree, max)
  sum = 0
  #check if val is higher than root
  if tree.val >= max
    sum = 1
    sum += traverse(tree.l, tree.val) unless tree.l.nil?
    sum += traverse(tree.r, tree.val) unless tree.r.nil?
  else
    sum = 0
    sum += traverse(tree.l, max) unless tree.l.nil?
    sum += traverse(tree.r, max) unless tree.r.nil?
  end
  sum
end 

def solution(tree)
  return 0 if tree.val.nil?

  # max number == tree root
  traverse(tree, tree.val)
end 

#test nil case 
#expct 0 got 0 
tree_nil = TreeNode.new(nil)
p nil_case = solution(tree_nil) 

#tree with only root node 
#expect 1 got 1 
root_tree = TreeNode.new(1)
p root_tree_res = solution(root_tree)

# basic test 
#expect 2 got 2
basic_tree_l = TreeNode.new(7)
basic_tree_r = TreeNode.new(3)
basic_tree = TreeNode.new(5, basic_tree_l,basic_tree_r)

p basic_tree_res = solution(basic_tree)


# test example expect
# expect 4 got 4 
tree_l_l = TreeNode.new(20)
tree_l_r = TreeNode.new(21)
tree_l = TreeNode.new(3, tree_l_l, tree_l_r)

tree_r_l = TreeNode.new(1)
tree_r = TreeNode.new(10, tree_r_l)
tree = TreeNode.new(5, tree_l, tree_r)

p tree_res = solution(tree)

# test exmaple 2  expect 2 
tree_l = TreeNode.new(2, TreeNode.new(8), TreeNode.new(7))
tree = TreeNode.new(8, tree_l, TreeNode.new(6))
p solution(tree)

# test expect 2  got 2
tree_l_l = TreeNode.new(2)
tree_l = TreeNode.new(3, tree_l_l)
tree = TreeNode.new(1, tree_l)
p solution(tree) 
