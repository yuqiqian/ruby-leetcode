def remove_duplicates(nums)
	if nums.length == 0
		return 0
	end
	front, back = 1,1
	while front < nums.length do 
		if nums[front] != nums[front-1]
			nums[back] = nums[front]
			back +=1
		end
		front += 1
	end
	return back
end