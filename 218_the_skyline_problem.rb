# @param {Integer[][]} buildings
# @return {Integer[][]}
def get_skyline(buildings)
	return [] if buildings.length == 0
	return [[buildings[0][0], buildings[0][2]], [buildings[0][1], 0]] if buildings.length == 1
	mid = (buildings.length-1)/2
	left = get_skyline(buildings[0..mid])
	right = get_skyline(buildings[mid+1..-1])
	return merge(left, right)
end

def merge(left, right)
	i,j= 0, 0
	result = []
	h1, h2 = -1,-1
	while i < left.length && j < right.length
		if left[i][0] < right[j][0]
			h1 = left[i][1]
			new_point = [left[i][0], [h1, h2].max]
			result << new_point if result == [] || result[-1][1] != new_point[1]
			i += 1
		elsif left[i][0] > right[j][0]
			h2 = right[j][1]
			new_point = [right[j][0], [h1, h2].max]
			result << new_point if result == [] || result[-1][1] != new_point[1]
			j += 1
		else
			h1 = left[i][1]
			h2 = right[j][1]
			new_point = [right[j][0], [h1,h2].max]
			result << new_point if result == [] || result[-1][1] != new_point[1]
			i += 1
			j += 1
		end
	end

	while i < left.length
		if result == [] || result[-1][1] != left[i][1]
			result << left[i]
		end
		i+=1
	end

	while j< right.length
		if result == [] || result[-1][1] != right[j][1]
			result << right[j]
			j += 1
		end
	end
	result
end 