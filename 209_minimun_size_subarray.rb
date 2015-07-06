def min_sub_array_len(s, nums)
	size = nums.length
	left, right = 0, size
	min_size = 0
	while left <= right
		mid = (left+right)/2
		if sovle(mid, s, nums)
			min_size = mid
			right = mid-1
		else
			left = mid + 1
		end
	end
	min_size
end

def solve(l, s, nums)
	sums = 0
	(0..nums.length-1).each do |x|
		sums += nums[x]
		if x >= l
			sums -= nums[x-l]
		end
		if sums > = s
			return true
		end
	end
	false
end