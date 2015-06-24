def swap_pairs(head)
	if head == nil || head.next == nil
		return head
	end
	new_head = head.next
	current = head
	prev = nil
	while current!=nil && current.next !=nil
		if prev != nil
			prev.next = current.next
		end
		prev = current

		temp = current.next.next
		current.next.next = current
		current.next = temp
		current = current.next
	end

	return new_head
end