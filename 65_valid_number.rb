def is_number(s)
	s = s.strip
	if s.include?("e")
		div_pos = s.index("e")
		return is_num_without_e(s[0..div_pos-1]) && is_num_without_e(s[div_pos+1..-1], false)
	elsif s.include?("E")
		div_pos = s.index("E")
		return is_num_without_e(s[0..div_pos-1]) && is_num_without_e(s[div_pos+1..-1], false)
	else
		return is_num_without_e(s)
	end
end

def is_num_without_e(s, decimalAllow = true)
	digits = "0123456789"
	s_len = s.length
	if s_len == 0
		return false
	end
	if s[0] == "+" or s[0]=="-"
		s = s[1..-1]
		s_len -= 1
		return false if s_len == 0
	end

	if s.include?(".")
		return false if s_len == 1 or !decimalAllow
		decimal_point = s.index(".")
		temp_s = decimal_point == 0 ? s[decimal_point+1..-1] : s[0..decimal_point-1]+s[decimal_point+1..-1]
		(temp_s).each_char do |item|
			if not digits.include? item
				return false
			end
		end
		return true
	else
		s.each_char do |item|
			if not digits.include? item
				return false
			end
		end
		return true
	end
end

			