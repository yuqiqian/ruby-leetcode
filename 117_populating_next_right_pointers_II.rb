class TreeNode
	attr_accessor :val, :left, :right, :next
	def initialize(val)
		@val = val
		@left = nil
		@right = nil
		@next = nil
	end
end

def connect(root)
	parent_layer_current = root
	son_layer_head = nil
	son_layer_current = nil

	while !parent_layer_current.nil?
		while !parent_layer_current.nil?
			if !parent_layer_current.left.nil?
				if son_layer_head.nil?
					son_layer_head = parent_layer_current.left
					son_layer_current = son_layer_head
				else
					son_layer_current.next = parent_layer_current.left
					son_layer_current = son_layer_current.next
				end
			end
			if !parent_layer_current.right.nil?
				if son_layer_head.nil?
					son_layer_head = parent_layer_current.right
					son_layer_current = son_layer_head
				else
					son_layer_current.next = parent_layer_current.right
					son_layer_current = son_layer_current.next
				end
			end
			parent_layer_current = parent_layer_current.next
		end
		parent_layer_current = son_layer_head
		son_layer_head = nil
	end
	return
end


