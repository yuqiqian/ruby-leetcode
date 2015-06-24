def next_permutation(nums)
	back = nums.length-2
	while back >= 0 do
		front = nums.length-1
		while front > back do
			if nums[back] < nums[front]
				nums[back], nums[front] = nums[front], nums[back]
				nums[back+1..-1] = nums[back+1..-1].sort!
				return 
			else
				front -= 1
			end
		end
		back -=1
	end
	nums.sort!
	return 
end