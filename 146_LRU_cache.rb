class LRUCache
	#attr_accessor :heap, :count, :capacity, :position, :time
	def initailize(capacity)
		@heap = [nil]*capacity
		@count= 0
		@capacity = capacity

		@position = {}
		@time = 0
	end

	def get(key)
		@time += 1
		if !@position.has_key? key
			return -1
		else
			pos_in_heap = @position[key]
			@heap[pos_in_heap][2] = time
			sink(pos_in_heap)
			return @heap[@position[key]][1]
		end
	end

	def set(key,val)
		@time += 1
		if !@position.has_key? key
			add_new(key,val, @time)
		else
			@heap[@position[key][2]] = @time
			@heap[@position[key][1]] = val
			sink(@position[key])
		end
	end

	private

	def swim(pos)
		while pos > 0 && @heap[(pos-1)/2][2] > @heap[pos][2]
			@position[@heap[(pos-1)/2][0]] = pos
			@position[@heap[pos][0]] = (pos-1)/2

			@heap[(pos-1)/2], @heap[pos] = @heap[pos], @heap[(pos-1)/2]
			pos = (pos-1)/2
		end
		return
	end

	def sink(pos)
		while 2*pos+1 < count
			prev_son = 2*pos+1
			if prev_son+1 < count && @heap[prev_son][2] > @heap[prev_son+1][2]
				prev_son+=1
			end
			if @heap[prev_son][2] > @heap[pos][2]
				break
			end
			@position[@heap[pos][0]] = prev_son
			@position[@heap[prev_son][0]] = pos
			@heap[pos], @heap[prev_son] = @heap[prev_son], @heap[pos]

			pos = prev_son
		end
		return
	end

	def pop_LRU
		return nil if @count == 0
		result = @heap[0]
		@position.delete(result[0])

		if @count > 1
			@heap[0] = @heap[@count-1]
			@count -= 1
			@position[@heap[0][0]] = 0
			sink(0)
		else
			@count -= 1
		end
		return result
	end

	def add_new(key, val, time)
		if @count == @capacity
			pop_LRU
		end

		@heap[@count] = [key, val, time]
		@position[key] = @count
		@count += 1
		swim(@count-1)
		return
	end
end

