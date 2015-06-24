def str_str(haystack, needle)
	if needle == ""
		return 0
	end
	if haystack == ""
		return -1
	end

	len_hey = haystack.length
	len_needle = needle.length
	head = 0
	flag = false

	while len_hey - head >= len_needle do
		0.upto(len_needle-1) do |i|
			if haystack[head+i] != needle[i]
			    flag = false
				break
			else
			    flag = true
			end
		end
		if flag
		    return head
		end
		head += 1
	end

	return -1
end


