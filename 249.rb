# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer}
def count_unival_subtrees(root)
    return 0 if root.nil?
    return helper(root)[2]
end

def helper(root)
	if root.left.nil? && root.right.nil?
		return [root.val, true, 1]
	else
		left, right = nil, nil
		left = helper(root.left) if !root.left.nil?
		right = helper(root.right) if !root.right.nil?
		if !left.nil? && !right.nil?
			count = left[2]+right[2]
			val = left[0]==right[0] ? left[0] : nil
			flag = left[1] && right[1]
		elsif left.nil?
			count = right[2]
			val = right[0]
			flag = right[1]
		elsif right.nil?
			count = left[2]
			val = left[0]
			flag = left[1]
		end
		binding.pry
		if flag && !val.nil? && val == root.val
			return [root.val, true, count+1]
		else
			return [root.val, false, count]
		end
	end
end