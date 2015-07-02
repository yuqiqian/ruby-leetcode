def rob(nums)
	return 0 if nums.length == 0
	return nums.max if nums.length <= 2

	max_money = [0] * nums.length
	max_money[0] = nums[0]
	max_money[1] = [nums[0], nums[1]].max

	(2..nums.length-1).each do |house|
		max_money[house] = [max_money[house-1], max_money[house-2]+nums[house]].max
	end
	max_money[-1]
end
