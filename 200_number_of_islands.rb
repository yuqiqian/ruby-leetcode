# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
	count = 0
	return 0 if grid.nil? || grid.length == 0
	grid.each_with_index do |row, i|
		row.each_with_index do |cell, j|
			if cell == "1"
				count += 1
				dfs(grid, i, j)
			end
		end
	end
	count
end

def dfs(grid, i, j)
	grid[i][j] = "0"
	if i > 0 && grid[i-1][j] == "1"
		dfs(grid, i-1, j)
	end
	if i<grid.length-1 && grid[i+1][j] == "1"
		dfs(grid, i+1, j)
	end
	if j > 0 && grid[i][j-1] == "1"
		dfs(grid, i, j-1)
	end
	if j < grid[0].length && grid[i][j+1] == "1"
		dfs(grid, i, j+1)
	end
end