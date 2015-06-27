# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
	reachable = [false]*nums.length
	reachable[0] = true

	0.upto(nums.length-1) do |i|
		if reachable[i] == false
			break
		end

		nums[i].downto(1) do |step|
			if i+step >= nums.length
				next
			end

			if reachable[i+step] == true
				break
			end

			reachable[i+step] = true
		end
	end

	reachable[-1]
end
