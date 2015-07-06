# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
	return 0 if matrix == []
	height, width =matrix.length, matrix[0].length
	dp = Array.new(height){Array.new(width, 0)}
	ans = 0
	(0..height-1).each do |i|
		(0..width-1).each do |j|
			dp[i][j] = (matrix[i][j]).to_i
			if i!=0 && j!=0 && dp[i][j]!= 0
				dp[i][j] = [dp[i-1][j-1], dp[i-1][j], dp[i][j-1]].min+1
			end
			ans = [ans, dp[i][j]].max
		end
	end
	return ans * ans
end
