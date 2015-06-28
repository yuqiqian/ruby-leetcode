class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

def zigzag_level_order(root)
	if root == nil
		return []
	end

	result = []
	next_layer = [root]
	left_2_right = true
	while next_layer.length != 0
		result << next_layer
		next_layer = []
		left_2_right = !left_2_right
		i = result[-1].length-1
		while i > -1
			father = result[-1][i]
			
			if left_2_right
				if father.left != nil
					next_layer << father.left
				end
				if father.right != nil
					next_layer << father.right
				end

			else
				if father.right != nil
					next_layer << father.right
				end
				if father.left != nil
					next_layer << father.left
				end
			end
			i -= 1
		end
	end
	result = result.map{|layer| layer.map{|node| node.val}}
	result
end


