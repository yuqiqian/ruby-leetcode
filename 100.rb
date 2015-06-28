def is_same_tree(p, q)
	if p == nil && q== nil
		return true
	elsif p==nil || q==nil
		return false
	elsif p.val == q.val
		return is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
	else
		return false
	end
end
			
		

