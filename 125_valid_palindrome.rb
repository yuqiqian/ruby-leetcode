def is_palindrome(s)
	return true if s.length < 2
	head, tail = 0, s.length-1
	while(head < tail)
		if !isalnum(s[head])
			head+=1
		elsif !isalnum(s[tail])
			tail -=1
		else
			if s[head].downcase == s[tail].downcase
				head += 1
				tail -=1
			else
				return false
			end
		end
	end
	return true
end


def isalnum(char)
	if /[[:digit:]]/.match(char) || /[[:alpha:]]/.match(char)
		true
	else
		false
	end
end