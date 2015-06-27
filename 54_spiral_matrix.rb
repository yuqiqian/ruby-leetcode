# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
	row_len = matrix.length
	if row_len == 0
		return []
	end

	col_len = matrix[0].length
	result = []

	bound = [row_len, col_len].min
	0.upto(bound/2-1) do |layer|
		result = result + matrix[layer][layer..col_len-layer-2]
		layer.upto(row_len-layer-1) do |i|
			result << matrix[i][col_len-layer-1]
		end
		result = result + matrix[row_len-layer-1][layer..col_len-layer-2].reverse
		(row_len-layer-2).downto(layer+1) do |i|
			result << matrix[i][layer]
		end
		
	end

	if bound%2 == 1
		if bound==row_len
			result = result + matrix[bound/2][bound/2..col_len-bound/2-1]
		else
			(bound/2).upto(row_len-bound/2-1) do |i|
				result << matrix[i][bound/2]
			end
		end
	end

	result
end