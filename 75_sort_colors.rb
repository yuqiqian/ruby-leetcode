def sort_colors(nums)
	next_zero = 0
	next_two = nums.length-1
	index = 0
	while index<=next_two
		if nums[index] == 0
			if index == next_zero
				index+=1
				next_zero+=1
			else
				nums[index], nums[next_zero] = nums[next_zero], nums[index]
				next_zero+=1
			end
		elsif nums[index] == 2
			nums[index], nums[next_two] = nums[next_two], nums[index]
			next_two-=1
		else
			index += 1
		end
	end
	return
end
