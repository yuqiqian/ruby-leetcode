def gray_code(n)
	result = []
	0.upto((1<< n)-1) do |i|
		result << (i ^ (i >> 1))
	end
	result
end