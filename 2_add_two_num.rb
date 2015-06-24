# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    digit = l1.val+l2.val
    carrier = digit/10
    digit = digit%10
    result = ListNode.new(digit)
    tail = result
    l1=l1.next
    l2=l2.next
    while !l1.nil? || !l2.nil? do
        if l1.nil?
            digit = l2.val + carrier
            l2 = l2.next
        elsif l2.nil?
            digit = l1.val + carrier
            l1 = l1.next
        else
            digit = l1.val + l2.val+carrier
            l1 = l1.next
            l2 = l2.next
        end
        carrier = digit/10
        digit = digit % 10
        tail.next = ListNode.new(digit)
        tail = tail.next
    end
    
    if carrier == 1
        tail.next=ListNode.new(carrier)
    end
    
    return result
end