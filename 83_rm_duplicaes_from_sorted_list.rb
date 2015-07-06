def delete_duplicates(head)
	if head == nil
		return head
	end

	current == head
	while current.next != nil
		if current.val = current.next.val
			temp = current.next
			current.next = current.next.next
		else
			current = current.next
		end
	end
	head
end