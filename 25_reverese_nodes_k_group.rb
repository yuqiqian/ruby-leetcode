def reverse_k_group(head, k)
	new_head, next_head = reverse_next_k(nil, head, k)
	if new_head.nil?
		return head
	else
		result = new_head
	end
	pre_tail = head
	while !next_head.nil?
		current_node = next_head
		new_head, next_head = reverse_next_k(nil, current_node, k)
		if !new_head.nil?
			pre_tail.next = new_head
		else
			pre_tail.next = current_node
		end
		pre_tail = current_node
	end
	result
end

def reverse_next_k(pre, current, k)
	if current == nil
		return nil, nil
	end
	if k == 1
		next_node = current.next
		current.next = pre
		return current, next_node
	end
	new_head, next_head = reverse_next_k(current, current.next, k-1)
	if new_head == nil
		return nil, nil
	else
		current.next = pre
		return new_head, next_head
	end
end