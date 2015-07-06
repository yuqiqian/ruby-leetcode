def permute_unique(nums)
	require 'set'
	stack = []
	used =[]
	appeared = Set.new
	result = []
	full_flag = (1<<nums.length)-1

	(0..nums.length-1).each do |index|
		if !appeared.include? [nums[index]]
			stack << [nums[index]]
			used << (1<< index)
			appeared << [nums[index]]
		end
	end

	while stack.length != 0
		temp = stack.pop
		used_state = used.pop
		if used_state == full_flag
			result << temp.to_a
		else
			(0..nums.length-1).each do |i|
				if used_state & (1<<i) == 0
					next_state = temp + [nums[i]]
					if !appeared.include? next_state
						stack << next_state
						used << (used_state | (1<<i))
						appeared << next_state
					end
				end
			end
		end
	end
	result
end