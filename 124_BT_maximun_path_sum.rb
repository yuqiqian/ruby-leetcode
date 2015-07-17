def max_path_sum(root)
	return helper(root)[0]
end

def helper(root)
	this_tree = root.val
	to_upper = root.val

	left, right = nil, nil
	if !root.left.nil?
		left = helper(root.left)
		to_upper = [to_upper, root.val+left[1]].max
		this_tree = [this_tree, to_upper, left[0]].max
	end
	if !root.right.nil?
		right = helper(root.right)
		to_upper = [to_upper, root.val+right[1]].max
		this_tree = [this_tree, to_upper, right[0]].max
	end

	if !left.nil? && !right.nil?
		this_tree = [this_tree, root.val + left[1]+right[1]].max
	end

	return this_tree, to_upper
end