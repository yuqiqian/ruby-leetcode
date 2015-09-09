def length_of_longest_substring_two_distinct(s)
	i, j, max_len = 0, -1, 0
	(0..s.length-1).each do |k|
		next if s[k] == s[k-1]
		if j>=0 && s[j] != s[k]
			max_len = [k-i, max_len].max
			i = j+1
		end
		j = k-1
	end
	[s.length-i, max_len].max
end
