def max_area(height)
   area = 0
   left = 0
   right = height.length-1
   while left < right do
   	area = [area, (right-left)*[height[left], height[right]].min].max
   	if height[left] < height[right]
   		left += 1
   	else
   		right -= 1
   	end
   end
   return area
end