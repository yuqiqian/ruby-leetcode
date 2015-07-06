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