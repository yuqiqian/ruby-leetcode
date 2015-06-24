def three_sum_closest(nums, target)
	result  = 0xFFFFFFFF
	dif = 0xFFFFFFFF

	nums.sort!

	i = 0
	while i < nums.length-2 do 
		j = i +1
		k = nums.length-1
		while j<k do
			temp = nums[i]+nums[j]+nums[k]
			if temp == target
				return temp
			elsif temp < target
				if target - temp < dif
					dif = target - temp
					result = temp
				end
				j+=1
				while j<k+1 && nums[j] == nums[j-1]
					j+= 1
				end
			else
				if temp-target < dif
					dif = temp - target
					result = temp
				end
				k -= 1
				while k> j-1 && nums[k] == nums[k+1] do
					k-=1
				end
			end
		end
		i+=1
		while i<nums.length-1 && nums[i] == nums[i-1] do
			i+=1
		end
	end
	result
end