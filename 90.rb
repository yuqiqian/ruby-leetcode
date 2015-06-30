def subsets_with_dup(nums)
	nums.sort!
	used = []
	limit = 1 << nums.length
	current = 0
	result = []
	while current < limit
		temp = []
		0.upto(nums.length-1) do |index|
			if (1<<index) & current != 0
				temp << nums[index]
			end
		end
		temp_sort = temp.sort
		if !used.include? temp_sort
			result << temp
			used << temp_sort
		end

		current+=1
	end
	result
end


