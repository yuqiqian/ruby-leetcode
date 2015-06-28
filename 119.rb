def get_row(row_index)
	if row_index == 0
		return [1]
	elsif row_index == 1
		return [1,1]
	end

	result = [1]

	next_divisor = 1
	next_multiplier = row_index
	0.upto(row_index/2-1) do 
		next_val = (result[-1]*next_multiplier)/next_divisor
		result << next_val
		next_divisor += 1
		next_multiplier -= 1
	end
	binding.pry
	if row_index%2 == 1
		result = result + result.reverse
	else
		result = result + result[0..-2].reverse
	end
	result
end
			