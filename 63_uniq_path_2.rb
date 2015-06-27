def unique_paths_with_obstacles(obstacle_grid)
	row_len = obstacle_grid.length
	col_len = obstacle_grid[0].length

	count = [0]*row_len
	count[0] = 1

	0.upto(col_len-1) do |j|
		if obstacle_grid[0][j] == 1
			count[0] = 0
		end

		1.upto(row_len-1) do |i|
			if obstacle_grid[i][j] == 1
				count[i] = 0
			else
				count[i] += count[i-1]
			end
		end
	end

	count[-1]
end