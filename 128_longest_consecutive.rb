# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
    nums.uniq!
    return 1 if nums.length == 1
    s, r = {}, {}
    nums.each do |n|
        if s.has_key?(n) && r.has_key?(n)
            new_end = s[n]
            s.delete(n)
            new_begin = r[n]
            r.delete(n)
            s[new_begin-1] = new_end
            r[new_end+1] = new_begin
        elsif s.has_key?(n)
            old_end = s[n]
            s.delete(n)
            s[n-1] = old_end
            r[old_end+1] = n
        elsif r.has_key?(n)
            old_begin = r[n]
            r.delete(n)
            s[old_begin-1] = n
            r[n+1] = old_begin
        else
            s[n-1] = n
            r[n+1] = n
        end
    end
    len = 0
    s.each do |head, tail|
        len = [len, tail-head].max
    end
    len
end