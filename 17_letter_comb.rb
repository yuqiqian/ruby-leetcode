def letter_combinations(digits)
	num2letter = {"2" => "abc", "3"=>"def","4"=>"ghi","5"=>"jkl", "6"=>"mno", "7"=>"pqrs", "8"=>"tuv", "9"=>"wxyz"}
	
	if digits.length == 0
		return []
	end
	if !num2letter.has_key? digits[0]
		raise "Unacceptable input"
	end

	if digits.length == 1
		return num2letter[digits[0]].split("")
	end

	temp = num2letter[digits[0]].split("")
	result = []

	letter_combinations(digits[1..-1]).each do |tail|
		temp.each do |char|
			result << char+tail
		end
	end

	result
end