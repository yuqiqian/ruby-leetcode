def max_sub_array(nums)
	max_so_far = max_ending = nums[0]
	nums[1..-1].each do |num|
		max_ending = [num, max_ending+num].max 
		max_so_far = [max_ending, max_so_far].max
	end

	return max_so_far
end