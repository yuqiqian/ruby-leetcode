def search(nums, target)
	return helper(nums, target, 0, nums.length-1)
end

def helper(nums, target, head, tail)
	if head > tail
		return -1
	end
	mid =(head+tail)/2
	if nums[head] < nums[tail]
		rotated = false
	else
		rotated = true
	end

	if nums[mid] == target
		return mid
	elsif nums[mid] < target
		if rotated
			temp = helper(nums, target, head, mid-1)
			if temp != -1 
				return temp
			end
		end
		return helper(nums, target, mid+1, tail)
	else
		if rotated
			temp = helper(nums, target, mid+1, tail)
			if temp!= -1 
				return temp
			end
		end
		return helper(nums, target, head, mid-1)
	end
end
