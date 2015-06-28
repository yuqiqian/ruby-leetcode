def build_tree(preorder, inorder)
	in_pos = {}
	pre_pos = {}
	0.upto(inorder.length-1) do |i|
		in_pos[inorder[i]] = i
		pre_pos[preorder[i]] = i
	end
	return helper(inorder, [0, inorder.length-1], in_pos, preorder, [0, preorder.length-1], pre_pos)
end

def helper(inorder, in_order_zone, in_pos, preorder, pre_order_zone, pre_pos)
	if in_order_zone[1] < in_order_zone[0]
		return nil
	end

	root = TreeNode.new(preorder(pre_order_zone[0]))
	binding.pry
	left_inorder_zone = [in_order_zone[0], in_pos[root.val]-1]
	left_count = in_pos[root.val]-in_order_zone[0]
	left_preorder_zone = [pre_order_zone[0]+1, pre_order_zone[0]+left_count]
	root.left = helper(inorder, left_inorder_zone, in_pos, preorder, left_preorder_zone, pre_pos)

	right_inorder_zone = [in_pos[root.val]+1, in_order_zone[1]]
	right_count = in_order_zone[1] - in_pos[root.val]
	right_preorder_zone = [pre_order_zone[1]-right_count+1, pre_order_zone[1]]
	root.right = helper(inorder, right_inorder_zone, in_pos, preorder, right_preorder_zone, pre_pos)
	return root
end
