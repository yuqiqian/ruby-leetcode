def search_insert(nums, target)
    head = 0
    tail = nums.length-1
    insert = 0
    while head<=tail do 
    	mid = (head+tail)/2
    	if nums[mid] == target
    		return mid
    	elsif nums[mid] > target
    		tail = mid-1
    		insert = mid
    	else
    		head = mid+1
    		insert = mid+1
    	end
    end

    return insert
end