class TreeNode 
  attr_accessor :val,:l,:r 

    def initialize(val, l=nil , r=nil)
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
    sum = 1 # if tree is valid, always count root 
    sum += traverse(tree.l,max) if tree.l != nil 
    sum += traverse(tree.r,max) if tree.r != nil 
  else
    # if val lower than root check left and right node 
    sum += traverse(tree.l, max) if tree.l != nil 
    sum += traverse(tree.r, max) if tree.r != nil
  end 
  sum
end 

def solution(tree)
  return 0 if tree.val == nil
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
#expect 3 got 3 
basic_tree_l = TreeNode.new(7)
basic_tree_r = TreeNode.new(3)
basic_tree = TreeNode.new(5,basic_tree_l,basic_tree_r)

p basic_tree_res = solution(basic_tree) 


# test example expect
# expect 4 got 4 
tree_l_l = TreeNode.new(20)
tree_l_r = TreeNode.new(21)
tree_l = TreeNode.new(3,tree_l_l,tree_l_r)

tree_r_l = TreeNode.new(1) 
tree_r = TreeNode.new(10,tree_r_l)
tree = TreeNode.new(5,tree_l,tree_r)

p tree_res = solution(tree) 
# 		5
# 	3 	10
# 20 21	1
# ans = 4 
  
  