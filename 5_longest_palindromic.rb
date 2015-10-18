# @param {String} s
# @return {String}
def longest_palindrome(s)
    new_s = "#" + s.split("").join("#")+"#"
    id, mx = 0, 0
    p = []
    (0..new_s.length-1).each do |i|
        p[i] = mx > i ? [mx-i, p[id*2-i]].min : 1
        while new_s[i-p[i]] == new_s[i+p[i]]
            p[i] += 1
        end
        if i+p[i] > mx
            id = i
            mx = i+p[i]
        end
    end
    max_len = 0
    center = 0
    p.each_with_index do |val, i|
        if max_len < val
            max_len = val
            center = i
        end
    end
    binding.pry
    head = (center-max_len-1)/2+1 >= 0 ? (center-max_len-1)/2+1 : 0
    tail = head+max_len-2 < s.length-1 ? head+max_len-2 : s.length-1
    s[head..tail]
end
