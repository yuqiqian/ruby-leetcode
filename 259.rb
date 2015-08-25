# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_smaller(nums, target)
	nums.sort!
	count = 0
	(0..nums.length-1).each do |k|
		i, j = 0, k-1
		while i < j
			if nums[i]+nums[j]+nums[k] < target
				count += j-i
				i += 1
			else
				j -= 1
			end
		end
	end
	count
end