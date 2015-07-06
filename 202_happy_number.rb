# @param {Integer} n
# @return {Boolean}
def is_happy(n)
	num_arr = []
	while n!= 1 && !num_arr.include?(n)
		num_arr << n
		sum = 0
		while n != 0
			digit = n % 10
			sum += digit * digit
			n /= 10
		end
		n = sum
	end
	n == 1
end