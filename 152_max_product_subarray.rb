# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
    return 0 if nums.empty?
    pre_max = nums[0]
    pre_min = pre_max
    max = pre_max
    local_max, local_min = 0, 0
    nums[1..-1].each do |val|
        local_max = [val, [pre_max*val, pre_min*val].max ].max
        local_min = [val, [pre_max*val, pre_min*val].min ].min
        max = [local_max, max].max
        pre_max = local_max
        pre_min = local_min
    end
    max
end