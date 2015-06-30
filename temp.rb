def clone_graph(node)
    return nil if node.nil?
    cloned = {}
    current_layer = [node]
    while current_layer.length != 0
        next_layer = []
        current_layer.each do |to_clone|
            if cloned.has_key？ to_clone
                next
            end
            temp = UndirectGraphNode.new(to_clone.label)
            cloned[to_clone] = temp
            to_clone.neighbors.each do |n|
                next_layer << n 
            end
        end
        current_layer =next_layer
    end

    cloned.each do |old, new|
        new.neighbors = old.neighbors.map{|n| cloned[n]}
    end
    cloned[node]
end
