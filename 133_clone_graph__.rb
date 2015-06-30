def clone_graph(node)
	if node ==  nil
		return
	end
	cloned = {}
	current_layer = [node]
	while current_layer.length != 0
		next_layer = []
		current_layer.each do |to_clone|
			if cloned.has_key? to_clone
				next 
			end
			temp = UndirectedGraphNode.new(to_clone.label)
			next_layer.concat to_clone.neighbors
			cloned[to_clone] = temp
		end
		current_layer = next_layer
	end

	cloned.each do |old, new|
		new.neighbors = old.neighbors.map{|n| cloned[n]}
	end
	cloned[node]
end