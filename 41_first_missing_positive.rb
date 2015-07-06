def first_missing_positive(nums)
	index = 0
	while nums.length > index
		if index + 1 == nums[index]
			index+=1
		elsif nums[index] <= 0
			index += 1
		elsif nums[index] > nums.length
			index += 1
		elsif nums[index] == nums[nums[index]-1]
			index += 1
		else
			swap_i, swap_j = index, nums[index]-1
			nums[swap_i], nums[swap_j] = nums[swap_j], nums[swap_i]
		end
	end
	(0..nums.length-1).each do |i|
		if i+1 != nums[i]
			return i+1
		end
	end
	return nums.length+1
end
				
				