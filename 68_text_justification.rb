def full_justify(words, max_width)
	head, tail = 0, 0
	result = []
	while true
		words_len = 0
		while tail < words.length
			if words_len + words[tail].length + (tail-head) <= max_width
				words_len += words[tail].length
				tail += 1
			else
				break
			end
		end
		if tail >= words.length
			temp = words[head..tail-1].join(" ")
			temp += " "*(max_width-temp.length)
			result << temp
			break
		end
		temp = ""
		if tail == head + 1
			temp = words[head] + " "*(max_width-words[head].length)
		else
			space_count = (max_width - words_len)/(tail-head-1)
			one_more_space = (max_width - words_len) % (tail-head-1)
			(head..tail-2).each do |index|
				if index - head < one_more_space
					temp += words[index] + " "*(space_count+1)
				else
					temp += words[index]+" "*space_count
				end
			end
			temp += words[tail-1]
		end
		result << temp
		head = tail
	end
	result
end