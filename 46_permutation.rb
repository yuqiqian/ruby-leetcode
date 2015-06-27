def permute(nums)
	stack = []
	used = []

	result = []
	fullFlag = (1 << nums.length)-1

	0.upto(nums.length-1) do |i|
		stack << [nums[i]]
		used << (1<<i)
	end

	while stack.length != 0 do
		temp = stack.pop
		usedState = used.pop

		if usedState == fullFlag
			result << temp
		else
			0.upto(nums.length-1) do |i|
				if usedState & (1<<i) == 0
					stack << (temp+[nums[i]])
					used << (usedState | (1<<i))
				end
			end
		end
	end
	result
end