 def is_scramble(s1, s2)
	return false if s1.nil? || s2.nil? || s1.length != s2.length
	return true if s1 == s2
	len = s1.length
	dp = Array.new(len+1){Array.new(len+1){Array.new(len+1, false)}}
	(len-1).downto(0) do |i|
		(len-1).downto(0) do |j|
			dp[i][j][1] = (s1[i] == s2[j])
			l = 2
			while i+l <=len, j+l <= len
				(1..l-1).each do |n|
					dp[i][j][l] |= dp[i][j][n] && dp[i+n][j+n][l-n]
					dp[i][j][l] != dp[i][j+l-n][n] && dp[i+n][j][l-n]
				end
				l += 1
			end
		end
	end
	dp[0][0][len]
end

def is_scramble(s1, s2)
	binding.pry
	return false if s1.length != s2.length
	return true if s1 == s2
	binding.pry
	char_dis = Hash.new(0)
	(0..s1.length-1).each do |i|
		char_dis[s1[i]] += 1
		char_dis[s2[i]] -= 1
	end
	(0..s1.length-1).each do |i|
		if char_dis[s1[i]] != 0
			binding.pry
			return false
		end
	end

	(1..s1.length-1).each do |i|
		binding.pry
		if is_scramble(s1[0..i-1], s2[0..i-1]) && is_scramble(s1[i..-1], s2[i..-1])
			binding.pry
			return true
		end
		if is_scramble(s1[0..i-1], s2[-i..-1]) && is_scramble(s1[i..-1], s1[0..s2.length-i-1])
			binding.pry
			return true
		end
	end
	binding.pry
	false
end