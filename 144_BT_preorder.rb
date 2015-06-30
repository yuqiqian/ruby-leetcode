def preorder_traversal(root)
	if root == nil
		return []
	end

	result = []
	stack = [root]

	while stack.length != 0
		current = stack.pop
		result<<current.val
		if current.right != nil
			stack << current.right
		end
		if current.left != nil
			stack << current.left
		end
	end
	result
end