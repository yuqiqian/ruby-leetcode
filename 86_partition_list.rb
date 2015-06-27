def partition(head, x)
	smaller = ListNode.new(-1)
	others = ListNode.new(-1)

	smaller_last, other_last = smaller, others

	while head != nil
		if head.val < x
			smaller_last.next = head
			smaller_last = smaller_last.next
		else
			other_last.next = head
			other_last = other_last.next
		end
		head = head.next
	end

	smaller_last.next = others.next
	other_last.next = nil
	smaller.next
end
