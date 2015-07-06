# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
	stack = []
	(0..s.length-1).each do |i|
		s[i] = "" if s[i] == ")"
		break if s[i] == "("
	end

	s.each_char do |item|
		if item == "("
			stack << item
		else
			if stack[-1] == "("
				stack.pop
				stack << 2
			elsif stack.length > 1 && stack[-2] == "("
				temp = stack.pop
				stack.pop
				stack << temp + 2
			else
				stack << ")"
                next
            end

            while stack.length > 1 && stack[-2].is_a?(Integer)
            	temp = stack.pop
            	temp += stack.pop
            	stack << temp
            end
        end
    end

    stack = stack.map { |item| item if item.is_a?(Integer) }.compact
    if stack.length == 0
    	return 0
    else
    	return stack.max
    end
end