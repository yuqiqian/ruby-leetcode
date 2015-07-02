def trailing_zeroes(n)
	n = n.abs
	result = 0
	while n != 0
		result += n/5
		n/=5
	end
	result
end