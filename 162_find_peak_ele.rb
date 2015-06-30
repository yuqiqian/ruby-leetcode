# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums, base = 0)
	if nums.length == 1
		return base
	end

	if nums.length == 2
	    if nums[0] > nums[1]
		    return base
	    else
		    return base+1
		end
	end

	mid = (nums.length-1)/2
	if nums[mid-1] < nums[mid] && nums[mid+1] < nums[mid]
		return mid+base
	elsif nums[mid] < nums[mid-1]
		return find_peak_element(nums[0..mid-1], base)
	else
		return find_peak_element(nums[mid+1..-1], mid+1+base)
	end
end