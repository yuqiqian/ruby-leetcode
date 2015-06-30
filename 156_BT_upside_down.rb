def upside_down_binary_tree(root)
	p = root
	parent = parent_right = nil
	while p!= nil
		left = p.left
		p.left = parent_right
		parent_right = p.right 
		p.right = parent
		parent = p
		p = left
	end
	parent
end