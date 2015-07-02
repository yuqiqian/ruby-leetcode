# @param {String} s
# @return {Integer}
def title_to_number(s)
	result = 0
	s.each_char do |letter|
		result = result*26 + (letter.ord-"A".ord+1)
	end
	result
end