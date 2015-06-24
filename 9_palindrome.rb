def is_palindrome(x)
	if x < 0
		return false 
	else
		return helper(x,get_digits(x),1)
	end
end

def get_digits(x)
	result = 1
	while x/10 != 0 do
		result += 1
		x/=10
	end
	return result
end

def helper(x,high,low)
	if high<=low
		return true
	elsif (x%10**high)/10**(high-1) == (x%10**low)/10**(low-1)
		return helper(x, high-1,low+1)
	else
		return false
	end
end
			
