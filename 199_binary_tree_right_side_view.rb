def right_side_view(root)
	current_layer = !root.nil? ? [root] : []
	result = []

	while current_layer.length != 0
		result << current_layer[-1].val
		next_layer = []
		current_layer.each do |node|
			next_layer << node.left if !node.left.nil?
			next_layer << node.right if !node.right.nil?
		end

		current_layer = next_layer
	end
	result
end