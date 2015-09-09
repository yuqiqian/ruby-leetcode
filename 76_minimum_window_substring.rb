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


# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
	return "" if s.empty? || t.empty?
	count = t.size
	req = Hash.new(0)
	char_set = Hash.new(false)
	(0..count-1).each do |i|
		req[t[i]] += 1
		char_set[t[i]] = true
	end
	i,j,min_len, min_idx = -1, 0, 2**31-1, 0
	while i < s.length && j < s.length
		if !count.zero?
			i += 1
			req[s[i]] -= 1
			if char_set[s[i]] && req[s[i]] >= 0
				count -= 1
			end
		else
			if min_len > i-j+1
				min_len = i-j+1
				min_idx = j
			end
			req[s[j]] += 1
			if char_set[s[j]] && req[s[j]] > 0
				count += 1
			end
			j += 1
		end
	end
	return "" if min_len == 2**31-1
	return s[min_idx, min_idx+min_len-1]
end
end