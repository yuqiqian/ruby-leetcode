def has_cycle(head)
	if head == nil
		return false
	end
	slower = head
	quicker = head
	while slower.next != nil && quicker.next.next != nil
		slower = slower.next
		quicker = quicker.next.next
		if slower == quicker
			return true
		end
	end
	false
end
