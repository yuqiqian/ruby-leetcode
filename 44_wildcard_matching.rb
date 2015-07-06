# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
	p, minimal = compile(p)
	if minimal > s.length
		return false
	else
		tried = [0] * (s.length+1)
		return helper(s, 0, p, 0, tried)
	end
end
			

def compile(p)
	if p.length == 0
		return "", 0
	end
	result = p[0]
	minimal = 0
	p[1..-1].each_char do |i|
		if i!= "*"
			minimal += 1
		end
		if i=="*" && i==result[-1]
			next
		else
			result << i
		end
	end
	return result, minimal
end

def helper(s, s_i, p, p_i, tried)
    while true
		if tried[s_i] & (1<<p_i) != 0
			return false
		else
			tried[s_i] |= (1<<p_i)
		end

		if s_i==s.length && p_i==p.length
			return true
		elsif p_i==p.length
			return false
		elsif p_i==p.length-1 && p[p_i] == "*"
			return true
		elsif s_i != s.length && (p[p_i] == "?" || s[s_i] == p[p_i])
			s_i+=1
			p_i+=1
		elsif p[p_i] == "*"
			if helper(s,s_i, p, p_i+1, tried)
				return true
			elsif s_i != s.length && helper(s, s_i+1, p, p_i, tried)
				return true
			else
				return false
			end
		else
			return false
		end
	end
end


				
			
			