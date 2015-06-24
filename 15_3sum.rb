def three_sum(nums)
	nums.sort!
	result = []
	i = 0
	while i < nums.length-2 do 
		j = i+1
		k = nums.length-1
		while j < k
			if nums[i] + nums[j] + nums[j] > 0 || nums[i]+nums[k]+nums[k] < 0
				break
			end
			if nums[i] + nums[j] + nums[k] == 0
				result << [nums[i], nums[j], nums[k]]
				j += 1
				while j < k+1 && nums[j] == nums[j-1] do
					j += 1
				end
				k-= 1
				while k > j-1 && nums[k] == nums[k+1] do
					k -= 1
				end
			elsif nums[i] + nums[j] + nums[k] < 0
				j += 1
				while j < k+1 && nums[j] == nums[j-1] do
					j+= 1
				end
			else
				k -= 1
				while k > j-1 && nums[k] == nums[k+1] do
					k -= 1
				end
			end
		end
		i += 1
		while i< nums.length-1 && nums[i] == nums[i-1] do
			i += 1
		end
	end

	result
end
					
					