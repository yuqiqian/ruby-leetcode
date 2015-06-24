def remove_element(nums, val)
	f,b = 0,0
	while f < nums.length
		if nums[f] != val
			nums[b] = nums[f]
			b +=1
		end
		f += 1
	end
	return b
end