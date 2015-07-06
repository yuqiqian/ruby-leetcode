def reverse_list(head)
	do_reverse(head, nil)
end

def do_reverse(head, new_head)
	if head.nil?
		return new_head
	end

	next_node = head.next
	head.next = new_head
	return do_reverse(next_node, head)
end