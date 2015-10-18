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
	return nil if head.nil?
	dummy = ListNode.new(0)
	dummy.next = head
	pre = dummy
	cur = head
	while !cur.nil?
		while !cur.next.nil? && cur.val == cur.next.val
			cur = cur.next
		end
		if pre.next == cur
			pre = pre.next
		else
			pre.next = cur.next
		end
		cur = cur.next
	end
	dummy.next
end