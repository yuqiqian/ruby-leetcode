# @param {String} s
# @param {String} t
# @return {Integer}
def num_distinct(s, t)
	dp = Array.new(t.length+1){Array.new(s.length+1)}
	dp[0][0] = 1
	(0..t.length).each{|i| dp[i][0] = 0}
	(0..s.length).each{|j| dp[0][j] = 1}
	(1..t.length).each do |i|
		(1..s.length).each do |j|
			dp[i][j] = dp[i][j-1]
			if t[i-1] == s[j-1]
				dp[i][j] += dp[i-1][j-1]
			end
		end
	end
	dp[t.length][s.length]
end
