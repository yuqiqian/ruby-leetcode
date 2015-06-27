def set_zeroes(matrix)
	if matrix.length == 0 || matrix[0].length == 0
		return
	end

	row = [false] * matrix.length
	col = [false] * matrix[0].length
	
	0.upto(matrix.length-1) do |i|
		0.upto(matrix[0].length-1) do |j|
			if matrix[i][j] == 0
				row[i] = true
				col[j] = true
			end
		end
	end
	binding.pry
	0.upto(matrix.length-1) do |i|
		0.upto(matrix[0].length-1) do |j|
			if row[i] || col[j]
				matrix[i][j] = 0
			end
		end
	end
	binding.pry
end