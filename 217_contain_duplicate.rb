# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
	occur = Hash.new(0)
	nums.each do |n|
		if occur.has_key? n
			return true
		else
		    occur[n]+=1
		end
	end
	false
end
