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
		return
	end

	def del_min
		if @heap.length == 2
			return @heap.pop
		end
		@heap[1], @heap[-1] = @heap[-1], @heap[1]
		temp = @heap.pop
		sink(1)
		temp
	end

	private
	def swin(k)
		while k>1 && @heap[k/2].val > @heap[k].val
			@heap[k/2], @heap[k] = @heap[k], @heap[k/2]
			k = k/2
		end
		return
	end

	def sink(k)
		n = @heap.length
		while k*2 < n
			temp_index = 2*k
			if temp_index + 1 < n && @heap[temp_index+1].val < @heap[temp_index].val
				temp_index += 1
			end
			if @heap[k].val <= @heap[temp_index].val
				break
			end
			@heap[temp_index], @heap[k] = @heap[k], @heap[temp_index]
			k = temp_index
		end
		return
	end
end

def merge_k_lists(lists)
	return nil if lists.length == 0
	heap = Heap.new
	lists.each do |list|
		if !list.nil?
			heap.add(list)
		end
	end
	if heap.size == 0
		return nil
	end
	head = heap.del_min
	if !head.next.nil?
		heap.add(head.next)
	end
	current = head
	while heap.size != 0
		current.next = heap.del_min
		current = current.next
		if !current.next.nil?
			heap.add(current.next)
		end
	end
	head
end
