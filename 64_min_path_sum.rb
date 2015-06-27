def min_path_sum(grid)
	col_len = grid.length
	column = [-1]*col_len
	column[0] = grid[0][0]

	1.upto(col_len-1) do |j|
		column[j] = grid[j][0] + column[j-1]
	end

	1.upto(grid[0].length-1) do |j|
		column[0] += grid[0][j]

		1.upto(col_len-1) do |i|
			column[i] = [column[i], column[i-1]].min + grid[i][j]
		end
	end

	column[-1]
end