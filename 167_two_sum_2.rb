def two_sum(numbers, target)
	head, tail = 0, numbers.length-1
	while head != tail
		sum = numbers[head] + numbers[tail]
		if sum > target
			tail -= 1
		elsif sum < target
			head += 1
		else
			return [head+1, tail+1]
		end
	end
end
