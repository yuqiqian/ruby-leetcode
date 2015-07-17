def maximal_rectangle(matrix)
	return 0 if matrix.length == 0
	heights = Array.new(matrix.length){Array.new(matrix[0].length, 0)}
	(0..matrix.length-1).each do |row|
		heights[row][-1] = 1 if matrix[row][-1] == "1"
		(matrix[0].length-2).downto(0) do |col|
			if matrix[row][col] == "0"
				heights[row][col] = 0
			else
				heights[row][col] = heights[row][col+1] + 1
			end
		end
	end

	max_area = 0
	(0..matrix[0].length-1).each do |x|
		max_area = [max_area, largest_ractangle_area((0..matrix.length-1).map{|y| heights[y][x] })].max
	end
	max_area
end

def largest_rectangle_area(height)
	return 0 if height.length == 0
	stack = [-1]
	max_area = 0
	height << -1
	index = 0
	while index < height.length
		if height[index] >= height[stack[-1]]
			stack << index
			index+=1
		else
			pre_basin = stack.pop
			max_area = [max_area, height[pre_basin]*(index-stack[-1]-1)].max
		end
	end
	max_area
end