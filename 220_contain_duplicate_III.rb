# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer} t
# @return {Boolean}
def contains_nearby_almost_duplicate(nums, k, t)
    require 'thread'
    if k < 0 || t < 0
        return false
    end
    num_dict = {}
    order  = Queue.new
    nums.each_with_index do |val, i|
        key = val/[1,t].max
        [key, key-1, key+1].each do |m|
            if num_dict.has_key?(m) && (val - num_dict[m]).abs <= t
                return true
            end
        end
        num_dict[key] = val
        order << key 
        if i >= k
            num_dict.delete(order.pop)
        end
    end
    return false
end