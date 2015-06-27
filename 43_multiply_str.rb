def multiply(num1, num2)
	if num1=="0" || num2 == "0"
		return "0"
	end

	result = [0]*(num1.length+num2.length)
	num1 = num1.split("").map{|char| char.ord-"0".ord}
	num2 = num2.split("").map{|char| char.ord-"0".ord}

	0.upto(num1.length-1) do |i|
		multiplier = num1[i]
		temp = num2.map{|num| num*multiplier}
		(num1.length-i-1).times{temp << 0}

		1.upto(temp.length) do |res_index|
			result[-res_index]+=temp[-res_index]
		end
	end

	(result.length-1).downto(0) do |res_index|
		result[res_index-1] += result[res_index]/10
		result[res_index] %= 10
	end
	
	result = result[0]==0? result.join("").sub!(/^0+/,"") : result.join("")
	return result
end

