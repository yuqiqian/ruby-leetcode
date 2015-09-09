def min_cut(s)
	return 0 if s.length == 0
	cache = buil_palindrome_cache(s)
	min_cut_here = [0] *s.length
	(1..s.length-1).each do |i|
		if is_palindrome(0,i,cache)
			min_cut = 0
		else
			min_cut = 1 + min_cut_here[i-1]

			(1..i-1).each do |try|
				if is_palindrome(try, i, cache)
					min_cut = [min_cut, 1+min_cut_here[try-1]].min
				end
			end
		end
		min_cut_here[i] = min_cut
	end
	min_cut_here[-1]
end

def is_palindrome(first, last, cache)
	return cache[first+last+1]-1 >= (last-first+1)
end

def build_palindrome_cache(s)
	transformed = "#" + s.split("").join("#")+ "#"
	len = [1]*transformed.length
	center = 0
	farest = 0
	(1..transformed.length-1).each do |i|
		if farest <= i
			try_len = 1
		else
			pre_compted_len = len[2*center-i]
			if pre_compted_len + i > farest
				try_len = farest + 1 - i
			else
				len[i] = pre_compted_len
				next
			end
		end
		while i+try_len < transformed.length && i - try_len >= 0
			if transformed[i+try_len] == transformed[i-trylen]
				try_len+=1
			else
				break
			end
		end
		if i+try_len-1 > farest
			farest = i + try_len -1
			center = i
		end
		len[i] = try_len
	end
	len
end