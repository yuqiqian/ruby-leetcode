# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def recover_tree(root)
	return root if root.nil?
	stack = [root]
	prev = nil
	curr = root.left
	to_change_left, to_change_right = nil, nil
	while stack.length != 0 || !curr.nil?
		while !curr.nil?
			stack << curr
			curr = curr.left
		end
		curr = stack.pop
		if !prev.nil?
			if to_change_left.nil?
				if prev.val > curr.val
					to_change_left = prev
				end
			else
				if curr.val > to_change_left.val
					to_change_right = prev
					break
				end
			end
		end
		prev = curr
		curr = curr.right
	end
	to_change_right = prev if to_change_right.nil?
	to_change_left.val, to_change_right.val = to_change_right.val, to_change_left.val
	return
end