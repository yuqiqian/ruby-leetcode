def remove_duplicates(nums)
	if nums.length < 3
		return nums.length
	end

	front, back = 2, 2
	second_pre = nums[front-2]
	while front < nums.length
		if nums[front] == nums[front-1] && nums[front] == second_pre
			second_pre = nums[front-1]
		else
			second_pre = nums[front-1]
			nums[back] = nums[front]
			back+=1
		end
		front+=1
	end
	back
end