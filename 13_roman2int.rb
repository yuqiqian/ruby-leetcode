def roman_to_int(s)
	transSingleTable = {"I"=>1, "V"=>5, "X"=>10, "L"=>50, "C"=>100, "D"=>500, "M"=>1000}
	transDoubleTable = {"IV"=>4, "IX"=>9, "XL"=>40, "XC"=>90, "CD"=>400, "CM"=>900 } 

	result = 0
	index = 0
	roman = s.upcase
	while index < s.length
		if (index < s.length-1) && (transDoubleTable.has_key?roman[index..index+1])
			result += transDoubleTable[roman[index..index+1]]
			index += 2
		elsif transSingleTable.has_key?roman[index]
			result += transSingleTable[roman[index]]
			index += 1
		else
			raise "Invalid Roman numeral!"
		end
	end

	return result
			
end