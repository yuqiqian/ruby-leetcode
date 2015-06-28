def build_tree(inorder, postorder)
	inpos = {}
	postpos = {}
	0.upto(inorder.length-1) do |i|
		inpos[inorder[i]] =i
		postpos[postorder[i]] = i
	end

	return helper(inorder, [0,inorder.length-1], inpos, postorder, [0,postorder.length-1], postpos)
end

def helper(inorder, inorder_zone, inpos, postorder, postorder_zone, postpos)
	if inorder_zone[1] < inorder_zone[0]
		return nil
	end

	root = TreeNode.new(postorder[postorder_zone[1]])

	left_inorder_zone = [inorder_zone[0], inpos[root.val]-1]
	left_count = inpos[root.val] - inorder_zone[0]
	left_postorder_zone = [postorder_zone[0], postorder_zone[0]+left_count-1]
	root.left = helper(inorder, left_inorder_zone, inpos, postorder, left_postorder_zone,postpos)

	right_inorder_zone = [inpos[root.val]+1, inorder_zone[1]]
	right_count = inorder_zone[1]-inpos[root.val]
	right_postorder_zone = [postorder_zone[1]-right_count, postorder_zone[1]-1]
	root.right = helper(inorder, right_inorder_zone, inpos, postorder, right_postorder_zone, postpos)
	return root
end