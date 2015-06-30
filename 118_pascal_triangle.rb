def generate(num_rows)
	if num_rows == 0
		return []
	end
	result = [[1]]
	while result.length < num_rows
		temp = [1]
		0.upto(result[-1].length-2) do |i|
			temp << result[-1][i] + result[-1][i+1]
		end
		temp << 1
		result << temp
	end
	result
end
