# @param {Integer} num
# @return {Integer}
def add_digits(num)
	res = 0
	while res/10 == 0
		res = num%10
		while num/10 != 0
			num /= 10
			res += num%10
		end
		num = res
		break if res/10 == 0
		res = 0
	end
	res
end