def majority_element(nums)
	major = nums[0]
	major_times = 1
	nums[1..-1].each do |number|
		if number == major
			major_times+=1
		elsif major_times == 0
			major_times = 1
			major = number
		else
			major_times -= 1
		end
	end
	major
end
				