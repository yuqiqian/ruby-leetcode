# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def sum_numbers(root)
	if root == nil
		return 0
	else
		return helper(root).map{|item| item[0]}.inject(:+)
	end
end

def helper(root)
	if root.left == nil && root.right == nil
		return [[root.val, 1]]
	end
	temp = []
	if root.left != nil
		temp = temp + helper(root.left)
	end

	if root.right != nil
		temp = temp + helper(root.right)
	end

	result = []
	temp.each{|item| result << [(10**item[1])*root.val+item[0], item[1]+1]}
	return result
end