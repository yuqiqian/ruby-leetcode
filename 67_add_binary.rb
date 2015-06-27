# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
	if a.length > b.length
		a, b = b, a
	end

	alen = a.length
	blen = b.length

	addition={"0"=>{"0"=>{"0"=>["0","0"], "1"=>["1","0"]}, "1"=>{"0"=>["1","0"], "1"=>["0","1"]}}, "1"=>{"0"=>{"0"=>["1","0"], "1"=>["0","1"]}, "1"=>{"0"=>["0","1"], "1"=>["1","1"]}}}

	result = ""
	carry = "0"
	(-1).downto(-alen) do |i|
		temp, carry = addition[a[i]][b[i]][carry]
		result = temp + result
	end

	(-alen-1).downto(-blen) do |i|
		temp, carry = addition["0"][b[i]][carry]
		result = temp+result
		if carry == "0"
			result = b[0..i-1]+result
			break
		end
	end

	if carry == "1"
		result = "1"+result
	end

	result

end