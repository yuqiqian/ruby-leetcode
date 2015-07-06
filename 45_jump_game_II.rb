# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
    return 0 if nums.length == 0 || nums.length==1
	steps = [0] * nums.length
	(0..nums.length-1).each do |index|
		pre_steps = steps[index]
		step = nums[index]
		step.downto(1) do |jump|
			if index+jump >= steps.length
				next
			end
			if steps[index+jump] != 0
				break
			end
			steps[index+jump] = pre_steps+1
		end
	end
	return steps[-1]
end
