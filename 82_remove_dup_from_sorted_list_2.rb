# Definition for singly-linked list.
class ListNode
 attr_accessor :val, :next
 def initialize(val)
     @val = val
     @next = nil
 end
end

# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
	if head == nil
		return head
	end

	temp_head = ListNode.new(head.val^0x1)
	temp_head.next = head

	current = temp_head
	while current.next != nil
		next_val = current.next
		if next_val.next != nil && next_val.val == next_val.next.val
			next_val = next_val.next
			while next_val.next != nil && next_val.val == next_val.next.val
				next_val = next_val.next
			end
			current.next = next_val.next
		else
			current = current.next
		end
	end

	return temp_head.next
end
