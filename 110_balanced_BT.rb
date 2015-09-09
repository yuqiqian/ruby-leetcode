def is_balanced(root)
	return dfs_height(root) != -1
end
def dfs_height(root)
	return 0 if root.nil?
	left = dfs_height(root.left)
	return -1 if left==-1
	right = dfs_height(root.right)
	return -1 if right == -1

	return -1 if (left-right).abs > 1
	return 1+[left,right].max
end
