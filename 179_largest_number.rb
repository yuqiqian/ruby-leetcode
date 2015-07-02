def largest_number(nums)
	temp = nums.map{|i| i.to_s}
	temp.sort!{|x,y| y+x <=> x+y}
	result = temp.join("")
	if result[0] == "0"
		return "0"
	else
		return result
	end
end