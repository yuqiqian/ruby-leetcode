def single_number(nums)
	bits_in_int = 32
	bits_res = [0] * bits_in_int
	num_neg = 0
	nums.each do |item|
		if item < 0
			item = -item
			num_neg += 1
		end

		(0..bits_in_int-1).each do |i|
			bits_res[i] += (item & (1<<i)) >> i
		end
	end
	result = 0
	(0..bits_in_int-1) do |i|
		result |= (bits_res[i]%3)<<i
	end
	if num_neg%3!=0
		result = -result
	end

	result
end