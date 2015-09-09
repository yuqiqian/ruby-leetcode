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

# @param {Integer[]} height
# @return {Integer}
def largest_rectangle_area(height)
	ret = 0
	height << 0
	index = []
	(0..height.length-1).each do |i|
		while index.size > 0 && height[index[-1]] >= height[i]
			h = height[index[-1]]
			index.pop
			sidx = index.length > 0 ? index[-1] : -1
			if h*(i-sidx-1) > ret
				ret = h * (i-sidx-1)
			end
		end
		index << i
	end
end
end