def kth_smallest(root, k)
	stack = []
	node = root
	while !node.nil?
		stack << node
		node = node.left
	end
	x = 1
	while stack.length != 0 && x <= k
		node = stack.pop
		x += 1
		right = node.right
		while !right.nil?
			stack << right
			right = right.left
		end
	end
	return node.val
end