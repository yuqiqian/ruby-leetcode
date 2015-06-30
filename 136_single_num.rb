def single_number(nums)
	result = 0
	nums.each{|item| result ^= item}
	return result
end