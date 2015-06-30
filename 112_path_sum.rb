def has_path_sum(root, sum)
	if root == nil
		return false
	elsif root.left == nil && root.right == nil
		return root.val == sum
	elsif root.left == nil
		return has_path_sum(root.right, sum-root.val)
	elsif root.right == nil
		return has_path_sum(root.left, sum-root.val)
	else
		return has_path_sum(root.left, sum-root.val) || has_path_sum(root.right, sum-root.val)
	end
end
			
			
			
