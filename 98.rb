#Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
	inorder = inorder_traversal(root)
	0.upto(inorder.length-2) do |i|
		if inorder[i] >= inorder[i+1]
			return false
		end
	true

end

def inorder_traversal(root)
	if root == nil
		return []
	end

	stack = [root]
	current = root.left
	result = []
	while stack.length != 0 || current != nil
		while current != nil
			stack << current
			current = current.left
		end

		current = stack.pop()
		result << current.val
		current = current.right
	end
	result
end
