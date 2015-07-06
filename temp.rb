def first_missing_positive(nums)
    i = 0
    while i < nums.length
        if i+1 == nums[i]
            i+=1
        elsif nums[i] > nums.length
            i+=1
        elsif nums[i] <= 0
            i+=1
        elsif nums[i] == nums[nums[i]-1]
            i+=1
        else
            x, y = i, nums[i]-1
            nums[x], nums[y] = nums[y], nums[x]
        end
    end
    (0..nums.length-1).each do |index|
        binding.pry
        if index+1 != nums[i]
            return index+1
        end
    end
    return nums.length+1
end