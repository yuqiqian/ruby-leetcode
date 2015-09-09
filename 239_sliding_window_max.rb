# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
    return [] if nums.nil? || k<= 0
    n = nums.length
    r = Array.new(n-k+1)
    ri = 0
    q = []
    (0..n-1).each do |i|
        while !q.empty? && q.first < i-k+1
            q.shift
        end
        while !q.empty? && nums[q.last] < nums[i] 
            q.pop
        end
        q << i
        if i>= k-1
            r[ri] = nums[q.first] 
            ri += 1
        end
    end
    return r
end