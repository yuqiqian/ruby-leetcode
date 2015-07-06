def remove_elements(head, val)
	dummy = ListNode.new(0)
	dummy.next = head
	pre, cur = dummy, head
	while !cur.nil?
		if cur.val == val
			pre.next =cur.next
		else
			pre = cur
		end
		cur = cur.next
	end
	dummy.next
end