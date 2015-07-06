# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
    num_dict = {}
    (0..nums.length-1).each do |x|
        id_x = num_dict[nums[x]]
        if !id_x.nil? && id_x >= 0 && x-id_x <= k
            return true
        end
        num_dict[nums[x]] = x
    end
    false
end