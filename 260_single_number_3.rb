# @param {Integer[]} nums
# @return {Integer[]}
def single_number(nums)
	bits = 0
	nums.each {|n| bits^=n}
	i = 0
	while !(bits & (1<<i) == (1<<i))
		i += 1
	end
	other_bits = 0
	nums.each {|n| other_bits^=n if n&(1<<i) == (1 << i)}
	return [other_bits, bits^other_bits]
end