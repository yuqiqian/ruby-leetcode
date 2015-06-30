def get_intersection_node(head_A, head_B)
	len_A = len(head_A)
	len_B = len(head_B)

	if len_A > len_B
		len_A, len_B = len_B, len_A
		head_A, head_B = head_B, head_A
	end

	if len_A == 0 || len_B == 0
		return nil
	end

	current_A = head_A
	current_B = head_B
	(0..len_B-len_A-1).each do
		current_B = current_B.next
	end

	while current_A!= nil && current_A != current_B
		current_A = current_A.next
		current_B = current_B.next
	end
	current_A
end

def len(head)
	current = 0
	length = 0
	while current!= nil
		current = current.next
		length += 1
	end
	length
end