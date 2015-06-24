def count_and_say(n)
	result = "1"

	0.upto(n-2) do 
		temp = ""
		current = result[0]
		count = 1

		result[1..-1].each_char do |item|
			if item == current
				count += 1
			else
				temp += count.to_s + current
				current = item
				count = 1
			end
		end
		temp += count.to_s + current
		result = temp
	end

	return result
end
