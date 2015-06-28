# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
	tree_size = nums.length
	if tree_size == 0
		return nil
	elsif tree_size == 1
		root = TreeNode.new(nums[0])
		return root
	else
		binding.pry
		root = TreeNode.new(nums[tree_size/2])
		root.left = sorted_array_to_bst(nums[0..tree_size/2-1])
		root.right = sorted_array_to_bst(nums[tree_size/2+1..-1])
		return root
	end
end