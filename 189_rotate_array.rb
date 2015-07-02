def rotate(nums, k)
	k = nums.length - (k%nums.length)
	if k != nums.length
		reverse(nums, 0, k)
		reverse(nums, k, nums.length)
		reverse(nums, 0, nums.length)
	end
	return
end

def reverse(nums, head, tail)
	(0..(tail-1-head)/2).each do |i|
		front = head + i
		back = tail-1-i
		nums[head+i], nums[tail-1-i] = nums[tail-1-i], nums[head+i]
	end
	return
end