def reverse_between(head, m, n)
	if m==n
		return head
	end

	current_node = pseodu_head = ListNode.new(-1)
	pseodu_head.next = head
	current = 0
	while current < m-1
		current_node = current_node.next
		current+=1
	end

	before_reverse = current_node
	stack = []

	m.upto(n) do 
		stack << current_node.next
		current_node = current_node.next
	end

	after_reverse = current_node.next
	reverse_end = reverse_head = stack.pop
	while stack.length != 0
		reverse_end.next = stack.pop
		reverse_end = reverse_end.next
	end

	before_reverse.next = reverse_head
	reverse_end.next = after_reverse
	pseodu_head.next

end
