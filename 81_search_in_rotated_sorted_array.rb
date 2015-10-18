# @param {Integer[]} nums
# @param {Integer} target
# @return {Boolean}
def search(nums, target)
    lo, hi = 0, nums.length-1
    mid = 0
    while lo < hi
        mid = (lo+hi)/2
        return true if nums[mid] == target
        if nums[mid] > nums[hi]
            if nums[mid] > target && nums[lo] <= target
                hi = mid
            else
                lo = mid+1
            end
        elsif nums[mid] < nums[hi]
            if nums[mid] < target && nums[hi] >= target
                lo = mid+1
            else
                hi = mid
            end
        else
            hi -= 1
        end
    end
    nums[lo] == target 
end