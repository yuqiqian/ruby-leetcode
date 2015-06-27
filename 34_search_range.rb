def search_range(nums, target)
	head = -1
	tail = -1
	front = nums.length-1
	back = 0
	while back <= front do
		mid = (front+back)/2
		if nums[mid] > target
			front = mid-1
		elsif nums[mid] < target
			back = mid+1
		else
			front = mid-1
			head = mid
		end
	end

	if head == -1
		return [-1,-1]
	end

	front = nums.length-1
	back = 0

	while back <= front
		mid = (front+back)/2
		if nums[mid] > target
			front = mid-1
		elsif nums[mid] < target
			back = mid+1
		else
			back=mid+1
			tail=mid
		end
	end

	return [head,tail]
end



