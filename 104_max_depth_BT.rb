def max_depth(root)
	if root == nil
		return 0
	else
		return 1+[max_depth(root.left), max_depth(root.right)].max
	end
end