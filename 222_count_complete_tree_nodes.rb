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
def count_nodes(root)
	return 0 if root.nil?
	hl = hr = 0
	left = root
	right = root
	while !left.nil?
		hl +=1
		left = left.left
	end
	while !right.nil?
		hr += 1
		right = right.right
	end
	if hl == hr
		return 2**hl - 1
	end
	return 1+count_nodes(root.left)+count_nodes(root.right)
end