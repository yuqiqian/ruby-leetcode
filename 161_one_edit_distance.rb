def is_one_edit_distance(s, t)
	m, n = s.length, t.length
	if m> n
		return is_one_edit_distance(t, s)
	end
	if n-m > 1
		return false
	end

	i, shift = 0, n-m
	while i < m && s[i] == t[i]
		i+=1
	end
	if shift == 0
		i+=1
	end
	while i<m && s[i] == t[i+shift]
		i += 1
	end
	return i==m
end