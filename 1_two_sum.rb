# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    hash = {}
    result = []
    nums.each_with_index do |n,i|
        if j = hash[target-n]
            return result << j+1 << i+1
        end
        hash[n] = i
    end
end