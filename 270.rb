# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Float} target
# @return {Integer}
def closest_value(root, target)
    wrapper = helper(root, target)
    return wrapper[0]
end

def helper(root, target)
	cur_diff = root.val-target
	if cur_diff.zero?
		return [root.val, 0]
	elsif root.val > target
		return [root.val, cur_diff] if root.left.nil?
		next_val, next_diff = helper(root.left, target)
		if next_diff.abs < cur_diff.abs
			return [next_val, next_diff]
		else
			return [root.val, cur_diff]
		end
	else
		return [root.val, cur_diff] if root.right.nil?
		next_val, next_diff = helper(root.right, target)
		if next_diff.abs < cur_diff.abs
			return [next_val, next_diff]
		else
			return [root.val, cur_diff]
		end
	end
end

			
