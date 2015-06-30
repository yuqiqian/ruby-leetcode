def find_min(nums)
	if nums[0] < nums[-1]
		return nums[0]
	elsif nums.length < 3
		return nums.min
	else
		mid = (nums.length-1)/2
		return [find_min(nums[0..mid-1]), find_min(nums[mid..-1])].min
	end
end
			