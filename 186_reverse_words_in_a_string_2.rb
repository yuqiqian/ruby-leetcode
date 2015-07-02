def reverse_words(s)
	s = reverse(s, 0, s.length)
	j =i= 0
	while j <= s.length
		if j==s.length || s[j]==" "
			s[i..j-1] = reverse(s,i,j)
			i = j+1
		end
		j+=1
	end
	s
end

def reverse(s, head, tail)
	(0..(tail-1-head)/2).each do |i|
		s[head+i], s[tail-1-i] = s[tail-1-i], s[head+i]
		
	end
	s[head..tail-1]
end