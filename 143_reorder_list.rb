def reorder_list(head)
	list_in_array = []
	current = head
	while current!= nil
		list_in_array << current
		current = current.next
	end

	list_len = list_in_array.length
	if list_len == 0
		return
	end

	(0..list_len/2-1).each do |i|
		list_in_array[i].next = list_in_array[list_len-1-i]
		list_in_array[list_len-1-i].next = list_in_array[i+1]
	end
	list_in_array[list_len/2].next = nil
	return
end
