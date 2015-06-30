def find_missing_ranges(nums, lower, upper)
	ranges = []
	prev = lower-1
	(0..nums.length).each do |i|
		curr = i==nums.length ? upper+1 : nums[i]
		if curr- prev >= 2
			ranges << get_range(prev+1, curr-1)
		end
		prev = curr
	end
	ranges
end

def get_range(from, to)
	return from == to ? from.to_s : from.to_s + "->" + to.to_s
end