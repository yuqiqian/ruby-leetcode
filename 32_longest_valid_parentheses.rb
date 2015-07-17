# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
    stack = [] 
    max_len = 0
    curr_len = 0
    left = -1
    (0..s.length-1).each do |i|
        if s[i] == "("
            stack << i
        else
            left = i if stack.length == 0
            stack.pop
            if stack.length == 0
                curr_len = i-left
            else
                curr_len = i-stack[-1]
            end
            max_len = [max_len, curr_len].max
        end
    end
    max_len
end