def invert_tree(root)
	return nil if root.nil?
	if !root.left.nil?
		invert_tree(root.left)
	end
	if !root.right.nil?
		invert_tree(root.right)
	end
	root.left, root.right = root.right, root.left
	return root
end