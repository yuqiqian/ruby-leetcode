def longest_common_prefix(strs)
	if strs.length == 0
		return ""
	end
	longest = strs[0].length
	strs.each do |str|
		index = 0
		#binding.pry
		while index < str.length && index < longest && strs[0][index] == str[index]
			index += 1
		end
		#binding.pry
		longest = [index,longest].min
	end
	#binding.pry
	if longest == 0
		return ""
	else
		return strs[0][0..longest-1]
	end

end