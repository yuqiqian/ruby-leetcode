# @param {Integer} numerator
# @param {Integer} denominator
# @return {String}
def fraction_to_decimal(numerator, denominator)
	sign = ""
	if numerator < 0 && denominator > 0
		numerator = -numerator
		sign = "-"
	end
	if numerator > 0 && denominator < 0
		denominator = -denominator
		sign = "-"
	end

	remaining = numerator % denominator
	if remaining == 0
		return sign+(numerator/denominator).to_s
	end

	result = [sign, (numerator/denominator).to_s, "."]
	position = {}
	current = 3
	while remaining != 0
		remaining *= 10
		new_val = remaining/denominator
		if !position.has_key? new_val
			position[new_val] = {}
		end
		new_rem = remaining % denominator
		if new_rem == 0
			result << new_val.to_s
			break
		elsif position[new_val].has_key? new_rem
			result.insert(position[new_val][new_rem], "(")
			result << ")"
			break
		end
		result << new_val.to_s
		position[new_val][new_rem] = current

		remaining = remaining% denominator
		current += 1
	end
	result.join("")
end
