def path_sum(root, sum)
	if root == nil
		return []
	elsif root.left == nil && root.right == nil
		if root.val == sum
			return [[root.val]]
		else
			return []
		end
	elsif root.left == nil
		result = path_sum(root.right, sum-root.val)
		new_result = []
		result.each {|item| new_result << [root.val] + item}
		return new_result
	elsif root.right == nil
		result = path_sum(root.left, sum-root.val)
		new_result = []
		result.each {|item| new_result << [root.val] + item}
		return new_result
	else
		result = path_sum(root.left, sum-root.val)
		result = result + path_sum(root.right, sum-root.val)
		new_result = []
		result.each {|item| new_result << [root.val] + item}
		return new_result
	end
end
