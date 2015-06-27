def combine(n, k)
	pool = Array(1..n)
	limit = 1 << pool.length

	current = 0
	result = []

	while current < limit
		temp = []
		0.upto(pool.length-1) do |i|
			if (1 << i) & current != 0
				temp << pool[i]
				binding.pry
				if temp.length > k
					break
				end
			end
		end
		if temp.length == k
			result << temp
		end
		current += 1
	end
	result
end