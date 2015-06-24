# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
    former = head
    latter = head
    0.upto(n-2) do 
    	latter = latter.next
    end
    if latter.next == nil
    	head = head.next
    else
    	latter = latter.next
    	while latter.next != nil
    		former = former.next
    		latter = latter.next
    	end
    	former.next = former.next.next
    end
    head
end