def plus_one(digits)
	digits[-1] += 1

	carry = 0
	(digits.length-1).downto(0) do |i|
		digits[i] += carry
		carry = digits[i]/10
		if carry == 0
			break
		else
			digits[i] %= 10
		end
	end

	if carry == 1
		digits.insert(0,1)
	end

	digits
end
