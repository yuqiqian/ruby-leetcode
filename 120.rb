def min_total(triangle)
	if triangle.length == 0
		return 0
	end

	path_sum = [0]*triangle.length

	path_sum[0] = triangle[0][0]
	1.upto(triangle.length-1) do |row|
		path_sum[row] = path_sum[row-1] + triangle[row][row]
		(row-1).downto(1) do |col|
			path_sum[col] = [path_sum[col], path_sum[col-1]].min+triangle[row][col]
		end
		path_sum[0] += triangle[row][0]
	end
	return path_sum.min 
end
