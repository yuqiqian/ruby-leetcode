# @param {String} s
# @return {String[]}
def restore_ip_addresses(s)
	if s.length < 4 || s.length > 12
		return []
	end

	result = []

	0.upto(s.length-3) do |i|
		if i > 2
			break
		end
		(i+1).upto(s.length-2) do |j|
			if j-i > 3
				break
			end
			(j+1).upto(s.length-1) do |k|
				if k-j > 3
					break
				end
				if s.length-1-k > 3
					next
				end
				if !helper(s[0..i])
					next
				end
				if !helper(s[i+1..j])
					next
				end
				if !helper(s[j+1..k])
					next
				end
				if !helper(s[k+1..-1])
					next
				end

				result << s[0..i]+"."+s[i+1..j]+"."+s[j+1..k]+"."+s[k+1..-1]
			end
		end
	end
	result
end

def helper(s)
	if s.length == 1
		return true
	elsif s.length==2 && s[0]!="0"
		return true
	else
		if s[0] == "1"
			return true
		elsif s[0] == "2"
			if "01234".include? s[1]
				return true
			elsif s[1] == "5"
				if "012345".include? s[2]
					return true
				end
			end
		end
	end
	false
end
			
						
						