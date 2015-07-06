# @param {Integer[]} nums
# @return {Integer[]}
def majority_element(nums)
	n1 = n2 = nil
	c1 = c2 = 0
	nums.each do |num|
		if n1 == num
			c1+=1
		elsif n2 == num
			c2 +=1
		elsif c1 == 0
			n1, c1 = num, 1
		elsif c2 == 0
			n2, c2 = num, 1
		else
			c1, c2 = c1-1, c2-1
		end
	end
	size = nums.length
	return [n1, n2].map{|n| n if !n.nil? && nums.count(n) > size/3}.compact
end