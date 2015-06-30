# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} m
# @param {Integer} n
# @return {ListNode}
def reverse_between(head, m, n)
    if m==n
        return head
    end
    pseudo_head = ListNode.new(-1)
    pseudo_head.next = head
    current = pseudo_head
    i = 0
    while i<m-1
        current = current.next
        i+=1
    end
    before_reverse = current
    stack = []
    (m..n).each do
        stack.push current.next
        current = current.next
    end
    after_reverse = current.next
    reverse_head = reverse_tail=stack.pop
    while stack.length != 0 do 
        reverse_tail.next = stack.pop
        reverse_tail = reverse_tail.next
    end
    before_reverse.next = reverse_head
    reverse_tail.next = after_reverse
    pseudo_head.next
end