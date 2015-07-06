# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
	x, size = 0, nums.length
	ans = []
	while x < size
		c, r = x, nums[x].to_s
		while x+1 < size && nums[x+1]-nums[x] == 1
			x += 1
		end
		if x > c
			r = r + "->" + nums[x].to_s
		end
		ans << r
		x+=1
	end
	ans
end