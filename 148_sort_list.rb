def sort_list(head)
	return head if head.nil? || head.next.nil?
	f = head.next.next
	p = head
	while !f.nil? && !f.next.nil?
		p = p.next
		f = f.next.next
	end
	h2 = sort_list(p.next)
	p.next = nil
	merge(sort_list(head), h2)
end

def merge(h1, h2)
	hn = ListNode.new(0-2**31)
	c = hn
	while !h1.nil? && !h2.nil?
		if h1.val < h2.val
			c.next = h1
			h1 = h1.next
		else
			c.next = h2
			h2 = h2.next
		end
		c = c.next
	end
	if !h1.nil?
		c.next = h1
	end
	if !h2.nil?
		c.next = h2
	end
	hn.next
end