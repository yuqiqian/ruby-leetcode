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


# @param {Integer[]} nums
# @return {Integer[][]}
def subsets_with_dup(nums)
	totalset = [[]]
	nums.sort!
	i = 0
	while i < nums.length
		count = 0
		while count + i < nums.length && nums[count+i] == nums[i]
			count += 1
		end
		prev_num = totalset.length * 1
		(0..prev_num-1).each do |k|
			instance = totalset[k]
			(0..count-1).each do |j|
				instance << nums[i]
				totalset << instance * 1
			end
		end
		i += count
	end
	totalset
end

end