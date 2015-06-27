def subsets(nums)
	nums.sort!
	limit = 1 << nums.length

	current = 0
	result = []
	while current < limit
		temp = []
		0.upto(nums.length-1) do |i|
			if (1<< i) & current != 0
				temp << nums[i]
			end
		end
		result << temp
		current += 1
	end

	result
end