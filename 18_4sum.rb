def four_sum(nums, target)
	result = []
	nums.sort!
	len = nums.length
	first = 0
	while first < len-3 do 
		second = first+1
		while second < len-2
			third = second+1
			fourth = len-1
			while third < fourth
				if nums[first] + nums[second] + nums[third] + nums[third] > target
					break
				end
				if nums[first] + nums[second] + nums[fourth] + nums[fourth] < target
					break
				end

				temp = nums[first] + nums[second] + nums[third] + nums[fourth]
				if temp == target
					result << [nums[first],nums[second],nums[third],nums[fourth]]
					third +=1
					while third < fourth+1 && nums[third]==nums[third-1]
						third+=1
					end
					fourth -=1
					while fourth > third -1 && nums[fourth]==nums[fourth+1]
						fourth-=1
					end
				elsif temp > target
					fourth -= 1
					while fourth > third -1 && nums[fourth]==nums[fourth+1]
						fourth-=1
					end
				else
					third += 1
					while third < fourth+1 && nums[third]==nums[third-1]
						third+=1
					end
				end
			end
			second += 1
			while second < len-1 && nums[second] == nums[second-1]
				second+=1
			end
		end
		first += 1
		while first<len-2 && nums[first] == nums[first-1]
			first+=1
		end
	end
	result
end
						


