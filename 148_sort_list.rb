def sort_list(head)
	return nil if head.nil?

	merge_size = 1
	finish_sort = false

	pseudo_head = ListNode.new(-1)
	pseudo_head.next = head
	while !finish_sort
		end_of_sorted = pseudo_head
		while !end_of_sorted.next.nil?
			first_to_sort = end_of_sorted.next
			seconde_to_sort = first_to_sort
			(0..merge_size-1).each do
				seconde_to_sort = seconde_to_sort.next
				if seconde_to_sort.nil?
					break
				end
			end
			if seconde_to_sort.nil?
				if first_to_sort == pseudo_head.next
					finish_sort = true
				end
				break
			end

			first_list_count, second_list_count = 0, 0
			while first_list_count < merge_size && second_list_count < merge_size && !seconde_to_sort.nil?
				if first_to_sort.val <= seconde_to_sort.val
					end_of_sorted.next = first_to_sort
					end_of_sorted = end_of_sorted.next
					first_to_sort = first_to_sort.next
					first_list_count += 1
				else
					end_of_sorted.next = seconde_to_sort
					end_of_sorted = end_of_sorted.next
					seconde_to_sort = seconde_to_sort.next
					second_list_count += 1
				end
			end

			if first_list_count == merge_size
				while second_list_count < merge_size && !seconde_to_sort.nil?
					end_of_sorted.next = seconde_to_sort
					end_of_sorted = end_of_sorted.next
					seconde_to_sort =  seconde_to_sort.next
					second_list_count += 1
				end
			else
				while first_list_count < merge_size
					end_of_sorted.next = first_to_sort
					end_of_sorted = end_of_sorted.next
					first_to_sort = first_to_sort.next
					first_list_count +=1
				end
				end_of_sorted.next = seconde_to_sort
			end
		end
		merge_size = merge_size << 1
	end
	pseudo_head.next
end