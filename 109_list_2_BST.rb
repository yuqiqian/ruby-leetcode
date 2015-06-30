# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {ListNode} head
# @return {TreeNode}
def sorted_list_to_bst(head)
	nums = []
	current = head
	while current!= nil
		nums << current.val
		current = current.next
	end
	return sorted_array_to_bst(nums)
end

def sorted_array_to_bst(nums)
	tree_size = nums.length
	if tree_size == 0
		return 
	elsif tree_size == 1
		return TreeNode.new(nums[0])
	else
		root = TreeNode.new(nums[tree_size/2])
		root.left = sorted_array_to_bst(nums[0..tree_size/2-1])
		root.right = tree_size/2+1<=nums.length-1 ? sorted_array_to_bst(nums[tree_size/2+1..-1]) : nil
		return root
	end
end
			