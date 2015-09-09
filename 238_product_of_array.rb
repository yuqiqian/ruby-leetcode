# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
    len = nums.length
    res = Array.new(len)
    res[0] = 1
    (1..len-1).each do |i|
        res[i] = res[i-1]*nums[i-1]
    end
    right = 1
    (len-1).downto(0) do |i|
        res[i] *= right
        right *= nums[i]
    end
    res
end