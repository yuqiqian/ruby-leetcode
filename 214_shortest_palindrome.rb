# @param {String} s
# @return {String}
def shortest_palindrome(s)
	r = s
	r = r.reverse
	t = s+"#"+r 
	p = Array.new(t.size, 0)
	(1..t.size-1).each do |i|
		j = p[i-1]
		while j>0 && t[i]!=t[j]
			j = p[j-1]
		end
		p[i] = t[i]==t[j] ? j+1 : j
	end
	new_head = s.length-p[-1] == 0 ? "" : r[0..s.length-p[-1]-1]
	return new_head+s
end