def insertion_sort_list(head)
	return nil if head==nil
	pseudo_head = ListNode.new(-1)
	pseudo_head.next = head
	current = head.next
	head.next = nil

	sorted_end = head
	while current!= nil
		next_current = current.next
		if sorted_end.val <= current.val
			sorted_end.next = current
			current.next = nil
			sorted_end = current
		else
			head_of_sorted = pseudo_head
			while head_of_sorted.next.val < current.val
				head_of_sorted = head_of_sorted.next
			end
			current.next = head_of_sorted.next
			head_of_sorted.next = current
		end
		current = next_current
	end
	pseudo_head.next
end
