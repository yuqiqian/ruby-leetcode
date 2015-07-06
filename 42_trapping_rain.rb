# @param {Integer[]} height
# @return {Integer}
def trap(height)
	water = 0
	head = 0
	while head < height.length-1 && height[head] <= height[head+1]
		head += 1
	end

	if head >= height.length-1
		return 0
	end

	stack = [[height[head], head]]
	height[head+1..-1].each_with_index do |wall, i|
		if wall == stack[-1][0]
			next
		elsif wall < stack[-1][0]
			stack << [wall, i]
		else
			adjust_index = -1
			while stack.length > 1 && wall > stack[-1][0]
				pre_wall, pre_i = stack.pop
				water += ([wall, stack[-1][0]].min - pre_wall)*(i-pre_i)
				adjust_index = pre_i
			end
			if stack.length == 1 && stack[-1][0] <= wall
				stack.pop
			end
			stack << [wall, adjust_index]
		end
	end
	water
end