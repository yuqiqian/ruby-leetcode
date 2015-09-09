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
def count_unival_subtrees(root)
	count = [0]
	helper(root, count)
	return count[0]
end

def helper(node, count)
	return true if node.nil?
	left = helper(node.left, count)
	right = helper(node.right, count)

	if left && right
		return false if !node.left.nil? && node.val != node.left.val
		return false if !node.right.nil? && node.val != node.right.val
		count[0] += 1
		return true
	end
	return false
end