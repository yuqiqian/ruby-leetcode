# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
	head, tail = 0, 0
	if nums.count(0) != 0
		max_prod = 0
	else
		max_prod = nums[0]
	end
	while tail < nums.length
		if nums[tail] != 0
			tail += 1
		else
			max_prod = [max_prod, max_product_without_zero(nums[head..tail-1])].max
			tail += 1
			head = tail
		end
	end
	[max_prod, max_product_without_zero(nums[head..tail-1])].max
end

def max_product_without_zero(nums)
	return 0 if nums.length == 0
	return nums[0] if nums.length == 1

	neg_count = nums.map{|i| i if i<0}.compact.length
	if neg_count %2 == 0
		return nums.inject(:*)
	else
		first_neg = 0
		while first_neg < nums.length
			if nums[first_neg] < 0
				break
			end
			first_neg += 1
		end
		last_neg = nums.length-1
		while last_neg >= 0
			if nums[last_neg] < 0
				break
			end
			last_neg -=1
		end
		if last_neg != 0 && first_neg != nums.length-1
			return [max_product_without_zero(nums[0..last_neg-1]), max_product_without_zero(nums[first_neg+1..-1])].max 
		elsif first_neg == 0
			return [nums[0], max_product_without_zero(nums[first_neg+1..-1])].max 
		else
			return [max_product_without_zero(nums[0..last_neg-1]), nums[-1]].max 
		end
				
	end
end