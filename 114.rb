def helper(root)
	if root == nil
		return nil
	else
		left = root.left
		right = root.right
		root.left = nil
		current = root

		current.right = helper(left)
		while current.right != nil
			current = current.right
		end

		current.right = helper(right)
		return root
	end
end

def flatten(root)
	helper(root)
	return
end