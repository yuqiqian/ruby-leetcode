def reverse_words(s, method = "Stack")
	method_dict = {"Recursive" => reverse_words_rec, "Stack" => reverse_words_stack} 
	method_fun = method_dict[method]
	return method_fun(s)
end

def reverse_words_stack(s)
	stack = []
	index = 0
	while index < s.length
		next_word = ""
		while index < s.length && s[index] == " "
			index +=1
		end
		while index < s.length && s[index] != " "
			next_word = next_word + s[index]
			index +=1
		end

		if next_word != ""
			stack << next_word
		end
	end
	if stack.length == 0
		return ""
	else
		result = stack.pop
		while stack.length != 0
			result.concat " "+stack.pop
		end
		return result
	end
end

def reverse_words_rec(s)
	return "" if s==""
	first_word = ""
	i = 0
	while i<s.length && s[i] == " "
		i +=1
	end
	while i<s.length && s[i]!= " "
		first_word += s[i]
		i+=1
	end
	remaining = reverse_words_rec(s[i..-1])
	if remaining == ""
		return first_word
	else
		return remaining + " " + first_word
	end
end