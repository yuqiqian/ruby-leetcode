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

# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
    return b if a.nil? || a.empty?
    return a if b.nil? || b.empty?
    a_arr = a.split("")
    b_arr = b.split("")
    i, j = a_arr.length-1, b_arr.length-1
    a_byte, b_byte = 0, 0
    carry = 0
    temp = 0
    result = ""
    while i > -1 || j > -1 || carry == 1
        a_byte = (i>-1)? a_arr[i].to_i : 0
        b_byte = (j > -1)? b_arr[j].to_i : 0
        temp = a_byte ^ b_byte ^ carry
        carry = (a_byte+b_byte+carry) >= 2 ? 1 : 0
        result << temp.to_s
        binding.pry
        i -= 1
        j -= 1
    end
    result.reverse
end