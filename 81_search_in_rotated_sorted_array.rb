# @param {Integer[]} nums
# @param {Integer} target
# @return {Boolean}
def search(nums, target)
    rotated = false
    left,right = 0, nums.length-1
    while left<=right
        rotated =  
        mid = (left+right)/2
        if nums[mid] == target
            return true
        elsif nums[mid] > nums[right]
            if nums[mid] > target && nums[left] <= target
                right = mid
            else
                left = mid+1
            end
        elsif nums[mid] < nums[right]
            if nums[mid] < target && nums[right] >= target
                left = mid+1
            else
                right = mid
            end
        else
            right -= 1
        end
    end
    nums[left] == target
end