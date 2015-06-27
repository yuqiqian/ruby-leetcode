def rotate_right(head, k)
    if head == nil || head.next == nil
        return head
    end
    len = 0
    temp = head
    while temp != nil do
        temp = temp.next
        len += 1
    end

    k%=len
    if k==0
        return head
    end
    
    fast, slow = head, head
    k.times do
        fast = fast.next
    end
    
    while fast.next != nil do 
        fast = fast.next
        slow = slow.next
    end
    new_head = slow.next
    fast.next = head
    slow.next = nil
    
    new_head
end