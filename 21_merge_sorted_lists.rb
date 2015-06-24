# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
class Heap
	attr_accessor :heap
	def initialize
		@heap = [nil]
	end

	def size
		return @heap.length-1
	end

	def add(item)
		@heap << item
		swin(@heap.length-1)
	end

	def del_min
		if @heap.length == 2
			return @heap.pop
		end
		temp = @heap[1]
		@heap[1] = @heap[-1]
		@heap[-1] = temp
		temp = @heap.pop
		sink(1)
		return temp
	end

	private
	def swin(k)
		while k>1 && @heap[k/2].val>@heap[k].val do
			temp = @heap[k/2]
			@heap[k/2] = @heap[k]
			@heap[k] = temp
			k = k/2
		end
	end

	def sink(k)
		n = @heap.length
		while 2*k < n do
			index = 2*k
			if index+1<n && @heap[index+1].val < @heap[index].val
				index +=1
			end
			if @heap[k].val <= @heap[index].val
				break
			end
			temp = @heap[index]
			@heap[index] = @heap[k]
			@heap[k] = temp
			k = index
		end
	end
end

def merge_two_lists(l1, l2)
	heap = Heap.new()
	if l1!=nil
		heap.add(l1)
	end
	
	if l2 != nil
		heap.add(l2)
	end
			

	if heap.size == 0
		return nil
	end

	head = heap.del_min
	if head.next != nil
		heap.add(head.next)
	end

	current = head
	while heap.size != 0 do
		current.next = heap.del_min
		current = current.next
		if current.next != nil
			heap.add(current.next)
		end

	end

	return head
end
