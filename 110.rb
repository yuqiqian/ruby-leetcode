def is_balanced(root)
	return helper(root)[0]
end
def helper(current)
	if current == nil
		return [true, 0]
	else
		left = helper(current.left)
		if left[0] == false
			return [false, -1]
		end

		right = helper(current.right)
		if right[0]==false
			return [false, -1]
		end

		if (left[1]-right[1]).abs <= 1
			height = [left[1], right[1]].max + 1
			return [true, height]
		else
			return [false, -1]
		end
	end
end