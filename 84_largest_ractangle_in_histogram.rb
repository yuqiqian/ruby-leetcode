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