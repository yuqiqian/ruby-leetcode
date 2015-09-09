# @param {String} s
# @param {String[]} words
# @return {Integer[]}
def find_substring(s, words)
	result = []

	occurrence = Hash.new(0)
	total_count = words.length
	words.each do |word|
		occurrence[word] += 1
	end

	current_occur = {}
	occurrence.each do |key, val|
		current_occur[key] = 0
	end
	sub_len = words[0].length

	(0..sub_len-1).each do |offset|
		current_count = 0
		current_occur.each do |k, v|
			current_occur[k] = 0
		end
		begin_i = offset
		end_i = offset

		if begin_i >= s.length - sub_len * words.length+1
			break
		end

		while begin_i < s.length - sub_len*words.length + 1 && end_i < s.length - sub_len + 1
			while end_i < s.length - sub_len + 1
				if occurrence.has_key? s[end_i..end_i+sub_len-1]
					current_occur[s[end_i..end_i+sub_len-1]] += 1
					current_count += 1

					if current_occur[s[end_i..end_i+sub_len-1]] > occurrence[s[end_i..end_i+sub_len-1]]
						while s[begin_i..begin_i+sub_len-1] != s[end_i..end_i+sub_len-1]
							current_occur[s[begin_i..begin_i+sub_len-1]] -= 1
							current_count -= 1
							begin_i += sub_len
						end
						current_occur[s[begin_i..begin_i+sub_len-1]] -= 1
						current_count -= 1
						begin_i += sub_len
						end_i += sub_len
						next
					end
				else
					begin_i = end_i + sub_len
					end_i = begin_i
					current_count = 0
					current_occur.each do |k,v|
						current_occur[k] = 0
					end
					next
				end
				end_i += sub_len
				if current_count == total_count
					result << begin_i
					current_count -= 1
					current_occur[s[begin_i..begin_i+sub_len-1]] -= 1
					begin_i += sub_len
				end
			end
		end
	end
	result
end

# @param {String} s
# @param {String[]} words
# @return {Integer[]}
def find_substring(s, words)
	ans = []
	n, cnt = s.size, words.size
	return ans if n <= 0 || cnt <= 0
	dict = Hash.new(0)
	words.each{|w| dict[w]+=1}
	wl = words[0].length
	(0..wl-1).each do |i|
		left, count = i, 0
		tdict = Hash.new(0)
		(i..n-wl).step(wl).each do |j|
			str = s[j..j+wl-1]
			if dict.has_key?(str)
				tdict[str] += 1
				if tdict[str] <= dict[str]
					count += 1
				else
					while tdict[str] > dict[str]
						str1 = s[left..left+wl-1]
						tdict[str1] -= 1
						count -= 1 if tdict[str1] < dict[str1]
						left += wl
					end
				end
				if count == cnt
					ans << left
					tdict[s[left..left+wl-1]] -= 1
					count -= 1
					left += wl
				end
			else
				tdict.clear
				count = 0
				left = j + wl
			end
		end
	end
	ans
end
