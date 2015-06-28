def is_symmetric(root)
	if root == nil
		return true
	else
		return helper(root.left, root.right)
	end
end

def helper(left, right)
	if left == nil && right ==nil
		return true
	elsif left == nil || right == nil
		return false
	elsif left.val != right.val
		return false
	else
		return helper(left.right, right.left) && helper(left.left, right.right)
	end
end

			
			