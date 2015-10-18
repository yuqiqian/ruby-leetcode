# @param {String} s
# @return {Integer}
def length_of_last_word(s)
	i = s.length-1
	count = 0
	space = false
	while i >= 0
		if s[i] == " "
			if count == 0
				i -= 1
			else
				break
			end
		else
			count += 1
			i -= 1
		end
	end
	count
end