def divide(dividend, divisor)
	max = 2147483647
	if dividend == 0
		return 0
	end

	if divisor ==0
		raise "divisor cannot be zero!"
	end

	result = 0
	pos = true

	if dividend < 0
		dividend = -dividend
		pos = !pos
	end

	if divisor < 0
		divisor = -divisor
		pos = !pos
	end

	step = divisor
	res = 1

	while (step << 1) <= dividend
		step = step << 1
		res = res << 1
	end

	while step >= divisor do
		while dividend >= step do
			dividend -= step
			result += res
		end
		step = step >> 1
		res = res >> 1
	end

	if result > max
		result = pos ? max : max+1
	end
	
	if pos
		return result
	else
		return -result-1
	end
end
