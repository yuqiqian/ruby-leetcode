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

# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
	n = nums.length
	temp = []
	output = []
	is_used = Array.new(n, false)
	helper(0, nums, is_used, temp, output)
	return output
end

def helper(i, nums, is_used, temp, output)
	if i == nums.length
		output << temp * 1
		return
	end
	(0..nums.length-1).each do |j|
		if !is_used[j]
			temp << nums[j]
			is_used[j] = true
			helper(j+1, nums, is_used, temp, output)
			is_used[j] = false
			temp.pop
		end
	end
end