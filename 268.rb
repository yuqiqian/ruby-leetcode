# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
	n = nums.length
	sum = n(n+1)/2
	nums.each do |num|
		sum -= num
	end
	sum
end