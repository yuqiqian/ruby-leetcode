# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    if s==nil || s.length == 0
        return 0
    end
    hash = {}
    max = 0
    first = 0
    last =0
    while last < s.length do
        if hash.has_key?(s[last])
           max = max < last-first ? last-first : max
           while s[first] != s[last] do
               hash.delete(s[first])
               first +=1
           end
           first +=1
       else
           hash[s[last]] = 1
       end
       last += 1
    end
    max = max < last-first ? last-first : max
    return max
end