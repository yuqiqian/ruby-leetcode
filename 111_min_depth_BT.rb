def min_depth(root)
	if root == nil
		return 0
	elsif root.left == nil && root.right == nil
		return 1
	elsif root.left == nil
		return 1 + min_depth(root.right)
	elsif root.right == nil
		return 1 + min_depth(root.left)
	else
		return 1 + [min_depth(root.left), min_depth(root.right)].min 
	end
end
			
			