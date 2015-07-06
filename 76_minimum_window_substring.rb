# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
	min_window = [-1, -1]
	head, tail = -1, 0
	total_count = Hash[t.split("").collect{|v| [v, 0] }]
	need = Hash.new(0)
	t.each_char{|item| need[item] += 1}
	need_count = t.length
	while tail < s.length
		if need.has_key? s[tail]
			if head  == -1
				head = tail
			end
			total_count[s[tail]] += 1
			if total_count[s[tail]] <= need[s[tail]]
				need_count -= 1
				break if need_count == 0
			end
		end
		tail += 1
	end
	if tail >= s.length
		return ""
	end
	while true
		if need.has_key? s[head]
			if total_count[s[head]] > need[s[head]]
				total_count[s[head]] -= 1
				head += 1
			else
				break
			end
		else
			head += 1
		end
	end

	min_window = [head, tail]

	while true
		tail += 1
		while tail < s.length
			break if s[tail] == s[head]
			total_count[s[tail]] += 1 if total_count.has_key? s[tail]
			tail += 1
		end
		if tail >= s.length
			break
		end
		head += 1
		while head <= tail 
			if need.has_key? s[head]
				if total_count[s[head]] > need[s[head]]
					total_count[s[head]] -= 1
					head += 1
				else
					break
				end
			else
				head+=1
			end
		end
		if tail-head < min_window[1]-min_window[0]
			min_window[0], min_window[1] = head, tail
		end
	end
	s[min_window[0]..min_window[1]]
end