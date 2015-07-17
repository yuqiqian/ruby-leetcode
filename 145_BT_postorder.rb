def postorder_traversal(root)
	return [] if root.nil?

	stack_prepare =[root]
	stack_ready = []
	result = []

	while stack_prepare.length != 0
		current = stack_prepare.pop
		stack_ready << current
		if !current.left.nil?
			stack_prepare << current.left
		end
		if !current.right.nil?
			stack_prepare << current.right
		end
	end
	while stack_ready.length != 0
		result << stack_ready.pop.val
	end
	result
end