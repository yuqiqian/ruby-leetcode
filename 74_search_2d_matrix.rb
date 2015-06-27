def search_matrix(matrix, target)
	heigh = matrix.length
	width = matrix[0].length
	front, back = 0, heigh*width-1
	while front <= back
		mid = (front+back)/2
		mid_cell = matrix[mid/width][mid%width]
		if mid_cell > target
			back = mid-1
		elsif mid_cell < target
			front = mid + 1
		else
			return true
		end
	end
	false
end

				
