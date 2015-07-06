def inorder_traversal(root)
	if root == nil
		return []
	end

	stack = [root]
	current = root.left
	result = []
	while stack.length != 0 || current!= nil
		while current!= nil
			stack << current
			current = current.left
		end

		current = stack.pop
		result << current.val
		current = current.right
	end
	result
end