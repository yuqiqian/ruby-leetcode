def level_order(root)
	if root == nil
		return []
	end

	result = []
	next_layer = [root]
	while next_layer.length != 0
		result << next_layer
		next_layer = []
		result[-1].each do |father|
			if father.left != nil
				next_layer << father.left
			end
			if father.right != nil
				next_layer << father.right
			end
		end
	end
	result = result.map{|layer| layer.map{|node| node.val}}
	result
end
