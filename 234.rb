# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
    rev = nil
    slow = fast = head
    while !fast.nil? && !fast.next.nil?
        fast = fast.next.next
        rev, rev.next, slow  = slow, rev, slow.next
    end
    if !fast.nil?
        slow = slow.next
    end
    while !rev.nil? && rev.val == slow.val
        rev = rev.next
        slow= slow.next
    end
    return rev.nil?
end