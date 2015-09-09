def word_break(s, dict)
	return [] if !is_breakable(s, dict)
	s_len = s.length
	could_break = Array.new(s_len){Array.new()}
	candidate_len = dict.map{|item| item.length}.uniq.sort

	(0..s_len-1).each do |break_after_current|
		if dict.include? s[0..break_after_current]
			could_break[break_after_current] << [s[0..break_after_current]]
		end
		candidate_len.each do |pre_break|
			pre_break = break_after_current - pre_break
			if pre_break < 0
				next
			elsif could_break[pre_break] == []
				next
			elsif !dict.include? s[pre_break+1..break_after_current]
				next
			else
				combinations = could_break[pre_break].map{|item| item + [s[pre_break+1..break_after_current]]}
				could_break[break_after_current].concat combinations
			end
		end
	end
	could_break[-1].map{|comb| comb.join(" ")}
end

def is_breakable(s, dict)
	could_break = [false] * s.length
	(0..s.length).each do |break_after_current|
		if dict.include? s[0..break_after_current]
			could_break[break_after_current] = true
			next
		end
		(0..break_after_current-1).each do |pre_break|
			if !could_break[pre_break]
				next
			elsif !dict.include? s[pre_break+1..break_after_current]
				next
			else
				could_break[break_after_current] = true
				break
			end
		end
	end
	could_break[-1]
end