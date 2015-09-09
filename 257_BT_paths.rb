# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {String[]}
def binary_tree_paths(root)
	res = []
	helper(root, res, "") if !root.nil?
	return res
end

def helper(root, res, curr_path)
	res << curr_path + root.val if root.left.nil? && root.right.nil?
	helper(root.left, res, curr_path+root.val+"->") if !root.left.nil?
	helper(root.right, res, curr_path+root.val+"->") if !root.right.nil?
end
