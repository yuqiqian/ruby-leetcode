# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
    return 0 if nums.length == 0
	if nums.length == 1
		return nums[0]
	end
	return [rob_linear(nums[1..-1]), rob_linear(nums[0..-2])].max
end

def rob_linear(nums)
	size = nums.length
	odd, even = 0, 0
	(0..size-1).each do |i|
		if i%2 != 0
			odd = [odd+nums[i], even].max
		else
			even = [even+nums[i], odd].max
		end
	end
	return [odd, even].max
end