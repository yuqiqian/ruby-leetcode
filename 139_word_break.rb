def word_break(s, word_dict)
	count_break = [false]*s.length
	(0..s.length-1).each do |break_after_current|
		if word_dict.include? s[0..break_after_current]
			count_break[break_after_current] = true
			next
		end

		(0..break_after_current-1).each do |pre_break|
			if !count_break[pre_break]
				next
			elsif !word_dict.include? s[pre_break+1..break_after_current]
				next
			else
				count_break[break_after_current] = true
				break
			end
		end
	end
	count_break[-1]
end