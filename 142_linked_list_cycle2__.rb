def detect_cycle(head)
	return nil if head == nil
	slower= quicker = head
	while quicker.next != nil && quicker.next.next!= nil
		slower = slower.next
		quicker = quicker.next.next
		if slower==quicker
			break
		end
	end
	if quicker.next == nil || quicker.next.next == nil
		return nil
	end

	latter, former = head, quicker
	while latter != former
		latter = latter.next
		former = former.next
	end
	former
end